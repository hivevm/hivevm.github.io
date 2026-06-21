#!/usr/bin/env bash
#
# Documentation consistency checks for this template.
#
# Enforces — as CI, not just convention — the documentation rules from AGENTS.md and
# docs/adr/README.md:
#
#   1. ADR index integrity: every docs/adr/NNNN-*.md file is listed in the index table in
#      docs/adr/README.md, every index row points to an existing file, and the status shown
#      in the index matches the **Status:** line inside each ADR.
#   2. Relative-link integrity: every relative Markdown link in every tracked .md file resolves
#      to a file or directory that exists.
#
# Pure bash + coreutils/grep/sed only — present in the Dev Container base image, so running it
# adds no toolchain and no dependency that would require an ADR.
#
# Usage:
#     scripts/check-docs.sh        (or: bash scripts/check-docs.sh)
# Exit code 0 when all checks pass, 1 otherwise.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ADR_DIR="$ROOT/docs/adr"
ADR_INDEX="$ADR_DIR/README.md"

errors=()
add_error() { errors+=("$1"); }

# Print the first legend status emoji (🟢 🟡 🔴 ⚪) read from stdin, if any.
first_status_emoji() { grep -oE '🟢|🟡|🔴|⚪' | head -n1; }

# _contains <needle> <haystack...> — true if needle equals one of the arguments.
_contains() {
  local needle="$1"; shift
  local item
  for item in "$@"; do [[ "$item" == "$needle" ]] && return 0; done
  return 1
}

check_adr_index() {
  if [[ ! -f "$ADR_INDEX" ]]; then
    add_error "ADR index not found: docs/adr/README.md"
    return
  fi

  # ADR files on disk (basenames), excluding the template.
  local disk_files=()
  local f
  while IFS= read -r f; do
    [[ "$(basename "$f")" == "template.md" ]] && continue
    disk_files+=("$(basename "$f")")
  done < <(find "$ADR_DIR" -maxdepth 1 -type f -name '[0-9][0-9][0-9][0-9]-*.md' | sort)

  # Parse the index into parallel arrays: filename + status emoji per row.
  local indexed_files=() indexed_status=()
  local line number target filename status
  while IFS= read -r line; do
    [[ "$line" =~ ^\|[[:space:]]*\[([0-9]{4})\]\(([^\)]+)\) ]] || continue
    number="${BASH_REMATCH[1]}"
    target="${BASH_REMATCH[2]}"
    filename="${target%%#*}"
    status="$(printf '%s' "$line" | first_status_emoji)"
    indexed_files+=("$filename")
    indexed_status+=("$status")
    if [[ "$filename" != "$number"-* ]]; then
      add_error "ADR index: row for $number links to '$filename', which does not start with '$number-'"
    fi
  done < "$ADR_INDEX"

  # Every file on disk must be listed.
  local d
  for d in "${disk_files[@]}"; do
    if ! _contains "$d" "${indexed_files[@]}"; then
      add_error "ADR index: file '$d' exists but is not listed in the index"
    fi
  done

  # Every listed file must exist, and its status must match the file.
  local i file_status
  for i in "${!indexed_files[@]}"; do
    f="${indexed_files[$i]}"
    status="${indexed_status[$i]}"
    if [[ ! -f "$ADR_DIR/$f" ]]; then
      add_error "ADR index: lists '$f', but no such ADR file exists"
      continue
    fi
    file_status="$(grep -m1 -F '**Status:**' "$ADR_DIR/$f" | first_status_emoji)"
    if [[ -z "$file_status" ]]; then
      add_error "$f: no '**Status:**' line with a status emoji found"
    elif [[ "$file_status" != "$status" ]]; then
      add_error "ADR index: status for '$f' is ${status:-<none>} in the index but $file_status in the file"
    fi
  done
}

check_relative_links() {
  local md rel linkexpr target path_part dir
  while IFS= read -r md; do
    rel="${md#"$ROOT"/}"
    # Superseded ADRs are immutable historical record (see AGENTS.md and docs/adr/README.md):
    # they intentionally reference files from a past state that may since have been removed.
    # Their links are frozen with the decision, so they are not checked for live resolution.
    if [[ "$md" == "$ADR_DIR"/* ]] && grep -m1 -F '**Status:**' "$md" | grep -q '⚪'; then
      continue
    fi
    while IFS= read -r linkexpr; do
      # linkexpr is the whole [text](target); extract the target.
      target="$(printf '%s' "$linkexpr" | sed -E 's/^\[[^]]*\]\(([^)]+)\)$/\1/')"
      # Trim surrounding whitespace.
      target="$(printf '%s' "$target" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')"
      case "$target" in
        http://*|https://*|mailto:*|"#"*) continue ;;
      esac
      path_part="${target%%#*}"
      [[ -z "$path_part" ]] && continue
      dir="$(dirname "$md")"
      if [[ ! -e "$dir/$path_part" ]]; then
        add_error "$rel: broken relative link -> '$target'"
      fi
    done < <(grep -oE '\[[^]]*\]\([^)]+\)' "$md")
  done < <(find "$ROOT" -type f -name '*.md' -not -path '*/.git/*' | sort)
}

check_adr_index
check_relative_links

if ((${#errors[@]} > 0)); then
  echo "Documentation checks FAILED:"
  echo
  for e in "${errors[@]}"; do echo "  - $e"; done
  echo
  echo "${#errors[@]} problem(s) found."
  exit 1
fi

echo "Documentation checks passed."
exit 0
