USE library_management_final;

CREATE INDEX idx_books_title
ON Books(title);

CREATE INDEX idx_users_name
ON Users(full_name);

CREATE INDEX idx_transactions_user
ON Transactions(user_id);

CREATE INDEX idx_transactions_status_due_date
ON Transactions(transaction_status, due_date);