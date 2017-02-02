--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-01-27 15:56:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE controlefrota;
--
-- TOC entry 2074 (class 1262 OID 24800)
-- Name: controlefrota; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE controlefrota WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE controlefrota OWNER TO postgres;

\connect controlefrota

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 24880)
-- Name: controlefrota; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA controlefrota;


ALTER SCHEMA controlefrota OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = controlefrota, pg_catalog;

--
-- TOC entry 173 (class 1259 OID 24881)
-- Name: seq_combustivel; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_combustivel
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_combustivel OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24883)
-- Name: seq_funcao; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_funcao
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_funcao OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 24885)
-- Name: seq_revisao; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_revisao
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_revisao OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24887)
-- Name: seq_saida; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_saida
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_saida OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 24889)
-- Name: seq_tipo_veiculo; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_tipo_veiculo
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_tipo_veiculo OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24891)
-- Name: seq_usuario; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_usuario
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_usuario OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 24893)
-- Name: seq_veiculo; Type: SEQUENCE; Schema: controlefrota; Owner: postgres
--

CREATE SEQUENCE seq_veiculo
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_veiculo OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 24895)
-- Name: tb_combustivel; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_combustivel (
    id_combustivel integer DEFAULT nextval('seq_combustivel'::regclass) NOT NULL,
    txt_combustivel character varying
);


ALTER TABLE tb_combustivel OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 24902)
-- Name: tb_funcao; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_funcao (
    id_funcao integer DEFAULT nextval('seq_funcao'::regclass) NOT NULL,
    txt_funcao character varying
);


ALTER TABLE tb_funcao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24909)
-- Name: tb_revisao; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_revisao (
    id_revisao integer DEFAULT nextval('seq_revisao'::regclass) NOT NULL,
    id_veiculo integer NOT NULL,
    itens_a_verificar character varying,
    itens_verificados character varying,
    trocas_efetuadas character varying,
    problemas_remanescentes character varying,
    id_usuario integer,
    data_realizacao timestamp without time zone,
    odometro double precision,
    observacao character varying,
    concluida character(1)
);


ALTER TABLE tb_revisao OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24916)
-- Name: tb_saida; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_saida (
    id_saida integer DEFAULT nextval('seq_saida'::regclass) NOT NULL,
    data_saida timestamp without time zone NOT NULL,
    id_veiculo integer NOT NULL,
    id_usuario integer NOT NULL,
    odometro_saida double precision NOT NULL,
    motorista character varying NOT NULL,
    destino character varying NOT NULL,
    data_retorno timestamp without time zone,
    odometro_retorno double precision,
    autorizacao character(1)
);


ALTER TABLE tb_saida OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24923)
-- Name: tb_tipo_veiculo; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_tipo_veiculo (
    id_tipo_veiculo integer DEFAULT nextval('seq_tipo_veiculo'::regclass) NOT NULL,
    finalidade character varying,
    txt_tipo character varying
);


ALTER TABLE tb_tipo_veiculo OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25042)
-- Name: tb_usuario; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_usuario (
    id_usuario integer DEFAULT nextval('seq_usuario'::regclass) NOT NULL,
    nome character varying,
    sobrenome character varying,
    id_funcao integer,
    email character varying,
    usuario character varying NOT NULL,
    senha character varying,
    data_nascimento timestamp without time zone,
    data_admisssao timestamp without time zone,
    data_demissao timestamp without time zone,
    setor character varying,
    observacao character varying,
    telefone character varying
);


ALTER TABLE tb_usuario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24937)
-- Name: tb_veiculo; Type: TABLE; Schema: controlefrota; Owner: postgres
--

CREATE TABLE tb_veiculo (
    id_veiculo integer DEFAULT nextval('seq_veiculo'::regclass) NOT NULL,
    id_tipo_veiculo integer NOT NULL,
    placa character varying NOT NULL,
    chassi character varying,
    ano_fabricacao integer,
    ano_modelo integer,
    data_aquisicao timestamp without time zone,
    data_exclusao timestamp without time zone,
    capacidade_pessoas integer,
    cilindradas double precision,
    capacidade_carga double precision,
    fabricante character varying,
    modelo character varying,
    cor character varying,
    renavam character varying,
    id_combustivel integer,
    portas integer,
    odometro_atual double precision,
    bloqueado "char",
    observacao character varying
);


ALTER TABLE tb_veiculo OWNER TO postgres;

--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 173
-- Name: seq_combustivel; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_combustivel', 6, true);


--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 174
-- Name: seq_funcao; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_funcao', 3, true);


--
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 175
-- Name: seq_revisao; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_revisao', 0, false);


--
-- TOC entry 2079 (class 0 OID 0)
-- Dependencies: 176
-- Name: seq_saida; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_saida', 0, false);


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 177
-- Name: seq_tipo_veiculo; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_tipo_veiculo', 7, true);


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 178
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_usuario', 46, true);


--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 179
-- Name: seq_veiculo; Type: SEQUENCE SET; Schema: controlefrota; Owner: postgres
--

SELECT pg_catalog.setval('seq_veiculo', 0, false);


--
-- TOC entry 2063 (class 0 OID 24895)
-- Dependencies: 180
-- Data for Name: tb_combustivel; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--

