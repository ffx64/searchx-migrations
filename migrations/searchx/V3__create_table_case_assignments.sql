-- Create the 'case_assignments' table if it doesn't exist
CREATE TABLE IF NOT EXISTS case_assignments (
    id SERIAL PRIMARY KEY,                          -- Unique identifier for each case assignment
    case_id INTEGER NOT NULL REFERENCES cases(id) ON DELETE CASCADE,  -- Link to the case; if the case is deleted, the assignment will also be deleted
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,  -- Link to the user assigned to the case; if the user is deleted, the assignment will also be deleted
    role TEXT DEFAULT 'analyst',                   -- The role of the user in the case ('coordinator', 'agent', 'analyst')
    assigned_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP  -- Timestamp when the user was assigned to the case
);


