-- =============================================
-- BÀI 7: QUẢN LÝ BÁN HÀNG
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE KHACHHANG_BH (
    MaKH     INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Ho       NVARCHAR(50),
    Ten      NVARCHAR(20) NOT NULL,
    NgaySinh DATE,
    GioiTinh BIT,
    DiaChi   NVARCHAR(200),
    SoDT     NVARCHAR(12)
);

CREATE TABLE NHANVIEN_BH (
    MaNV     INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Ho       NVARCHAR(50),
    Ten      NVARCHAR(20) NOT NULL,
    NgaySinh DATE,
    GioiTinh BIT,
    DiaChi   NVARCHAR(200),
    SoDT     NVARCHAR(12)
);

CREATE TABLE HANGHOA (
    MaHH          NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenHH         NVARCHAR(100) NOT NULL,
    DVT           NVARCHAR(20),
    DonGiaNiemYet DECIMAL(18,2)
);

CREATE TABLE DONHANG (
    MaDH          INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    NgayMua       DATETIME     NOT NULL DEFAULT GETDATE(),
    TienVanChuyen DECIMAL(18,2) DEFAULT 0,
    MaKH          INT          NOT NULL,
    MaNV          INT          NOT NULL,
    CONSTRAINT FK_DH_KH FOREIGN KEY (MaKH) REFERENCES KHACHHANG_BH(MaKH),
    CONSTRAINT FK_DH_NV FOREIGN KEY (MaNV) REFERENCES NHANVIEN_BH(MaNV)
);

CREATE TABLE CHITIETDONHANG (
    MaDH      INT          NOT NULL,
    MaHH      NVARCHAR(10) NOT NULL,
    DonGiaBan DECIMAL(18,2) NOT NULL,
    SoLuong   INT           NOT NULL DEFAULT 1,
    CONSTRAINT PK_CTDH PRIMARY KEY (MaDH, MaHH),
    CONSTRAINT FK_CTDH_DH FOREIGN KEY (MaDH) REFERENCES DONHANG(MaDH),
    CONSTRAINT FK_CTDH_HH FOREIGN KEY (MaHH) REFERENCES HANGHOA(MaHH)
);

INSERT INTO KHACHHANG_BH (Ho, Ten, NgaySinh, GioiTinh, DiaChi, SoDT) VALUES
(N'Nguyễn Thị', N'Lan',  '1990-03-15', 0, N'Quận 1, TP.HCM',  '0901234567'),
(N'Trần Văn',   N'Bình', '1985-07-20', 1, N'Quận 3, TP.HCM',  '0912345678'),
(N'Lê Minh',    N'Châu', '1995-11-05', 0, N'Quận 10, TP.HCM', '0923456789');

INSERT INTO NHANVIEN_BH (Ho, Ten, NgaySinh, GioiTinh, DiaChi, SoDT) VALUES
(N'Phạm Văn',  N'An',  '1992-01-10', 1, N'Bình Thạnh', '0931234567'),
(N'Hoàng Thị', N'Bảo', '1993-05-22', 0, N'Gò Vấp',     '0941234567');

INSERT INTO HANGHOA VALUES
('HH01', N'Laptop Dell XPS', N'Cái', 22000000),
('HH02', N'Chuột không dây', N'Cái',   350000),
('HH03', N'Bàn phím cơ',    N'Cái',   800000);

INSERT INTO DONHANG (NgayMua, TienVanChuyen, MaKH, MaNV) VALUES
('2024-06-01', 30000, 1, 1),
('2024-06-03', 0,     2, 2),
('2024-06-05', 50000, 3, 1);

INSERT INTO CHITIETDONHANG VALUES
(1, 'HH01', 21500000, 1),
(1, 'HH02',   330000, 2),
(2, 'HH03',   750000, 1),
(3, 'HH01', 21000000, 1),
(3, 'HH02',   320000, 1);