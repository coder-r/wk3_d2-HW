DROP TABLE IF EXISTS bounty;

CREATE TABLE bounty(

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  favourite_weapon VARCHAR(255),
  bounty_values INT,
  danger_level VARCHAR(255)

);
