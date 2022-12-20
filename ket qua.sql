DROP TABLE IF EXISTS DIADIEMPHONG; DROP TABLE IF EXISTS DUAN; DROP TABLE IF EXISTS NHANVIEN; DROP TABLE IF EXISTS PHANCONG; DROP TABLE IF EXISTS PHONGBAN; DROP TABLE IF EXISTS THANNHAN; CREATE TABLE PHONGBAN ( MaPB INT constraint PB_MaPB_PK PRIMARY KEY, TenPB VARCHAR (10) constraint PB_TenPB_UQ UNIQUE, TrPhong CHAR(9), NgNhanChuc TIMESTAMP(3) default (NOW()) ); CREATE TABLE NHANVIEN ( MaNV CHAR(9) constraint NV_MaNV_PK PRIMARY KEY, Ho VARCHAR(15) NOT NULL, TenDem VARCHAR (15), Ten VARCHAR(15) NOT NULL, NgSinh TIMESTAMP(3), DiaChi VARCHAR(50), GTinh CHAR(3) constraint NV_GTinh_CK CHECK ( GTinh IN ('Nam', 'Nu') ), Luong INT, MaGSat CHAR(9), Phong INT ); CREATE TABLE DUAN ( MaDA INT constraint DUAN_MaDA_PK PRIMARY KEY, TenDA VARCHAR(15) NOT NULL, DiaDiem VARCHAR(15), PhongQL INT ); CREATE TABLE PHANCONG ( MaNV CHAR(9) NOT NULL, MaDA INT NOT NULL, SoGio DECIMAL (3, 1) ); CREATE TABLE THANNHAN ( MaNV CHAR (9) NOT NULL, TenTN CHAR(15) NOT NULL, GTinh CHAR (3) constraint TN_GTinh_CK CHECK ( GTinh IN ('Nam', 'Nu') ), NgSinh TIMESTAMP(3), QuanHe VARCHAR (10) ); CREATE TABLE DIADIEMPHONG ( MaPB INT NOT NULL, DiaDiem VARCHAR(15) NOT NULL ); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('5','Nghien cuu',NULL,'06/22/1988'); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('4','Hanh chinh',NULL,'01/01/1995'); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('1','Giam doc',NULL,'06/19/1981'); INSERT INTO NHANVIEN VALUES('888665555', 'Le','Van','Bo', '11/10/1937','45 Ho Van Hue, Phu Nhuan, TPHCM', 'Nam', 55000,NULL,1 ); INSERT INTO NHANVIEN VALUES('333445555', 'Phan','Van','Nghia', '12/08/1955','63 Tran Huy Lieu, Phu Nhuan, TPHCM', 'Nam', 40000,'888665555',5 ); INSERT INTO NHANVIEN VALUES('123456789', 'Nguyen','Bao','Hung', '01/09/1965','73 Phan Dang Luu, Phu Nhuan, TPHCM', 'Nam', 30000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('666884444', 'Tran','Van','Nam', '09/15/1962','97 Dien Bien Phu, Binh Thanh, TPHCM', 'Nam', 38000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('453453453', 'Hoang','Kim','Yen', '07/31/1972','56 Thich Quang Duc, Phu Nhuan, TPHCM', 'Nu', 25000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('987654321', 'Du','Thi','Hau', '06/20/1941','29 Bach Dang, Tan Binh, TPHCM', 'Nu', 43000,'888665555',4 ); INSERT INTO NHANVIEN VALUES('999887777', 'Au','Thi','Vuong', '01/19/1968','32 Cao Ba Nha, Q1, TPHCM', 'Nu', 25000,'987654321',4 ); INSERT INTO NHANVIEN VALUES('987987987', 'Nguyen','Van','Giap', '03/29/1969','98 Huynh Van Banh, Phu Nhuan, TPHCM', 'Nam', 25000,'987654321',4 ); INSERT INTO DIADIEMPHONG VALUES(1, 'Phu Nhuan'); INSERT INTO DIADIEMPHONG VALUES(4, 'Go Vap'); INSERT INTO DIADIEMPHONG VALUES(5, 'Tan Binh'); INSERT INTO DIADIEMPHONG VALUES(5, 'Phu Nhuan'); INSERT INTO DIADIEMPHONG VALUES(5, 'Thu Duc'); INSERT INTO DUAN VALUES(1,'San pham X', 'Tan Binh', 5); INSERT INTO DUAN VALUES(2,'San pham y', 'Thu Duc', 5); INSERT INTO DUAN VALUES(3,'San pham Z', 'Phu Nhuan', 5); INSERT INTO DUAN VALUES(10,'Tin hoc hoa', 'Go Vap', 4); INSERT INTO DUAN VALUES(20,'Tai to chuc', 'Phu Nhuan', 1); INSERT INTO DUAN VALUES(30,'Phuc Loi', 'Go Vap', 4); INSERT INTO PHANCONG VALUES('123456789',1,32.5); INSERT INTO PHANCONG VALUES('123456789',2,7.5); INSERT INTO PHANCONG VALUES('666884444',3,40.0); INSERT INTO PHANCONG VALUES('453453453',1,20.0); INSERT INTO PHANCONG VALUES('453453453',2,20.0); INSERT INTO PHANCONG VALUES('333445555',2,10.0); INSERT INTO PHANCONG VALUES('333445555',3,10.0); INSERT INTO PHANCONG VALUES('333445555',10,10.0); INSERT INTO PHANCONG VALUES('333445555',20,10.0); INSERT INTO PHANCONG VALUES('999887777',30,30.0); INSERT INTO PHANCONG VALUES('999887777',10,10.0); INSERT INTO PHANCONG VALUES('987987987',10,35.0); INSERT INTO PHANCONG VALUES('987987987',30,5.0); INSERT INTO PHANCONG VALUES('987654321',30,20.0); INSERT INTO PHANCONG VALUES('987654321',20,15.0); INSERT INTO PHANCONG VALUES('888665555',20,NULL); INSERT INTO THANNHAN VALUES('333445555','Anh','Nu','04/05/1986','Con gai'); INSERT INTO THANNHAN VALUES('333445555','The','Nam','10/25/1983','Con trai'); INSERT INTO THANNHAN VALUES('333445555','Loi','Nu','05/03/1958','Vo'); INSERT INTO THANNHAN VALUES('987654321','An','Nam','02/28/1942','Chong'); INSERT INTO THANNHAN VALUES('123456789','Minh','Nam','01/04/1988','Con trai'); INSERT INTO THANNHAN VALUES('123456789','Anh','Nu','12/30/1988','Con gai'); INSERT INTO THANNHAN VALUES('123456789','Yen','Nu','05/05/1967','Vo');

--------------------------
1. Cho biết danh sách nhân viên của công ty.
Mai: select * from nhanvien n
CHECK:OK

--------------------------

2. Cho biết họ và tên của nhân viên trong công ty. (sử dụng +’ ‘+ để nối chuỗi)	
Mai: select n.ho, n.tendem, n.ten from nhanvien n
CHECK: select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n
--------------------------

3. Cho biết danh sách nhân viên thuộc phòng số 5. 	
MAI: select n.ho, n.tendem, n.ten from nhanvien n 
where n.phong = 5
CHECK: OK
--------------------------

4. Cho biết thông tin của những phòng ban không phải là phòng ‘Dieu hanh’. 	
MAI: select * from phongban p where not p.tenpb = 'Dieu hannh'
CHECK:select * from phongban p where  p.tenpb <> 'Dieu hannh'
--------------------------

5. Cho biết danh sách các nhân viên thuộc phòng ‘Dieu hanh’. 
MAI: select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, p.tenpb from nhanvien n join phongban p on n.phong = p.mapb where p.tenpb = 'Dieu hanh'
CHECK: 
--------------------------

6. Cho biết mã nhân viên (MA_NVIEN) làm việc cho đề án số 3.
MAI: 
CHECK: 
--------------------------S
7. Cho biết mã số và tên các đề án triển khai ở Phú Nhuận. 	
MAI: 
CHECK: 
--------------------------