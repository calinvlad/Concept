-- Users data
INSERT INTO users (fname, lname, email, pass) 
VALUES 
('calin', 'vlad', 'calinvlad.t@gmail.com', 'Pwd1q2w'),
('john', 'snow', 'john@pussy.com', 'Pwd1q2w');

-- Address data
INSERT INTO address (address1, city, building, user_id)  VALUES
('HELLO WORLD', 'Budapest', 'What?', 1),
('HELLO EARTH', 'Bucharest', 'Ibiza delsol', 2);

INSERT INTO products (name, category, price, user_id)
VALUES
('pen', 'school', 1.99, 1),
('book', 'lifestyle', 10.50, 1),
('lamp',  'households', 25.55, 2);

INSERT INTO details (text, product_id)
VALUES
('With smooth writing, your thoughts became poetry', 1),
('You won t belive this story', 2),
('Helps you read and write in the night', 3);