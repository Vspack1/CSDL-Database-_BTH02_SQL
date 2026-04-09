-- =============================================
-- BÀI 6: QUẢN LÝ THƯ VIỆN
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE NXB (
    MaNXB  NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenNXB NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200)
);

CREATE TABLE TACGIA (
    MaTacGia  NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenTacGia NVARCHAR(100) NOT NULL,
    QuocTich  NVARCHAR(50)
);

CREATE TABLE SACH_TV (
    MaSach     NVARCHAR(10)  NOT NULL PRIMARY KEY,
    TenSach    NVARCHAR(200) NOT NULL,
    MaNXB      NVARCHAR(10),
    NamXuatBan INT,
    CONSTRAINT FK_SachTV_NXB FOREIGN KEY (MaNXB) REFERENCES NXB(MaNXB)
);

CREATE TABLE SACH_TACGIA (
    MaSach   NVARCHAR(10) NOT NULL,
    MaTacGia NVARCHAR(10) NOT NULL,
    CONSTRAINT PK_SachTacGia PRIMARY KEY (MaSach, MaTacGia),
    CONSTRAINT FK_STG_Sach   FOREIGN KEY (MaSach)   REFERENCES SACH_TV(MaSach),
    CONSTRAINT FK_STG_TacGia FOREIGN KEY (MaTacGia) REFERENCES TACGIA(MaTacGia)
);

CREATE TABLE DOCGIA (
    MaDG   INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TenDG  NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDT   NVARCHAR(12),
    Email  NVARCHAR(100)
);

CREATE TABLE MUONTRA (
    MaMuon        INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    MaDG          INT          NOT NULL,
    MaSach        NVARCHAR(10) NOT NULL,
    NgayGioMuon   DATETIME     NOT NULL,
    NgayGioTra    DATETIME,
    TinhTrangMuon NVARCHAR(100),
    TinhTrangTra  NVARCHAR(100),
    CONSTRAINT FK_MuonTra_DG   FOREIGN KEY (MaDG)   REFERENCES DOCGIA(MaDG),
    CONSTRAINT FK_MuonTra_Sach FOREIGN KEY (MaSach) REFERENCES SACH_TV(MaSach)
);

INSERT INTO NXB VALUES
('NXB01', N'NXB Kim Đồng', N'Hà Nội'),
('NXB02', N'NXB Văn Học',  N'Hà Nội'),
('NXB03', N'NXB Trẻ',      N'TP.HCM');

INSERT INTO TACGIA VALUES
('TG01', N'Tô Hoài',      N'Việt Nam'),
('TG02', N'Nam Cao',      N'Việt Nam'),
('TG03', N'J.K. Rowling', N'Anh');

INSERT INTO SACH_TV VALUES
('S001', N'Dế Mèn Phiêu Lưu Ký',             'NXB01', 1941),
('S002', N'Chí Phèo',                         'NXB02', 1941),
('S003', N'Harry Potter và Hòn Đá Phù Thủy',  'NXB03', 1997);

INSERT INTO SACH_TACGIA VALUES
('S001', 'TG01'),
('S002', 'TG02'),
('S003', 'TG03');

INSERT INTO DOCGIA (TenDG, DiaChi, SoDT) VALUES
(N'Mai Thị Cúc',   N'Quận 1, TP.HCM', '0910000001'),
(N'Đặng Văn Danh', N'Quận 3, TP.HCM', '0910000002'),
(N'Hồ Thị Ê',     N'Quận 5, TP.HCM', '0910000003');

INSERT INTO MUONTRA (MaDG, MaSach, NgayGioMuon, NgayGioTra, TinhTrangMuon, TinhTrangTra) VALUES
(1, 'S001', '2024-05-01 08:00', '2024-05-08 09:00', N'Tốt',         N'Tốt'),
(2, 'S002', '2024-05-03 10:00', NULL,               N'Bình thường', NULL),
(1, 'S001', '2024-06-01 08:00', NULL,               N'Tốt',         NULL);