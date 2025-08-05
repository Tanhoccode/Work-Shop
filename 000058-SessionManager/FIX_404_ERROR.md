# 🔧 Khắc Phục Lỗi 404 GitHub Pages

## ❌ Vấn Đề Hiện Tại

Bạn đang gặp lỗi 404 "File not found" trên GitHub Pages. Điều này có nghĩa là:
- Website chưa được deploy thành công
- Hoặc GitHub Actions chưa chạy đúng cách

## ✅ Giải Pháp

### Bước 1: Kiểm Tra GitHub Actions

1. **Truy cập repository**: https://github.com/Tanhoccode/Work-Shop
2. **Vào tab Actions**
3. **Kiểm tra workflow "Deploy Hugo site to Pages"**
   - Nếu có lỗi, click vào workflow để xem chi tiết
   - Nếu chưa chạy, click "Run workflow"

### Bước 2: Kích Hoạt GitHub Pages

1. **Vào Settings** → **Pages**
2. **Cấu hình Source**:
   - Chọn "GitHub Actions" (không phải "Deploy from a branch")
   - Điều này cho phép GitHub Actions tự động deploy

### Bước 3: Chạy Workflow Thủ Công

Nếu workflow chưa chạy:

1. **Vào tab Actions**
2. **Click "Run workflow"**
3. **Chọn branch "master"**
4. **Click "Run workflow"**

### Bước 4: Theo Dõi Deployment

1. **Kiểm tra trạng thái**:
   - Workflow sẽ có các bước: Checkout → Setup Pages → Setup Hugo → Build → Upload → Deploy
   - Tất cả phải có dấu ✅ xanh

2. **Thời gian chờ**:
   - Lần đầu: 5-10 phút
   - Các lần sau: 2-3 phút

## 🔍 Troubleshooting Chi Tiết

### Nếu GitHub Actions Thất Bại:

**Lỗi thường gặp**:
1. **"Theme not found"**:
   - Đảm bảo theme `hugo-theme-learn` đã được commit
   - Kiểm tra file `config.toml`

2. **"Build failed"**:
   - Kiểm tra logs trong GitHub Actions
   - Đảm bảo Hugo có thể build locally

3. **"Permission denied"**:
   - Đảm bảo repository có quyền deploy
   - Kiểm tra Settings → Pages

### Nếu Website Vẫn Không Load:

1. **Chờ thêm thời gian**:
   - Có thể mất 10-15 phút để website xuất hiện
   - Kiểm tra lại sau 15 phút

2. **Kiểm tra URL**:
   - URL đúng: `https://tanhoccode.github.io/Work-Shop/`
   - Không phải: `https://tanhoccode.github.io/Work-Shop`

3. **Clear cache**:
   - Mở website trong tab ẩn danh
   - Hoặc Ctrl+F5 để refresh

## 📋 Checklist Khắc Phục

- [ ] GitHub Pages đã được kích hoạt với "GitHub Actions"
- [ ] GitHub Actions workflow đã chạy thành công
- [ ] Tất cả các bước trong workflow có dấu ✅
- [ ] Đã chờ đủ thời gian (10-15 phút)
- [ ] Đã thử URL đúng
- [ ] Đã clear cache trình duyệt

## 🚨 Nếu Vẫn Không Hoạt Động

1. **Kiểm tra logs GitHub Actions**:
   - Copy toàn bộ error message
   - Tạo issue trên GitHub với logs

2. **Test locally**:
   ```bash
   hugo server
   ```
   - Nếu local hoạt động, vấn đề ở GitHub Actions

3. **Kiểm tra cấu trúc thư mục**:
   - Đảm bảo `config.toml` ở đúng vị trí
   - Đảm bảo theme đã được commit

## 📞 Hỗ Trợ Thêm

Nếu vẫn gặp vấn đề:
1. Chụp màn hình GitHub Actions logs
2. Chụp màn hình Settings → Pages
3. Gửi cho tôi để hỗ trợ thêm

---

**Lưu ý**: Lỗi 404 thường do deployment chưa hoàn tất hoặc cấu hình sai. Hãy kiên nhẫn chờ và kiểm tra từng bước. 