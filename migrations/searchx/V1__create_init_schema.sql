CREATE EXTENSION IF NOT EXISTS "citext";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS users (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username        TEXT NOT NULL UNIQUE,
    full_name       TEXT,
    email           TEXT UNIQUE,
    role            TEXT NOT NULL,
    password_hash   TEXT NOT NULL,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    last_login      TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS agents (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name                VARCHAR(100) UNIQUE,
    user_id             UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    agent_type          TEXT NOT NULL,
    agent_status        TEXT DEFAULT 'active',
    auth_key            TEXT NOT NULL UNIQUE,
    platform            TEXT NOT NULL,
    data_processed      INTEGER DEFAULT 0,
    last_activity_at    TIMESTAMPTZ,
    created_at          TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    collection_interval INTEGER DEFAULT 60,
    tags                TEXT[],
    last_updated_by     UUID REFERENCES users(id),
    last_ip_address     TEXT
);
