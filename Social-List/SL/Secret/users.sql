CREATE TABLE users
(
  username	varchar(32) NOT NULL,
  pwd		varchar(32) NOT NULL,
  role		varchar(32)
);

INSERT INTO users (username, pwd, role) VALUES ('parent', 'uawp', 'Family');
INSERT INTO users (username, pwd, role) VALUES ('xiao', 'uawp', 'Friend');
