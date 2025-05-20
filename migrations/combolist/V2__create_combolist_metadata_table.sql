CREATE TABLE combolist_metadata (
    id              BIGSERIAL PRIMARY KEY,
    source          TEXT,
    collected_at    TIMESTAMP,
    tags            TEXT[],
    notes           TEXT
);


