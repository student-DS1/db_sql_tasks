����� �뢮�� ������ �� �࠭ (ECHO) ����祭.


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    category_id INTEGER REFERENCES categories(id)
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100)
);

CREATE TABLE rentals (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies(id),
    customer_id INTEGER REFERENCES customers(id),
    rental_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT m.title, m.duration, c.name AS category
FROM movies m
JOIN categories c ON m.category_id = c.id;

SELECT m.title, r.rental_date
FROM rentals r
JOIN movies m ON r.movie_id = m.id
WHERE r.customer_id = 1; -- �������� `1` �� ID �������


SELECT m.title, COUNT(r.id) AS rental_count
FROM rentals r
JOIN movies m ON r.movie_id = m.id
GROUP BY m.title
ORDER BY rental_count DESC
LIMIT 5;

INSERT INTO customers (name, address, city)
VALUES ('Alice Cooper', '123 Main St', 'San Francisco');

UPDATE customers
SET address = '456 Elm St'
WHERE name = 'Alice Cooper';

DELETE FROM customers
WHERE name = 'Alice Cooper';




