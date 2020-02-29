CREATE DATABASE emotions;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(300),
    dob DATE,
    sex VARCHAR(100),
    origin VARCHAR(300),
    email VARCHAR(300),
    password_digest VARCHAR(400)
);

CREATE TABLE moods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) not null,
    image_url VARCHAR(500),
    thoughts TEXT,
    comments TEXT,
    activities TEXT,
    voice bytea,
    user_id INTEGER not null,
    FOREIGN KEY (user_id) REFERENCES users (id) on DELETE CASCADE
);

CREATE TABLE emotions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) not null,
);

-- CREATE TABLE emotions_moods (
--     mood_id INTEGER not null,
--     FOREIGN KEY (mood_id) REFERENCES moods (id) on DELETE CASCADE,
--     emotion_id INTEGER not null,
--     FOREIGN KEY (emotion_id) REFERENCES emotions (id) on DELETE CASCADE
-- );

ALTER TABLE moods ADD COLUMN emotions VARCHAR(300);

ALTER TABLE moods ADD COLUMN emotions TEXT[];
ALTER TABLE moods ADD CONSTRAINT emotion_id_fk FOREIGN KEY (emotion_id) REFERENCES emotions (id) ON DELETE CASCADE;

INSERT INTO emotions (name) VALUES ('Admiration');
INSERT INTO emotions (name) VALUES ('Adoration');
INSERT INTO emotions (name) VALUES ('Aesthetic Appreciation');
INSERT INTO emotions (name) VALUES ('Amusement');
INSERT INTO emotions (name) VALUES ('Anxiety');
INSERT INTO emotions (name) VALUES ('Awe');
INSERT INTO emotions (name) VALUES ('Awkwardness');
INSERT INTO emotions (name) VALUES ('Boredom');
INSERT INTO emotions (name) VALUES ('Calmness');
INSERT INTO emotions (name) VALUES ('Confusion');
INSERT INTO emotions (name) VALUES ('Craving');
INSERT INTO emotions (name) VALUES ('Disgust');
INSERT INTO emotions (name) VALUES ('Empathetic Pain');
INSERT INTO emotions (name) VALUES ('Entrancement');
INSERT INTO emotions (name) VALUES ('Envy');
INSERT INTO emotions (name) VALUES ('Excitement');
INSERT INTO emotions (name) VALUES ('Fear');
INSERT INTO emotions (name) VALUES ('Horror');
INSERT INTO emotions (name) VALUES ('Interest');
INSERT INTO emotions (name) VALUES ('Joy');
INSERT INTO emotions (name) VALUES ('Nostalgia');
INSERT INTO emotions (name) VALUES ('Romance');
INSERT INTO emotions (name) VALUES ('Sadness');
INSERT INTO emotions (name) VALUES ('Satisfaction');
INSERT INTO emotions (name) VALUES ('Sexual Desire');
INSERT INTO emotions (name) VALUES ('Sympathy');
INSERT INTO emotions (name) VALUES ('Triumph');

























