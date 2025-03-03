CREATE DATABASE beqando;
USE beqando;
CREATE USER 'beqando_web'@'%' IDENTIFIED BY 'b3q4nd0W3b';
GRANT DELETE,INSERT,SELECT,UPDATE on beqando.* TO beqando_web@'%';

-- pools BBDD
CREATE TABLE beqando.pools (
    id bigint NOT NULL AUTO_INCREMENT,
    type int NOT NULL,
    matches int NOT NULL,
    beneficiary int,
    price decimal(4,2),
    end_time datetime NOT NULL,
    created_by int NOT NULL,
    created_at datetime NOT NULL,
    PRIMARY KEY (id)
);
-- matches BBDD
CREATE TABLE beqando.pool_fixtures (
    id bigint NOT NULL,
    pool_id bigint NOT NULL,
    start_time datetime NOT NULL,
    league varchar(30) NOT NULL, 
    home_team varchar(60),
    home_team_logo varchar(150),
    away_team varchar(60),
    away_team_logo varchar(150),
    result varchar(1),
    created_at datetime NOT NULL,
    PRIMARY KEY (id,pool_id)
);
-- sales BBDD
CREATE TABLE beqando.sales (
    id bigint NOT NULL AUTO_INCREMENT,
    user_id varchar(36) NOT NULL,
    pools int NOT NULL,
    transaction_id varchar(25) NOT NULL,
    transaction_authorization varchar(16) NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE beqando.sales_pools (
    sale_id bigint NOT NULL,
    pool_id bigint NOT NULL,
    donation decimal(4,2) NOT NULL, 
    PRIMARY KEY (sale_id,pool_id)
);
-- predictions BBDD
CREATE TABLE beqando.predictions (
    sale_id bigint NOT NULL,
    pool_id bigint NOT NULL,
    fixture_id bigint NOT NULL,
    prediction varchar(1) NOT NULL,
    created_at datetime NOT NULL,
    PRIMARY KEY (sale_id,pool_id,fixture_id)
);
-- users BBDD
CREATE TABLE beqando.users (
    id varchar(36) NOT NULL,
    username varchar(20) NOT NULL,
    password char(60) BINARY,
    name varchar(80) NOT NULL,
    last_name varchar(80) NOT NULL,
    birthdate date NOT NULL,
    email varchar(60) NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime NOT NULL,
    last_login datetime,
    PRIMARY KEY (id),
    CONSTRAINT u_usern UNIQUE(username),
    CONSTRAINT u_email UNIQUE(email)
);

-- users BBDD
CREATE TABLE beqando.internal_users (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(20) NOT NULL,
    password char(60) BINARY NOT NULL,
    name varchar(80) NOT NULL,
    last_name varchar(80) NOT NULL,
    email varchar(60) NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime NOT NULL,
    last_login datetime,
    PRIMARY KEY (id),
    CONSTRAINT u_usern UNIQUE(username),
    CONSTRAINT u_email UNIQUE(email)
);

-- discounts BBDD
CREATE TABLE beqando.discount_codes (
    code varchar(10) NOT NULL,
    discount int NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime NOT NULL,
    PRIMARY KEY (code),
    CONSTRAINT u_code UNIQUE(code)
);

ALTER TABLE beqando.sales ADD INDEX i_user (user_id);
ALTER TABLE beqando.sales ADD INDEX i_transaction (transaction_id);
ALTER TABLE beqando.pools ADD CONSTRAINT FOREIGN KEY (created_by) REFERENCES internal_users (id);
ALTER TABLE beqando.pool_fixtures ADD CONSTRAINT FOREIGN KEY (pool_id) REFERENCES pools (id);
ALTER TABLE beqando.sales ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE beqando.sales_pools ADD CONSTRAINT FOREIGN KEY (sale_id) REFERENCES sales (id);
ALTER TABLE beqando.sales_pools ADD CONSTRAINT FOREIGN KEY (pool_id) REFERENCES pools (id);
ALTER TABLE beqando.predictions ADD CONSTRAINT FOREIGN KEY (sale_id) REFERENCES sales (id);
ALTER TABLE beqando.predictions ADD CONSTRAINT FOREIGN KEY (fixture_id, pool_id) REFERENCES pool_fixtures (id, pool_id);

INSERT INTO internal_users (username, password, name, last_name, email, created_at, updated_at, last_login)
VALUES
('johndoe', 'hashedpasswordhere', 'John', 'Doe', 'johndoe@example.com', NOW(), NOW(), NULL);

INSERT INTO beqando.users (
    id,
    username, 
    password, 
    name, 
    last_name, 
    birthdate, 
    email, 
    created_at, 
    updated_at, 
    last_login
) 
VALUES (
    'e87fc7b3-a65a-4527-a8d6-56f4c73f06cd', -- id
    'new_user',                      -- username
    'hashed_password_here',           -- password (should be hashed, not plain text)
    'John',                           -- name
    'Doe',                            -- last_name
    '1990-01-01',                     -- birthdate (use actual birthdate in format 'YYYY-MM-DD')
    'john.doe@example.com',           -- email
    NOW(),                            -- created_at (current timestamp)
    NOW(),                            -- updated_at (current timestamp)
    NULL                              -- last_login (NULL for now)
);

INSERT INTO beqando.discount_codes (code, discount, created_at, updated_at)
VALUES
('WELCOME', 10, NOW(), NOW());

