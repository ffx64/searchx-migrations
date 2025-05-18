-- Create the 'agents' table if it doesn't exist
CREATE TABLE IF NOT EXISTS agents (
    id SERIAL PRIMARY KEY,                     -- Agent ID
    case_id INTEGER NOT NULL REFERENCES cases(id) ON DELETE CASCADE, -- Related case
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- Responsible user
    agent_type TEXT NOT NULL,                  -- Type ('collector', 'analyzer')
    agent_status TEXT DEFAULT 'active',        -- Current status
    auth_key TEXT NOT NULL UNIQUE,             -- Unique auth key
    platform TEXT NOT NULL,                    -- Platform the agent handles
    data_processed INTEGER DEFAULT 0,          -- Amount of data processed
    last_activity_at TIMESTAMPTZ,              -- Last activity timestamp
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Creation time
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Last update time
    collection_interval INTEGER DEFAULT 60,    -- Collection interval (minutes)
    tags TEXT[],                               -- Agent tags
    last_updated_by INTEGER REFERENCES users(id), -- Last editor
    last_ip_address TEXT                       -- Last IP used
);
