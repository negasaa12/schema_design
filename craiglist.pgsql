
DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist


-- Design a schema for Craigslist! Your schema should keep track of the following

-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to




CREATE TABLE region (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region_id INTEGER NOT NULL REFERENCES region (id)
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users (id),
    region_id INTEGER NOT NULL REFERENCES region (id)
   
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    post_id INTEGER NOT NULL REFERENCES posts (id)
);

INSERT INTO region (name) VALUES ('New York'), ('Atlanta'), ('Seattle');

INSERT INTO users (username, preferred_region_id) VALUES ('negasaa12', 1), ('hoodrat345',2), ('smokingmamaces', 3);

INSERT INTO posts (title, description, user_id, region_id) VALUES ('I hate you', 'I hate everyone here',1, 1), ('I like flowers', 'I really enjoy all flowers',2,2);

INSERT INTO categories (name, post_id) VALUES ('Flower Topic', 2 ), ('Things You Hate', 1 );

