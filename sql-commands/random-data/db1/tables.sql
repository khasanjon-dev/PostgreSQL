CREATE TABLE users
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders
(
    id      SERIAL PRIMARY KEY,
    user_id INT,
    amount  DECIMAL(10, 2)
);


CREATE TABLE products
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO users (name, email)
SELECT 'User ' || i, 'user' || i || '@example.com'
FROM generate_series(1, 100) AS i;

INSERT INTO orders (user_id, amount)
SELECT (random() * 100 + 1)::int, (random() * 500 + 10) ::numeric(10, 2)
FROM generate_series(1, 100);

INSERT INTO products (name, price)
SELECT 'Product ' || gs, (random() * 100 + 1)::numeric(10, 2)
FROM generate_series(1, 100) AS gs;


select count(*)
from users;

select count(*)
from orders;

select count(*)
from products;