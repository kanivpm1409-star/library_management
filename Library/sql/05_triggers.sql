USE library_management_final;

CREATE TABLE ActivityLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    action_type VARCHAR(20) NOT NULL,
    action_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),

    CONSTRAINT chk_action_type
        CHECK (action_type IN ('ISSUED', 'RETURNED')),

    CONSTRAINT fk_activity_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES Transactions(transaction_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
DESCRIBE ActivityLog

DELIMITER $$

CREATE TRIGGER trg_book_issue
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO ActivityLog (
        transaction_id,
        action_type,
        description
    )
    VALUES (
        NEW.transaction_id,
        'ISSUED',
        'A book has been issued to a library member'
    );
END$$

CREATE TRIGGER trg_book_return
AFTER UPDATE ON Transactions
FOR EACH ROW
BEGIN
    IF OLD.transaction_status = 'Issued'
       AND NEW.transaction_status = 'Returned' THEN

        INSERT INTO ActivityLog (
            transaction_id,
            action_type,
            description
        )
        VALUES (
            NEW.transaction_id,
            'RETURNED',
            'A book has been returned by a library member'
        );

    END IF;
END$$

DELIMITER ;
