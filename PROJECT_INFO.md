# HiveVM Project Information

Complete reference guide for working with the HiveVM website project.

## 🎯 Project Summary

**Project Name**: HiveVM Website  
**Purpose**: Landing page and project showcase for HiveVM development tools  
**Technology**: Static HTML/CSS/JavaScript website  
**Hosting**: GitHub Pages  
**Domain**: hivevm.org  
**Repository**: https://github.com/hivevm/hivevm.org

## 📊 Project Status

- **Current Version**: 1.0.0
- **Status**: Production
- **Last Updated**: February 9, 2025
- **Maintainer**: HiveVM Team
- **License**: MIT

## 🏗️ Architecture

### Site Structure
```
Single Page Application (SPA)
├── Header/Navigation (Fixed)
├── Hero Section
├── About/Features Section
└── Footer
```

### Technology Stack

**Frontend:**
- HTML5 (Semantic markup)
- CSS3 (Custom styling + Bootstrap)
- JavaScript (jQuery + custom)

**Libraries:**
- Bootstrap 4.6.x (Grid & Components)
- jQuery 2.1.0 (DOM Manipulation)
- Font Awesome 4.x (Icons)
- ScrollReveal (Animations)
- Owl Carousel (If needed for future use)

**Hosting:**
- GitHub Pages (Static hosting)
- Custom DNS (hivevm.org)

## 📁 Complete File Inventory

### Root Files
```
/index.html              - Main HTML file (Entry point)
/honeycomb.jpg          - Hero background image
/.nojekyll              - Prevents Jekyll processing
/CNAME                  - Custom domain configuration
/README.md              - Project documentation
/LICENSE                - MIT License
/CONTRIBUTING.md        - Contribution guidelines
/SETUP.md              - Development setup guide
/CHANGELOG.md          - Version history
/PROJECT_INFO.md       - This file
/.gitignore            - Git ignore rules
```

### CSS Files (assets/css/)
```
bootstrap.min.css      - Bootstrap framework (155KB)
font-awesome.css       - Font Awesome icons (39KB)
hivevm.css            - Custom styles ⭐ MAIN CSS (24KB)
owl-carousel.css      - Carousel styles (4KB)
flex-slider.css       - Slider styles (7KB)
```

### JavaScript Files (assets/js/)
```
jquery-2.1.0.min.js    - jQuery library (83KB)
bootstrap.min.js       - Bootstrap JS (58KB)
custom.js             - Custom scripts ⭐ MAIN JS (6KB)
owl-carousel.js       - Carousel functionality (93KB)
scrollreveal.min.js   - Scroll animations (4KB)
```

### Images (assets/images/)
```
banner-bg.png          - Hero section background (1.1MB)
footer-bg.png          - Footer background (2.2MB)
features-icon-0.png    - Feature icon (3KB)
features-icon-1.png    - Feature icon (3KB)
features-icon-2.png    - Feature icon (3KB)
features-icon-3.png    - Feature icon (3KB)
about-icon-01.png      - About icon (6KB)
about-icon-02.png      - About icon (6KB)
about-icon-03.png      - About icon (6KB)
```

### Fonts (assets/fonts/)
```
Font Awesome webfonts (.eot, .woff, .woff2, .ttf, .svg)
Flaticon font
FlexSlider icons
Slick carousel fonts
```

## 🎨 Design Specifications

### Color Palette
```css
Primary:    #f2b408  (Golden Yellow)  - Main brand color
Secondary:  #f1556a  (Coral Pink)     - Accent/hover color
Accent:     #f4813f  (Orange)         - Buttons/highlights
Dark:       #1e1e1e  (Almost Black)   - Text
Gray:       #7a7a7a  (Medium Gray)    - Secondary text
Light Gray: #888888  (Light Gray)     - Body text
White:      #ffffff  (White)          - Backgrounds
```

### Typography
```css
Font Family: 'Poppins', sans-serif
Import: Google Fonts

Font Weights:
- 100: Thin
- 200: Extra Light
- 300: Light
- 400: Regular
- 500: Medium
- 600: Semi Bold
- 700: Bold
- 800: Extra Bold
- 900: Black

Font Sizes:
- Body: 16px (base)
- Small: 13-15px
- Medium: 22px
- Large: 28px
- Headings: 42px
```

