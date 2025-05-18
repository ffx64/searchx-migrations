-- Create the 'combolist_informations' table if it doesn't exist
CREATE TABLE IF NOT EXISTS combolist_informations (
    id SERIAL PRIMARY KEY,  -- 'id' is the primary key of the table, a unique number identifying each entry
    name TEXT NOT NULL,     -- 'name' is the name of the combolist entry (required)
    description TEXT,       -- 'description' is a more detailed description of the entry, can be null
    agent_external_ip TEXT, -- 'agent_external_ip' stores the external IP of the agent who created the entry.
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- 'created_at' stores the date and time when the entry was created.
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP  -- 'updated_at' stores the date and time of the last update to the entry.
);