insert into roles (rCode,rName) values ('ADMIN','ADMIN')
insert into roles (rCode,rName) values ('USER','USER')

insert into users(uUsername,uPassword,uFullname) values ('admin', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Admin')
insert into users(uUsername,uPassword,uFullname) values ('user1', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Doan Duc Tin')
insert into users(uUsername,uPassword,uFullname) values ('user2', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Trinh Quang Hien')
insert into users(uUsername,uPassword,uFullname) values ('user3', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Nguyen Xuan Huy')

insert into user_role(userid,roleid) values (1,1)
insert into user_role(userid,roleid) values (2,2)
insert into user_role(userid,roleid) values (3,2)