-- ============================================================
--  PostgreSQL script – Drilling Service (forage)
--  Compatible with PostgreSQL 12+
-- ============================================================

-- Create the database (run this separately as a superuser if needed)
-- CREATE DATABASE forage;
-- \c forage;

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

-- AJOUTER UNE TABLE DEMANDE_STATUS / SPRINT 3 BIS

-- -------------------------------------------------------------
--  3. type_devis
-- -------------------------------------------------------------
CREATE TABLE type_devis (
    id      SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- -------------------------------------------------------------
--  4. statut
-- -------------------------------------------------------------
CREATE TABLE statut (
    id      SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
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
INSERT INTO type_devis (libelle) VALUES
    ('Devis estimatif'),
    ('Devis définitif');

INSERT INTO statut (libelle) VALUES
    ('En attente'),
    ('Approuvé'),
    ('Rejeté');

INSERT INTO statut_travaux (libelle) VALUES
    ('Planifié'),
    ('En cours'),
    ('Terminé'),
    ('Suspendu');
