# Fix all date format errors in Hugo content files
$pattern = 'date :  "`r Sys\.Date\(\)`"'
$replacement = 'date : "2024-01-01"'

# Get all .md and .vi.md files
$files = Get-ChildItem -Path "content" -Recurse -Include "*.md", "*.vi.md"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    if ($content -match $pattern) {
        $newContent = $content -replace $pattern, $replacement
        Set-Content $file.FullName $newContent
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "All files processed!" 