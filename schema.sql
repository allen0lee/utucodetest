create database utu_code_test;

create table cryptos(
    id SERIAL PRIMARY KEY,
    currency TEXT,
    date varchar(100),
    open varchar(100),
    high varchar(100),
    low varchar(100),
    close varchar(100),
    volume varchar(100),
    market_cap varchar(100)
);