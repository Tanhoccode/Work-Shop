# 🚀 Deployment Guide - GitHub Pages

## Quick Start

### 1. Prepare Your Repository

1. **Push your code to GitHub**:
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Click "Settings" tab
   - Scroll down to "Pages" section
   - Under "Source", select "GitHub Actions"

### 2. Automatic Deployment

Once you push to the `main` branch, GitHub Actions will automatically:
- Build your Hugo site
- Deploy it to GitHub Pages
- Your site will be available at: `https://<username>.github.io/<repository-name>`

### 3. Manual Build (Optional)

To test locally before pushing:

```powershell
# Windows PowerShell
.\build.ps1

# Or manually
hugo --minify
```

## 📋 Checklist Before Deploy

- [ ] All content is in the `content/` directory
- [ ] Images are in the `static/images/` directory
- [ ] `config.toml` is properly configured
- [ ] `.github/workflows/hugo.yml` exists
- [ ] `.gitignore` is set up correctly

## 🔧 Troubleshooting

### Common Issues

1. **Build fails in GitHub Actions**:
   - Check the Actions tab in your repository
   - Ensure Hugo theme is properly installed
   - Verify all dependencies are committed

2. **Site not loading**:
   - Wait 5-10 minutes for deployment to complete
   - Check the Actions tab for deployment status
   - Verify the baseURL in config.toml

3. **Images not showing**:
   - Ensure images are in `static/images/`
   - Check file paths in markdown files
   - Verify image file names match exactly

### Getting Help

- Check GitHub Actions logs in your repository
- Review Hugo documentation: https://gohugo.io/documentation/
- GitHub Pages documentation: https://docs.github.com/en/pages

## 🎯 Next Steps

After successful deployment:

1. **Customize your domain** (optional):
   - Add a custom domain in repository settings
   - Update DNS records accordingly

2. **Monitor performance**:
   - Use GitHub Insights to track site performance
   - Monitor build times and deployment frequency

3. **Add analytics** (optional):
   - Integrate Google Analytics
   - Add search functionality

---

**Note**: The first deployment may take 5-10 minutes. Subsequent deployments are usually faster. 