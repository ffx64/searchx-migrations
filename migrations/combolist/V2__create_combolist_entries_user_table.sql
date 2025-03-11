-- Create the combolist_entries_user table to store the extracted log entries from files
CREATE TABLE combolist_entries_user (
    id SERIAL PRIMARY KEY,                           -- Unique identifier for the log entry
    file_combolist_id INT NOT NULL,                  -- Foreign key referencing the log file (file_combolist table)
    username TEXT NOT NULL,                          -- Username extracted from the log
    password TEXT NOT NULL,                          -- Password extracted from the log
    created_at DATE DEFAULT CURRENT_DATE,          -- Creation date of the log entry (only the date)
    FOREIGN KEY (file_combolist_id) REFERENCES file_combolist(id) ON DELETE CASCADE  -- Relationship to the file_combolist table, with CASCADE on delete
);

-- Add indexes to optimize search queries
CREATE INDEX IF NOT EXISTS idx_combolist_entries_user_file_combolist_id ON combolist_entries_user(file_combolist_id);
CREATE INDEX IF NOT EXISTS idx_combolist_entries_user_created_at ON combolist_entries_user(created_at);