### Spacing System
```css
Small:  15-30px
Medium: 45-60px
Large:  100-120px
XLarge: 200px+
```

### Border Radius
```css
Buttons: 25px (pill shape)
Cards: 5px
Circles: 50%
```

### Responsive Breakpoints
```css
Mobile S:   320px
Mobile M:   375px
Mobile L:   425px
Tablet:     768px
Laptop:     1024px
Desktop:    1440px
Large:      2560px
```

## 🔧 Key Components

### 1. Header/Navigation
**Location**: Lines 29-46 in index.html
**Features**:
- Fixed positioning on scroll
- Logo with brand name
- Navigation menu (Home, About)
- Mobile hamburger menu
- Smooth scroll to sections

**Key Classes**:
- `.header-area` - Main header container
- `.background-header` - Sticky header state
- `.main-nav` - Navigation wrapper
- `.logo` - Brand logo
- `.nav` - Navigation list

### 2. Hero Section
**Location**: Lines 48-62 in index.html
**Features**:
- Full-width background image
- Centered content
- Call-to-action button
- Animated entrance

**Key Classes**:
- `.welcome-area` - Hero container
- `.header-text` - Content wrapper
- `.left-text` - Text content
- `.main-button-slider` - CTA button

### 3. Features Section
**Location**: Lines 64-105 in index.html
**Features**:
- Three-column grid
- Icon + Title + Description
- GitHub links for each project
- Responsive layout

**Key Classes**:
- `.section` - Section wrapper
- `.features-item` - Individual feature
- `.features-icon` - Icon container
- `.main-button` - GitHub link button

### 4. Preloader
**Location**: Lines 21-27 in index.html
**Features**:
- Loading animation
- Gradient background
- Automatic hide on load

**Key Classes**:
- `#preloader` - Preloader overlay
- `.jumper` - Animation container

## 🔗 External Links

### GitHub Repositories
1. **Parser Generator**: https://github.com/hivevm/cc
2. **Manual Generator**: https://github.com/hivevm/doc
3. **Gradle Workflow**: https://github.com/hivevm/gradleDevOps

### External Resources
- Google Fonts: Poppins font family
- Font Awesome CDN (if used)
- Bootstrap CDN (if used)

## 📝 Content Structure

### Navigation Items
1. **Home** → #welcome
2. **About** → #about

### Feature Cards
1. **Parser Generator**
   - Number: 01
   - Icon: features-icon-1.png
   - Title: Parser Generator
   - Description: LL(k) parser generator for context-free grammars
   - Link: github.com/hivevm/cc

2. **Manual Generator**
   - Number: 02
   - Icon: features-icon-2.png
   - Title: Manual Generator
   - Description: Manual generator for markdown documents
   - Link: github.com/hivevm/doc

3. **Gradle Workflow**
   - Number: 03
   - Icon: features-icon-3.png
   - Title: Gradle Workflow
   - Description: Gradle-based CD/CI pipeline engine
   - Link: github.com/hivevm/gradleDevOps

## 🎯 SEO & Meta Information

### Current Meta Tags
```html
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="HiveVM">
```

### Recommended Additions
```html
<meta name="description" content="HiveVM - Development tools based on modelling. Parser generators, documentation tools, and build automation for Java, C++, and Rust.">
<meta name="keywords" content="parser generator, LL(k), gradle, vscode, development tools, build automation">
<meta property="og:title" content="HiveVM - Development Tools">
<meta property="og:description" content="Parser generators, documentation tools, and build pipelines">
<meta property="og:image" content="https://hivevm.org/honeycomb.jpg">
<meta property="og:url" content="https://hivevm.org">
<meta name="twitter:card" content="summary_large_image">
```

## 🔍 Common Modifications

### 1. Add New Feature Card
```html
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
  <div class="features-item">
    <div class="features-icon">
      <h2>04</h2>
      <img src="assets/images/features-icon-0.png" alt="">
      <h4>Feature Name</h4>
      <p>Feature description goes here.</p>
      <a href="https://github.com/hivevm/repo" class="main-button">GitHub</a>
    </div>
  </div>
</div>
```

