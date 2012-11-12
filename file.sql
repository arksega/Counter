--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: installation; Type: TABLE; Schema: public; Owner: counter; Tablespace: 
--

CREATE TABLE installation (
    code varchar(10) NOT NULL,
    name varchar(50),
    career varchar(4),
    date timestamp without time zone,
    distro varchar(10)
);


ALTER TABLE public.installation OWNER TO counter;

--
-- Name: users; Type: TABLE; Schema: public; Owner: counter; Tablespace: 
--

CREATE TABLE users (
    code varchar(10) NOT NULL,
    name varchar(50) NOT NULL,
    pass varchar(40) NOT NULL
);


ALTER TABLE public.users OWNER TO counter;

--
-- Data for Name: installation; Type: TABLE DATA; Schema: public; Owner: counter
--

COPY installation (code, name, career, date, distro) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: counter
--

COPY users (code, name, pass) FROM stdin;
208175863 	user 	e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4
\.


--
-- Name: unico; Type: CONSTRAINT; Schema: public; Owner: counter; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT unico UNIQUE (name, code);


--
-- Name: unico_installation; Type: CONSTRAINT; Schema: public; Owner: counter; Tablespace: 
--

ALTER TABLE ONLY installation
    ADD CONSTRAINT unico_installation UNIQUE (code);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: counter; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (code);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

