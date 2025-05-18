-- Create the 'combolist_data' table if it doesn't exist
CREATE TABLE IF NOT EXISTS combolist_data (
    id SERIAL PRIMARY KEY,  -- 'id' is the primary key of the table, a unique number identifying each entry
    username TEXT NOT NULL, -- 'username' stores the username for the combolist entry (required)
    password TEXT NOT NULL, -- 'password' stores the password associated with the username (required)
    url TEXT NOT NULL,      -- 'url' stores the URL associated with the username (required)
    CONSTRAINT unique_password_url UNIQUE (password, url), -- Ensures that the combination of 'password' and 'url' is unique in the table
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,      -- 'created_at' stores the date and time when the entry was created
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP       -- 'updated_at' stores the date and time of the last update to the entry
);