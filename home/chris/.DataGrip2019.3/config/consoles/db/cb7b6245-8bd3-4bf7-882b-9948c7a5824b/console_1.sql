create table member(
    member_no varchar(20), name varchar(20), age INT,
    primary key (member_no)
);
create table borrowed(
    member_no varchar(20), isbn varchar(20),
    primary key (member_no, isbn), foreign key (member_no) references member(member_no)
);
insert into member (member_no, name, age) VALUE (1, 'chris', 20);
insert into member (member_no, name, age) value (2, 'carmen', 20);
insert into member (member_no, name, age) value (3, 'jjj', 20);

insert into borrowed (member_no, isbn) value (1, '3231');
insert into borrowed (member_no, isbn) value (1, '4324');
insert into borrowed (member_no, isbn)
values (2, '4234');
insert into borrowed (member_no, isbn)
values (2, '4231');
insert into borrowed (member_no, isbn)
values (1, '33');
