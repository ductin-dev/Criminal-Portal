use covidtracker;
/****** ROLE ******/
insert into role(rName, rCreateddate) values('ADMIN', GETDATE());
insert into role(rName, rCreateddate) values('MODERATOR', GETDATE());
insert into role(rName, rCreateddate) values('PRIMARY USER', GETDATE());

/****** USER ******/
insert into [dbo].[user](uUsername, uPassword, uFullname, uPhone, uAddress, uEmail, uStatus, uRole, uCreateddate) values('admin', '123456', 'admin', '19008198', 'Nguyen Van Thoai-Da Nang', 'admin@gmail.com',1,1, GETDATE());
insert into[dbo].[user](uUsername, uPassword, uFullname, uPhone, uAddress, uEmail, uStatus, uRole, uCreateddate) values('nguyenvana', '123456', 'Nguyen Van A', '19008198', 'Thanh Khe-Da Nang', 'nguyenvana@gmail.com',1,2, GETDATE());
insert into [dbo].[user](uUsername, uPassword, uFullname, uPhone, uAddress, uEmail, uStatus, uRole, uCreateddate) values('nguyenvanb', '123456', 'Nguyen Van B', '19008198', 'Cam Le-Da Nang', 'nguyenvanb@gmail.com',1,2, GETDATE());
insert into [dbo].[user](uUsername, uPassword, uFullname, uPhone, uAddress, uEmail, uStatus, uRole, uCreateddate) values('nguyenvanc', '123456', 'Nguyen Van C', '19008198', 'Son Tra-Da Nang', 'nguyenvanc@gmail.com',1,2, GETDATE());

/****** PRODUCTS ******/
insert into products(pName, pNumber, pCreateddate) values('Mỳ Tôm','my-tom',321,GETDATE());
insert into products(pName, pNumber, pCreateddate)  values('Nước','nuoc',232,GETDATE());
insert into products(pName, pNumber, pCreateddate)  values('Bánh Kẹo','banh-keo',543,GETDATE());
insert into products(pName, pNumber, pCreateddate)  values('Khẩu Trang','khau-trang',312,GETDATE());
insert into products(pName, pNumber, pCreateddate)  values('Another','another',312,GETDATE());

/******CHARITY ******/
insert into charity(cName, cAddress, cUser, cProduct, cCreateddate) values('Nhà Hỗ Trợ Nhân Tâm','Hải Châu-Đà Nẵng',1,1,GETDATE());
insert into charity(cName, cAddress, cUser, cProduct, cCreateddate) values('Đoàn FPT','Sơn Trà-Đà Nẵng',2,2,GETDATE());
insert into charity(cName, cAddress, cUser, cProduct, cCreateddate) values('Xã Hòa Thịnh','Thanh Khê-Đà Nẵng',1,3,GETDATE());
insert into charity(cName, cAddress,  cUser, cProduct, cCreateddate) values('UBND Đồng Nai','Cẩm Lệ-Đà Nẵng',1,4,GETDATE());
insert into charity(cName, cAddress,  cUser, cProduct, cCreateddate) values('Nhà Hỗ Trợ 5','FPT-Đà Nẵng',2,5,GETDATE());

/****** PATIENT ******/
/****** FILE EXCEL ******/

/****** AREA******/
INSERT [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'15.967313', N'108.183486', N'Thôn Lệ Sơn Nam, xã Hòa Tiến, huyện Hoà Vang, Đà Nẵng', N'- Nhà BN509, BN557, BN581, BN629, BN630, BN638, BN640, BN851 ở khu vực này
- BN456 đã đến đây vào ngày 20/07/2020
- BN637 đã đến đây
- BN693 đã đến đây vào ngày 23/7/2020 và 25/7/2020')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'15.972618', N'108.172090', N'Thôn Yến Nê 2 (ranh giới 1/2 tổ 6, tổ 7 và tổ 8), Hoà Vang, Đà Nẵng', N'')
INSERT [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.010536', N'108.195136', N'Trung tâm Y tế quận Cẩm Lệ - Đà Nẵng', N'- BN556 đi khám vào ngày 27/7/2020
- BN509 đã đến Khoa Truyền nhiễm, phòng số 6 vào ngày 27/7/2020
- BN826 đã khám sức khỏe tại đây vào 22/7/2020')
INSERT [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.059738', N'108.209942', N'Bệnh viện Hoàn Mỹ Đà Nẵng', N'- BN456 đã đến đây vào ngày 29/07/2020
- BN696 đã đến đây nửa đầu tháng 7/2020')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.057214', N'108.235863', N'Đường Lê Hữu Trác, phường An Hải Đông, Sơn Trà, Đà Nẵng', N'Khu vực Kiệt K34, K38, K54 đường Lê Hữu Trác và hai đoạn đường Nguyễn Duy Hiệu, Lê Hữu Trác (đoạn từ K34 đến K54 Lê Hữu Trác), phường An Hải Đông, quận Sơn Trà')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.072677', N'108.215707', N'Bệnh viện Đà Nẵng', N'')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.072522', N'108.213390', N'Trung tâm Y tế quận Hải Châu - Đà Nẵng', N'- BN555 đã đến đây vào ngày 28/07/2020
- BN503 đã đến đây làm việc vào ngày 24/07/2020 tại khoa Nhi
- BN456 đã đến đây vào ngày 24/07/2020
- BN656 đã đến đây khám và khai báo y tế vào ngày 27/07/2020 và29/07/2020
- BN663 đã đến đây từ 27/07/2020 - 30/07/2020
- BN724, BN801 đã đến đây vào khoảng 16:00 ngày 27/07/2020 và 29/07/2020
- BN457 đã đến đây ngày 28/07/2020
- BN582 đã đến đây ngày 29/07/2020
- BN874 đến đây từ ngày 26/7 đến 30/7/2020')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.088499', N'108.230703', N'Chung cư B1 - 119 Vân Đồn, Đà Nẵng', N'')
INSERT  [dbo].[Area] ([aX], [aY], [aAddress], [aDetail]) VALUES (N'16.092086', N'108.232238', N'Chung cư A3 - Ngô Trí Hòa, Nại Hiên Đông, Sơn Trà, Đà Nẵng', N'')

