# Common Edits Reference

**Ready-to-use code snippets for Claude**

This document provides copy-paste ready code for common editing tasks.

---

## 📋 Table of Contents

1. [HTML Edits](#html-edits)
2. [CSS Edits](#css-edits)
3. [Color Changes](#color-changes)
4. [Content Updates](#content-updates)
5. [Layout Modifications](#layout-modifications)
6. [SEO & Meta Tags](#seo--meta-tags)
7. [Navigation Updates](#navigation-updates)
8. [Feature Cards](#feature-cards)
9. [Responsive Adjustments](#responsive-adjustments)
10. [Performance Optimization](#performance-optimization)

---

## 📝 HTML Edits

### Change Hero Heading

**Current** (Line 71):
```html
<h1>Development Tools based on <em>MODELLING</em></h1>
```

**Example Replacements**:
```html
<!-- Option 1: Simpler -->
<h1>Professional <em>Development Tools</em></h1>

<!-- Option 2: Feature-focused -->
<h1>Parser Generators & <em>Build Automation</em></h1>

<!-- Option 3: Action-oriented -->
<h1>Build Better Software with <em>HiveVM</em></h1>
```

**Claude Command**:
```bash
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '<h1>Development Tools based on <em>MODELLING</em></h1>' \
  --new_str '<h1>Professional <em>Development Tools</em></h1>'
```

---

### Update Hero Description

**Current** (Line 72):
```html
<p>Developer tools for Gradle and VSCode, based on Java/C++ and Rust. The tools includes a parser generator on LL(k), server launchers for VSCode and build pipelines for Gradle.</p>
```

**Example Replacements**:
```html
<!-- Option 1: Concise -->
<p>Professional development tools including parser generators, documentation builders, and CI/CD pipelines for modern software projects.</p>

<!-- Option 2: Technical -->
<p>LL(k) parser generator, Markdown documentation tools, and Gradle-based build automation for Java, C++, and Rust development.</p>

<!-- Option 3: Benefit-focused -->
<p>Accelerate your development workflow with advanced parsing, automated documentation, and streamlined build processes.</p>
```

---

### Change Call-to-Action Button

**Current** (Line 73):
```html
<a href="#about" class="main-button-slider">Read more</a>
```

**Example Replacements**:
```html
<!-- Different text -->
<a href="#about" class="main-button-slider">Learn More</a>
<a href="#about" class="main-button-slider">Get Started</a>
<a href="#about" class="main-button-slider">Explore Tools</a>

<!-- Different destination -->
<a href="https://github.com/hivevm" class="main-button-slider" target="_blank" rel="noopener noreferrer">View on GitHub</a>

<!-- Multiple buttons -->
<a href="#about" class="main-button-slider">Learn More</a>
<a href="https://github.com/hivevm" class="main-button-slider" target="_blank" rel="noopener noreferrer" style="margin-left: 15px;">GitHub</a>
```

---

## 🎨 CSS Edits

### Change Primary Color (Golden Yellow)

**Find All Instances**:
```bash
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css"
```

**Replace Systematically**:

1. **Logo Color** (Line 288):
```css
/* OLD */
.header-area .main-nav .logo em { color: #f2b408; }

/* NEW - Blue */
.header-area .main-nav .logo em { color: #0066cc; }

/* NEW - Green */
.header-area .main-nav .logo em { color: #28a745; }

/* NEW - Purple */
.header-area .main-nav .logo em { color: #6f42c1; }
```

2. **Button Background** (Line 142, 161):
```css
/* OLD */
background-color: #f2b408;

/* NEW */
background-color: #0066cc;
```

3. **Navigation Hover** (Line 246, 250):
```css
/* OLD */
color: #f2b408;

/* NEW */
color: #0066cc;
```

**Claude Command Pattern**:
```bash
str_replace \
  --path /home/claude/hivevm/assets/css/hivevm.css \
  --old_str '.header-area .main-nav .logo em {
  font-style: normal;
  color: #f2b408;
}' \
  --new_str '.header-area .main-nav .logo em {
  font-style: normal;
  color: #0066cc;
}'
```

---

### Change Secondary Color (Coral Pink)

**Current**: `#f1556a`

**Find**:
```bash
bash_tool "grep -n '#f1556a' /home/claude/hivevm/assets/css/hivevm.css"
```

**Common Replacements**:
```css
/* Blue Theme */
#f1556a → #0056b3

/* Green Theme */
#f1556a → #218838

/* Purple Theme */
#f1556a → #5a32a3
```

---

### Change Font Family

**Current** (Line 73):
```css
font-family: 'Poppins', sans-serif;
```

**Alternatives**:
```css
/* Modern Sans-Serif */
font-family: 'Inter', sans-serif;
font-family: 'Roboto', sans-serif;
font-family: 'Open Sans', sans-serif;

/* Serif */
font-family: 'Merriweather', serif;
font-family: 'Playfair Display', serif;

/* Monospace for Tech Look */
font-family: 'Fira Code', monospace;
font-family: 'Source Code Pro', monospace;
```

**Note**: Remember to update Google Fonts import in HTML:
```html
<!-- In index.html head section -->
<link href="https://fonts.googleapis.com/css?family=Inter:300,400,600,700&display=swap" rel="stylesheet">
```

---

### Adjust Hero Section Height

**Current** (Line ~550):
```css
.welcome-area {
  padding: 300px 0px 200px 0px;
}
```

**Adjustments**:
```css
/* Shorter (more compact) */
.welcome-area {
  padding: 200px 0px 150px 0px;
}

/* Taller (more dramatic) */
.welcome-area {
  padding: 400px 0px 300px 0px;
}

/* Balanced */
.welcome-area {
  padding: 250px 0px 180px 0px;
}
```

---

## 🌈 Color Changes

### Complete Color Scheme Templates

#### Blue Professional Theme
```css
Primary:   #0066cc  (replaces #f2b408)
Secondary: #0056b3  (replaces #f1556a)
Accent:    #0099ff  (replaces #f4813f)
```

**Implementation**:
```bash
# Find and replace all colors
bash_tool "grep -n '#f2b408' /home/claude/hivevm/assets/css/hivevm.css | wc -l"
# Then replace each instance
```

#### Green Tech Theme
```css
Primary:   #28a745  (replaces #f2b408)
Secondary: #218838  (replaces #f1556a)
Accent:    #20c997  (replaces #f4813f)
```

#### Purple Creative Theme
```css
Primary:   #6f42c1  (replaces #f2b408)
Secondary: #5a32a3  (replaces #f1556a)
Accent:    #8b5cf6  (replaces #f4813f)
```

#### Dark Mode Colors
```css
Background: #1a1a1a
Text:       #ffffff
Primary:    #ffd700
Secondary:  #ff6b6b
```

---

## 📄 Content Updates

### Update Page Title

**Current** (Line 28):
```html
<title>HiveVM - Development Tools based on Modelling</title>
```

**Variations**:
```html
<title>HiveVM | Parser Generator & Build Tools</title>
<title>HiveVM - Open Source Development Tools</title>
<title>HiveVM - Tools for Modern Developers</title>
<title>Parser Generators, Docs & CI/CD | HiveVM</title>
```

---

### Update Meta Description

**Current** (Line 7):
```html
<meta name="description" content="HiveVM - Development tools based on modelling. Parser generators, documentation tools, and build automation for Java, C++, and Rust.">
```

**SEO-Optimized Variations**:
```html
<!-- Keyword-focused (155 chars) -->
<meta name="description" content="HiveVM provides open-source parser generators, documentation builders, and CI/CD tools for Java, C++, and Rust developers. Free GitHub projects.">

<!-- Benefit-focused (158 chars) -->
<meta name="description" content="Accelerate development with HiveVM's parser generator, automated docs, and Gradle pipelines. Free open-source tools for professional developers.">

<!-- Technical (152 chars) -->
<meta name="description" content="LL(k) parser generator, CommonMark documentation tool, and Gradle-based CI/CD engine. Professional development tools for Java, C++, and Rust.">
```

---

## 📑 Navigation Updates

### Add New Navigation Link

**Current** (Lines 50-54):
```html
<ul class="nav">
    <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
    <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>
</ul>
```

**With New Links**:
```html
<ul class="nav">
    <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
    <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>
    <li class="scroll-to-section"><a href="#features" class="menu-item">Features</a></li>
    <li class="scroll-to-section"><a href="#contact" class="menu-item">Contact</a></li>
    <li><a href="https://github.com/hivevm" class="menu-item" target="_blank" rel="noopener noreferrer">GitHub</a></li>
</ul>
```

**Claude Command**:
```bash
str_replace \
  --path /home/claude/hivevm/index.html \
  --old_str '                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
                            <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>
                        </ul>' \
  --new_str '                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#welcome" class="menu-item">Home</a></li>
                            <li class="scroll-to-section"><a href="#about" class="menu-item">About</a></li>
                            <li class="scroll-to-section"><a href="#contact" class="menu-item">Contact</a></li>
                        </ul>'
```

---

## 🎴 Feature Cards

### Add 4th Feature Card

**Insert After Line 116** (before closing `</div></div></section>`):

```html
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12"
                    data-scroll-reveal="enter bottom move 30px over 0.6s after 0.4s">
                    <div class="features-item">
                        <div class="features-icon">
                            <h2>04</h2>
                            <img src="assets/images/features-icon-0.png" alt="New Feature">
                            <h4>Feature Name</h4>
                            <p>Description of the new feature and what it does for developers.</p>
                            <a href="https://github.com/hivevm/new-repo" class="main-button" target="_blank" rel="noopener noreferrer">GitHub</a>
                        </div>
                    </div>
                </div>
```

**Complete Replacement Example**:
```bash
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
                            <img src="assets/images/features-icon-0.png" alt="VSCode Extension">
                            <h4>VSCode Extension</h4>
                            <p>Language server and IDE integration for enhanced development experience.</p>
                            <a href="https://github.com/hivevm/vscode" class="main-button" target="_blank" rel="noopener noreferrer">GitHub</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>'
```

---

### Update Existing Feature Card

**Example: Update Parser Generator Description**:

**Current** (Lines 90-92):
```html
<h4>Parser Generator</h4>
<p>LL(k) parser generator for context-free grammars. Generates parser and AST (Abstract Syntax Tree) for Java &amp; C++.</p>
<a href="https://github.com/hivevm/cc" class="main-button" target="_blank" rel="noopener noreferrer">GitHub</a>
```

**New**:
```html
<h4>Parser Generator</h4>
<p>Advanced LL(k) parser generator supporting context-free grammars with automatic AST generation for Java and C++. Fast, reliable, and easy to use.</p>
<a href="https://github.com/hivevm/cc" class="main-button" target="_blank" rel="noopener noreferrer">Learn More</a>
```

---

## 📱 Responsive Adjustments

### Mobile Hero Text Size

**Add to hivevm.css**:
```css
@media (max-width: 767px) {
  .welcome-area h1 {
    font-size: 28px;  /* Smaller on mobile */
  }
  
  .welcome-area p {
    font-size: 14px;
  }
}
```

### Mobile Navigation Spacing

```css
@media (max-width: 991px) {
  .header-area .main-nav .nav li {
    padding: 10px 0;  /* Vertical spacing for mobile */
  }
}
```

### Hide Elements on Mobile

```css
@media (max-width: 767px) {
  .desktop-only {
    display: none;
  }
}
```

---

## ⚡ Performance Optimization

### Lazy Load Images

**Add to images**:
```html
<img src="assets/images/features-icon-1.png" 
     alt="Parser Generator" 
     loading="lazy">
```

### Optimize Large Background Images

**In CSS, use responsive images**:
```css
.welcome-area {
  background-image: url(../images/banner-bg.png);
}

@media (max-width: 767px) {
  .welcome-area {
    background-image: url(../images/banner-bg-mobile.png);
  }
}
```

---

## 🔍 SEO Enhancements

### Add Open Graph Tags

**Insert in `<head>` section**:
```html
<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://hivevm.org/">
<meta property="og:title" content="HiveVM - Development Tools">
<meta property="og:description" content="Parser generators, documentation tools, and build automation.">
<meta property="og:image" content="https://hivevm.org/honeycomb.jpg">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://hivevm.org/">
<meta property="twitter:title" content="HiveVM - Development Tools">
<meta property="twitter:description" content="Parser generators, documentation tools, and build automation.">
<meta property="twitter:image" content="https://hivevm.org/honeycomb.jpg">
```

### Add Structured Data

**Insert before `</head>`**:
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "HiveVM",
  "description": "Development tools based on modelling",
  "url": "https://hivevm.org",
  "applicationCategory": "DeveloperApplication",
  "operatingSystem": "Cross-platform"
}
</script>
```

---

## 🎯 Quick Snippets

### Add Analytics

```html
<!-- Google Analytics - Insert before </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

### Add Contact Section

```html
<!-- Insert before closing </body> -->
<section class="section" id="contact">
    <div class="container">
        <div class="row">
            <div class="center-heading">
                <h2>Get in <em>Touch</em></h2>
                <p>Questions? Suggestions? We'd love to hear from you!</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <p>Contact us via <a href="https://github.com/hivevm">GitHub</a></p>
            </div>
        </div>
    </div>
</section>
```

### Add Footer

```html
<!-- Insert before </body> -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © 2025 HiveVM. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>
```

---

## 📊 Testing Snippets

### Check All Colors Changed

```bash
# Should return 0 if all primary colors changed
bash_tool "grep -c '#f2b408' /home/claude/hivevm/assets/css/hivevm.css"
```

### Verify Image Alt Tags

```bash
# Should return 0 (all images have alt tags)
bash_tool "grep '<img' /home/claude/hivevm/index.html | grep -v 'alt=' | wc -l"
```

### Check File Sizes

```bash
bash_tool "du -sh /home/claude/hivevm/assets/images/*"
```

---

## 💡 Pro Tips

1. **Always view before editing**: Use `view` tool to see exact text
2. **Include context**: Make `old_str` unique with surrounding code
3. **Test incrementally**: Make one change, verify, then continue
4. **Backup important changes**: Copy to outputs frequently
5. **Use grep to find**: Search before replacing

---

**Version**: 1.0.0  
**Last Updated**: February 9, 2025  
**Total Snippets**: 50+
