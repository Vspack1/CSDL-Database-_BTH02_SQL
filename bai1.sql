-- =============================================
-- BÀI 1: QUẢN LÝ CHO THUÊ SÁCH
-- Chạy trong database BTH02_SQL
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE LOAISACH (
    MaLoaiSach  NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenLoaiSach NVARCHAR(100) NOT NULL,
    MieuTa      NVARCHAR(255)
);

CREATE TABLE SACH (
    MaSach     NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenSach    NVARCHAR(50)  NOT NULL,
    TacGia     NVARCHAR(50),
    NXB        NVARCHAR(50),
    GiaMuaVao  DECIMAL(18,2),
    MaLoaiSach NVARCHAR(10),
    GhiChu     NVARCHAR(MAX),
    CONSTRAINT FK_Sach_LoaiSach FOREIGN KEY (MaLoaiSach)
        REFERENCES LOAISACH(MaLoaiSach)
);

CREATE TABLE KHACHHANG (
    MaKH     INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TenKH    NVARCHAR(50)  NOT NULL,
    DiaChi   NVARCHAR(100),
    SoDT     NVARCHAR(12),
    LoaiSachYeuThich NVARCHAR(100),
    GhiChu   NVARCHAR(MAX)
);

CREATE TABLE THUESACH (
    MaKH        INT          NOT NULL,
    MaSach      NVARCHAR(10) NOT NULL,
    NgayGioMuon DATETIME     NOT NULL,
    NgayGioTra  DATETIME,
    SoTienThue  DECIMAL(18,2),
    GhiChu      NVARCHAR(MAX),
    CONSTRAINT PK_ThueSach PRIMARY KEY (MaKH, MaSach, NgayGioMuon),
    CONSTRAINT FK_ThueSach_KH   FOREIGN KEY (MaKH)   REFERENCES KHACHHANG(MaKH),
    CONSTRAINT FK_ThueSach_Sach FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
);

-- =============================================
-- DỮ LIỆU MẪU
-- =============================================

INSERT INTO LOAISACH VALUES
('LS01', N'Văn học',   N'Tiểu thuyết, truyện ngắn'),
('LS02', N'Kỹ thuật',  N'Sách lập trình, công nghệ'),
('LS03', N'Thiếu nhi', N'Truyện tranh, học tiếng Anh');

INSERT INTO SACH VALUES
('S001', N'Dế Mèn Phiêu Lưu Ký', N'Tô Hoài',       N'NXB Kim Đồng',  45000,  'LS03', NULL),
('S002', N'Lập trình C#',         N'Nguyễn Văn A',  N'NXB Thống Kê',  120000, 'LS02', NULL),
('S003', N'Số Đỏ',                N'Vũ Trọng Phụng',N'NXB Văn Học',   60000,  'LS01', NULL);

INSERT INTO KHACHHANG (TenKH, DiaChi, SoDT, LoaiSachYeuThich) VALUES
(N'Nguyễn Thị Lan', N'12 Lê Lợi, Q1',       '0901234567', N'Văn học'),
(N'Trần Văn Bình',  N'34 Nguyễn Huệ, Q3',   '0912345678', N'Kỹ thuật'),
(N'Lê Minh Châu',   N'56 Hai Bà Trưng, Q5', '0923456789', N'Thiếu nhi');

INSERT INTO THUESACH VALUES
(1, 'S001', '2024-01-10 08:00', '2024-01-17 09:00', 14000, NULL),
(2, 'S002', '2024-01-12 10:00', '2024-01-19 10:00', 24000, NULL),
(3, 'S003', '2024-01-15 14:00', NULL,               NULL,  N'Chưa trả');