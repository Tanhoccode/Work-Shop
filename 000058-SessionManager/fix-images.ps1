# Script sửa đường dẫn ảnh cho GitHub Pages
Write-Host "🔧 Đang sửa đường dẫn ảnh..." -ForegroundColor Green

# Tìm tất cả file markdown
$markdownFiles = Get-ChildItem -Path "content" -Recurse -Filter "*.md"

$totalFiles = $markdownFiles.Count
$modifiedFiles = 0

foreach ($file in $markdownFiles) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
    
    # Thay thế đường dẫn ảnh
    # Từ: /images/... thành /Work-Shop/images/...
    $content = $content -replace '\]\(/images/', '](/Work-Shop/images/'
    
    # Nếu có thay đổi, ghi lại file
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        $modifiedFiles++
        Write-Host "✅ Đã sửa: $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "🎉 Hoàn thành!" -ForegroundColor Green
Write-Host "📁 Tổng số file: $totalFiles" -ForegroundColor Cyan
Write-Host "✏️ File đã sửa: $modifiedFiles" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 Bước tiếp theo:" -ForegroundColor Yellow
Write-Host "1. git add ." -ForegroundColor White
Write-Host "2. git commit -m 'Fix image paths for GitHub Pages'" -ForegroundColor White
Write-Host "3. git push origin master" -ForegroundColor White 