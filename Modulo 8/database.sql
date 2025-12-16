-- Criar banco de dados
CREATE DATABASE partners_db;

-- Conectar no banco (execute após criar)
-- \c partners_db;

-- Ativar extensão espacial
CREATE EXTENSION IF NOT EXISTS postgis;

-- =========================
-- Tabela PARTNERS
-- =========================
CREATE TABLE partners (
    id VARCHAR PRIMARY KEY,
    trading_name VARCHAR(150) NOT NULL,
    owner_name VARCHAR(150) NOT NULL,
    document VARCHAR(50) NOT NULL UNIQUE,
    coverage_area GEOGRAPHY(MULTIPOLYGON, 4326) NOT NULL,
    address GEOGRAPHY(POINT, 4326) NOT NULL
);

-- =========================
-- Índices para performance
-- =========================
CREATE INDEX idx_partners_coverage_area
ON partners
USING GIST (coverage_area);

CREATE INDEX idx_partners_address
ON partners
USING GIST (address);
