# Hugo Build and Test Script
# This script helps build and test the Hugo site locally

Write-Host "🚀 Building Hugo site..." -ForegroundColor Green

# Check if Hugo is installed
try {
    $hugoVersion = hugo version
    Write-Host "✅ Hugo found: $hugoVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Hugo not found. Please install Hugo first." -ForegroundColor Red
    Write-Host "Download from: https://gohugo.io/installation/" -ForegroundColor Yellow
    exit 1
}

# Clean previous build
if (Test-Path "public") {
    Write-Host "🧹 Cleaning previous build..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force "public"
}

# Build the site
Write-Host "🔨 Building site..." -ForegroundColor Yellow
hugo --minify

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Site built successfully!" -ForegroundColor Green
    Write-Host "📁 Built files are in the 'public' directory" -ForegroundColor Cyan
    
    # Show build info
    $publicSize = (Get-ChildItem -Path "public" -Recurse | Measure-Object -Property Length -Sum).Sum
    $publicSizeMB = [math]::Round($publicSize / 1MB, 2)
    Write-Host "📊 Total size: $publicSizeMB MB" -ForegroundColor Cyan
    
    # Count files
    $fileCount = (Get-ChildItem -Path "public" -Recurse -File).Count
    Write-Host "📄 Total files: $fileCount" -ForegroundColor Cyan
    
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Ready for deployment!" -ForegroundColor Green
Write-Host "To start local server: hugo server" -ForegroundColor Cyan
Write-Host "To deploy to GitHub Pages: Push to main branch" -ForegroundColor Cyan 