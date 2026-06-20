# HiveVM — Website (Pulsar-Lite-Stil, Gelb)

Statische Single-Page-Site für `hivevm.github.io`. Kein Build-Schritt nötig —
einfach committen und GitHub Pages liefert sie aus.

## Inhalt

```
index.html                     Komplette Seite (CSS + JS inline)
assets/favicon.svg             Skalierbares Favicon (moderne Browser)
assets/favicon.ico             Favicon-Fallback (16/32/48/64)
assets/apple-touch-icon.png    iOS-Homescreen-Icon (180×180)
```

Schriftarten (Inter, JetBrains Mono) werden von Google Fonts geladen.

## Einbauen ins Repo `hivevm/hivevm.github.io`

1. `index.html` im Repo-Root durch diese Datei ersetzen.
2. Die drei Dateien aus `assets/` in den vorhandenen `assets/`-Ordner kopieren
   (die alte `favicon.ico` wird durch die neue, scharfe ersetzt).
3. **`CNAME` (hivevm.org) und alle übrigen Inhalte unangetastet lassen.**
4. Commit + Push → Pages aktualisiert sich automatisch.

Die alten, nicht mehr benötigten Dateien (`assets/css/bootstrap.min.css`,
`owl-carousel.*`, `jquery-2.1.0.min.js`, `hivevm.css`, `flex-slider.css` usw.)
kannst du später aufräumen — die neue Seite verwendet sie nicht.

## Farben anpassen

Alle Akzentfarben hängen an vier Variablen ganz oben im `<style>`:

```
--brand:        #f2b408;
--brand-bright: #ffd614;
--accent:       #f2a408;
--accent-bright:#ffcc33;
```

Eine Stelle ändern — Buttons, Logo, Verläufe und Hervorhebungen ziehen nach.

---
Design adaptiert von Pulsar Lite (MIT). Inhalte & Gelb-Branding: HiveVM.
