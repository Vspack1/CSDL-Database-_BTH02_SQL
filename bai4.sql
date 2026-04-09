-- =============================================
-- BÀI 4: QUẢN LÝ CHO THUÊ SÂN QUẦN VỢT
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE SAN (
    MaSan     NVARCHAR(10) NOT NULL PRIMARY KEY,
    TinhTrang NVARCHAR(50),
    GiaThue   DECIMAL(18,2),
    GhiChu    NVARCHAR(MAX)
);

CREATE TABLE KHACHHANG_SAN (
    MaKH   INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TenKH  NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100),
    SoDT   NVARCHAR(12),
    GhiChu NVARCHAR(MAX)
);

CREATE TABLE THUESAN (
    MaKH        INT          NOT NULL,
    MaSan       NVARCHAR(10) NOT NULL,
    NgayGioThue DATETIME     NOT NULL,
    NgayGioTra  DATETIME,
    SoTienThu   DECIMAL(18,2),
    GhiChu      NVARCHAR(MAX),
    CONSTRAINT PK_ThueSan PRIMARY KEY (MaKH, MaSan, NgayGioThue),
    CONSTRAINT FK_ThueSan_KH  FOREIGN KEY (MaKH)  REFERENCES KHACHHANG_SAN(MaKH),
    CONSTRAINT FK_ThueSan_San FOREIGN KEY (MaSan) REFERENCES SAN(MaSan)
);

INSERT INTO SAN VALUES
('SAN01', N'Tốt',          80000,  NULL),
('SAN02', N'Bình thường',  65000,  N'Sân cũ'),
('SAN03', N'Mới nâng cấp', 100000, NULL);

INSERT INTO KHACHHANG_SAN (TenKH, DiaChi, SoDT) VALUES
(N'Lý Văn Dũng',    N'Quận Bình Thạnh', '0977777777'),
(N'Trương Thị Em',  N'Quận Gò Vấp',     '0988888888'),
(N'Huỳnh Văn Phú',  N'Quận Tân Bình',   '0999999999');

INSERT INTO THUESAN VALUES
(1, 'SAN01', '2024-04-01 06:00', '2024-04-01 08:00', 160000, NULL),
(2, 'SAN02', '2024-04-02 07:00', '2024-04-02 09:00', 130000, NULL),
(3, 'SAN03', '2024-04-03 17:00', NULL,               NULL,   N'Đang thuê');