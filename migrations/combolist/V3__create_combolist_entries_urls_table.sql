-- Create the table to store all URLs for a given username and password
CREATE TABLE combolist_entries_urls (
    id SERIAL PRIMARY KEY,                           -- Unique identifier for the entry
    combolist_entries_user_id INT NOT NULL,           -- ID of the corresponding entry in combolist_entries_user table
    url TEXT NOT NULL,                               -- URL associated with the username and password pair
    created_at DATE DEFAULT CURRENT_DATE,            -- Date when the entry was created (only the date)
    FOREIGN KEY (combolist_entries_user_id) REFERENCES combolist_entries_user(id) ON DELETE CASCADE  -- Foreign key referencing the id from combolist_entries_user table
);

-- Create an index to optimize queries by combolist_entries_user_id and url
CREATE INDEX IF NOT EXISTS idx_combolist_entries_urls_combolist_entries_user_id_url ON combolist_entries_urls(combolist_entries_user_id, url);
