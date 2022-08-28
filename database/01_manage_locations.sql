CREATE DATABASE gerenciador_de_localidades;
\c gerenciador_de_localidades
CREATE SCHEMA IF NOT EXISTS "public";
CREATE TABLE "public"."city" (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY(start 1) NOT NULL,
    name VARCHAR(250) NOT NULL UNIQUE,
    CONSTRAINT "city_pk" PRIMARY KEY (id),
    CONSTRAINT "name_UK" UNIQUE (name)
);
CREATE TABLE "public"."workstation" (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY(start 1) NOT NULL,
    name VARCHAR(250) NOT NULL UNIQUE,
    city_id INTEGER NOT NULL,
    ip VARCHAR(250),
    link VARCHAR(250),
    adsl_vpn BOOLEAN NOT NULL DEFAULT FALSE,
    regional BOOLEAN NOT NULL DEFAULT FALSE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    regional_id INTEGER,
    CONSTRAINT "workstation_workstation_fk" FOREIGN KEY (regional_id)
        REFERENCES "public"."workstation" (id),
    CONSTRAINT "name_UNK" UNIQUE (name),
    CONSTRAINT "workstation_pk" PRIMARY KEY (id),
    CONSTRAINT "workstation_city_id_fkey" FOREIGN KEY (city_id)
    REFERENCES "public"."city" (id)
    ON DELETE RESTRICT
);

CREATE TABLE "public"."phone" (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY(start 1) NOT NULL,
    workstation_id INTEGER NOT NULL,
    number VARCHAR(250) NOT NULL,
    CONSTRAINT "phone_pk" PRIMARY KEY (id),
    CONSTRAINT "phone_workstation_id_fkey" FOREIGN KEY (workstation_id)
        REFERENCES "public"."workstation" (id)
            ON DELETE CASCADE 
            ON UPDATE CASCADE
);