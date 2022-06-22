PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

-- FIX FOREIGN KEY CONSTRAINT ERROR 
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    top_level INTEGER NOT NULL,
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (top_level) REFERENCES questions(id)

);

-- INSERT INTO 
--     replies(parent_id, user_id, body, top_level)
-- VALUES
--     (NULL,1,'Dog',1),
--     (NULL,2,'Cheese and pineapple', 2);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    likes INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users(fname, lname)
VALUES 
    ('John', 'Smith'),
    ('Chad', 'Cattington');

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Am I a cat?', 'Yes my name is Chad.', 1),
    ('What''s for lunch', 'How about pizza', 2);
