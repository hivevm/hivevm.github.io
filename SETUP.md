# HiveVM Project Setup Guide

This guide provides comprehensive information for working on the HiveVM website project.

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Technology Stack](#technology-stack)
3. [File Structure](#file-structure)
4. [Development Environment](#development-environment)
5. [Making Changes](#making-changes)
6. [Testing](#testing)
7. [Deployment](#deployment)
8. [Common Tasks](#common-tasks)
9. [Troubleshooting](#troubleshooting)

## 🎯 Project Overview

HiveVM is a static website showcasing development tools for Gradle and VSCode. The website is:
- **Purpose**: Landing page for HiveVM tools and projects
- **Target Audience**: Developers interested in parser generators, documentation tools, and build automation
- **Key Features**: Responsive design, smooth animations, project showcases
- **Hosting**: GitHub Pages at hivevm.org

## 🛠️ Technology Stack

### Core Technologies
- **HTML5**: Semantic markup
- **CSS3**: Styling with custom properties
- **JavaScript**: Interactive elements and animations

### Libraries & Frameworks
- **Bootstrap 4**: Grid system and responsive utilities
- **jQuery 2.1.0**: DOM manipulation and event handling
- **Font Awesome**: Icon library
- **Owl Carousel**: Carousel functionality (if needed)
- **ScrollReveal**: Scroll-based animations

### Build Tools
- None (static site, no build process required)

## 📁 File Structure

```
hivevm/
│
├── index.html                 # Main page (entry point)
│
├── assets/
│   ├── css/
│   │   ├── bootstrap.min.css  # Bootstrap framework
│   │   ├── font-awesome.css   # Icon styles
│   │   ├── hivevm.css        # Custom styles (MAIN CSS FILE)
│   │   └── owl-carousel.css  # Carousel styles
│   │
│   ├── js/
│   │   ├── jquery-2.1.0.min.js    # jQuery library
│   │   ├── bootstrap.min.js       # Bootstrap JS
│   │   ├── custom.js             # Custom scripts (MAIN JS FILE)
│   │   ├── owl-carousel.js       # Carousel functionality
│   │   └── scrollreveal.min.js   # Scroll animations
│   │
│   ├── images/
│   │   ├── banner-bg.png         # Hero section background
│   │   ├── footer-bg.png         # Footer background
│   │   ├── features-icon-*.png   # Feature icons
│   │   └── about-icon-*.png      # About section icons
│   │
│   ├── fonts/
│   │   └── [Font Awesome fonts]
│   │
│   └── favicon.ico
│
├── honeycomb.jpg             # Banner/hero image
├── .nojekyll                 # GitHub Pages config
├── CNAME                     # Custom domain config
├── README.md                 # Main documentation
├── LICENSE                   # MIT License
├── CONTRIBUTING.md           # Contribution guidelines
├── SETUP.md                  # This file
└── .gitignore               # Git ignore rules
```

## 💻 Development Environment

### Prerequisites
- **Git**: Version control
- **Text Editor**: VS Code, Sublime, or similar
- **Web Browser**: Chrome/Firefox (with DevTools)
- **Optional**: Local web server

### Initial Setup

1. **Clone the Repository**
```bash
git clone https://github.com/hivevm/hivevm.org.git
cd hivevm.org
```

2. **Open in Editor**
```bash
code .  # VS Code
# or open in your preferred editor
```

3. **Start Local Server**

**Option A: Python**
```bash
python -m http.server 8000
# Then open http://localhost:8000
```

**Option B: Python 3**
```bash
python3 -m http.server 8000
```

**Option C: Node.js**
```bash
npx http-server
# or
npm install -g http-server
http-server
```

**Option D: PHP**
```bash
php -S localhost:8000
```

**Option E: VS Code Live Server**
- Install "Live Server" extension
- Right-click index.html → "Open with Live Server"

### Recommended VS Code Extensions
- Live Server
- HTML CSS Support
- Prettier - Code formatter
- Auto Rename Tag
- Path Intellisense

## 🔧 Making Changes

### HTML Changes (index.html)

**Key Sections:**
1. **Header/Navigation** (lines 29-46)
2. **Hero/Welcome** (lines 48-62)
3. **Features/About** (lines 64-105)
4. **Scripts** (lines 107-118)

**Example: Update Hero Text**
```html
<!-- Find this section around line 54 -->
<h1>Development Tools based on <em>MODELLING</em></h1>
<p>Your new description here...</p>
```

**Example: Add New Feature**
```html
<!-- Add after line 102, before </div> -->
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
  <div class="features-item">
    <div class="features-icon">
      <h2>04</h2>
      <img src="assets/images/features-icon-0.png" alt="">
      <h4>New Feature</h4>
      <p>Feature description here.</p>
      <a href="https://github.com/hivevm/new-repo" class="main-button">GitHub</a>
    </div>
  </div>
</div>
```

### CSS Changes (assets/css/hivevm.css)

**Key Sections:**
- **Global Styles**: Lines 106-221
- **Header**: Lines 224-450
- **Welcome/Hero**: Lines 452-650
- **Features**: Lines 652-822
- **Footer**: Lines 956-1150

**Example: Change Primary Color**
```css
/* Find all instances of #f2b408 and replace with your color */
/* Common locations: */
.header-area .main-nav .logo em { color: #f2b408; } /* Line 288 */
a.main-button { background-color: #f2b408; }        /* Line 161 */
```

**Example: Adjust Hero Section**
```css
.welcome-area {
  padding: 300px 0px 200px 0px;  /* Adjust padding */
  background-position: center;    /* Adjust background */
}
```

### JavaScript Changes (assets/js/custom.js)

View the current custom.js:
```bash
cat assets/js/custom.js
```

Common modifications:
- Scroll behavior
- Menu animations
- Preloader timing
- Smooth scrolling offsets

## 🧪 Testing

### Browser Testing

**Desktop Browsers:**
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

**Mobile Browsers:**
- Chrome Mobile
- Safari iOS
- Samsung Internet

### Responsive Testing

**Using Browser DevTools:**
1. Open DevTools (F12)
2. Click device toolbar icon
3. Test these breakpoints:
   - 320px (Mobile S)
   - 375px (Mobile M)
   - 425px (Mobile L)
   - 768px (Tablet)
   - 1024px (Laptop)
   - 1440px (Desktop)

**Using Online Tools:**
- [Responsive Design Checker](https://responsivedesignchecker.com/)
- [BrowserStack](https://www.browserstack.com/)

### Performance Testing

**Lighthouse Audit (Chrome DevTools):**
1. Open DevTools (F12)
2. Go to "Lighthouse" tab
3. Select categories: Performance, Accessibility, Best Practices, SEO
4. Click "Generate report"

**Target Scores:**
- Performance: > 90
- Accessibility: > 90
- Best Practices: > 90
- SEO: > 90

### Link Testing

Check all links work:
```bash
# Manual check or use a link checker tool
```

Links to verify:
- Navigation links (smooth scroll)
- GitHub repository links
- External resources

## 🚀 Deployment

### GitHub Pages Deployment

**Automatic Deployment:**
1. Push to `main` branch
2. GitHub Pages automatically deploys
3. Check status in Settings → Pages

**Manual Steps (if needed):**
1. Go to repository Settings
2. Navigate to "Pages" section
3. Source: Deploy from branch `main`
4. Folder: `/ (root)`
5. Save

**Deployment URL:**
- GitHub: `https://hivevm.github.io/hivevm.org/`
- Custom: `https://hivevm.org`

### Custom Domain Setup

**DNS Configuration:**
```
Type    Name    Value
A       @       185.199.108.153
A       @       185.199.109.153
A       @       185.199.110.153
A       @       185.199.111.153
CNAME   www     hivevm.github.io
```

**Verify Setup:**
```bash
dig hivevm.org
# Should show GitHub Pages IPs
```

### Deployment Checklist

Before deploying:
- [ ] Test all pages locally
- [ ] Check responsive design
- [ ] Verify all links
- [ ] Optimize images
- [ ] Run Lighthouse audit
- [ ] Check browser console for errors
- [ ] Test on mobile devices
- [ ] Update version/date if applicable

## 📝 Common Tasks

### Add a New Section

1. **HTML Structure:**
```html
<section class="section" id="new-section">
  <div class="container">
    <div class="row">
      <div class="center-heading">
        <h2>Section <em>Title</em></h2>
        <p>Section description</p>
      </div>
    </div>
    <div class="row">
      <!-- Content here -->
    </div>
  </div>
</section>
```

2. **Add Navigation Link:**
```html
<li class="scroll-to-section">
  <a href="#new-section" class="menu-item">New Section</a>
</li>
```

3. **Add CSS Styling:**
```css
#new-section {
  padding: 100px 0px;
  background-color: #fff;
}
```

### Update Colors/Theme

**Global Color Variables:**
```css
/* assets/css/hivevm.css */
:root {
  --primary-color: #f2b408;
  --secondary-color: #f1556a;
  --accent-color: #f4813f;
}
```

**Find and Replace:**
1. Open hivevm.css
2. Find: `#f2b408` (old color)
3. Replace: `#YOUR_NEW_COLOR`
4. Repeat for other colors

### Optimize Images

**Compression:**
```bash
# Using ImageOptim (Mac) or similar tool
# Target: < 200KB per image
```

**Recommended Formats:**
- PNG: Icons, logos
- JPG: Photos, backgrounds
- SVG: Simple graphics, icons
- WebP: Modern browsers (with fallback)

### Add Analytics

**Google Analytics:**
```html
<!-- Add before </head> in index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🔍 Troubleshooting

### Common Issues

**1. Changes Not Showing**
- Clear browser cache (Ctrl+Shift+R / Cmd+Shift+R)
- Check file saved
- Verify correct file path
- Check browser console for errors

**2. CSS Not Loading**
- Verify CSS file path in index.html
- Check for CSS syntax errors
- Clear cache
- Check network tab in DevTools

**3. JavaScript Not Working**
- Check browser console for errors
- Verify jQuery loads before custom.js
- Check for syntax errors
- Ensure scripts at bottom of body

**4. Images Not Displaying**
- Check image file paths (case-sensitive)
- Verify images exist in assets/images/
- Check image file permissions
- Inspect network tab for 404 errors

**5. Responsive Design Issues**
- Test with actual devices, not just DevTools
- Check Bootstrap grid classes
- Verify viewport meta tag present
- Test across different screen sizes

### Debug Tools

**Browser Console:**
```javascript
// Check for errors
console.log('Debugging...');
```

**Network Tab:**
- Check for failed requests
- Verify resource loading
- Check file sizes

**Elements Inspector:**
- Inspect computed styles
- Check element dimensions
- Verify class names

## 📚 Additional Resources

### Documentation
- [Bootstrap 4 Docs](https://getbootstrap.com/docs/4.6/)
- [jQuery API](https://api.jquery.com/)
- [Font Awesome Icons](https://fontawesome.com/v4.7/icons/)
- [GitHub Pages Docs](https://docs.github.com/en/pages)

### Learning Resources
- [MDN Web Docs](https://developer.mozilla.org/)
- [W3Schools](https://www.w3schools.com/)
- [CSS-Tricks](https://css-tricks.com/)

### Tools
- [Can I Use](https://caniuse.com/) - Browser compatibility
- [Validator.nu](https://validator.nu/) - HTML validation
- [CSS Validator](https://jigsaw.w3.org/css-validator/)
- [PageSpeed Insights](https://pagespeed.web.dev/)

## 🎯 Best Practices

1. **Always test locally before committing**
2. **Use meaningful commit messages**
3. **Keep code clean and commented**
4. **Optimize images before adding**
5. **Test on multiple browsers**
6. **Follow existing code style**
7. **Update documentation when needed**
8. **Use version control properly**

## 💡 Tips for Claude

When working on this project:

1. **File Locations**: All source files are in `/home/claude/hivevm/`
2. **Main Files**: index.html, assets/css/hivevm.css, assets/js/custom.js
3. **Always preserve**: File structure, existing functionality
4. **Test changes**: Use bash to preview files before committing
5. **Output location**: Copy final files to `/mnt/user-data/outputs/` when done

**Quick Reference Commands:**
```bash
# View file structure
ls -la /home/claude/hivevm/

# View HTML
cat /home/claude/hivevm/index.html

# Edit CSS
# Use str_replace tool on /home/claude/hivevm/assets/css/hivevm.css

# Preview in browser (if server setup)
python -m http.server 8000
```

---

**Need help? Check the main README.md or open an issue on GitHub!**