### 2. Change Colors
Find and replace in hivevm.css:
- `#f2b408` → Your primary color
- `#f1556a` → Your secondary color
- `#f4813f` → Your accent color

### 3. Update Hero Text
Edit lines 54-56 in index.html:
```html
<h1>Your New Heading <em>Emphasis</em></h1>
<p>Your new description here...</p>
```

### 4. Add Navigation Link
Add in nav list (around line 37):
```html
<li class="scroll-to-section">
  <a href="#section-id" class="menu-item">Link Text</a>
</li>
```

## 🐛 Known Issues & Solutions

### Issue 1: Images Not Displaying
**Problem**: Images return 404  
**Solution**: Check file paths are relative and case-sensitive

### Issue 2: CSS Not Loading
**Problem**: Styles not applied  
**Solution**: Clear cache, check file paths in index.html

### Issue 3: Smooth Scroll Not Working
**Problem**: Navigation doesn't scroll smoothly  
**Solution**: Verify custom.js is loaded after jQuery

### Issue 4: Mobile Menu Not Working
**Problem**: Hamburger menu doesn't toggle  
**Solution**: Check Bootstrap JS is loaded correctly

## 📊 Performance Metrics

### Target Lighthouse Scores
- Performance: > 90
- Accessibility: > 90
- Best Practices: > 90
- SEO: > 90

### Optimization Checklist
- [ ] Images optimized (< 200KB each)
- [ ] CSS minified
- [ ] JS minified
- [ ] Enable gzip compression
- [ ] Use CDN for libraries
- [ ] Lazy load images
- [ ] Reduce HTTP requests
- [ ] Add caching headers

## 🔐 Security Considerations

1. **External Links**: Use `rel="noopener noreferrer"` for security
2. **Dependencies**: Keep libraries updated
3. **HTTPS**: Ensure site uses HTTPS
4. **Content Security Policy**: Consider adding CSP headers
5. **Subresource Integrity**: Add SRI hashes for CDN resources

## 🚀 Deployment Process

### Standard Deployment
1. Make changes locally
2. Test thoroughly
3. Commit to git
4. Push to `main` branch
5. GitHub Pages auto-deploys
6. Verify at hivevm.org

### Emergency Rollback
1. Identify last working commit
2. `git revert <commit-hash>`
3. Push to main
4. Verify deployment

## 📞 Support & Resources

### Documentation
- Main README: `/README.md`
- Setup Guide: `/SETUP.md`
- Contributing: `/CONTRIBUTING.md`
- Changelog: `/CHANGELOG.md`

### External Resources
- Bootstrap 4: https://getbootstrap.com/docs/4.6/
- jQuery: https://api.jquery.com/
- Font Awesome: https://fontawesome.com/v4.7/
- GitHub Pages: https://docs.github.com/en/pages

### Contact
- Issues: https://github.com/hivevm/hivevm.org/issues
- Discussions: https://github.com/hivevm/hivevm.org/discussions

## 🎓 Quick Reference for Claude

### File Paths
```bash
# Working directory
/home/claude/hivevm/

# Main files to edit
/home/claude/hivevm/index.html
/home/claude/hivevm/assets/css/hivevm.css
/home/claude/hivevm/assets/js/custom.js

# Output directory for sharing
/mnt/user-data/outputs/
```

### Common Commands
```bash
# View structure
ls -la /home/claude/hivevm/

# Read HTML
cat /home/claude/hivevm/index.html

# Edit CSS (use str_replace tool)
# /home/claude/hivevm/assets/css/hivevm.css

# Copy to outputs
cp -r /home/claude/hivevm/* /mnt/user-data/outputs/
```

### Editing Workflow
1. Use `view` tool to examine files
2. Use `str_replace` tool to make changes
3. Use `create_file` for new files
4. Use `bash_tool` to verify changes
5. Copy final files to `/mnt/user-data/outputs/`

---

**Last Updated**: February 9, 2025  
**Version**: 1.0.0  
**Maintained By**: HiveVM Team
