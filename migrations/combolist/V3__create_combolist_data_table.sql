CREATE TABLE combolist_data (
    id              BIGSERIAL PRIMARY KEY,
    email           CITEXT,
    password        TEXT,
    username        CITEXT,
    domain          CITEXT,
    metadata_id     BIGINT REFERENCES combolist_metadata(id)
);

CREATE INDEX idx_combolist_email ON combolist_data(email);
CREATE INDEX idx_combolist_username ON combolist_data(username);
