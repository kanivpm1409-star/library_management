USE library_management_final;


CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    biography TEXT
);


CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,

    CONSTRAINT chk_total_copies
        CHECK (total_copies >= 0),

    CONSTRAINT chk_available_copies
        CHECK (available_copies >= 0
        AND available_copies <= total_copies),

    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_books_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);



CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    membership_status VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT chk_membership_status
        CHECK (membership_status IN ('Active', 'Inactive'))
);



CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    transaction_status VARCHAR(20) NOT NULL DEFAULT 'Issued',

    CONSTRAINT chk_transaction_status
        CHECK (transaction_status IN ('Issued', 'Returned')),

    CONSTRAINT chk_due_date
        CHECK (due_date >= issue_date),

    CONSTRAINT chk_return_date
        CHECK (
            return_date IS NULL
            OR return_date >= issue_date
        ),

    CONSTRAINT chk_return_status
        CHECK (
            (transaction_status = 'Issued' AND return_date IS NULL)
            OR
            (transaction_status = 'Returned' AND return_date IS NOT NULL)
        ),

    CONSTRAINT fk_transactions_book
        FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_transactions_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


USE library_management_final;
SHOW TABLES;
