# AWS System Manager Session Manager Documentation

This is a Hugo-based documentation site for AWS System Manager Session Manager, available in both English and Vietnamese.

## 🚀 Features

- **Multi-language support**: English and Vietnamese
- **Responsive design**: Works on desktop and mobile
- **Search functionality**: Built-in search capabilities
- **Modern UI**: Clean and professional design using Hugo Learn theme

## 📁 Project Structure

```
000058-SessionManager/
├── content/           # Markdown content files
├── layouts/          # Custom layout templates
├── static/           # Static assets (CSS, JS, images)
├── themes/           # Hugo themes
├── config.toml       # Hugo configuration
└── .github/          # GitHub Actions workflows
```

## 🛠️ Local Development

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version recommended)
- Git

### Running Locally

1. Clone the repository:
```bash
git clone <your-repo-url>
cd 000058-SessionManager
```

2. Start the development server:
```bash
hugo server
```

3. Open your browser and navigate to `http://localhost:1313`

## 🌐 Deployment

This project is configured for automatic deployment to GitHub Pages using GitHub Actions.

### Automatic Deployment

1. Push your changes to the `main` branch
2. GitHub Actions will automatically build and deploy your site
3. Your site will be available at `https://<username>.github.io/<repository-name>`

### Manual Deployment

If you need to deploy manually:

1. Build the site:
```bash
hugo --minify
```

2. The built files will be in the `public/` directory
3. Upload the contents of `public/` to your web server

## 📝 Content Management

### Adding New Content

1. Create a new markdown file in the `content/` directory
2. Use the following front matter format:

```yaml
---
title: "Your Page Title"
weight: 10
draft: false
---
```

### Multi-language Content

- English content: `content/`
- Vietnamese content: `content/vi/`

## 🎨 Customization

### Theme

This project uses the Hugo Learn theme. You can customize it by:

1. Modifying files in `layouts/partials/`
2. Adding custom CSS in `static/css/`
3. Updating theme parameters in `config.toml`

### Configuration

Key configuration options in `config.toml`:

- `theme`: Hugo theme name
- `baseURL`: Your site's base URL
- `params`: Theme-specific parameters
- `Languages`: Multi-language configuration

## 🔧 Troubleshooting

### Common Issues

1. **Hugo not found**: Make sure Hugo is installed and in your PATH
2. **Theme not loading**: Check that the theme is properly installed in `themes/`
3. **Build errors**: Check the Hugo console output for specific error messages

### Getting Help

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Learn Theme](https://themes.gohugo.io/hugo-theme-learn/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `hugo server`
5. Submit a pull request

---

**Note**: This site is automatically deployed to GitHub Pages. Any changes pushed to the `main` branch will trigger a new deployment. 