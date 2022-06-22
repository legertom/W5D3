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

INSERT INTO 
    question_follows(user_id, question_id)
VALUES 
    (1, 1),
    (2, 2)

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



-- FIX FOREIGN KEY CONSTRAINT ERROR 
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_id INTEGER,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO 
    replies(parent_id, body, author_id, question_id)
VALUES
    (NULL,'Dog',1,1),
    (NULL,'Cheese and pineapple',2,2);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    likes INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


