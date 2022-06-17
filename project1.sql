use db_project_mvc;

create table member_table (
mid bigint auto_increment, -- 회원관리번호
memberId varchar(20) not null,-- 회원 아이디
memberPassword varchar(20) not null, -- 회원비밀번호
memberName varchar(10) not null, -- 회원이름
memberBirth varchar(20),
memberEmail varchar(20)not null, -- 회원이메일
memberPhone varchar(20) not null, -- 회원핸드폰번호
memberCash bigint default 0,
itemPrice bigint, 
constraint pk_member_table primary key (mid),
constraint unique (memberId)
);



create table item_table ( -- 상품등록 테이블
pid bigint auto_increment,
memberId varchar(20) not null, -- 판매자 아이디
itemName varchar(20) not null, -- 상품이름
itemPrice bigint not null, -- 상품가격
itemCreatedTime dateTime, -- 상품올린시간
itemFileName varchar(100) not null, -- 아이템이미지
-- itemCount bigint, -- 아이템 갯수

constraint pk_item_table primary key (pid),
constraint fk_memberId foreign key(memberId) references member_table(memberId) --  판매자가 회원 아이디 참조
);



create table order_table( -- 거래내역 테이블
oid bigint auto_increment primary key, -- 거래번호 
trade int not null default 0, -- 구매판매
-- 판매가 0 이라는 가정하에 디폴트 0을 줌  
itemName varchar(20) not null, -- 상품 참조 
memberId varchar(20) not null, -- 회원아이디 참조
itemPrice bigint not null, -- 거래금액
itemCreatedTime datetime, -- 거래시간


constRaint fk_idMember foreign key (memberId) references member_table(memberId)
);



create table board_table (
bid bigint auto_increment,
boardTitle varchar(30) not null, -- 제목
boardWriter varchar(20) not null, -- 작성자
boardContents varchar(200) not null, -- 내용
boardHits int default 0, -- 조회수
boardCreatedTime dateTime, -- 작성시간

constraint pk_board_table primary key (bid)
);




create table comment_table (
cid bigint auto_increment,
bid bigint,
commentWriter varchar(20) not null,
commentContents varchar(100) not null,
commentCreatedTime datetime,

constraint pk_comment_table primary key (cid),
constraint fk_commentWriter foreign key(commentWriter) references member_table(memberId) on delete cascade, -- 작성자가 회원아이디 참조
constraint pk_board_id foreign key (bid) references board_table (bid) on delete cascade 
);





select * from member_table;
select * from board_table;
select * from comment_table;
select * from item_table;
select * from order_table;



drop table member_table;
drop table board_table;
drop table comment_table;
drop table item_table;
drop table order_table;