-- =============================================
-- BÀI 5: QUẢN LÝ NHÂN SỰ CÁC DỰ ÁN
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE NHANVIEN (
    MaNV    NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenNV   NVARCHAR(50)  NOT NULL,
    BangCap NVARCHAR(50),
    NamSinh INT,
    DiaChi  NVARCHAR(100),
    ChucVu  NVARCHAR(50)
);

CREATE TABLE DUAN (
    MaDA          NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenDA         NVARCHAR(100) NOT NULL,
    NgayDuKienBD  DATE,
    NgayBatDau    DATE,
    NgayDuKienKT  DATE,
    NgayKetThuc   DATE,
    GhiChu        NVARCHAR(MAX)
);

CREATE TABLE THAMGIADUAN (
    MaNV          NVARCHAR(10) NOT NULL,
    MaDA          NVARCHAR(10) NOT NULL,
    NgayBatDauTG  DATE         NOT NULL,
    NgayKetThucTG DATE,
    NhiemVu       NVARCHAR(200),
    DanhGia       NVARCHAR(200),
    CONSTRAINT PK_ThamGiaDuAn PRIMARY KEY (MaNV, MaDA, NgayBatDauTG),
    CONSTRAINT FK_TGDA_NV FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    CONSTRAINT FK_TGDA_DA FOREIGN KEY (MaDA) REFERENCES DUAN(MaDA)
);

INSERT INTO NHANVIEN VALUES
('NV01', N'Nguyễn Minh Tuấn', N'Đại học', 1990, N'TP.HCM',  N'Lập trình viên'),
('NV02', N'Trần Thị Thu',     N'Thạc sĩ', 1988, N'Hà Nội',  N'Kiểm thử'),
('NV03', N'Lê Văn Hải',      N'Đại học', 1995, N'Đà Nẵng', N'BA');

INSERT INTO DUAN VALUES
('DA01', N'Phần mềm quản lý bán hàng', '2024-01-01', '2024-01-10', '2024-06-30', NULL,         NULL),
('DA02', N'App mobile giao đồ ăn',     '2024-02-01', '2024-02-15', '2024-08-31', NULL,         NULL),
('DA03', N'Website thương mại điện tử','2023-06-01', '2023-06-10', '2023-12-31', '2024-01-05', N'Hoàn thành');

INSERT INTO THAMGIADUAN VALUES
('NV01', 'DA01', '2024-01-10', NULL,         N'Backend developer', NULL),
('NV02', 'DA01', '2024-01-15', '2024-03-31', N'QA Tester',         N'Hoàn thành tốt'),
('NV03', 'DA02', '2024-02-15', NULL,         N'Business Analyst',  NULL),
('NV01', 'DA03', '2023-06-10', '2023-09-30', N'Frontend',          N'Nghỉ giữa chừng'),
('NV01', 'DA03', '2023-11-01', '2024-01-05', N'Frontend',          N'Tái tham gia, hoàn thành');