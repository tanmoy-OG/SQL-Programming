-- 1.1 Create the table cust
create table cust( 
    cust_id varchar2(3) not null primary key, 
    lname varchar2(15), 
    fname varchar2(15), 
    area varchar2(2), 
    phone_no number(8) 
);

-- 1.2 Create the table movie
create table movie( 
    mv_no varchar(2) not null primary key, 
    title varchar2(25), 
    type varchar2(10), 
    star varchar2(25) 
);

-- 1.3 Create the table invoice
create table invoice( 
    inv_no varchar2(3) not null primary key, 
    mv_no varchar(2), 
    cust_id varchar2(3), 
    issue_date date, 
    return_date date 
);

-- Display all 3 tables
desc cust;
desc movie;
desc invoice;

/* 1.4 Add the following constraints
	INVOICE(Cust_id) references  CUST(Cust_id) 
	INVOICE(Mv_no) references MOVIE(Mv_no)
	Declare NOT NULL : lname, fname, title, type */
alter table invoice add foreign key(cust_id) references cust(cust_id);
alter table invoice add foreign key(mv_no) references movie(mv_no);
alter table cust modify(lname not null, fname not null);
alter table movie modify(title not null, type not null);

-- 1.5 Add a new column PRICE in Movie table with data type number(8,2) 
alter table movie add price number(8,2);

-- Display all 3 tables
desc cust;
desc movie;
desc invoice;

-- 2.1
insert into cust values('a01', 'Bayross', 'Ivan', 'sa', 6125467);
insert into cust values('a02', 'Saitwal', 'Vandana', 'mu', 5560379);
insert into cust values('a03', 'Jaguste', 'Pramada', 'da', 4563891);
insert into cust values('a04', 'Navindgi', 'Basu', 'ba', 6125401);
insert into cust values('a05', 'Sreedharan', 'Ravi', 'va', null);
insert into cust values('a06', '-', 'Rukmini', 'gh', 5125274);

-- 2.2
insert into movie values(1, 'bloody vengence', 'acion', 'jakie chan', 180.95);
insert into movie values(2, 'the firm', 'thriller', 'tom cruise', 200.00);
insert into movie values(3, 'pretty woman', 'romance', 'richard gere', 150.55);
insert into movie values(4, 'home alone', 'comedy', 'macaulay culkin', 140.00);
insert into movie values(5, 'the fugiive', 'thriller', 'harisson ford', 200.00);
insert into movie values(6, 'coma', 'suspense', 'michael douglas', 100.00);
insert into movie values(7, 'dracula', 'horror', 'gary oldman', 150.25);
insert into movie values(8, 'quick change', 'comedy', 'bill muray', 100.00);
insert into movie values(9, 'gone wih the wind', 'drama', 'clarke gable', 200.00);
insert into movie values(10, 'carry on doctor', 'comedy', 'leslie phillips', 100.00);

-- 2.3
insert into invoice values('i01', 4, 'a01', '23-jul-93', '25-jul-93');
insert into invoice values('i02', 3, 'a02', '12-aug-93', '15-aug-93');
insert into invoice values('i03', 1, 'a02', '15-aug-93', '18-aug-93');
insert into invoice values('i04', 6, 'a03', '10-sep-93', '12-sep-93');
insert into invoice values('i05', 7, 'a04', '05-aug-93', '08-aug-93');
insert into invoice values('i06', 2, 'a06', '18-sep-93', '21-sep-93');
insert into invoice values('i07', 9, 'a05', '07-jul-93', '10-jul-93');
insert into invoice values('i08', 9, 'a01', '11-aug-93', '14-aug-93');
insert into invoice values('i09', 5, 'a03', '06-jul-93', '07-jul-93');
insert into invoice values('i10', 8, 'a06', '03-sep-93', '06-sep-93');

-- Display all 3 tables
select * from cust;
select * from movie;
select * from invoice;

-- 3.1. Find out the names of all the customers
select fname, lname from cust;
-- 3.2. Print the entire customer table
select * from cust;
-- 3.3. Retrieve the list of fname and the area of all the customers
select fname, area from cust;
-- 3.4. List the various movie types available from the movie table
select type from movie;
/* 3.5. Print the information of invoice table in the following format for all records
A)The Invoice No. of Customer Id. {cust - id} is {inv - no} and Movie No. is {mv - no}.
B){cust-id} has taken Movie No. {mv-no} on {issue-date} and will return on (return_date) */
select ('The Invoice No. of Customer Id. '||cust_id||' is '||inv_no||' and Movie No. is '||mv_no) from invoice;
select (cust_id||' has taken Movie No. '||mv_no||' on '||issue_date||' and will return on '||return_date) from invoice;


