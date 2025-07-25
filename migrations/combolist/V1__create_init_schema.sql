CREATE EXTENSION IF NOT EXISTS "citext";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE combolist_metadata (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    hash            TEXT UNIQUE NOT NULL,
    source          TEXT,
    collected_at    TIMESTAMP NOT NULL,
    tags            TEXT[],
    notes           TEXT,
    created_at      TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE combolist_data (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email           CITEXT,
    password        TEXT,
    username        CITEXT,
    domain          CITEXT,
    metadata_id     UUID REFERENCES combolist_metadata(id) ON DELETE CASCADE,
    created_at      TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_combolist_email ON combolist_data(email);
CREATE INDEX idx_combolist_username ON combolist_data(username);
CREATE INDEX idx_combolist_domain ON combolist_data(domain);

CREATE UNIQUE INDEX uniq_identity ON combolist_data (COALESCE(email::TEXT, username::TEXT), password, domain);