INSERT INTO tb_combustivel VALUES (0, 'Gasolina');
INSERT INTO tb_combustivel VALUES (1, 'Etanol');
INSERT INTO tb_combustivel VALUES (2, 'Flex');
INSERT INTO tb_combustivel VALUES (3, 'Diesel');
INSERT INTO tb_combustivel VALUES (4, 'Biodiesel');
INSERT INTO tb_combustivel VALUES (5, 'GNV');
INSERT INTO tb_combustivel VALUES (6, 'Outros');


--
-- TOC entry 2064 (class 0 OID 24902)
-- Dependencies: 181
-- Data for Name: tb_funcao; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--

INSERT INTO tb_funcao VALUES (0, 'Gerente');
INSERT INTO tb_funcao VALUES (1, 'Mecânico');
INSERT INTO tb_funcao VALUES (2, 'Porteiro');
INSERT INTO tb_funcao VALUES (3, 'Motorista');


--
-- TOC entry 2065 (class 0 OID 24909)
-- Dependencies: 182
-- Data for Name: tb_revisao; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--



--
-- TOC entry 2066 (class 0 OID 24916)
-- Dependencies: 183
-- Data for Name: tb_saida; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--



--
-- TOC entry 2067 (class 0 OID 24923)
-- Dependencies: 184
-- Data for Name: tb_tipo_veiculo; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--

INSERT INTO tb_tipo_veiculo VALUES (1, 'Passeio', 'Automóvel');
INSERT INTO tb_tipo_veiculo VALUES (2, 'Carga', 'Caminhão');
INSERT INTO tb_tipo_veiculo VALUES (3, 'Carga', 'Caminhão Trator');
INSERT INTO tb_tipo_veiculo VALUES (4, 'Passeio/Carga', 'Caminhonete');
INSERT INTO tb_tipo_veiculo VALUES (5, 'Passeio', 'Utilitário');
INSERT INTO tb_tipo_veiculo VALUES (6, 'Passeio', 'Ônibus');
INSERT INTO tb_tipo_veiculo VALUES (7, 'Passeio/Carga', 'Motocicleta');


--
-- TOC entry 2069 (class 0 OID 25042)
-- Dependencies: 186
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--

INSERT INTO tb_usuario VALUES (29, 'Sergio', 'Dorneles', 0, 'ssdorneles@gmail.com', 'admin', 'admin', '1983-12-21 00:00:00', '2017-01-26 15:39:15.88', NULL, 'Garagem', 'asdasd', '21 986215193');
INSERT INTO tb_usuario VALUES (31, 'Sergio', 'Santrovitsch Dorneles', 0, 'ssdorneles@gmail.com', 'admin2', 'admin', '1983-12-21 00:00:00', '2017-01-26 15:40:44.687', NULL, 'Garagem', 'asdasd', '21 986215193');
INSERT INTO tb_usuario VALUES (32, 'Sergio', 'Santrovitsch Dorneles', 1, 'ssdorneles@gmail.com', 'admin3', 'admin', '1983-12-21 00:00:00', '2017-01-26 15:41:24.26', NULL, 'Garagem', 'asdasd', '21 986215193');
INSERT INTO tb_usuario VALUES (34, 'adasd', 'asdasda', 0, 'asdasd', 'admin4', 'a', '0001-01-01 00:00:00', '2017-01-26 15:43:40.91', '2017-01-27 14:36:29.358', '1', '1', 'asdads');


--
-- TOC entry 2068 (class 0 OID 24937)
-- Dependencies: 185
-- Data for Name: tb_veiculo; Type: TABLE DATA; Schema: controlefrota; Owner: postgres
--



--
-- TOC entry 1932 (class 2606 OID 24945)
-- Name: tb_combustivel_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_combustivel
    ADD CONSTRAINT tb_combustivel_pkey PRIMARY KEY (id_combustivel);


--
-- TOC entry 1934 (class 2606 OID 24947)
-- Name: tb_funcao_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_funcao
    ADD CONSTRAINT tb_funcao_pkey PRIMARY KEY (id_funcao);


--
-- TOC entry 1936 (class 2606 OID 24949)
-- Name: tb_revisao_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_revisao
    ADD CONSTRAINT tb_revisao_pkey PRIMARY KEY (id_revisao);


--
-- TOC entry 1938 (class 2606 OID 24951)
-- Name: tb_saida_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_saida
    ADD CONSTRAINT tb_saida_pkey PRIMARY KEY (id_saida);


--
-- TOC entry 1940 (class 2606 OID 24953)
-- Name: tb_tipo_veiculo_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_tipo_veiculo
    ADD CONSTRAINT tb_tipo_veiculo_pkey PRIMARY KEY (id_tipo_veiculo);


--
-- TOC entry 1944 (class 2606 OID 25050)
-- Name: tb_usuario_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1946 (class 2606 OID 25054)
-- Name: tb_usuario_usuario_key; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT tb_usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 1942 (class 2606 OID 24957)
-- Name: tb_veiculo_pkey; Type: CONSTRAINT; Schema: controlefrota; Owner: postgres
--

ALTER TABLE ONLY tb_veiculo
    ADD CONSTRAINT tb_veiculo_pkey PRIMARY KEY (id_veiculo);


-- Completed on 2017-01-27 15:56:39

--
-- PostgreSQL database dump complete
--

