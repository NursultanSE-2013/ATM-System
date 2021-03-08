create table customers(
    id serial primary key,
    name varchar,
    lastName varchar,
    phone varchar
);

insert into customers(name, lastName, phone)
values ('John', 'Smith', '+77777777777');



create table accounts(
    id serial primary key,
    name varchar,
    customerID int,
    balance decimal,
    foreign key(customerID) references customers(id)
);

insert into accounts(name, customerID, balance)
values ('Smith J.', 1, 1000000);


create table cards(
    number varchar primary key,
    accountID int,
    expirationDate date,
    withdrawalLimit decimal,
    foreign key (accountID) references accounts(id)
);

insert into cards(number, accountID, expirationDate, withdrawalLimit)
values ('4444 4444 4444 4444', 1, DATE '2015-12-17', 300000);

create table ATM(
    id serial primary key,
    location varchar
)

create table withdrawals(
    id serial primary key,
    cardNumber varchar,
    amount decimal,
    ATMID int,
    date date,
    foreign key(cardNumber) references cards(number),
    foreign key(ATMID) references ATM(id)
)

create table funds(
    id serial primary key,
    cardNumber varchar,
    ATMID int,
    amount decimal,
    foreign key (ATMID) references ATM(id),
    foreign key (cardNumber) references cards(number)
)
