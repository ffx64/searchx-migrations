-- Create the 'users' table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                         -- Unique identifier for each user
    username TEXT NOT NULL UNIQUE,                 -- Login name, must be unique
    full_name TEXT,                                -- Full name of the user (optional)
    email TEXT UNIQUE,                             -- Email address (must be unique if provided)
    role TEXT NOT NULL,                            -- User role: admin, analyst, auditor, etc.
    password_hash TEXT NOT NULL,                   -- Hashed password for authentication
    is_active BOOLEAN DEFAULT TRUE,                -- Whether the user account is active
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the user was created
    last_login TIMESTAMPTZ                         -- Timestamp of the user's last login
);