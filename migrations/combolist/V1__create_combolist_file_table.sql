-- Create the file_combolist table to store information about log files
CREATE TABLE file_combolist (
    id SERIAL PRIMARY KEY,                           -- Unique identifier for the log file
    file_name VARCHAR(255) NOT NULL,                  -- Name of the file
    file_size BIGINT NOT NULL,                        -- Size of the file in bytes
    file_hash BYTEA NOT NULL,                         -- Hash of the file (e.g., SHA-256) -> Use BYTEA for binary data
    created_at DATE DEFAULT CURRENT_DATE,             -- Creation date (only the date, no time)
    processed_at DATE,                                -- Processing date (only the date)
    status INTEGER DEFAULT 0,                         -- Status of the file (0 = pending, 1 = processed, 2 = error)
    source VARCHAR(255),                              -- Source from where the file came from (optional)
    file_type VARCHAR(20),                            -- Type of the file (e.g., txt, csv, json)
    file_description TEXT,                            -- Optional description of the file
    processed_entries_count INT DEFAULT 0             -- Count of processed entries (for auditing)
);

-- Add indexes to optimize search queries
CREATE INDEX IF NOT EXISTS idx_file_combolist_file_hash ON file_combolist(file_hash);
CREATE INDEX IF NOT EXISTS idx_file_combolist_status ON file_combolist(status);
CREATE INDEX IF NOT EXISTS idx_file_combolist_created_at ON file_combolist(created_at);