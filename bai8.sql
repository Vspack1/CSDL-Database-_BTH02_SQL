-- =============================================
-- BÀI 8: QUẢN LÝ CHUYẾN BAY
-- =============================================

USE BTH02_SQL;
GO

CREATE TABLE MAYBAY (
    MaMB        NVARCHAR(10) NOT NULL PRIMARY KEY,
    HangSX      NVARCHAR(50),
    NamSX       INT,
    SoHieuModel NVARCHAR(50),
    SoChoNgoi   INT,
    TrongTai    DECIMAL(10,2)
);

CREATE TABLE TUYENBAY (
    MaTuyen    NVARCHAR(10)  NOT NULL PRIMARY KEY,
    DiemDi     NVARCHAR(100) NOT NULL,
    DiemDen    NVARCHAR(100) NOT NULL,
    KhoangCach INT
);

CREATE TABLE NGUOI (
    MaNguoi  INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
    HoTen    NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    SoDT     NVARCHAR(12),
    VaiTro   NVARCHAR(20)  NOT NULL  -- 'PhiCong' | 'TiepVien' | 'HanhKhach'
);

CREATE TABLE CHUYENBAY (
    MaCB            NVARCHAR(10) NOT NULL PRIMARY KEY,
    MaMB            NVARCHAR(10) NOT NULL,
    MaTuyen         NVARCHAR(10) NOT NULL,
    NgayGioCatCanh  DATETIME     NOT NULL,
    NgayGioHaCanh   DATETIME,
    PhiCongChinh    INT          NOT NULL,
    CONSTRAINT FK_CB_MB       FOREIGN KEY (MaMB)         REFERENCES MAYBAY(MaMB),
    CONSTRAINT FK_CB_Tuyen    FOREIGN KEY (MaTuyen)      REFERENCES TUYENBAY(MaTuyen),
    CONSTRAINT FK_CB_PCChinh  FOREIGN KEY (PhiCongChinh) REFERENCES NGUOI(MaNguoi)
);

CREATE TABLE PHICONGPHU (
    MaCB    NVARCHAR(10) NOT NULL,
    MaNguoi INT          NOT NULL,
    CONSTRAINT PK_PCP PRIMARY KEY (MaCB, MaNguoi),
    CONSTRAINT FK_PCP_CB    FOREIGN KEY (MaCB)    REFERENCES CHUYENBAY(MaCB),
    CONSTRAINT FK_PCP_Nguoi FOREIGN KEY (MaNguoi) REFERENCES NGUOI(MaNguoi)
);

CREATE TABLE TIEPVIEN_CB (
    MaCB    NVARCHAR(10) NOT NULL,
    MaNguoi INT          NOT NULL,
    CONSTRAINT PK_TVCB PRIMARY KEY (MaCB, MaNguoi),
    CONSTRAINT FK_TVCB_CB    FOREIGN KEY (MaCB)    REFERENCES CHUYENBAY(MaCB),
    CONSTRAINT FK_TVCB_Nguoi FOREIGN KEY (MaNguoi) REFERENCES NGUOI(MaNguoi)
);

CREATE TABLE HANHKHACH_CB (
    MaCB    NVARCHAR(10) NOT NULL,
    MaNguoi INT          NOT NULL,
    SoGhe   NVARCHAR(5),
    CONSTRAINT PK_HKCB PRIMARY KEY (MaCB, MaNguoi),
    CONSTRAINT FK_HKCB_CB    FOREIGN KEY (MaCB)    REFERENCES CHUYENBAY(MaCB),
    CONSTRAINT FK_HKCB_Nguoi FOREIGN KEY (MaNguoi) REFERENCES NGUOI(MaNguoi)
);

INSERT INTO MAYBAY VALUES
('MB001', N'Boeing', 2010, 'B737-800', 162, 79015.8),
('MB002', N'Airbus', 2015, 'A320neo',  165, 73900.0),
('MB003', N'Boeing', 2018, 'B787-9',   296, 115120.0);

INSERT INTO TUYENBAY VALUES
('TB01', N'Hà Nội',          N'TP. Hồ Chí Minh', 1137),
('TB02', N'TP. Hồ Chí Minh', N'Hà Nội',          1137),
('TB03', N'Hà Nội',          N'Đà Nẵng',           609);

INSERT INTO NGUOI (HoTen, NgaySinh, SoDT, VaiTro) VALUES
(N'Nguyễn Văn Phi',  '1975-04-10', '0901000001', 'PhiCong'),    -- 1
(N'Trần Quang Bay',  '1980-06-15', '0901000002', 'PhiCong'),    -- 2
(N'Lê Minh Cánh',   '1983-09-20', '0901000003', 'PhiCong'),    -- 3
(N'Phạm Thị Dịu',   '1995-01-05', '0901000004', 'TiepVien'),   -- 4
(N'Hoàng Thị Êm',   '1997-03-22', '0901000005', 'TiepVien'),   -- 5
(N'Vũ Văn Phong',   '1990-08-11', '0901000006', 'HanhKhach'),  -- 6
(N'Đỗ Thị Giao',   '1988-12-30', '0901000007', 'HanhKhach'),  -- 7
(N'Bùi Văn Hải',   '1992-05-17', '0901000008', 'HanhKhach');  -- 8

INSERT INTO CHUYENBAY VALUES
('CB001', 'MB001', 'TB01', '2024-07-01 06:00', '2024-07-01 08:10', 1),
('CB002', 'MB002', 'TB02', '2024-07-01 09:00', '2024-07-01 11:15', 2),
('CB003', 'MB003', 'TB03', '2024-07-02 07:00', '2024-07-02 08:15', 3);

INSERT INTO PHICONGPHU VALUES
('CB001', 2), ('CB001', 3),
('CB002', 1), ('CB002', 3),
('CB003', 1), ('CB003', 2);

INSERT INTO TIEPVIEN_CB VALUES
('CB001', 4), ('CB001', 5),
('CB002', 4),
('CB003', 5);

INSERT INTO HANHKHACH_CB VALUES
('CB001', 6, '12A'), ('CB001', 7, '12B'),
('CB002', 8, '5C'),
('CB003', 6, '3A'),  ('CB003', 7, '3B');