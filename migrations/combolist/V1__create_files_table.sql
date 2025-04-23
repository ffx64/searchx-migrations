-- Table to store information about log files
CREATE TABLE IF NOT EXISTS files (
    id SERIAL PRIMARY KEY,                             -- Unique identifier for each log file
    agent_key VARCHAR(64) NOT NULL,
    name VARCHAR(255) NOT NULL,                        -- Name of the log file (e.g., "combolist.txt")
    size BIGINT NOT NULL,                              -- Size of the file in bytes
    hash VARCHAR(64) NOT NULL UNIQUE,                  -- Hash of the file (e.g., SHA-256)
                                                       -- Ensures the file hash is unique, used for file comparison
    created_at DATE DEFAULT CURRENT_DATE,              -- Date when the file entry was created (only the date, no time)
    processed_at DATE,                                 -- Date when the file was processed (only the date, no time)
    status INTEGER DEFAULT 0,                          -- Status of the file
                                                       -- 0 = pending, 1 = processed, 2 = error
    source VARCHAR(255),                               -- Source from where the file came from (optional)
    type VARCHAR(20),                                  -- Type of the file (e.g., txt, csv, json)
    description TEXT,                                  -- Optional description of the file (e.g., "File contains user/password entries")
    processed_entries_count INT DEFAULT 0              -- Count of processed entries from the file (useful for auditing)
);

-- Index to optimize search queries by file status (e.g., to find pending or processed files)
CREATE INDEX IF NOT EXISTS idx_files_combolist_status ON files(status);
-- Index to optimize search queries by creation date (e.g., to retrieve files created on a specific date)
CREATE INDEX IF NOT EXISTS idx_files_combolist_created_at ON files(created_at);
