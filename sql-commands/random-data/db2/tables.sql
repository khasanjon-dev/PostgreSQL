CREATE TABLE customers
(
    id       SERIAL PRIMARY KEY,
    fullname VARCHAR(50),
    phone    VARCHAR(15)
);

CREATE TABLE invoices
(
    id          SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers (id),
    total       DECIMAL(10, 2)
);

CREATE TABLE items
(
    id          SERIAL PRIMARY KEY,
    description VARCHAR(200),
    cost        DECIMAL(10, 2)
);

INSERT INTO customers (fullname, phone)
SELECT 'Customer ' || i, '+99890' || (1000000 + i)
FROM generate_series(1, 100) AS i;

INSERT INTO invoices (customer_id, total)
SELECT (random() * 100 + 1)::int, (random() * 1000 + 20) ::numeric(10, 2)
FROM generate_series(1, 100);

INSERT INTO items (description, cost)
SELECT 'Item ' || gs, (random() * 50 + 5) ::numeric(10, 2)
FROM generate_series(1, 100) as gs;
