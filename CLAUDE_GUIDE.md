# Claude Guide - HiveVM Project Documentation

**Complete Reference for Claude AI Assistant**

This document provides Claude with all necessary information to work effectively on the HiveVM website project.

---

## 📋 Table of Contents

1. [Quick Reference](#quick-reference)
2. [Project Overview](#project-overview)
3. [File System Layout](#file-system-layout)
4. [Common Tasks & Workflows](#common-tasks--workflows)
5. [Tool Usage Guide](#tool-usage-guide)
6. [Editing Patterns](#editing-patterns)
7. [Testing & Validation](#testing--validation)
8. [Deployment Process](#deployment-process)
9. [Troubleshooting](#troubleshooting)
10. [Best Practices](#best-practices)

---

## 🎯 Quick Reference

### Critical Paths
```bash
# Working Directory
/home/claude/hivevm/

# User Uploads (Read Only)
/mnt/user-data/uploads/

# Final Output Location (Share with User)
/mnt/user-data/outputs/
```

### Main Files to Edit
```bash
/home/claude/hivevm/index.html              # Content & Structure
/home/claude/hivevm/assets/css/hivevm.css   # Styling
/home/claude/hivevm/assets/js/custom.js     # Interactivity
```

### Critical Workflow
```bash
1. View files with 'view' tool
2. Edit with 'str_replace' tool
3. Test with 'bash_tool'
4. Copy to /mnt/user-data/outputs/ when complete
5. Use 'present_files' tool to share with user
```

---

## 📊 Project Overview

### What This Project Is
- **Type**: Static website (HTML/CSS/JavaScript)
- **Purpose**: Landing page for HiveVM development tools
- **Hosting**: GitHub Pages
- **Domain**: hivevm.org
- **Framework**: Bootstrap 4, jQuery

### Project Goals
- Showcase 3 main HiveVM projects (Parser Generator, Manual Generator, Gradle Workflow)
- Provide professional, responsive design
- Fast loading and good SEO
- Easy to maintain and update

### Technology Stack
```
Frontend:
├── HTML5 (semantic markup)
├── CSS3 (Bootstrap 4 + custom)
└── JavaScript (jQuery 2.1.0 + custom)

Libraries:
├── Bootstrap 4.6.x (grid, components)
├── jQuery 2.1.0 (DOM manipulation)
├── Font Awesome 4.x (icons)
├── ScrollReveal (scroll animations)
└── Owl Carousel (carousel functionality)

Hosting:
└── GitHub Pages (static site hosting)
```

---

## 📁 File System Layout

### Complete Structure
```
hivevm/
├── index.html                    ⭐ MAIN HTML FILE
├── honeycomb.jpg                 🖼️ Hero background image
│
├── assets/
│   ├── css/
│   │   ├── bootstrap.min.css     📦 Bootstrap framework
│   │   ├── font-awesome.css      📦 Icon styles
│   │   ├── hivevm.css           ⭐ CUSTOM STYLES (EDIT THIS)
│   │   ├── owl-carousel.css      📦 Carousel styles
│   │   └── flex-slider.css       📦 Slider styles
│   │
│   ├── js/
│   │   ├── jquery-2.1.0.min.js   📦 jQuery library
│   │   ├── bootstrap.min.js      📦 Bootstrap JS
│   │   ├── custom.js            ⭐ CUSTOM SCRIPTS (EDIT THIS)
│   │   ├── owl-carousel.js       📦 Carousel functionality
│   │   └── scrollreveal.min.js   📦 Scroll animations
│   │
│   ├── images/
│   │   ├── banner-bg.png         🖼️ Hero background (1.1MB)
│   │   ├── footer-bg.png         🖼️ Footer background (2.2MB)
│   │   ├── features-icon-*.png   🖼️ Feature icons
│   │   └── about-icon-*.png      🖼️ About icons
│   │
│   ├── fonts/
│   │   └── [Font Awesome files]
│   │
│   └── favicon.ico               🎨 Site favicon
│
├── .nojekyll                     ⚙️ GitHub Pages config
├── CNAME                         🌐 Custom domain (hivevm.org)
├── .gitignore                    🚫 Git ignore rules
├── .github/
│   └── workflows/
│       └── deploy.yml            🔄 CI/CD workflow
│
└── Documentation/
    ├── README.md                 📖 Main docs
    ├── SETUP.md                  📖 Setup guide
    ├── PROJECT_INFO.md           📖 Technical reference
    ├── QUICKSTART.md             📖 Quick start
    ├── CONTRIBUTING.md           📖 Contributor guide
    ├── CHANGELOG.md              📖 Version history
    ├── LICENSE                   📖 MIT License
    ├── PROJECT_SUMMARY.md        📖 Project summary
    └── CLAUDE_GUIDE.md           📖 This file

⭐ = Files Claude will commonly edit
📦 = External libraries (don't edit)
🖼️ = Image assets
⚙️ = Configuration files
📖 = Documentation
```

### File Sizes & Performance
```
HTML:        ~5KB    ✅ Small
CSS Total:   ~228KB  ⚠️ Bootstrap heavy (expected)
JS Total:    ~245KB  ⚠️ jQuery + Bootstrap (expected)
Images:      Varies  ⚠️ Optimize to <200KB each
```

---

## 🔧 Common Tasks & Workflows

### Task 1: Update Hero Section Text

**User Request**: "Change the main heading"

**Workflow**:
```bash
# 1. View current content
view /home/claude/hivevm/index.html --range 67,75

# 2. Edit the text (around line 71)
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '<h1>Development Tools based on <em>MODELLING</em></h1>' \
  --new_str '<h1>Your New Heading <em>Here</em></h1>'

# 3. Verify change
view /home/claude/hivevm/index.html --range 67,75

# 4. Copy to outputs
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"

# 5. Share with user
present_files ["/mnt/user-data/outputs/index.html"]
```

### Task 2: Change Primary Color

**User Request**: "Change the yellow color to blue"

**Workflow**:
```bash
# 1. View current color usage
view /home/claude/hivevm/assets/css/hivevm.css --range 280,290

# 2. Find all instances of #f2b408 (golden yellow)
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css | head -20"

# 3. Replace each instance (multiple str_replace calls)
str_replace \
  --path /home/claude/hivevm/assets/css/hivevm.css \
  --old_str 'color: #f2b408;' \
  --new_str 'color: #0066cc;'

# Repeat for all instances

# 4. Copy to outputs
bash_tool "cp /home/claude/hivevm/assets/css/hivevm.css /mnt/user-data/outputs/assets/css/"

# 5. Share with user
present_files ["/mnt/user-data/outputs/assets/css/hivevm.css"]
```

### Task 3: Add New Feature Card

**User Request**: "Add a 4th project to the features section"

**Workflow**:
```bash
# 1. View existing feature cards
view /home/claude/hivevm/index.html --range 84,105

# 2. Identify insertion point (after line 102, before </div>)
view /home/claude/hivevm/index.html --range 100,105

# 3. Add new feature card
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '                </div>
            </div>
        </div>
    </section>' \
  --new_str '                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                    <div class="features-item">
                        <div class="features-icon">
                            <h2>04</h2>
                            <img src="assets/images/features-icon-0.png" alt="New Feature">
                            <h4>New Feature Name</h4>
                            <p>New feature description goes here.</p>
                            <a href="https://github.com/hivevm/new-repo" class="main-button" target="_blank" rel="noopener noreferrer">GitHub</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>'

# 4. Copy to outputs
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"

# 5. Share with user
present_files ["/mnt/user-data/outputs/index.html"]
```

### Task 4: Update Navigation Menu

**User Request**: "Add a Contact link to the navigation"

**Workflow**:
```bash
# 1. View current navigation
view /home/claude/hivevm/index.html --range 50,54

# 2. Add new menu item
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '                            <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
                            <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>' \
  --new_str '                            <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
                            <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>
                            <li class="scroll-to-section"><a href="#contact" class="menu-item">Contact</a></li>'

# 3. Add corresponding section (if needed)
# ... add section HTML ...

# 4. Copy to outputs and share
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"
present_files ["/mnt/user-data/outputs/index.html"]
```

### Task 5: Optimize Images

**User Request**: "Optimize the banner image"

**Workflow**:
```bash
# 1. Check current image size
bash_tool "ls -lh /home/claude/hivevm/assets/images/banner-bg.png"

# 2. Optimize with ImageMagick (if available)
bash_tool "convert /home/claude/hivevm/assets/images/banner-bg.png -quality 85 -resize 1920x /home/claude/hivevm/assets/images/banner-bg-optimized.png"

# 3. Replace original
bash_tool "mv /home/claude/hivevm/assets/images/banner-bg-optimized.png /home/claude/hivevm/assets/images/banner-bg.png"

# 4. Copy to outputs
bash_tool "cp -r /home/claude/hivevm/assets/images /mnt/user-data/outputs/assets/"

# 5. Report results
bash_tool "ls -lh /home/claude/hivevm/assets/images/banner-bg.png"
```

---

## 🛠️ Tool Usage Guide

### 1. view Tool
**Purpose**: Read files and directories

**Usage**:
```bash
# View entire file
view /home/claude/hivevm/index.html

# View specific line range
view /home/claude/hivevm/index.html --range 50,60

# View directory structure
view /home/claude/hivevm/assets/

# View image (displays visually)
view /home/claude/hivevm/honeycomb.jpg
```

**Best Practices**:
- Always view files before editing
- Use line ranges for large files
- Check context around edit location

### 2. str_replace Tool
**Purpose**: Edit existing files

**Usage**:
```bash
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str 'exact text to find' \
  --new_str 'replacement text'
  --description 'Why I am making this change'
```

**Critical Rules**:
- `old_str` must match EXACTLY (whitespace, case, special chars)
- Can only be used when `old_str` appears ONCE in file
- Cannot use for adding new content at end of file
- Must include --description

**Common Errors**:
```bash
# ❌ WRONG: Text doesn't match exactly
old_str: '<h1>Hello</h1>'
# File has: '<h1> Hello </h1>' (extra spaces)

# ✅ CORRECT: Match exactly including whitespace
old_str: '<h1> Hello </h1>'

# ❌ WRONG: String appears multiple times
# Error: String to replace not unique

# ✅ CORRECT: Include more context to make unique
old_str: '<div class="features-item">
            <div class="features-icon">
                <h2>01</h2>'
```

### 3. create_file Tool
**Purpose**: Create new files

**Usage**:
```bash
create_file \
  --path /home/claude/hivevm/new-file.html \
  --file_text 'File content here...' \
  --description 'Creating new file for...'
```

**Use Cases**:
- Creating new HTML pages
- Adding new CSS files
- Creating documentation
- Adding configuration files

**Cannot Use**:
- To overwrite existing files
- Use str_replace for edits instead

### 4. bash_tool Tool
**Purpose**: Run shell commands

**Usage**:
```bash
bash_tool \
  --command 'ls -la /home/claude/hivevm/' \
  --description 'Listing project files'
```

**Common Commands**:
```bash
# List files
bash_tool "ls -la /home/claude/hivevm/"

# Copy files
bash_tool "cp source.html destination.html"

# Copy directories
bash_tool "cp -r /home/claude/hivevm/* /mnt/user-data/outputs/"

# Search text
bash_tool "grep -n 'search term' /home/claude/hivevm/index.html"

# Check file size
bash_tool "ls -lh /home/claude/hivevm/honeycomb.jpg"

# Count lines
bash_tool "wc -l /home/claude/hivevm/index.html"

# View file info
bash_tool "file /home/claude/hivevm/index.html"
```

### 5. present_files Tool
**Purpose**: Share files with user

**Usage**:
```bash
present_files [
  "/mnt/user-data/outputs/index.html",
  "/mnt/user-data/outputs/assets/css/hivevm.css"
]
```

**Critical Rules**:
- Files MUST be in `/mnt/user-data/outputs/`
- Use array notation for multiple files
- Always use at end of workflow
- Most important file should be first in array

**Example Workflow**:
```bash
# 1. Make edits in /home/claude/hivevm/
# 2. Copy to outputs
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"
# 3. Share with user
present_files ["/mnt/user-data/outputs/index.html"]
```

---

## 🎨 Editing Patterns

### Pattern 1: Simple Text Change
```bash
# View → Edit → Verify → Share

# 1. View
view /home/claude/hivevm/index.html --range 70,75

# 2. Edit
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '<p>Old text here</p>' \
  --new_str '<p>New text here</p>'

# 3. Verify
view /home/claude/hivevm/index.html --range 70,75

# 4. Share
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"
present_files ["/mnt/user-data/outputs/index.html"]
```

### Pattern 2: Multiple Related Changes
```bash
# Make all changes first, then copy once

# 1. Change title
str_replace --path /home/claude/hivevm/index.html ...

# 2. Change description  
str_replace --path /home/claude/hivevm/index.html ...

# 3. Change button text
str_replace --path /home/claude/hivevm/index.html ...

# 4. Copy once
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"

# 5. Share
present_files ["/mnt/user-data/outputs/index.html"]
```

### Pattern 3: CSS Color Theme Change
```bash
# Find all instances, replace systematically

# 1. Find color usage
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css"

# 2. Replace each unique instance
str_replace --path /home/claude/hivevm/assets/css/hivevm.css \
  --old_str '.header-area .main-nav .logo em { color: #f2b408; }' \
  --new_str '.header-area .main-nav .logo em { color: #0066cc; }'

# Repeat for each instance...

# 3. Copy and share
bash_tool "cp /home/claude/hivevm/assets/css/hivevm.css /mnt/user-data/outputs/assets/css/"
present_files ["/mnt/user-data/outputs/assets/css/hivevm.css"]
```

### Pattern 4: Adding New Section
```bash
# Large addition requires careful context matching

# 1. View insertion point
view /home/claude/hivevm/index.html --range 115,122

# 2. Include surrounding context in old_str
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

</body>
</html>' \
  --new_str '    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <!-- New section HTML here -->
    <section id="new-section">
        ...
    </section>

</body>
</html>'

# 3. Verify and share
```

### Pattern 5: Complete File Replacement
```bash
# When many changes needed, create new version

# 1. Read original
view /home/claude/hivevm/index.html

# 2. Create updated version in outputs directly
create_file \
  --path /mnt/user-data/outputs/index.html \
  --file_text '<!DOCTYPE html>
<html>
... entire new content ...
</html>'

# 3. Share
present_files ["/mnt/user-data/outputs/index.html"]
```

---

## ✅ Testing & Validation

### Pre-Deployment Checklist

```bash
# 1. HTML Validation
bash_tool "grep -i 'error\|warning' /home/claude/hivevm/index.html || echo 'No obvious errors'"

# 2. Check for broken links
bash_tool "grep -o 'href=\"[^\"]*\"' /home/claude/hivevm/index.html | sort -u"

# 3. Verify image paths
bash_tool "grep -o 'src=\"[^\"]*\"' /home/claude/hivevm/index.html | while read line; do
  path=$(echo $line | cut -d'\"' -f2)
  if [[ ! -f /home/claude/hivevm/$path ]]; then
    echo 'Missing: '$path
  fi
done"

# 4. Check file sizes
bash_tool "find /home/claude/hivevm/assets/images/ -type f -exec ls -lh {} \; | awk '{print $5, $9}'"

# 5. Count total files
bash_tool "find /home/claude/hivevm/ -type f | wc -l"
```

### Common Validation Tasks

**Check All Colors Updated**:
```bash
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css | wc -l"
# Should return 0 if all replaced
```

**Verify External Links**:
```bash
bash_tool "grep -o 'https://github.com/[^\"]*' /home/claude/hivevm/index.html"
# Check all GitHub links are correct
```

**Check Alt Text Present**:
```bash
bash_tool "grep '<img' /home/claude/hivevm/index.html | grep -v 'alt=' | wc -l"
# Should return 0 (all images have alt text)
```

---

## 🚀 Deployment Process

### Complete Deployment Workflow

```bash
# 1. Final checks
bash_tool "ls -la /home/claude/hivevm/"

# 2. Copy ALL files to outputs
bash_tool "cp -r /home/claude/hivevm/* /mnt/user-data/outputs/"

# 3. Copy hidden files
bash_tool "cp /home/claude/hivevm/.nojekyll /mnt/user-data/outputs/"
bash_tool "cp /home/claude/hivevm/.gitignore /mnt/user-data/outputs/"
bash_tool "cp -r /home/claude/hivevm/.github /mnt/user-data/outputs/"

# 4. Verify outputs
bash_tool "ls -la /mnt/user-data/outputs/"

# 5. Share with user
present_files [
  "/mnt/user-data/outputs/README.md",
  "/mnt/user-data/outputs/index.html",
  "/mnt/user-data/outputs/SETUP.md"
]
```

### What User Needs to Do

After Claude shares files, user should:

1. **Download all files** from outputs
2. **Create GitHub repository**
3. **Push files to repository**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/username/hivevm.org.git
   git push -u origin main
   ```
4. **Enable GitHub Pages** in repository settings
5. **Configure custom domain** (optional)

---

## 🔍 Troubleshooting

### Issue: str_replace fails with "String not found"

**Cause**: Text doesn't match exactly

**Solution**:
```bash
# 1. View the exact text
view /home/claude/hivevm/index.html --range 70,75

# 2. Copy EXACT text including:
#    - Whitespace (spaces, tabs)
#    - Line breaks
#    - Special characters
#    - Case sensitivity

# 3. Use in str_replace
str_replace \
  --old_str 'EXACT TEXT HERE
WITH EXACT FORMATTING' \
  --new_str 'replacement'
```

### Issue: File not found in outputs

**Cause**: File not copied to outputs directory

**Solution**:
```bash
# Must copy to outputs before using present_files
bash_tool "cp /home/claude/hivevm/index.html /mnt/user-data/outputs/"
```

### Issue: Multiple files need same change

**Solution**: Use bash loop
```bash
bash_tool "for file in /home/claude/hivevm/*.html; do
  sed -i 's/old text/new text/g' \$file
done"
```

### Issue: Large file replacement needed

**Solution**: Create new file
```bash
# Instead of many str_replace calls, create new version
create_file \
  --path /mnt/user-data/outputs/index.html \
  --file_text 'entire new content'
```

---

## 🎯 Best Practices

### DO:
- ✅ Always view file before editing
- ✅ Use line ranges for large files  
- ✅ Match exact whitespace in str_replace
- ✅ Copy to outputs before present_files
- ✅ Include context in replacements to ensure uniqueness
- ✅ Test changes before sharing
- ✅ Share most important file first in array
- ✅ Use descriptive tool parameters

### DON'T:
- ❌ Edit files in /mnt/user-data/uploads/ (read-only)
- ❌ Forget to copy to outputs
- ❌ Use str_replace without viewing first
- ❌ Assume whitespace doesn't matter
- ❌ Edit library files (Bootstrap, jQuery, etc.)
- ❌ Share files from /home/claude/ directory
- ❌ Make destructive changes without backup

### Efficiency Tips:

1. **Batch operations**: Make multiple edits before copying to outputs
2. **Use grep**: Find text before replacing: `grep -n "search" file.html`
3. **Verify paths**: Double-check file paths before operations
4. **Test incrementally**: Make one change, test, then continue
5. **Read documentation**: Check PROJECT_INFO.md for technical details

---

## 📚 Quick Command Reference

### File Operations
```bash
# View file
view /home/claude/hivevm/index.html

# View specific lines
view /home/claude/hivevm/index.html --range 50,60

# Edit file
str_replace --path /file --old_str 'old' --new_str 'new'

# Create file
create_file --path /file --file_text 'content'

# Copy file
bash_tool "cp source dest"

# Copy directory
bash_tool "cp -r source/ dest/"
```

### Search Operations
```bash
# Search for text
bash_tool "grep 'search term' /home/claude/hivevm/index.html"

# Search with line numbers
bash_tool "grep -n 'search term' file.html"

# Search recursively
bash_tool "grep -r 'search term' /home/claude/hivevm/"

# Count occurrences
bash_tool "grep -c 'search term' file.html"
```

### Information Commands
```bash
# List files
bash_tool "ls -la /home/claude/hivevm/"

# File size
bash_tool "ls -lh file.jpg"

# Line count
bash_tool "wc -l file.html"

# File type
bash_tool "file /home/claude/hivevm/index.html"

# Disk usage
bash_tool "du -sh /home/claude/hivevm/"
```

### Validation Commands
```bash
# Find broken image links
bash_tool "grep -o 'src=\"[^\"]*\"' index.html"

# Check for missing alt tags
bash_tool "grep '<img' index.html | grep -v 'alt='"

# List all links
bash_tool "grep -o 'href=\"[^\"]*\"' index.html"

# Check color usage
bash_tool "grep '#f2b408' assets/css/hivevm.css"
```

---

## 🎓 Learning Resources

### For Understanding the Project
- **PROJECT_INFO.md**: Complete technical reference
- **SETUP.md**: Development guide
- **README.md**: Project overview

### For Specific Tasks
- **QUICKSTART.md**: Common tasks
- **CONTRIBUTING.md**: Best practices
- **CHANGELOG.md**: Version history

### External Resources
- Bootstrap 4: https://getbootstrap.com/docs/4.6/
- jQuery: https://api.jquery.com/
- Font Awesome: https://fontawesome.com/v4.7/

---

## 📞 Support & Questions

If Claude encounters issues:

1. **Check this guide** for solutions
2. **View PROJECT_INFO.md** for technical details
3. **Review SETUP.md** for setup information
4. **Explain issue to user** and ask for clarification

---

## ✨ Summary

Claude should follow this workflow for every task:

1. **Understand Request**: Read user's request carefully
2. **View Files**: Use view tool to examine relevant files
3. **Plan Changes**: Determine which files need editing
4. **Make Edits**: Use str_replace for precise changes
5. **Verify**: Check changes with view or bash commands
6. **Copy to Outputs**: Move files to /mnt/user-data/outputs/
7. **Share**: Use present_files to deliver to user
8. **Explain**: Briefly describe what was changed

**Most Important Rule**: 
Always copy final files to `/mnt/user-data/outputs/` and use `present_files` tool to share with the user!

---

**Version**: 1.0.0  
**Last Updated**: February 9, 2025  
**Maintained By**: HiveVM Team
