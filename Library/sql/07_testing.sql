USE library_management_final;

SELECT
    book_id,
    title,
    available_copies
FROM Books;

START TRANSACTION;

INSERT INTO Transactions (
    book_id,
    user_id,
    issue_date,
    due_date,
    transaction_status
)
VALUES (
    1,
    1,
    CURRENT_DATE,
    DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY),
    'Issued'
);

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 1
AND available_copies > 0;

COMMIT;

SELECT * FROM vw_issued_books;

SELECT * FROM ActivityLog;