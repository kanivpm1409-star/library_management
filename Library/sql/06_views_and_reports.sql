USE library_management_final;

CREATE OR REPLACE VIEW vw_book_catalog AS
SELECT
    b.book_id,
    b.isbn,
    b.title,
    a.author_name,
    c.category_name,
    b.total_copies,
    b.available_copies
FROM Books b
INNER JOIN Authors a
    ON b.author_id = a.author_id
INNER JOIN Categories c
    ON b.category_id = c.category_id;


CREATE OR REPLACE VIEW vw_issued_books AS
SELECT
    t.transaction_id,
    b.title,
    u.full_name,
    u.email,
    t.issue_date,
    t.due_date,
    t.transaction_status
FROM Transactions t
INNER JOIN Books b
    ON t.book_id = b.book_id
INNER JOIN Users u
    ON t.user_id = u.user_id
WHERE t.transaction_status = 'Issued';

CREATE OR REPLACE VIEW vw_overdue_books AS
SELECT
    t.transaction_id,
    b.title,
    u.full_name,
    u.email,
    t.issue_date,
    t.due_date,
    DATEDIFF(CURRENT_DATE, t.due_date) AS days_overdue
FROM Transactions t
INNER JOIN Books b
    ON t.book_id = b.book_id
INNER JOIN Users u
    ON t.user_id = u.user_id
WHERE t.transaction_status = 'Issued'
AND t.due_date < CURRENT_DATE;

CREATE OR REPLACE VIEW vw_borrowing_history AS
SELECT
    t.transaction_id,
    b.title,
    u.full_name,
    t.issue_date,
    t.due_date,
    t.return_date,
    t.transaction_status
FROM Transactions t
INNER JOIN Books b
    ON t.book_id = b.book_id
INNER JOIN Users u
    ON t.user_id = u.user_id;

CREATE OR REPLACE VIEW vw_book_borrowing_summary AS
SELECT
    b.book_id,
    b.title,
    COUNT(t.transaction_id) AS total_borrowings
FROM Books b
LEFT JOIN Transactions t
    ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;


SHOW FULL TABLES
WHERE Table_type = 'VIEW';

