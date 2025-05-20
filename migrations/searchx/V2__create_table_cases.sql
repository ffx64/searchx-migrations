-- Create the 'cases' table if it doesn't exist
CREATE TABLE IF NOT EXISTS cases (
    id SERIAL PRIMARY KEY,                            -- Unique identifier for each case
    name TEXT NOT NULL,                               -- Name of the case
    description TEXT,                                 -- Detailed description of the case
    status TEXT DEFAULT 'open',                       -- Status of the case: open, in progress, closed
    priority_level INTEGER DEFAULT 1,                 -- Priority level: low, medium, high, critical
    tags TEXT[] DEFAULT ARRAY[]::TEXT[],              -- Array of tags, {'urgent', 'data_leak'}
    assigned_to INTEGER NOT NULL REFERENCES users(id) ON DELETE SET NULL, -- ID of the user who created the case
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the case was created
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Timestamp of the last update to the case
    closed_at TIMESTAMPTZ
);
