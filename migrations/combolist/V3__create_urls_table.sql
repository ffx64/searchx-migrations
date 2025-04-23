-- Table to store all URLs associated with a given username and password pair
CREATE TABLE IF NOT EXISTS urls (
    id SERIAL PRIMARY KEY,                    -- Unique identifier for each URL entry
    user_id INT NOT NULL,                     -- ID of the related user
                                              -- References "user.id" (foreign key)
    url TEXT NOT NULL,                        -- The extracted URL linked to the user credentials
    file_line TEXT NOT NULL,                  -- Raw line from the original file (useful for auditing/debugging)
    created_at DATE DEFAULT CURRENT_DATE,     -- Date when the URL entry was created (date only, no time)

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    -- Establishes relationship with the "users" table
    -- If a user is deleted, all associated URLs are automatically deleted
);

-- Index to optimize queries by user ID and URL (e.g. checking if a specific URL already exists for a user)
CREATE INDEX IF NOT EXISTS idx_urls_user_id_url ON urls(user_id, url);
