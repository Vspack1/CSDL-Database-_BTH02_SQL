-- =============================================
-- BÀI 3: QUẢN LÝ CHO THUÊ PHÒNG KHÁCH SẠN
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE PHONG (
    MaPhong  NVARCHAR(10) NOT NULL PRIMARY KEY,
    SoGiuong INT,
    NhanVienPhuTrach NVARCHAR(50),
    GiaTien  DECIMAL(18,2),
    GhiChu   NVARCHAR(MAX)
);

CREATE TABLE KHACHHANG_PHONG (
    MaKH   INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TenKH  NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100),
    SoDT   NVARCHAR(12),
    GhiChu NVARCHAR(MAX)
);

CREATE TABLE THUEPHONG (
    MaKH         INT          NOT NULL,
    MaPhong      NVARCHAR(10) NOT NULL,
    NgayLayPhong DATETIME     NOT NULL,
    NgayTraPhong DATETIME,
    SoTienDaTra  DECIMAL(18,2),
    GhiChu       NVARCHAR(MAX),
    CONSTRAINT PK_ThuePhong PRIMARY KEY (MaKH, MaPhong, NgayLayPhong),
    CONSTRAINT FK_ThuePhong_KH    FOREIGN KEY (MaKH)    REFERENCES KHACHHANG_PHONG(MaKH),
    CONSTRAINT FK_ThuePhong_Phong FOREIGN KEY (MaPhong) REFERENCES PHONG(MaPhong)
);

INSERT INTO PHONG VALUES
('P101', 1, N'Nguyễn Thị Hồng', 350000, N'Phòng đơn'),
('P102', 2, N'Trần Văn Nam',     500000, N'Phòng đôi'),
('P201', 2, N'Lê Thị Bích',      600000, N'Phòng view đẹp');

INSERT INTO KHACHHANG_PHONG (TenKH, DiaChi, SoDT) VALUES
(N'Đinh Văn An',    N'Hà Nội',  '0944444444'),
(N'Võ Thị Bảo',    N'Đà Nẵng', '0955555555'),
(N'Phan Minh Cường',N'Cần Thơ', '0966666666');

INSERT INTO THUEPHONG VALUES
(1, 'P101', '2024-03-01', '2024-03-03', 700000,  NULL),
(2, 'P102', '2024-03-05', '2024-03-08', 1500000, NULL),
(3, 'P201', '2024-03-10', NULL,         0,        N'Đang ở');