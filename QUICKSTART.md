# Quick Start Guide

Get up and running with the HiveVM website in 5 minutes!

## ⚡ 5-Minute Setup

### 1. Clone & Open (1 minute)
```bash
git clone https://github.com/hivevm/hivevm.org.git
cd hivevm.org
code .  # or open in your editor
```

### 2. Start Server (1 minute)
```bash
# Choose one:
python -m http.server 8000
# OR
npx http-server
# OR use VS Code Live Server extension
```

### 3. Open Browser (30 seconds)
```
http://localhost:8000
```

### 4. Make Changes (2 minutes)
- Edit `index.html` for content
- Edit `assets/css/hivevm.css` for styles
- Refresh browser to see changes

### 5. Deploy (30 seconds)
```bash
git add .
git commit -m "Your changes"
git push origin main
```

Done! ✅ Your changes are live at hivevm.org in ~1 minute.

---

## 🎯 Common Tasks

### Change Hero Text
**File**: `index.html` (line ~54)
```html
<h1>Development Tools based on <em>MODELLING</em></h1>
<p>Your new description here...</p>
```

### Change Colors
**File**: `assets/css/hivevm.css`
```css
/* Find and replace: */
#f2b408  → Your primary color
#f1556a  → Your secondary color
#f4813f  → Your accent color
```

### Add Feature Card
**File**: `index.html` (after line ~102)
```html
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
  <div class="features-item">
    <div class="features-icon">
      <h2>04</h2>
      <img src="assets/images/features-icon-0.png" alt="">
      <h4>New Feature</h4>
      <p>Description here.</p>
      <a href="https://github.com/user/repo" class="main-button">GitHub</a>
    </div>
  </div>
</div>
```

### Update Navigation
**File**: `index.html` (line ~36)
```html
<li class="scroll-to-section">
  <a href="#section-id" class="menu-item">New Link</a>
</li>
```

---

## 📁 Key Files

```
index.html                    → Main content
assets/css/hivevm.css        → Styling
assets/js/custom.js          → Interactivity
assets/images/               → Images
```

---

## 🧪 Testing Checklist

Before pushing:
- [ ] Test on Chrome
- [ ] Test on Firefox  
- [ ] Test on mobile (DevTools responsive mode)
- [ ] Check all links work
- [ ] No console errors
- [ ] Images load correctly

---

## 🚀 Deploy Checklist

- [ ] Changes tested locally
- [ ] Meaningful commit message
- [ ] No broken links
- [ ] Images optimized
- [ ] Code formatted

---

## 💡 Pro Tips

1. **Use browser DevTools**: F12 to inspect elements
2. **Clear cache often**: Ctrl+Shift+R / Cmd+Shift+R
3. **Test responsive**: Use DevTools device toolbar
4. **Check console**: For JavaScript errors
5. **Use Lighthouse**: To check performance

---

## 🆘 Quick Fixes

### Problem: Changes not showing
```bash
# Clear browser cache
Ctrl+Shift+R (Windows)
Cmd+Shift+R (Mac)
```

### Problem: CSS not loading
```html
<!-- Check file path in index.html -->
<link rel="stylesheet" href="assets/css/hivevm.css">
```

### Problem: Images not displaying
```html
<!-- Check paths are correct -->
<img src="assets/images/features-icon-1.png" alt="">
```

---

## 📚 Learn More

- **Full Setup**: See [SETUP.md](SETUP.md)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Project Info**: See [PROJECT_INFO.md](PROJECT_INFO.md)
- **Main Docs**: See [README.md](README.md)

---

## 🎓 Resources

- [Bootstrap Docs](https://getbootstrap.com/docs/4.6/)
- [jQuery API](https://api.jquery.com/)
- [Font Awesome Icons](https://fontawesome.com/v4.7/)
- [CSS Tricks](https://css-tricks.com/)

---

**Questions?** Open an issue on GitHub!

**Ready to contribute?** Read CONTRIBUTING.md

**Need detailed setup?** Check SETUP.md

---

*Happy coding! 🚀*
