BEGIN;

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS is_online INTEGER NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    nama TEXT,
    telepon TEXT,
    alamat TEXT,
    kota TEXT,
    nama_anak TEXT,
    jenjang_anak TEXT,
    sekolah_tujuan TEXT,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    nama TEXT,
    telepon TEXT,
    afiliasi TEXT,
    kode TEXT,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS operator_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    nama TEXT,
    telepon TEXT,
    afiliasi TEXT,
    kode TEXT,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMIT;
