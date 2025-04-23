-- Table to store extracted log entries for users from files
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                           -- Unique identifier for each user entry
    file_id INT NOT NULL,                            -- ID of the log file from which this entry was extracted
                                                     -- References the "file.id" (foreign key)
    username TEXT NOT NULL,                          -- The username extracted from the log file
    password TEXT NOT NULL,                          -- The password associated with the username
    created_at DATE DEFAULT CURRENT_DATE,            -- Date when the user entry was created (date only, no time)

    FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
    -- Establishes relationship with the "file" table
    -- If a log file is deleted, all associated user entries will also be deleted automatically
);

-- Index to optimize search queries by file ID (e.g. to find all users from a specific file)
CREATE INDEX IF NOT EXISTS idx_users_file_id ON users(file_id);
-- Index to optimize search queries by the date of creation (e.g. to find entries created on a specific date)
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at);
