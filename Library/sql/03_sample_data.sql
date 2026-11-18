USE library_management_final;

INSERT INTO Authors (author_name, biography)
VALUES
('A.P.J. Abdul Kalam', 'Indian aerospace scientist and former President'),
('Paulo Coelho', 'Brazilian novelist'),
('James Clear', 'Author known for books on habits'),
('J.K. Rowling', 'British novelist and fantasy writer'),
('Robert Kiyosaki', 'Author and financial educator'),
('George Orwell', 'English novelist and essayist');

INSERT INTO Categories (category_name)
VALUES
('Autobiography'),
('Fiction'),
('Self Help'),
('Fantasy'),
('Finance'),
('Dystopian Fiction');

INSERT INTO Books
(isbn, title, author_id, category_id, total_copies, available_copies)
VALUES
('9788173711466', 'Wings of Fire', 1, 1, 5, 5),
('9780062315007', 'The Alchemist', 2, 2, 4, 4),
('9780735211292', 'Atomic Habits', 3, 3, 3, 3),
('9780747532699', 'Harry Potter', 4, 4, 6, 6),
('9781612680194', 'Rich Dad Poor Dad', 5, 5, 2, 2),
('9780451524935', '1984', 6, 6, 4, 4);

INSERT INTO Users
(full_name, email, phone, membership_status)
VALUES
('Arun Kumar', 'arun@gmail.com', '9876543210', 'Active'),
('Priya Sharma', 'priya@gmail.com', '9876543211', 'Active'),
('Karthik Raj', 'karthik@gmail.com', '9876543212', 'Active'),
('Divya Suresh', 'divya@gmail.com', '9876543213', 'Active'),
('Rahul Anand', 'rahul@gmail.com', '9876543214', 'Inactive'),
('Meena Devi', 'meena@gmail.com', '9876543215', 'Active');

SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Users;
