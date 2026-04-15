-- ============================================================
--  PostgreSQL script – Drilling Service (forage)
--  Compatible with PostgreSQL 12+
-- ============================================================

-- Reset Database structure
DROP TABLE IF EXISTS demande_statut_historique CASCADE;
DROP TABLE IF EXISTS detail_devis CASCADE;
DROP TABLE IF EXISTS devis CASCADE;
DROP TABLE IF EXISTS travaux CASCADE;
DROP TABLE IF EXISTS demande CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS type_devis CASCADE;
DROP TABLE IF EXISTS statut CASCADE;
DROP TABLE IF EXISTS statut_travaux CASCADE;

-- -------------------------------------------------------------
--  1. client   
-- -------------------------------------------------------------
CREATE TABLE client (
    id      SERIAL PRIMARY KEY,
    nom     VARCHAR(150) NOT NULL,
    contact VARCHAR(150) NOT NULL
);

-- -------------------------------------------------------------
--  2. demande
-- -------------------------------------------------------------
CREATE TABLE demande (
    id           SERIAL PRIMARY KEY,
    client_id    INT NOT NULL,
    date_demande TIMESTAMP NOT NULL,
    description  TEXT NOT NULL,
    lieu         VARCHAR(255) NOT NULL,
    CONSTRAINT fk_demande_client
        FOREIGN KEY (client_id) REFERENCES client(id)
);

-- -------------------------------------------------------------
--  3. statut
-- -------------------------------------------------------------
CREATE TABLE statut (
    id      SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL UNIQUE
);

-- -------------------------------------------------------------
--  2b. demande_statut_historique
-- -------------------------------------------------------------
CREATE TABLE demande_statut_historique (
    id              SERIAL PRIMARY KEY,
    demande_id      INT NOT NULL,
    id_statut       INT NOT NULL,
    description     TEXT,
    date_changement TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historique_demande
        FOREIGN KEY (demande_id) REFERENCES demande(id) ON DELETE CASCADE,
    CONSTRAINT fk_historique_statut
        FOREIGN KEY (id_statut) REFERENCES statut(id)
);

-- -------------------------------------------------------------
--  4. type_devis
-- -------------------------------------------------------------
CREATE TABLE type_devis (
    id      SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL UNIQUE,
    statut_id INT,
    CONSTRAINT fk_type_devis_statut
        FOREIGN KEY (statut_id) REFERENCES statut(id)
);

-- -------------------------------------------------------------
--  5. devis
-- -------------------------------------------------------------
CREATE TABLE devis (
    id            SERIAL PRIMARY KEY,
    demande_id    INT NOT NULL,
    type_devis_id INT NOT NULL,
    date_devis    TIMESTAMP NOT NULL,
    statut_id     INT NOT NULL,
    CONSTRAINT fk_devis_demande
        FOREIGN KEY (demande_id)    REFERENCES demande(id),
    CONSTRAINT fk_devis_type
        FOREIGN KEY (type_devis_id) REFERENCES type_devis(id),
    CONSTRAINT fk_devis_statut
        FOREIGN KEY (statut_id)     REFERENCES statut(id)
);

-- -------------------------------------------------------------
--  6. detail_devis
-- -------------------------------------------------------------
CREATE TABLE detail_devis (
    id      SERIAL PRIMARY KEY,
    devis_id INT NOT NULL,
    libelle  VARCHAR(255) NOT NULL,
    quantite NUMERIC(12,2) NOT NULL DEFAULT 1,
    prix_unitaire NUMERIC(12,2) NOT NULL DEFAULT 0,
    montant  NUMERIC(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_detail_devis_devis
        FOREIGN KEY (devis_id) REFERENCES devis(id)
);



-- -------------------------------------------------------------
--  7. statut_travaux
-- -------------------------------------------------------------
CREATE TABLE statut_travaux (
    id      SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- -------------------------------------------------------------
--  8. travaux
-- -------------------------------------------------------------
CREATE TABLE travaux (
    id               SERIAL PRIMARY KEY,
    demande_id       INT NOT NULL,
    statut_travaux_id INT NOT NULL,
    CONSTRAINT fk_travaux_demande
        FOREIGN KEY (demande_id)        REFERENCES demande(id),
    CONSTRAINT fk_travaux_statut
        FOREIGN KEY (statut_travaux_id) REFERENCES statut_travaux(id)
);

-- -------------------------------------------------------------
--  Reference data – populate lookup tables
-- -------------------------------------------------------------
INSERT INTO statut (libelle) VALUES
    ('en attente'),
    ('devis étude créé'),
    ('devis forage créé');

INSERT INTO type_devis (libelle, statut_id) VALUES
    ('devis étude', 2),
    ('devis forage', 3);

INSERT INTO statut_travaux (libelle) VALUES
    ('Planifié'),
    ('En cours'),
    ('Terminé'),
    ('Suspendu');


-- Chiffre d'affaire prévisionnel
SELECT SUM(montant) FROM detail_devis;

