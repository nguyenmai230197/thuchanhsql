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
select n.manv 
from nhanvien n 
join phancong p on n.manv=p.manv 
where n.gtinh = 'Nu' and p.mada = 1
24. Cho biết tên nhân viên không có thân nhân nào. 
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten 
from nhanvien n 
left outer join thannhan t on n.manv = t.manv
where t.tentn is null
25. Cho biết danh sách các nhân viên có mức lương từ 30000 đến 40000.
select * from nhanvien n 
where n.luong between 30000 and 40000
26. Cho biết tên hai nhân viên có cùng lương. 
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.luong
from nhanvien n 
where n.luong in
(select n.luong 
from nhanvien n 
group by n.luong 
having count (luong) > 1)
27. Cho biết tên nhân viên và số lượng các đề án mà nhân viên đó tham gia. 
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, count (p.mada) as SL_Đề_án from nhanvien n
join phancong p on n.manv = p.manv

28. Cho biết họ tên các trưởng phòng.
select p.trphong  from phongban p 

29. Cho biết tên nhân viên và tên thân nhân có cùng ngày sinh với mình.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, t.tentn as Ten_than_nhan from nhanvien n, thannhan t
where n.ngsinh = t.ngsinh

30. Cho biết họ tên, mức lương, phòng của các nhân viên thuộc phòng số 4 hoặc các nhân 
viên có mức lương lớn hơn 35000.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.luong, n.phong 
from nhanvien n
where n.phong = 4 or n.luong > 35000

31. Cho biết lương trung bình của nhân viên có đề án tham gia hơn 10 giờ.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, avg(n.luong) as Luong_trung_binh, sum(p.sogio) as Tong_so_gio 
from nhanvien n 
join phancong p on n.manv = p.manv
group by n.manv
having sum(p.sogio)>10

32. Với mỗi phòng ban cho biết số lượng nhân viên và tổng lương tương ứng.
select p.*, count (n.manv) as so_luong_nv, sum(n.luong) as tong_luong from phongban p join nhanvien n on p.mapb = n.phong
group by p.mapb

33. Cho biết các nhân viên có lương cao nhất.
select * from nhanvien n 
where n.luong = 
(select max (n.luong) from nhanvien n)

34. Hãy cho biết nhân viên ‘Nguyen Bao Hung’ có bao nhiêu thân nhân.
select count (t.tentn) as tong_than_nhan 
from thannhan t join nhanvien n on t.manv = n.manv 
group by n.manv 
having concat(n.ho, ' ', n.tendem, ' ', n.ten) = 'Nguyen Bao Hung'

35. Liệt kê các nhân viên chưa được phân công đề án nào.
select * from nhanvien n join phancong p on n.manv = p.manv 
where p.mada is null

36. Cho biết tên phòng, số lượng nhân viên và tổng lương của từng phòng.
select p.tenpb, count(n.manv) as so_luong_nv, sum (n.luong) as tong_luong 
from phongban p join nhanvien n on p.mapb = n.phong 
group by p.mapb 

37. Cho biết tên phòng, số lượng nhân viên và mức lương trung bình của từng phòng.
select p.tenpb, count(n.manv) as so_luong_nv, avg (n.luong) as tong_luong 
from phongban p join nhanvien n on p.mapb = n.phong 
group by p.mapb 

38. Cho biết tên phòng, mức lương trung bình của phòng đó >30000. 
select p.tenpb, avg (n.luong) as tong_luong 
from phongban p join nhanvien n on p.mapb = n.phong 
group by p.mapb 
having avg (n.luong) > 30000

39. Cho biết mã nhân viên (MA_NVIEN) nào có nhiều thân nhân nhất. 
select n.manv as MA_NVIEN from nhanvien n join thannhan t on n.manv = t.manv 
group by n.manv 
having count (t.tentn) =
(select max(x.so_than_nhan) from 
       (select count (t.tentn) as so_than_nhan from thannhan t group by t.manv) x)

40. Cho biết thông tin nhân viên nào có nhiều thân nhân nhất. 
select n.* from nhanvien n join thannhan t on n.manv = t.manv 
group by n.manv 
having count (t.tentn) =
(select max(x.so_than_nhan) from 
       (select count (t.tentn) as so_than_nhan from thannhan t group by t.manv) x)

