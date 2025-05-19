create
    schema public;

CREATE TABLE public.users
(
    id         BIGSERIAL PRIMARY KEY,
    name       TEXT,
    email      TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE public.products
(
    id         BIGSERIAL PRIMARY KEY,
    name       TEXT,
    price      NUMERIC(10, 2),
    created_at TIMESTAMP DEFAULT NOW()
);


ALTER TABLE private.products
ADD COLUMN "order" TEXT DEFAULT 'uid';


CREATE TABLE public.orders
(
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT REFERENCES users (id),
    product_id BIGINT REFERENCES products (id),
    quantity   INT,
    ordered_at TIMESTAMP DEFAULT NOW()
);


select count(*)
from public.users;

INSERT INTO public.users (name, email)
SELECT 'User_' || g,
       'user_' || g || '@example.com'
FROM generate_series(1, 10000000) AS g;


INSERT INTO public.products (name, price)
SELECT 'Product_' || g,
       ROUND((random() * 1000)::numeric, 2)
FROM generate_series(1, 10000000) AS g;



INSERT INTO public.orders (user_id, product_id, quantity)
SELECT (random() * 99999999)::BIGINT + 1, (random() * 99999999)::BIGINT + 1, (random() * 10) ::INT + 1
FROM generate_series(1, 100000000) AS g;


select count(*)
from public.users;

select count(*)
from public.products;

select count(*) from public.users;
