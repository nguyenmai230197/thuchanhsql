DROP TABLE IF EXISTS DIADIEMPHONG; DROP TABLE IF EXISTS DUAN; DROP TABLE IF EXISTS NHANVIEN; DROP TABLE IF EXISTS PHANCONG; DROP TABLE IF EXISTS PHONGBAN; DROP TABLE IF EXISTS THANNHAN; CREATE TABLE PHONGBAN ( MaPB INT constraint PB_MaPB_PK PRIMARY KEY, TenPB VARCHAR (10) constraint PB_TenPB_UQ UNIQUE, TrPhong CHAR(9), NgNhanChuc TIMESTAMP(3) default (NOW()) ); CREATE TABLE NHANVIEN ( MaNV CHAR(9) constraint NV_MaNV_PK PRIMARY KEY, Ho VARCHAR(15) NOT NULL, TenDem VARCHAR (15), Ten VARCHAR(15) NOT NULL, NgSinh TIMESTAMP(3), DiaChi VARCHAR(50), GTinh CHAR(3) constraint NV_GTinh_CK CHECK ( GTinh IN ('Nam', 'Nu') ), Luong INT, MaGSat CHAR(9), Phong INT ); CREATE TABLE DUAN ( MaDA INT constraint DUAN_MaDA_PK PRIMARY KEY, TenDA VARCHAR(15) NOT NULL, DiaDiem VARCHAR(15), PhongQL INT ); CREATE TABLE PHANCONG ( MaNV CHAR(9) NOT NULL, MaDA INT NOT NULL, SoGio DECIMAL (3, 1) ); CREATE TABLE THANNHAN ( MaNV CHAR (9) NOT NULL, TenTN CHAR(15) NOT NULL, GTinh CHAR (3) constraint TN_GTinh_CK CHECK ( GTinh IN ('Nam', 'Nu') ), NgSinh TIMESTAMP(3), QuanHe VARCHAR (10) ); CREATE TABLE DIADIEMPHONG ( MaPB INT NOT NULL, DiaDiem VARCHAR(15) NOT NULL ); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('5','Nghien cuu',NULL,'06/22/1988'); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('4','Hanh chinh',NULL,'01/01/1995'); INSERT INTO PHONGBAN (MaPB,TenPB, TrPhong, NgNhanChuc) VALUES('1','Giam doc',NULL,'06/19/1981'); INSERT INTO NHANVIEN VALUES('888665555', 'Le','Van','Bo', '11/10/1937','45 Ho Van Hue, Phu Nhuan, TPHCM', 'Nam', 55000,NULL,1 ); INSERT INTO NHANVIEN VALUES('333445555', 'Phan','Van','Nghia', '12/08/1955','63 Tran Huy Lieu, Phu Nhuan, TPHCM', 'Nam', 40000,'888665555',5 ); INSERT INTO NHANVIEN VALUES('123456789', 'Nguyen','Bao','Hung', '01/09/1965','73 Phan Dang Luu, Phu Nhuan, TPHCM', 'Nam', 30000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('666884444', 'Tran','Van','Nam', '09/15/1962','97 Dien Bien Phu, Binh Thanh, TPHCM', 'Nam', 38000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('453453453', 'Hoang','Kim','Yen', '07/31/1972','56 Thich Quang Duc, Phu Nhuan, TPHCM', 'Nu', 25000,'333445555',5 ); INSERT INTO NHANVIEN VALUES('987654321', 'Du','Thi','Hau', '06/20/1941','29 Bach Dang, Tan Binh, TPHCM', 'Nu', 43000,'888665555',4 ); INSERT INTO NHANVIEN VALUES('999887777', 'Au','Thi','Vuong', '01/19/1968','32 Cao Ba Nha, Q1, TPHCM', 'Nu', 25000,'987654321',4 ); INSERT INTO NHANVIEN VALUES('987987987', 'Nguyen','Van','Giap', '03/29/1969','98 Huynh Van Banh, Phu Nhuan, TPHCM', 'Nam', 25000,'987654321',4 ); INSERT INTO DIADIEMPHONG VALUES(1, 'Phu Nhuan'); INSERT INTO DIADIEMPHONG VALUES(4, 'Go Vap'); INSERT INTO DIADIEMPHONG VALUES(5, 'Tan Binh'); INSERT INTO DIADIEMPHONG VALUES(5, 'Phu Nhuan'); INSERT INTO DIADIEMPHONG VALUES(5, 'Thu Duc'); INSERT INTO DUAN VALUES(1,'San pham X', 'Tan Binh', 5); INSERT INTO DUAN VALUES(2,'San pham y', 'Thu Duc', 5); INSERT INTO DUAN VALUES(3,'San pham Z', 'Phu Nhuan', 5); INSERT INTO DUAN VALUES(10,'Tin hoc hoa', 'Go Vap', 4); INSERT INTO DUAN VALUES(20,'Tai to chuc', 'Phu Nhuan', 1); INSERT INTO DUAN VALUES(30,'Phuc Loi', 'Go Vap', 4); INSERT INTO PHANCONG VALUES('123456789',1,32.5); INSERT INTO PHANCONG VALUES('123456789',2,7.5); INSERT INTO PHANCONG VALUES('666884444',3,40.0); INSERT INTO PHANCONG VALUES('453453453',1,20.0); INSERT INTO PHANCONG VALUES('453453453',2,20.0); INSERT INTO PHANCONG VALUES('333445555',2,10.0); INSERT INTO PHANCONG VALUES('333445555',3,10.0); INSERT INTO PHANCONG VALUES('333445555',10,10.0); INSERT INTO PHANCONG VALUES('333445555',20,10.0); INSERT INTO PHANCONG VALUES('999887777',30,30.0); INSERT INTO PHANCONG VALUES('999887777',10,10.0); INSERT INTO PHANCONG VALUES('987987987',10,35.0); INSERT INTO PHANCONG VALUES('987987987',30,5.0); INSERT INTO PHANCONG VALUES('987654321',30,20.0); INSERT INTO PHANCONG VALUES('987654321',20,15.0); INSERT INTO PHANCONG VALUES('888665555',20,NULL); INSERT INTO THANNHAN VALUES('333445555','Anh','Nu','04/05/1986','Con gai'); INSERT INTO THANNHAN VALUES('333445555','The','Nam','10/25/1983','Con trai'); INSERT INTO THANNHAN VALUES('333445555','Loi','Nu','05/03/1958','Vo'); INSERT INTO THANNHAN VALUES('987654321','An','Nam','02/28/1942','Chong'); INSERT INTO THANNHAN VALUES('123456789','Minh','Nam','01/04/1988','Con trai'); INSERT INTO THANNHAN VALUES('123456789','Anh','Nu','12/30/1988','Con gai'); INSERT INTO THANNHAN VALUES('123456789','Yen','Nu','05/05/1967','Vo');
--------------------------
1. Cho biết danh sách nhân viên của công ty.
select * from nhanvien n
=> ok
--------------------------
2. Cho biết họ và tên của nhân viên trong công ty. (sử dụng +’ ‘+ để nối chuỗi)	
select n.ho, n.tendem, n.ten from nhanvien n
=> select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n
--------------------------
3. Cho biết danh sách nhân viên thuộc phòng số 5. 	
select n.ho, n.tendem, n.ten from nhanvien n 
where n.phong = 5
=> ok
--------------------------
4. Cho biết thông tin của những phòng ban không phải là phòng ‘Dieu hanh’. 	
select * from phongban p where not p.tenpb = 'Dieu hannh'
=> select * from phongban p where  p.tenpb <> 'Dieu hannh'
--------------------------
5. Cho biết danh sách các nhân viên thuộc phòng ‘Dieu hanh’. 
select * from nhanvien n join phongban p on n.phong = p.mapb
where p.tenpb = 'Dieu hanh'
=> C1: Sử dụng phép join
select nv.* from nhanvien nv join phongban pb on nv.phong = pb.mapb
where pb.tenpb = 'DieuHanh'

C2: Sử dung truy vẫn lồng
select nv.* from nhanvien nv
where nv.phong =
(
    select pb.mapb from phongban pb
    where pb.tenpb =  'Dieu hanh'
)

* Cho biết danh sách nhân viên, TÊN PHÒNG BAN của những nhân viên KHÔNG THUỘC phòng điều hành
select nv.*, pb.tenpb from nhanvien nv join phongban pb on nv.phong = pb.mapb
where not pb.tenpb = 'DieuHanh'

C2: Sử dung truy vẫn lồng
select nv.* from nhanvien nv
where nv.phong in
(
select pb.mapb from phongban pb
where pb.tenpb <> 'Dieu hanh'
)

--------------------------
6. Cho biết mã nhân viên (MA_NVIEN) làm việc cho đề án số 3
=> select pc.manv from phancong pc where pc.mada = '3'
--------------------------
7. Cho biết mã số và tên các đề án triển khai ở Phú Nhuận
select d.tenda from duan d where d.diadiem = 'Phu Nhuan'
=> select d.mada, d.tenda from duan d where d.diadiem = 'Phu Nhuan'

8. Liệt kê các nhân viên có địa chỉ thuộc quận Phú Nhuận. 
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.diachi from nhanvien n where n.diachi like '%Phu Nhuan%'
=> select n.* from nhanvien n where n.diachi like '%Phu Nhuan%'

9. Cho biết họ tên các nhân viên nam có mức lương nhỏ hơn 30000.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n where n.gtinh='Nam' and n.luong<30000
=> OK

10. Cho biết các nhân viên phòng 4 và có mức lương trên 30000.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n where n.phong=4 and n.luong>30000 
=> select n.* from nhanvien n where n.phong=4 and n.luong>30000

11. Cho biết tổng số lượng nhân viên và lương trung bình của nhân viên. 
select count (n.manv) as tong_so_nhan_vien, avg (n.luong) as luong_trung_binh from nhanvien n 
=> OK

12. Cho biết những nhân viên có địa chỉ ở TP.HCM.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.diachi from nhanvien n where n.diachi like '%TPHCM%'
=> select n.* from nhanvien n where n.diachi like '%TPHCM%'

13. Cho biết mã nhân viên và tiền thưởng tương ứng. Với tiền thưởng = 60% của lương. 
select n.manv as ma_nhan_vien, n.luong*60/100 as tien_thuong from nhanvien n 
=> ok

14. Cho biết họ tên trưởng phòng của phòng ban ‘Nghien cuu’.
select p.trphong from phongban p where p.tenpb = 'Nghien cuu'
 => ok
 
16. Cho biết mã nhân viên có người thân và tham gia đề án. 
select p.manv, sum (p.sogio) as so_gio from phancong p join thannhan t on p.manv = t.manv
group by p.manv having count(p.sogio)>0
=> 

17. Danh sách các mã đề án có nhân viên họ ‘Nguyen’ tham gia.
select p.mada from phancong p join nhanvien n on p.manv = n.manv where n.ho = 'Nguyen' 
=> 

18. Cho biết tên nhân viên sinh vào những năm 1950.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n where n.ngsinh >= '1950-01-01' and n.ngsinh < '1960-01-01'
=> 
 
19. Liệt kê các nữ nhân viên thuộc phòng ‘Nghien cuu’
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n join phongban p on n.phong = p.mapb 
where n.gtinh = 'Nu' and p.tenpb = 'Ngien cuu'
=> 

20. Cho biết MaNV, TenNV, Phong, NgSinh của những nhân viên Nam. Sắp xếp 
theo phòng giảm dần và sau đó ngày sinh tăng dần. 
select n.manv, concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.phong, n.ngsinh from nhanvien n
order by n.phong desc 
=> 

select n.manv, concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.phong, n.ngsinh from nhanvien n
order by n.ngsinh asc 
=> 

21. Cho biết kết quả lương mới (được tăng lên 10%) của của các nhân viên tham gia đề
án “San pham X” 
select * from nhanvien n select * from phancong p 
select * from duan d 
=> 

select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten 
from nhanvien n 
join phancong p
on n.manv = p.manv
join duan d
on p.mada = d.mada 
where d.tenda = 'San Pham X'
=> 


22. Cho biết họ tên những nhân viên có tuổi từ 40 trở lên.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten from nhanvien n 
where (now - n.ngsinh) >= 40 (chưa xong)

23. Cho biết mã các nhân viên nữ có tham gia đề án số 1. 
24. Cho biết tên nhân viên không có thân nhân nào. 
25. Cho biết danh sách các nhân viên có mức lương từ 30000 đến 40000. 
26. Cho biết tên hai nhân viên có cùng lương. 
27. Cho biết tên nhân viên và số lượng các đề án mà nhân viên đó tham gia. 
28. Cho biết họ tên các trưởng phòng. 
29. Cho biết tên nhân viên và tên thân nhân có cùng ngày sinh với mình.
