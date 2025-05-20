-- Drop foreign key dependencies first (if not using ON DELETE CASCADE everywhere)
ALTER TABLE agents DROP CONSTRAINT IF EXISTS agents_case_id_fkey;

-- Remove the 'case_id' column from the 'agents' table
ALTER TABLE agents DROP COLUMN IF EXISTS case_id;

-- Drop dependent table first
DROP TABLE IF EXISTS case_assignments CASCADE;

-- Then drop the main 'cases' table
DROP TABLE IF EXISTS cases CASCADE;

