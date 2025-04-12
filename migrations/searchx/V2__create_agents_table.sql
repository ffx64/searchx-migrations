-- Create the 'agents' table if it doesn't already exist
CREATE TABLE IF NOT EXISTS agents (
    id SERIAL PRIMARY KEY,                                  -- Unique ID for each agent. Automatically created and cannot be duplicated.
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, -- Links each agent to a user by referencing their 'id' in the 'users' table.
                                                            -- If a user is deleted, all their associated agents will be deleted as well (ON DELETE CASCADE).
    name TEXT NOT NULL,                                     -- The agent's name. This is required, and cannot be left blank.
    key TEXT UNIQUE NOT NULL,                               -- A unique key for the agent, used for identification or security. This is also required.
    reason TEXT,                                            -- A field for any additional information about the agent. This is optional and can be left blank.
    active BOOLEAN NOT NULL DEFAULT FALSE,                  -- A true/false value indicating whether the agent is active. By default, it's set to 'false'.
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP        -- Automatically records the date and time when the agent is created, including time zone information.
);
