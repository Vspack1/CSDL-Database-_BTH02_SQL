-- =============================================
-- BÀI 2: QUẢN LÝ CHO THUÊ ĐĨA NHẠC, PHIM
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE DIA (
    MaDia     NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenDia    NVARCHAR(50)  NOT NULL,
    TheLoai   NVARCHAR(20),
    NuocSX    NVARCHAR(20),
    GiaMuaVao DECIMAL(18,2),
    GhiChu    NVARCHAR(MAX)
);

CREATE TABLE KHACHHANG_DIA (
    MaKH    INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TenKH   NVARCHAR(50) NOT NULL,
    DiaChi  NVARCHAR(100),
    SoDT    NVARCHAR(12),
    TheLoaiYeuThich NVARCHAR(20),
    GhiChu  NVARCHAR(MAX)
);

CREATE TABLE THUEDIA (
    MaKH        INT          NOT NULL,
    MaDia       NVARCHAR(10) NOT NULL,
    NgayGioThue DATETIME     NOT NULL,
    NgayGioTra  DATETIME,
    SoTienThu   DECIMAL(18,2),
    GhiChu      NVARCHAR(MAX),
    CONSTRAINT PK_ThueDia PRIMARY KEY (MaKH, MaDia, NgayGioThue),
    CONSTRAINT FK_ThueDia_KH  FOREIGN KEY (MaKH)  REFERENCES KHACHHANG_DIA(MaKH),
    CONSTRAINT FK_ThueDia_Dia FOREIGN KEY (MaDia) REFERENCES DIA(MaDia)
);

INSERT INTO DIA VALUES
('D001', N'Avengers Endgame', N'Phim', N'Mỹ',      250000, NULL),
('D002', N'Sơn Tùng Best',   N'Nhạc', N'Việt Nam',  80000, NULL),
('D003', N'BTS Anthology',   N'Nhạc', N'Hàn Quốc', 120000, NULL);

INSERT INTO KHACHHANG_DIA (TenKH, DiaChi, SoDT, TheLoaiYeuThich) VALUES
(N'Phạm Thị Hoa', N'10 Đinh Tiên Hoàng', '0901111111', N'Phim'),
(N'Ngô Văn Đức',  N'20 Võ Văn Tần',      '0902222222', N'Nhạc'),
(N'Bùi Thị Mai',  N'30 CMT8',            '0903333333', N'Phim');

INSERT INTO THUEDIA VALUES
(1, 'D001', '2024-02-01 09:00', '2024-02-03 09:00', 15000, NULL),
(2, 'D002', '2024-02-05 14:00', '2024-02-07 14:00', 10000, NULL),
(3, 'D003', '2024-02-10 10:00', NULL,               NULL,  N'Chưa trả');