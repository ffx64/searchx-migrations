CREATE TABLE IF NOT EXISTS agents (
    id SERIAL PRIMARY KEY,  -- Unique identifier for each agent    
    case_id INTEGER NOT NULL REFERENCES cases(id) ON DELETE CASCADE, -- Foreign key linking the agent to a specific case. If the case is deleted, the agent is also removed.
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- Foreign key linking the agent to the user who created or is responsible for it.
    agent_type TEXT NOT NULL, -- Defines the type of agent ('collector', 'analyzer').
    agent_status TEXT DEFAULT 'active', -- Current status of the agent. Could be 'active', 'inactive', 'paused'. Default is 'active'.
    auth_key TEXT NOT NULL UNIQUE, -- Unique authentication key used by the indexer to validate that this agent is legitimate.
    platform TEXT NOT NULL, -- Specifies the platform the agent is responsible.
    data_processed INTEGER DEFAULT 0, -- Counter of how much data this agent has processed (number of messages, entries).
    last_activity_at TIMESTAMPTZ, -- Timestamp of the last time the agent reported activity or communicated with the system.
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the agent record was created.
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Timestamp of the last time this agent record was updated.
    collection_interval INTEGER DEFAULT 60, -- Defines how frequently the agent should collect data, in minutes. Default is every 60 minutes.
    tags TEXT[], -- An array of tags used to classify or filter agents ['priority', 'test', 'beta'].
    last_updated_by INTEGER REFERENCES users(id), -- References the user who last updated the agent record (for audit purposes).
    last_ip_address TEXT -- Stores the last IP address used by the agent to connect to the system.
);


