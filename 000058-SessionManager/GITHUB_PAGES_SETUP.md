# 🚀 Hướng Dẫn Kích Hoạt GitHub Pages

## ✅ Bước 1: Kích Hoạt GitHub Pages

1. **Truy cập repository trên GitHub**:
   - Mở trình duyệt và đi đến: https://github.com/Tanhoccode/Work-Shop

2. **Vào Settings**:
   - Click vào tab "Settings" (cài đặt)

3. **Tìm GitHub Pages**:
   - Scroll xuống phần "Pages" (thường ở cuối trang)
   - Hoặc tìm trong menu bên trái

4. **Cấu hình Source**:
   - Trong phần "Source", chọn "GitHub Actions"
   - Điều này sẽ cho phép GitHub Actions tự động deploy

## ✅ Bước 2: Kiểm Tra GitHub Actions

1. **Vào tab Actions**:
   - Click vào tab "Actions" trong repository

2. **Kiểm tra workflow**:
   - Bạn sẽ thấy workflow "Deploy Hugo site to Pages"
   - Nó sẽ tự động chạy khi bạn push code

3. **Chạy workflow lần đầu**:
   - Nếu workflow chưa chạy, click "Run workflow"
   - Chọn branch "master"
   - Click "Run workflow"

## ✅ Bước 3: Theo Dõi Deployment

1. **Kiểm tra trạng thái**:
   - Trong tab Actions, click vào workflow đang chạy
   - Theo dõi các bước build và deploy

2. **Thời gian chờ**:
   - Lần đầu deploy có thể mất 5-10 phút
   - Các lần sau sẽ nhanh hơn

## ✅ Bước 4: Truy Cập Website

Sau khi deployment thành công:

1. **URL website**:
   - Website sẽ có URL: `https://tanhoccode.github.io/Work-Shop/`
   - Hoặc kiểm tra trong Settings > Pages để xem URL chính xác

2. **Kiểm tra website**:
   - Mở URL trong trình duyệt
   - Kiểm tra cả phiên bản tiếng Anh và tiếng Việt

## 🔧 Troubleshooting

### Nếu GitHub Actions thất bại:

1. **Kiểm tra logs**:
   - Vào tab Actions
   - Click vào workflow thất bại
   - Xem chi tiết lỗi trong logs

2. **Các lỗi thường gặp**:
   - **Theme không tìm thấy**: Đảm bảo theme `hugo-theme-learn` đã được commit
   - **Build lỗi**: Kiểm tra file `config.toml`
   - **Permission lỗi**: Đảm bảo repository có quyền deploy

### Nếu website không load:

1. **Chờ deployment hoàn tất**:
   - Có thể mất vài phút để website xuất hiện

2. **Kiểm tra URL**:
   - Đảm bảo URL đúng: `https://tanhoccode.github.io/Work-Shop/`

3. **Clear cache**:
   - Thử mở website trong tab ẩn danh

## 📋 Checklist Hoàn Thành

- [ ] GitHub Pages đã được kích hoạt
- [ ] GitHub Actions workflow đã chạy thành công
- [ ] Website có thể truy cập được
- [ ] Cả tiếng Anh và tiếng Việt đều hoạt động
- [ ] Tất cả hình ảnh hiển thị đúng

## 🎯 Cập Nhật Website

Để cập nhật website:

1. **Chỉnh sửa code locally**
2. **Commit và push**:
   ```bash
   git add .
   git commit -m "Update content"
   git push origin master
   ```
3. **GitHub Actions sẽ tự động deploy**

## 📞 Hỗ Trợ

Nếu gặp vấn đề:
- Kiểm tra GitHub Actions logs
- Xem file `DEPLOYMENT.md` để biết thêm chi tiết
- Tạo issue trên GitHub repository

---

**Lưu ý**: Website sẽ tự động cập nhật mỗi khi bạn push code lên branch `master`. 