41. Danh sách những nhân viên (HONV, TENNV) không tham gia đề án nào cả
select n.ho, n.ten from nhanvien n 
join phancong p on n.manv = p.manv 
group by n.manv
having sum (p.sogio) is null

42. Liệt kê tên phòng ban và số lượng nhân viên trong các phòng ban có số lượng nhân 
viên lớn hơn 3.
select p.tenpb, count(n.manv) as so_luong_nhan_vien from phongban p join nhanvien n on p.mapb = n.phong 
group by p.mapb having count(n.manv) >= 3 
 
*43. Tìm họ tên (HONV, HOLOT, TENNV) và địa chỉ (DIACHI) của những nhân viên
làm việc cho một đề án ở PHU NHUAN nhưng phòng ban mà họ trực thuộc không tọa 
lạc tại TPHCM 
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, n.diachi as DIACHI from nhanvien n
join phancong p on n.manv = p.manv
join duan d on p.mada = d.mada
join diadiemphong ddp on ddp.mapb = n.phong 
group by n.manv
having d.diadiem = 'Phu Nhuan' and not ddp.diadiem = 'TPHCM'

select * from phancong 
select * from duan d
select * from diadiemphong

select * from nhanvien n
join phancong p on n.manv = p.manv
join duan d on p.mada = d.mada

***44. Với mỗi phòng ban có hơn 3 nhân viên, cho biết mã phòng và số lượng nhân viên có
lương lớn hơn 30000.
select * from nhanvien n
join phongban p on n.phong = p.mapb
group by p.mapb
having

select * from phongban p

***45. Với mỗi nhân viên tham gia nhiều đề án, cho biết họ tên nhân viên và tổng số giờ
làm việc của từng nhân viên trong các đề án đó. Sắp xếp theo tên và họ tăng dần.
select concat(n.ho, ' ', n.tendem, ' ', n.ten) as ho_va_ten, sum (p.sogio), p.mada
from nhanvien n join phancong p on n.manv = p.manv
group by

***46. Tìm tên nhân viên và tên phòng ban mà nhân viên đó là trưởng phòng. Nếu nhân
viên không là trưởng phòng, thì chỉ cần ghi tên nhân viên và giá trị null kế bên.

select *
from nhanvien n join phongban p on p.mapb = n.phong
where n.manv = p.trphong 

47. Cho biết tên đề án và tổng thời gian của từng đề án.
select d.tenda, sum (p.sogio) as tong_thoi_gian from duan d join phancong p on d.mada = p.mada 
group by d.mada

48. Với những đề án tại Phú Nhuận cho biết MADA, MAPB chủ trì đề án.
select distinct d.mada as MADA, d.phongql as MAPB
from duan d join phancong p on d.mada = p.mada
where d.diadiem = 'Phu Nhuan'

49. Cho biết họ tên trưởng phòng cùng với ngày sinh và địa chỉ của người đó.

select x.ho, x.ten, x.ngsinh, x. diachi from 
(select * from phongban p 
join nhanvien n on p.trphong = n.manv) x

50. Tìm họ tên của nhân viên phòng số 5 có tham gia đề án "San pham X" với số giờ làm 
việc > 10 giờ.
select concat(x.ho, ' ', x.tendem, ' ', x.ten) as ho_va_ten from
(select *from nhanvien n 
join phancong p on n.manv = p.manv
join duan d on p.mada = d.mada 
where d.tenda = 'San pham X'and p.sogio > 10 and d.phongql = 5) x

***51. Tìm họ tên của từng nhân viên và người phụ trách trực tiếp của nhân viên đó.
select * from phancong p
select * from nhanvien n1 join nhanvien n2 on n1.manv = n2.magsat 
select * from phongban

52. Tìm họ tên của những nhân viên được Phan Van Nghia quản lý trực tiếp.

53. Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ
tham gia. 
54. Tìm mã và tên các nhân viên làm việc tại phòng ‘Nghien cuu’. 
55. Tìm họ tên các nhân viên và tên các đề án nhân viên tham gia nếu có. 
56. Cho biết MaNV, TenNV các nhân viên tham gia tất cả các đề án. 
57. Cho biết Mã nhân viên được phân công từ 2 đề án trở lên. 
58. Cho biết Tên những nhân viên tham gia từ 2 đề án trở lên.
