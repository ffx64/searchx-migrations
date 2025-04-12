-- Create the 'users' table if it doesn't already exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                           -- This is a unique ID for each user, automatically generated.
    username TEXT NOT NULL UNIQUE,                   -- The user's username, which must be unique and can't be left blank.
    password TEXT NOT NULL,                          -- The user's password, which is required and can't be empty.
    agents_count INTEGER NOT NULL DEFAULT 0,         -- This keeps track of the number of agents the user has, starting at 0 and cannot be left blank.
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP -- The timestamp when the user is created, automatically set to the current date and time.
);
