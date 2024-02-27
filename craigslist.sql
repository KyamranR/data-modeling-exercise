CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    pref_region INT REFERENCES region(id)
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    title TEXT NOT NULL,
    description TEXT,
    user_id INT REFERENCES users(id),
    location TEXT,
    region_id INT REFERENCES region(id)
);


INSERT INTO region (city, state)
VALUES ('Portland', 'OR'), ('Atlanta', 'GA');

INSERT INTO users (name, pref_region)
VALUES ('Adem', 2), ('Helena', 1);

INSERT INTO categories (category)
VALUES ('Automotive'),('Animals');

INSERT INTO posts (category_id, title, description, user_id, location, region_id)
VALUES (1, 'Car', 'About the car', 1, 'Downtown', 2),
        (2, 'Cat', 'About the cat', 2, 'Midtown', 1);