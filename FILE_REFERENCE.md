# File Reference - HiveVM Project

**Complete file-by-file documentation for Claude**

This document provides detailed information about every file in the HiveVM project.

---

## 📋 Table of Contents

- [Root Files](#root-files)
- [HTML Files](#html-files)
- [CSS Files](#css-files)
- [JavaScript Files](#javascript-files)
- [Images](#images)
- [Fonts](#fonts)
- [Configuration Files](#configuration-files)
- [Documentation Files](#documentation-files)

---

## 🏠 Root Files

### index.html
**Location**: `/home/claude/hivevm/index.html`  
**Size**: ~5.7KB  
**Lines**: 122  
**Purpose**: Main webpage  
**Edit Frequency**: ⭐⭐⭐⭐⭐ (Very Common)

**Structure**:
```html
Lines 1-34:   <head> section (meta tags, title, CSS links)
Lines 35-61:  <body> preloader
Lines 62-79:  Header/Navigation  
Lines 80-98:  Hero/Welcome section
Lines 99-123: Features/About section
Lines 124-141: Scripts (jQuery, Bootstrap, plugins)
```

**Key Sections**:
- **Line 7**: Meta description (SEO)
- **Line 28**: Page title
- **Lines 50-54**: Navigation menu
- **Lines 71-73**: Hero heading and description
- **Lines 88-116**: Feature cards (3 projects)

**Common Edits**:
- Change hero text (line 71-73)
- Add navigation links (line 52)
- Modify feature cards (lines 88-116)
- Update meta tags (lines 5-24)

**Dependencies**:
- Requires: All CSS files in assets/css/
- Requires: All JS files in assets/js/
- Requires: All images in assets/images/

---

### honeycomb.jpg
**Location**: `/home/claude/hivevm/honeycomb.jpg`  
**Size**: 588KB  
**Dimensions**: Unknown (use bash to check)  
**Purpose**: Hero section background image  
**Edit Frequency**: ⭐ (Rare)

**Usage**: Referenced but not actively displayed in current version

**Optimization**:
```bash
# Check dimensions
bash_tool "file /home/claude/hivevm/honeycomb.jpg"

# Optimize if needed
bash_tool "convert honeycomb.jpg -quality 85 honeycomb-optimized.jpg"
```

---

## 📄 HTML Files

### index.html (Detailed Breakdown)

**Header Section (Lines 4-33)**:
```html
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="...">  <!-- Line 7: Edit for SEO -->
    <title>HiveVM - Development Tools...</title>  <!-- Line 28: Edit page title -->
    <!-- CSS links Lines 29-33 -->
</head>
```

**Navigation (Lines 45-61)**:
```html
<header class="header-area header-sticky">
    <nav class="main-nav">
        <a href="index.html" class="logo">Hive<em>VM</em></a>
        <ul class="nav">
            <li><a href="#welcome">Home</a></li>  <!-- Line 51 -->
            <li><a href="#about">About</a></li>   <!-- Line 52 -->
            <!-- Add new links here -->
        </ul>
    </nav>
</header>
```

**Hero Section (Lines 64-81)**:
```html
<div class="welcome-area" id="welcome">
    <div class="header-text">
        <h1>Development Tools based on <em>MODELLING</em></h1>  <!-- Line 71 -->
        <p>Developer tools for Gradle and VSCode...</p>         <!-- Line 72 -->
        <a href="#about" class="main-button-slider">Read more</a>  <!-- Line 73 -->
    </div>
</div>
```

**Feature Cards (Lines 84-121)**:
```html
<section class="section" id="about">
    <!-- Feature 1: Parser Generator (Lines 88-96) -->
    <div class="features-item">
        <h2>01</h2>
        <img src="assets/images/features-icon-1.png" alt="Parser Generator">
        <h4>Parser Generator</h4>
        <p>LL(k) parser generator...</p>
        <a href="https://github.com/hivevm/cc">GitHub</a>
    </div>
    
    <!-- Feature 2: Manual Generator (Lines 97-105) -->
    <!-- Feature 3: Gradle Workflow (Lines 106-114) -->
    <!-- Add new features here -->
</section>
```

---

## 🎨 CSS Files

### assets/css/hivevm.css ⭐ MAIN STYLESHEET
**Location**: `/home/claude/hivevm/assets/css/hivevm.css`  
**Size**: 24.9KB  
**Lines**: 1233  
**Purpose**: Custom styles for HiveVM  
**Edit Frequency**: ⭐⭐⭐⭐⭐ (Very Common)

**Structure**:
```css
Lines 1-25:     Comments & Font Import
Lines 26-100:   CSS Reset
Lines 101-221:  Global Styles
Lines 222-451:  Header/Navigation Styles
Lines 452-651:  Hero/Welcome Section Styles
Lines 652-822:  Features Section Styles
Lines 823-955:  Testimonials (not used)
Lines 956-1150: Footer Styles
Lines 1151-1233: Preloader Animation
```

**Key Variables to Edit**:
```css
/* Primary Color: #f2b408 (Golden Yellow) */
Line 142: background-color: #f2b408;  /* Main button */
Line 154: background-color: #f1556a;  /* Button hover */
Line 288: color: #f2b408;              /* Logo accent */
Line 246: color: #f2b408;              /* Nav hover */

/* Secondary Color: #f1556a (Coral Pink) */
Line 114: background: #f1556a;         /* Text selection */
Line 154: background-color: #f1556a;   /* Hover states */

/* Accent Color: #f4813f (Orange) */
Line 183: background-color: #f4813f;   /* Buttons */
```

**Common Sections to Edit**:

1. **Colors** (search for color codes):
```bash
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css"
```

2. **Typography**:
```css
Lines 73-80:  Font family and base styles
Lines 86-89:  Headings
Lines 95-99:  Paragraphs
```

3. **Hero Section**:
```css
Lines 452-651: .welcome-area styles
```

4. **Navigation**:
```css
Lines 253-450: .header-area, .main-nav styles
```

5. **Feature Cards**:
```css
Lines 652-822: .features-item, .features-icon styles
```

**Responsive Breakpoints**:
```css
Line 122: @media (max-width: 991px)   /* Tablet & Mobile */
Line 962: @media (max-width: 992px)   /* Footer responsive */
Line 1142: @media (max-width: 991px)  /* Copyright responsive */
```

---

### assets/css/bootstrap.min.css
**Location**: `/home/claude/hivevm/assets/css/bootstrap.min.css`  
**Size**: 155KB (minified)  
**Purpose**: Bootstrap 4 framework  
**Edit Frequency**: ❌ NEVER EDIT

**Do Not Modify**: This is Bootstrap framework CSS

---

### assets/css/font-awesome.css
**Location**: `/home/claude/hivevm/assets/css/font-awesome.css`  
**Size**: 39KB  
**Purpose**: Font Awesome icon styles  
**Edit Frequency**: ❌ NEVER EDIT

**Do Not Modify**: External library

---

### assets/css/owl-carousel.css
**Location**: `/home/claude/hivevm/assets/css/owl-carousel.css`  
**Size**: 4.9KB  
**Purpose**: Carousel component styles  
**Edit Frequency**: ❌ NEVER EDIT

**Note**: Carousel not actively used in current version

---

## 💻 JavaScript Files

### assets/js/custom.js ⭐ MAIN SCRIPTS
**Location**: `/home/claude/hivevm/assets/js/custom.js`  
**Size**: 6.1KB  
**Lines**: 246  
**Purpose**: Custom JavaScript functionality  
**Edit Frequency**: ⭐⭐⭐ (Moderate)

**Structure**:
```javascript
Lines 1-22:   Owl Carousel Init (not used)
Lines 25-35:  Sticky Header on Scroll
Lines 38:     Mobile Navigation
Lines 42:     ScrollReveal Init
Lines 46-51:  Mobile Menu Toggle
Lines 55-74:  Smooth Scroll Animation
Lines 76-115: Scroll-based Navigation Highlighting
Lines 117-182: Accordion Component (not used)
Lines 195-206: Home Separator (not used)
Lines 200-206: Counter Animation (not used)
Lines 209-225: Preloader Animation
Lines 228-243: Window Resize Handler
```

**Key Functions**:

1. **Sticky Header** (Lines 25-35):
```javascript
$(window).scroll(function () {
    var scroll = $(window).scrollTop();
    if (scroll >= box - header) {
        $("header").addClass("background-header");
    }
});
```

2. **Smooth Scroll** (Lines 55-74):
```javascript
$('a[href*=\\#]:not([href=\\#])').on('click', function () {
    $('html,body').animate({
        scrollTop: (target.offset().top)
    }, 700);
});
```

3. **Preloader** (Lines 218-224):
```javascript
$("#preloader").animate({
    'opacity': '0'
}, 600, function () {
    $("#preloader").css("visibility", "hidden").fadeOut();
});
```

**Common Edits**:
- Adjust scroll speed (line 67: change 700)
- Modify preloader timing (line 219: change 600)
- Add new scroll sections

---

### assets/js/jquery-2.1.0.min.js
**Edit**: ❌ NEVER - External library

### assets/js/bootstrap.min.js
**Edit**: ❌ NEVER - External library

### assets/js/owl-carousel.js
**Edit**: ❌ NEVER - External library

### assets/js/scrollreveal.min.js
**Edit**: ❌ NEVER - External library

---

## 🖼️ Images

### assets/images/banner-bg.png
**Size**: 1.1MB  
**Purpose**: Hero section background  
**Optimization Needed**: ⚠️ YES (too large)

**Optimize**:
```bash
bash_tool "convert banner-bg.png -quality 80 -resize 1920x banner-bg-optimized.png"
```

---

### assets/images/footer-bg.png
**Size**: 2.2MB  
**Purpose**: Footer background gradient  
**Optimization Needed**: ⚠️ YES (too large)

---

### assets/images/features-icon-*.png
**Files**: features-icon-0.png, features-icon-1.png, features-icon-2.png, features-icon-3.png  
**Size**: ~3KB each  
**Purpose**: Icons for feature cards  
**Optimization**: ✅ Already optimized

---

### assets/images/about-icon-*.png
**Files**: about-icon-01.png, about-icon-02.png, about-icon-03.png  
**Size**: ~6KB each  
**Purpose**: About section icons (not currently used)  
**Status**: Available for future use

---

## 🔤 Fonts

### assets/fonts/ (Font Awesome)
**Files**:
- FontAwesome.otf
- fontawesome-webfont.eot
- fontawesome-webfont.svg
- fontawesome-webfont.ttf
- fontawesome-webfont.woff
- fontawesome-webfont.woff2

**Purpose**: Font Awesome icon fonts  
**Edit**: ❌ NEVER - External library

---

### assets/fonts/ (Other)
- Flaticon.woff - Custom icon font
- flexslider-icon.* - Flexslider icons
- slick.* - Slick carousel icons

**Edit**: ❌ NEVER - External libraries

---

## ⚙️ Configuration Files

### .nojekyll
**Location**: `/home/claude/hivevm/.nojekyll`  
**Size**: 0 bytes (empty file)  
**Purpose**: Tells GitHub Pages not to use Jekyll  
**Edit**: ❌ NEVER - Keep as empty file

**Critical**: Must exist for GitHub Pages to work correctly

---

### CNAME
**Location**: `/home/claude/hivevm/CNAME`  
**Size**: 10 bytes  
**Content**: `hivevm.org`  
**Purpose**: Custom domain configuration  
**Edit**: ⭐ Only when changing domain

**Edit Example**:
```bash
str_replace \
  --path /home/claude/hivevm/CNAME \
  --old_str 'hivevm.org' \
  --new_str 'newdomain.com'
```

---

### .gitignore
**Location**: `/home/claude/hivevm/.gitignore`  
**Size**: 549 bytes  
**Purpose**: Git ignore rules  
**Edit**: ⭐⭐ Moderate (when adding new file types)

**Current Ignores**:
- OS files (.DS_Store, Thumbs.db)
- IDE files (.vscode, .idea)
- Dependencies (node_modules/)
- Build output (dist/, build/)
- Logs (*.log)

---

### .github/workflows/deploy.yml
**Location**: `/home/claude/hivevm/.github/workflows/deploy.yml`  
**Size**: ~1KB  
**Purpose**: GitHub Actions CI/CD workflow  
**Edit**: ⭐⭐ Moderate (when changing deployment)

**Workflow Steps**:
1. Validate HTML
2. Check links
3. Upload artifact
4. Deploy to GitHub Pages

---

## 📚 Documentation Files

### README.md
**Size**: 5.1KB  
**Purpose**: Main project documentation  
**Sections**: Features, Setup, Deployment, Contributing  
**Edit**: ⭐⭐⭐ Common (keep updated)

### SETUP.md
**Size**: 12.3KB  
**Purpose**: Comprehensive setup guide  
**Sections**: 12 sections covering all aspects  
**Edit**: ⭐⭐ Moderate (update as project evolves)

### PROJECT_INFO.md
**Size**: 11.1KB  
**Purpose**: Complete technical reference  
**Sections**: Architecture, files, design specs  
**Edit**: ⭐⭐ Moderate (update with major changes)

### QUICKSTART.md
**Size**: 3.5KB  
**Purpose**: 5-minute getting started  
**Sections**: Quick tasks and common fixes  
**Edit**: ⭐⭐ Moderate (keep examples current)

### CLAUDE_GUIDE.md
**Size**: ~30KB  
**Purpose**: Complete guide for Claude  
**Sections**: 10 sections on working with project  
**Edit**: ⭐ Rare (stable reference)

### CONTRIBUTING.md
**Size**: 5.2KB  
**Purpose**: Contribution guidelines  
**Edit**: ⭐ Rare (stable policies)

### CHANGELOG.md
**Size**: 2.6KB  
**Purpose**: Version history  
**Edit**: ⭐⭐⭐⭐⭐ Every release

### LICENSE
**Size**: 1KB  
**Purpose**: MIT License text  
**Edit**: ❌ NEVER

### PROJECT_SUMMARY.md
**Size**: 8.8KB  
**Purpose**: Summary of all improvements  
**Edit**: ⭐⭐ Update with major changes

---

## 📊 File Statistics

### By Type
```
HTML:     1 file   (~6KB)
CSS:      5 files  (~228KB total, 25KB custom)
JS:       5 files  (~245KB total, 6KB custom)
Images:   10 files (~3.4MB total)
Fonts:    15 files (~800KB total)
Docs:     9 files  (~50KB total)
Config:   4 files  (~2KB total)
```

### Edit Frequency Legend
- ⭐⭐⭐⭐⭐ Very Common (weekly/daily)
- ⭐⭐⭐⭐ Common (monthly)
- ⭐⭐⭐ Moderate (quarterly)
- ⭐⭐ Rare (yearly)
- ⭐ Very Rare (never or once)
- ❌ NEVER EDIT

---

## 🎯 Quick File Finder

**Want to edit hero text?**  
→ `index.html` line 71-73

**Want to change colors?**  
→ `assets/css/hivevm.css` search for `#f2b408`

**Want to add navigation link?**  
→ `index.html` line 52

**Want to modify feature cards?**  
→ `index.html` lines 88-116

**Want to adjust animations?**  
→ `assets/js/custom.js` lines 55-74

**Want to optimize images?**  
→ `assets/images/` directory

**Want to configure GitHub Pages?**  
→ `.nojekyll`, `CNAME` files

**Want to update deployment?**  
→ `.github/workflows/deploy.yml`

---

**Version**: 1.0.0  
**Last Updated**: February 9, 2025  
**Total Files Documented**: 44+
