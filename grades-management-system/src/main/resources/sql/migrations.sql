-- Migration to allow NULL values in parameters table
-- This allows defining ranges like "Above X" (max is NULL) or "Below Y" (min is NULL)

ALTER TABLE parameters ALTER COLUMN min_value DROP NOT NULL;
ALTER TABLE parameters ALTER COLUMN max_value DROP NOT NULL;
