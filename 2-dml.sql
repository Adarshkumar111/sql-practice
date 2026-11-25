-------DML - Data Manipulation Language------------------------


-- 1. categories - prodiucct categories , the "parent" side of one - to many relationship

create table categories(
    category_id varchar(50) primary key,
    category_name varchar(50) not null unique,
    description text
)

--2 . product - eveything techbazaar sell . each belongs to exactly onne categary ( many to one via category_id).


create table products(
    product_id serial primary key,
    category_id int not null refrences categories(category_id),
    product_name varchar(100) not null ,
    price numeric(10,2) not null check (price>0),
    stock_quantity int not null default 0 check (stock_quantity >= 0),
    is_active boolean nut null default true,
    created_at date not null default current_date

);

-- 3. customer