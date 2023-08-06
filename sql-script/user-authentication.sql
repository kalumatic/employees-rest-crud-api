USE employee_directory;

DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    enabled tinyint NOT NULL,

    PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO users
VALUES
    ('kalu', '{noop}password', 1),
    ('nikola', '{noop}password', 1),
    ('lazar', '{noop}password', 1);

CREATE TABLE authorities (
    username varchar(50) NOT NULL,
    authority varchar(50) NOT NULL,

    UNIQUE KEY authorities_idx_1 (username, authority),

    CONSTRAINT authorities_ibfk_1
    FOREIGN KEY (username)
    REFERENCES users (username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO authorities
VALUES
    ('kalu', 'ROLE_EMPLOYEE'),
    ('nikola', 'ROLE_EMPLOYEE'),
    ('nikola', 'ROLE_MANAGER'),
    ('lazar', 'ROLE_EMPLOYEE'),
    ('lazar', 'ROLE_MANAGER'),
    ('lazar', 'ROLE_ADMIN');