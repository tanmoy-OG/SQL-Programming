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
