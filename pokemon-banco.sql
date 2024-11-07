SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.elementos (
    id integer NOT NULL,
    descricao character varying(100)
);


ALTER TABLE public.elementos OWNER TO postgres;

CREATE SEQUENCE public.elementos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elementos_id_seq OWNER TO postgres;

ALTER SEQUENCE public.elementos_id_seq OWNED BY public.elementos.id;

CREATE TABLE public.pokemon (
    id integer NOT NULL,
	foto VARCHAR(1024),
    data date,
    treinador character varying(100),
    nome character varying(100),
    descricao character varying,
    elementos_id integer
);

ALTER TABLE public.pokemon OWNER TO postgres;

CREATE SEQUENCE public.pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_id_seq OWNER TO postgres;

ALTER SEQUENCE public.pokemon_id_seq OWNED BY public.pokemon.id;

CREATE TABLE public.treinador (
    id integer NOT NULL,
    email character varying,
    senha character varying
);


ALTER TABLE public.treinador OWNER TO postgres;


CREATE SEQUENCE public.treinador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treinador_id_seq OWNER TO postgres;


ALTER SEQUENCE public.treinador_id_seq OWNED BY public.treinador.id;


ALTER TABLE ONLY public.elementos ALTER COLUMN id SET DEFAULT nextval('public.elementos_id_seq'::regclass);


ALTER TABLE ONLY public.pokemon ALTER COLUMN id SET DEFAULT nextval('public.pokemon_id_seq'::regclass);


ALTER TABLE ONLY public.treinador ALTER COLUMN id SET DEFAULT nextval('public.treinador_id_seq'::regclass);



INSERT INTO public.treinador VALUES (1, 'admin@gmail.com', '12345');


SELECT setval('public.elementos_id_seq', 1, false);
SELECT setval('public.pokemon_id_seq', 1, false);
SELECT setval('public.treinador_id_seq', 1, false);
