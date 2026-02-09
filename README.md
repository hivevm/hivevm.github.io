# HiveVM

**Development Tools based on MODELLING**

HiveVM provides developer tools for Gradle and VSCode, based on Java/C++ and Rust. The tools include a parser generator on LL(k), server launchers for VSCode, and build pipelines for Gradle.

![HiveVM Banner](honeycomb.jpg)

## 🚀 Features

### 1. Parser Generator
LL(k) parser generator for context-free grammars. Generates parser and AST (Abstract Syntax Tree) for Java & C++.

- **Repository:** [github.com/hivevm/cc](https://github.com/hivevm/cc)
- Context-free grammar support
- LL(k) parsing algorithm
- AST generation for Java and C++
- Efficient parser generation

### 2. Manual Generator
Manual generator for collections of markdown documents. Supports the CommonMark syntax.

- **Repository:** [github.com/hivevm/doc](https://github.com/hivevm/doc)
- CommonMark syntax support
- Document collection management
- Automated manual generation
- Clean, professional documentation output

### 3. Gradle Workflow
A Gradle-based CD/CI pipeline engine. Allows you to define workflows for heterogeneous build systems.

- **Repository:** [github.com/hivevm/gradleDevOps](https://github.com/hivevm/gradleDevOps)
- Continuous Deployment/Integration support
- Heterogeneous build system integration
- Workflow definition and management
- Gradle-based automation

## 🌐 Website

Visit the live website at [hivevm.org](https://hivevm.org)

This repository contains the source code for the HiveVM website, a modern, responsive landing page built with:

- HTML5
- CSS3 (Bootstrap 4)
- JavaScript (jQuery)
- Responsive design for all devices
- Smooth scrolling and animations

## 📁 Project Structure

```
hivevm/
├── index.html              # Main HTML file
├── assets/
│   ├── css/
│   │   ├── bootstrap.min.css
│   │   ├── font-awesome.css
│   │   ├── hivevm.css      # Custom styles
│   │   └── owl-carousel.css
│   ├── js/
│   │   ├── jquery-2.1.0.min.js
│   │   ├── bootstrap.min.js
│   │   ├── custom.js
│   │   └── scrollreveal.min.js
│   ├── images/             # Website images
│   ├── fonts/              # Web fonts
│   └── favicon.ico
├── honeycomb.jpg           # Banner image
├── README.md
├── LICENSE
└── .nojekyll              # GitHub Pages configuration
```

## 🛠️ Local Development

### Prerequisites

- A modern web browser (Chrome, Firefox, Safari, Edge)
- A local web server (optional, for best results)

### Running Locally

1. Clone the repository:
```bash
git clone https://github.com/hivevm/hivevm.org.git
cd hivevm.org
```

2. Open `index.html` in your web browser, or use a local server:

**Using Python:**
```bash
python -m http.server 8000
```

**Using Node.js (http-server):**
```bash
npx http-server
```

3. Navigate to `http://localhost:8000` in your browser

## 🚀 Deployment

### GitHub Pages

This site is configured for GitHub Pages deployment:

1. Push your changes to the `main` branch
2. Go to your repository Settings > Pages
3. Select "Deploy from a branch"
4. Select the `main` branch and `/ (root)` folder
5. Click Save

The `.nojekyll` file ensures that GitHub Pages doesn't process the site with Jekyll.

### Custom Domain

To use a custom domain (hivevm.org):

1. Create a `CNAME` file in the root directory with your domain:
```
hivevm.org
```

2. Configure your DNS settings:
   - Add an `A` record pointing to GitHub Pages IPs:
     - 185.199.108.153
     - 185.199.109.153
     - 185.199.110.153
     - 185.199.111.153
   - Or add a `CNAME` record pointing to `[username].github.io`

## 🎨 Customization

### Colors

The main brand colors are defined in `assets/css/hivevm.css`:

- Primary: `#f2b408` (Golden yellow)
- Secondary: `#f1556a` (Coral pink)
- Accent: `#f4813f` (Orange)

### Content

Edit `index.html` to update:
- Hero section text
- Feature descriptions
- Navigation links
- Footer information

### Styling

Modify `assets/css/hivevm.css` to customize:
- Layout and spacing
- Typography
- Colors and themes
- Responsive breakpoints

## 📦 Dependencies

- **Bootstrap 4** - Responsive grid and components
- **jQuery 2.1.0** - DOM manipulation
- **Font Awesome** - Icon library
- **Owl Carousel** - Carousel functionality
- **ScrollReveal** - Scroll animations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Related Projects

- [HiveVM CC (Parser Generator)](https://github.com/hivevm/cc)
- [HiveVM Doc (Manual Generator)](https://github.com/hivevm/doc)
- [HiveVM GradleDevOps (Workflow Engine)](https://github.com/hivevm/gradleDevOps)

## 📧 Contact

For questions or support, please open an issue on GitHub.

---

**Made with ❤️ by the HiveVM Team**
