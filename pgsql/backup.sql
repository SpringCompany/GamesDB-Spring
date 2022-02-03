--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
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

--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies
(
    cod_company  integer                NOT NULL,
    nacionalidad character varying(255) NOT NULL,
    nombre       character varying(255) NOT NULL
);


ALTER TABLE public.companies
    OWNER TO postgres;

--
-- Name: companies_cod_company_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_cod_company_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_cod_company_seq
    OWNER TO postgres;

--
-- Name: companies_cod_company_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_cod_company_seq OWNED BY public.companies.cod_company;


--
-- Name: generos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generos
(
    cod_genero integer                NOT NULL,
    nombre     character varying(255) NOT NULL
);


ALTER TABLE public.generos
    OWNER TO postgres;

--
-- Name: generos_cod_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.generos_cod_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generos_cod_genero_seq
    OWNER TO postgres;

--
-- Name: generos_cod_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.generos_cod_genero_seq OWNED BY public.generos.cod_genero;


--
-- Name: juegos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.juegos
(
    cod_juego         integer                NOT NULL,
    fecha_lanzamiento date                   NOT NULL,
    nombre            character varying(255) NOT NULL,
    pegi              integer                NOT NULL,
    portada           character varying(255) NOT NULL,
    precio            double precision       NOT NULL,
    desarrolladora    integer                NOT NULL,
    distribuidora     integer                NOT NULL,
    genero            integer                NOT NULL
);


ALTER TABLE public.juegos
    OWNER TO postgres;

--
-- Name: juegos_cod_juego_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.juegos_cod_juego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.juegos_cod_juego_seq
    OWNER TO postgres;

--
-- Name: juegos_cod_juego_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.juegos_cod_juego_seq OWNED BY public.juegos.cod_juego;


--
-- Name: juegos_desarrolladora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.juegos_desarrolladora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.juegos_desarrolladora_seq
    OWNER TO postgres;

--
-- Name: juegos_desarrolladora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.juegos_desarrolladora_seq OWNED BY public.juegos.desarrolladora;


--
-- Name: juegos_distribuidora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.juegos_distribuidora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.juegos_distribuidora_seq
    OWNER TO postgres;

--
-- Name: juegos_distribuidora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.juegos_distribuidora_seq OWNED BY public.juegos.distribuidora;


--
-- Name: juegos_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.juegos_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.juegos_genero_seq
    OWNER TO postgres;

--
-- Name: juegos_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.juegos_genero_seq OWNED BY public.juegos.genero;


--
-- Name: jugadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jugadores
(
    cod_jugador integer                NOT NULL,
    avatar      character varying(255) NOT NULL,
    correo      character varying(255) NOT NULL,
    edad        integer                NOT NULL,
    nombre      character varying(255) NOT NULL
);


ALTER TABLE public.jugadores
    OWNER TO postgres;

--
-- Name: jugadores_cod_jugador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jugadores_cod_jugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jugadores_cod_jugador_seq
    OWNER TO postgres;

--
-- Name: jugadores_cod_jugador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jugadores_cod_jugador_seq OWNED BY public.jugadores.cod_jugador;


--
-- Name: jugadores_juegos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jugadores_juegos
(
    cod_jugador integer NOT NULL,
    cod_juego   integer NOT NULL
);


ALTER TABLE public.jugadores_juegos
    OWNER TO postgres;

--
-- Name: companies cod_company; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ALTER COLUMN cod_company SET DEFAULT nextval('public.companies_cod_company_seq'::regclass);


--
-- Name: generos cod_genero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generos
    ALTER COLUMN cod_genero SET DEFAULT nextval('public.generos_cod_genero_seq'::regclass);


--
-- Name: juegos cod_juego; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ALTER COLUMN cod_juego SET DEFAULT nextval('public.juegos_cod_juego_seq'::regclass);


--
-- Name: juegos desarrolladora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ALTER COLUMN desarrolladora SET DEFAULT nextval('public.juegos_desarrolladora_seq'::regclass);


--
-- Name: juegos distribuidora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ALTER COLUMN distribuidora SET DEFAULT nextval('public.juegos_distribuidora_seq'::regclass);


--
-- Name: juegos genero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ALTER COLUMN genero SET DEFAULT nextval('public.juegos_genero_seq'::regclass);


--
-- Name: jugadores cod_jugador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadores
    ALTER COLUMN cod_jugador SET DEFAULT nextval('public.jugadores_cod_jugador_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (cod_company, nacionalidad, nombre) FROM stdin;
1	Slovenia	Stehr Inc
2	China	Langosh LLC
3	Tanzania	Parker, Ankunding and Wuckert
4	Argentina	Schaefer and Sons
5	Costa Rica	Dietrich, Towne and Zemlak
6	Mexico	Macejkovic-Sawayn
7	France	Walter-Funk
8	Japan	Schroeder Group
9	Indonesia	Shields-Johns
10	Indonesia	Ullrich-Kemmer
11	Vietnam	Rice-Kassulke
12	China	Dickinson-Bogisich
13	United Kingdom	Gaylord-Pacocha
14	France	Gibson, Brakus and Wilderman
15	Peru	Stroman LLC
16	Norway	Moen-Lowe
17	Belarus	Gleichner-Reinger
18	Vietnam	Gottlieb and Sons
19	Iran	Schmeler Inc
20	China	Connelly-Moore
21	Sweden	Crona Inc
22	Mexico	Murray-Keebler
23	Philippines	Jones-Farrell
24	Ukraine	Maggio-Breitenberg
25	Chile	Casper-Fisher
26	Armenia	Douglas-Balistreri
27	Namibia	Blick-Sawayn
28	Poland	Corkery-Kshlerin
29	Czech Republic	Upton and Sons
30	China	Jaskolski, Bradtke and Waelchi
31	France	Kuvalis, Haag and McCullough
32	Philippines	Strosin, Kuhn and Maggio
33	China	Sawayn, Littel and Maggio
34	Poland	Towne LLC
35	Indonesia	Veum, Hills and Stehr
36	Greece	Gusikowski Inc
37	Pakistan	Upton, Halvorson and Conroy
38	Democratic Republic of the Congo	Willms Inc
39	Kuwait	Stamm, Boehm and Brown
40	Colombia	Abernathy-Deckow
41	China	Williamson, Reichel and Bergstrom
42	Poland	Shields, Cartwright and Pagac
43	South Korea	Weissnat and Sons
44	Indonesia	Weimann, Dach and Torp
45	China	Upton Group
46	Brazil	Keebler Group
47	Thailand	Kuvalis Inc
48	Sweden	Kilback LLC
49	Madagascar	Reinger, O'Connell and Christiansen
50	Mauritius	Nikolaus-Towne
51	Nigeria	Harvey-Stroman
52	China	Jaskolski, Parker and Wolff
53	Sweden	Klein, Volkman and Brown
54	Brazil	Kertzmann, Paucek and Crona
55	Tunisia	Torphy, Blanda and Boehm
56	Indonesia	Barrows, Reilly and Blick
57	China	Smitham, Stroman and Dickens
58	France	Denesik Group
59	Moldova	Wintheiser, Bergstrom and Rosenbaum
60	Russia	Bruen Inc
61	Russia	Watsica-Lemke
62	Poland	Schulist-Bechtelar
63	Germany	Johnson, Reinger and Abernathy
64	Colombia	Schimmel Inc
65	Poland	Veum-Tillman
66	China	Maggio, Cruickshank and Weber
67	China	Zulauf, Barrows and Dare
68	Zimbabwe	Deckow-Rodriguez
69	China	Spinka LLC
70	France	Bahringer LLC
71	Indonesia	Gibson Group
72	Peru	Hilll and Sons
73	Russia	Upton, Kilback and Labadie
74	Philippines	Hane-Bosco
75	China	DuBuque Group
76	Philippines	Collins, Emmerich and Parisian
77	Argentina	Macejkovic-Mills
78	Bolivia	Kuhn, Jacobson and Schmitt
79	Yemen	Runolfsdottir, Prosacco and Stark
80	Japan	Larkin, Hansen and Schaden
81	Peru	Lindgren, Howell and Runolfsson
82	Australia	Dibbert-Grant
83	Portugal	Conn, Kling and Rogahn
84	Cuba	Altenwerth LLC
85	China	Spencer Group
86	Cuba	Rippin-Goyette
87	France	Gerlach, Terry and Cronin
88	Poland	Shields LLC
89	Brazil	Considine and Sons
90	Philippines	Hoeger, Collier and Hessel
91	China	Connelly-Nikolaus
92	China	Cummerata, Hammes and Goyette
93	Russia	Hilpert Group
94	Moldova	Batz, Moen and Robel
95	Latvia	Crona and Sons
96	Poland	Koss, Kautzer and Bogisich
97	Haiti	Purdy Group
98	Poland	Wolff Inc
99	Russia	Wiegand, Lehner and Hackett
100	Madagascar	Kihn-Dickinson
\.


--
-- Data for Name: generos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.generos (cod_genero, nombre) FROM stdin;
1	Action
2	Adventure
3	Comedy
4	Crime and mystery
5	Fantasy
6	Historical
7	Historical fiction
8	Horror
9	Romance
10	Satire
11	Science fiction
12	Speculative
13	Thriller
14	Western
\.


--
-- Data for Name: juegos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.juegos (cod_juego, fecha_lanzamiento, nombre, pegi, portada, precio, desarrolladora, distribuidora,
                    genero) FROM stdin;
1	2001-09-29	Fix San	14	http://dummyimage.com/121x100.png/ff4444/ffffff	45.82	61	43	14
2	2001-10-12	Tresom	11	http://dummyimage.com/250x100.png/dddddd/000000	58.12	79	74	10
3	2005-10-19	Tresom	14	http://dummyimage.com/192x100.png/cc0000/ffffff	85.68	15	85	4
4	2009-02-11	Daltfresh	17	http://dummyimage.com/128x100.png/cc0000/ffffff	16.16	2	98	3
5	2021-08-16	Lotlux	15	http://dummyimage.com/197x100.png/ff4444/ffffff	24.49	62	100	5
6	2010-07-30	Span	15	http://dummyimage.com/191x100.png/ff4444/ffffff	13.54	34	18	4
7	2009-01-22	Vagram	18	http://dummyimage.com/126x100.png/ff4444/ffffff	7.43	14	63	13
8	2002-09-10	Kanlam	17	http://dummyimage.com/128x100.png/dddddd/000000	17.59	51	36	6
9	2007-11-28	Pannier	10	http://dummyimage.com/192x100.png/ff4444/ffffff	87.22	89	12	3
10	2020-04-13	Home Ing	11	http://dummyimage.com/215x100.png/cc0000/ffffff	31.24	36	99	8
11	2018-06-02	Domainer	11	http://dummyimage.com/127x100.png/ff4444/ffffff	8.66	1	79	5
12	2021-12-24	Holdlamis	8	http://dummyimage.com/195x100.png/cc0000/ffffff	73.61	62	90	7
13	2004-07-09	Transcof	8	http://dummyimage.com/204x100.png/dddddd/000000	23.3	19	44	9
14	2012-05-20	Overhold	13	http://dummyimage.com/246x100.png/ff4444/ffffff	31.8	38	12	3
15	2017-05-17	Overhold	15	http://dummyimage.com/128x100.png/ff4444/ffffff	56.33	54	17	2
16	2021-09-11	Matsoft	18	http://dummyimage.com/177x100.png/cc0000/ffffff	92.38	43	46	7
17	2006-10-03	Toughjoyfax	18	http://dummyimage.com/137x100.png/ff4444/ffffff	68.7	35	29	14
18	2005-05-31	Voyatouch	14	http://dummyimage.com/141x100.png/5fa2dd/ffffff	93.1	45	80	11
19	2008-05-09	It	9	http://dummyimage.com/117x100.png/cc0000/ffffff	17.42	13	75	5
20	2009-10-04	Tin	16	http://dummyimage.com/231x100.png/cc0000/ffffff	4.88	80	45	7
21	2006-11-30	Hatity	15	http://dummyimage.com/168x100.png/cc0000/ffffff	26.09	15	53	9
22	2013-12-06	Lotstring	15	http://dummyimage.com/196x100.png/5fa2dd/ffffff	4.96	90	23	9
23	2018-02-01	Span	17	http://dummyimage.com/162x100.png/dddddd/000000	65.99	95	86	6
24	2015-02-06	Konklux	15	http://dummyimage.com/169x100.png/ff4444/ffffff	38.19	45	78	11
25	2003-08-03	Ventosanzap	11	http://dummyimage.com/173x100.png/cc0000/ffffff	35.27	94	93	12
26	2016-09-08	Toughjoyfax	9	http://dummyimage.com/211x100.png/dddddd/000000	24.66	28	24	11
27	2013-10-23	Bitchip	10	http://dummyimage.com/195x100.png/ff4444/ffffff	67.43	23	39	7
28	2019-11-13	Transcof	17	http://dummyimage.com/216x100.png/dddddd/000000	20.18	70	78	14
29	2006-04-22	Greenlam	17	http://dummyimage.com/163x100.png/ff4444/ffffff	55.62	44	51	7
30	2021-06-19	Redhold	13	http://dummyimage.com/161x100.png/5fa2dd/ffffff	58.23	6	43	11
31	2020-02-17	Treeflex	13	http://dummyimage.com/116x100.png/5fa2dd/ffffff	56.46	9	67	14
32	2019-01-10	Fixflex	13	http://dummyimage.com/139x100.png/cc0000/ffffff	69.62	86	43	5
33	2008-12-01	Stringtough	15	http://dummyimage.com/202x100.png/cc0000/ffffff	78.03	42	63	2
34	2015-09-22	Bitchip	16	http://dummyimage.com/121x100.png/dddddd/000000	20.71	17	86	2
35	2006-10-17	Keylex	14	http://dummyimage.com/217x100.png/ff4444/ffffff	67.54	89	63	9
36	2009-09-09	Rank	15	http://dummyimage.com/225x100.png/dddddd/000000	72.46	63	35	12
37	2016-09-17	Quo Lux	12	http://dummyimage.com/143x100.png/cc0000/ffffff	63.21	83	51	1
38	2002-04-28	Zoolab	14	http://dummyimage.com/134x100.png/5fa2dd/ffffff	50.35	69	68	3
39	2005-06-11	Pannier	10	http://dummyimage.com/190x100.png/cc0000/ffffff	94	38	55	13
40	2012-02-19	Wrapsafe	17	http://dummyimage.com/185x100.png/cc0000/ffffff	60.28	24	84	8
41	2019-11-12	Lotstring	14	http://dummyimage.com/151x100.png/cc0000/ffffff	43.63	18	96	6
42	2005-09-02	Gembucket	15	http://dummyimage.com/131x100.png/ff4444/ffffff	77.69	65	5	10
43	2014-04-03	Cookley	15	http://dummyimage.com/211x100.png/ff4444/ffffff	87.16	95	63	13
44	2014-05-09	Voyatouch	16	http://dummyimage.com/160x100.png/cc0000/ffffff	53.31	8	11	6
45	2014-05-30	Kanlam	18	http://dummyimage.com/136x100.png/cc0000/ffffff	46.15	21	99	7
46	2001-12-21	Transcof	12	http://dummyimage.com/148x100.png/cc0000/ffffff	58.08	85	1	14
47	2015-07-24	Fintone	17	http://dummyimage.com/209x100.png/dddddd/000000	50.75	47	48	11
48	2004-03-13	Ronstring	14	http://dummyimage.com/162x100.png/5fa2dd/ffffff	89.99	75	49	9
49	2017-09-27	Trippledex	18	http://dummyimage.com/213x100.png/dddddd/000000	26.39	88	54	10
50	2010-05-15	Zontrax	8	http://dummyimage.com/115x100.png/5fa2dd/ffffff	67.2	7	42	14
51	2020-02-26	Sub-Ex	11	http://dummyimage.com/229x100.png/cc0000/ffffff	51.88	90	98	10
52	2004-09-12	Voyatouch	12	http://dummyimage.com/244x100.png/dddddd/000000	91.68	85	92	3
53	2012-05-29	Zoolab	15	http://dummyimage.com/231x100.png/5fa2dd/ffffff	36.3	67	5	13
54	2014-11-14	Lotlux	11	http://dummyimage.com/207x100.png/ff4444/ffffff	10.2	80	59	12
55	2015-07-28	Aerified	8	http://dummyimage.com/181x100.png/dddddd/000000	4.96	95	46	9
56	2009-06-04	Toughjoyfax	12	http://dummyimage.com/248x100.png/5fa2dd/ffffff	14.32	64	39	9
57	2004-03-23	Holdlamis	17	http://dummyimage.com/226x100.png/5fa2dd/ffffff	78.74	7	31	4
58	2005-03-08	Sub-Ex	11	http://dummyimage.com/169x100.png/dddddd/000000	96.95	30	5	10
59	2021-05-02	Andalax	13	http://dummyimage.com/127x100.png/5fa2dd/ffffff	10.44	51	51	11
60	2011-04-04	Redhold	13	http://dummyimage.com/153x100.png/dddddd/000000	8.12	19	4	10
61	2014-06-17	Zathin	16	http://dummyimage.com/156x100.png/ff4444/ffffff	78.55	76	95	7
62	2005-03-06	Temp	12	http://dummyimage.com/248x100.png/dddddd/000000	10.83	38	83	3
63	2011-07-04	Temp	17	http://dummyimage.com/179x100.png/cc0000/ffffff	23.98	51	74	3
64	2009-10-28	Zontrax	16	http://dummyimage.com/154x100.png/5fa2dd/ffffff	88.53	60	76	12
65	2004-11-24	Toughjoyfax	17	http://dummyimage.com/217x100.png/dddddd/000000	40.68	42	52	10
66	2005-01-14	Stim	16	http://dummyimage.com/175x100.png/cc0000/ffffff	71.28	25	24	10
67	2018-04-01	Rank	15	http://dummyimage.com/214x100.png/ff4444/ffffff	21.51	68	51	9
68	2011-09-11	Rank	11	http://dummyimage.com/187x100.png/5fa2dd/ffffff	53.03	48	31	13
69	2007-10-14	Vagram	12	http://dummyimage.com/215x100.png/cc0000/ffffff	15.72	97	69	9
70	2001-02-22	Quo Lux	10	http://dummyimage.com/119x100.png/dddddd/000000	21.51	11	91	2
71	2004-09-11	Cardify	11	http://dummyimage.com/141x100.png/ff4444/ffffff	56.28	98	29	7
72	2015-08-01	Toughjoyfax	12	http://dummyimage.com/127x100.png/ff4444/ffffff	46.57	46	61	10
73	2017-05-13	Prodder	9	http://dummyimage.com/143x100.png/5fa2dd/ffffff	47.47	23	23	6
74	2016-11-24	Zamit	16	http://dummyimage.com/236x100.png/dddddd/000000	14.51	6	43	2
75	2010-04-03	Stringtough	12	http://dummyimage.com/171x100.png/cc0000/ffffff	17.81	75	21	8
76	2009-05-27	It	9	http://dummyimage.com/174x100.png/cc0000/ffffff	26.5	17	70	1
77	2008-08-14	Overhold	17	http://dummyimage.com/138x100.png/ff4444/ffffff	44.26	43	35	2
78	2018-04-24	Job	17	http://dummyimage.com/244x100.png/ff4444/ffffff	32.14	85	45	1
79	2006-07-26	Biodex	14	http://dummyimage.com/131x100.png/cc0000/ffffff	15.73	42	22	12
80	2009-11-02	Flowdesk	13	http://dummyimage.com/195x100.png/cc0000/ffffff	18.98	71	10	9
81	2006-02-26	Redhold	15	http://dummyimage.com/120x100.png/ff4444/ffffff	2.99	70	48	1
82	2014-06-06	Cardify	11	http://dummyimage.com/106x100.png/5fa2dd/ffffff	6.34	40	18	8
83	2004-07-01	Bitwolf	10	http://dummyimage.com/156x100.png/dddddd/000000	92.66	9	20	4
84	2010-11-30	Aerified	13	http://dummyimage.com/229x100.png/ff4444/ffffff	93.2	13	47	14
85	2011-04-18	Konklab	10	http://dummyimage.com/173x100.png/ff4444/ffffff	8.08	77	28	12
86	2011-09-17	Gembucket	17	http://dummyimage.com/122x100.png/cc0000/ffffff	29.79	76	63	1
87	2005-10-30	Treeflex	14	http://dummyimage.com/142x100.png/5fa2dd/ffffff	28.82	59	36	9
88	2005-01-20	Fintone	16	http://dummyimage.com/125x100.png/cc0000/ffffff	56.37	89	61	12
89	2009-10-29	Quo Lux	17	http://dummyimage.com/239x100.png/5fa2dd/ffffff	22.31	10	17	2
90	2006-06-02	Cookley	8	http://dummyimage.com/147x100.png/cc0000/ffffff	76.79	95	43	5
91	2018-02-12	Kanlam	8	http://dummyimage.com/172x100.png/ff4444/ffffff	87.09	3	25	5
92	2003-07-04	Tresom	11	http://dummyimage.com/158x100.png/cc0000/ffffff	44.2	90	97	4
93	2014-10-16	Tempsoft	17	http://dummyimage.com/118x100.png/dddddd/000000	41.49	71	33	13
94	2019-03-09	Voyatouch	15	http://dummyimage.com/120x100.png/dddddd/000000	36.68	21	15	9
95	2019-02-08	Konklux	11	http://dummyimage.com/245x100.png/dddddd/000000	60.42	4	27	1
96	2010-10-22	Span	10	http://dummyimage.com/208x100.png/dddddd/000000	42.2	63	63	5
97	2006-12-15	Wrapsafe	16	http://dummyimage.com/183x100.png/dddddd/000000	87.97	64	30	10
98	2003-09-16	Bitchip	11	http://dummyimage.com/122x100.png/cc0000/ffffff	94.48	65	97	7
99	2012-12-26	Alpha	10	http://dummyimage.com/197x100.png/dddddd/000000	90.81	6	73	7
100	2014-01-21	Tres-Zap	12	http://dummyimage.com/200x100.png/cc0000/ffffff	71.79	74	52	13
\.


--
-- Data for Name: jugadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jugadores (cod_jugador, avatar, correo, edad, nombre) FROM stdin;
1	https://robohash.org/doloreperspiciatisvoluptatibus.png?size=50x50&set=set1	astaddon0@europa.eu	80	gmaurice0
2	https://robohash.org/doloresquodsimilique.png?size=50x50&set=set1	mbrummitt1@uiuc.edu	30	glettson1
3	https://robohash.org/placeatinciduntodit.png?size=50x50&set=set1	kbillham2@ca.gov	19	tmcsporon2
4	https://robohash.org/utcupiditateut.png?size=50x50&set=set1	meagan3@squarespace.com	68	mwisdom3
5	https://robohash.org/utodiotempore.png?size=50x50&set=set1	cmccromley4@google.ca	48	jsmuth4
6	https://robohash.org/minusmagniea.png?size=50x50&set=set1	tfaircley5@omniture.com	99	kcolthurst5
7	https://robohash.org/rationedictanon.png?size=50x50&set=set1	chatton6@skyrock.com	46	eschwerin6
8	https://robohash.org/ducimusestreiciendis.png?size=50x50&set=set1	tfewless7@buzzfeed.com	19	dsangra7
9	https://robohash.org/cumveloptio.png?size=50x50&set=set1	vparley8@list-manage.com	24	mgarz8
10	https://robohash.org/essevelin.png?size=50x50&set=set1	gcrudgington9@springer.com	91	bloweth9
11	https://robohash.org/etveritatismagni.png?size=50x50&set=set1	lcarlesia@wisc.edu	92	efoorda
12	https://robohash.org/namipsumeos.png?size=50x50&set=set1	kpretselb@youtube.com	43	hhandmanb
13	https://robohash.org/autemcumvoluptatem.png?size=50x50&set=set1	obrideauxc@bloomberg.com	83	akirwanc
14	https://robohash.org/nemodoloremqueesse.png?size=50x50&set=set1	ghambrightd@shareasale.com	60	acarsbergd
15	https://robohash.org/quoplaceatdoloremque.png?size=50x50&set=set1	jkeyzmane@php.net	33	kmcdouglee
16	https://robohash.org/quaeratabtempora.png?size=50x50&set=set1	tfawlkesf@soundcloud.com	38	ranfonsif
17	https://robohash.org/facerequasicum.png?size=50x50&set=set1	dlightong@com.com	79	rjellicorseg
18	https://robohash.org/odioeumet.png?size=50x50&set=set1	rkilbrideh@geocities.com	71	mbellworthyh
19	https://robohash.org/numquamharumquia.png?size=50x50&set=set1	stucki@cdc.gov	51	dvassayi
20	https://robohash.org/voluptatemdolorlaudantium.png?size=50x50&set=set1	bmattiolij@github.com	57	ckaresj
21	https://robohash.org/idquidemaut.png?size=50x50&set=set1	iburlandk@sciencedaily.com	24	mnosworthyk
22	https://robohash.org/pariaturharumaliquam.png?size=50x50&set=set1	dmcgeneayl@arizona.edu	72	emcgarrityl
23	https://robohash.org/quiofficiaut.png?size=50x50&set=set1	fwhaplingtonm@europa.eu	98	tshurrockm
24	https://robohash.org/incumdolorem.png?size=50x50&set=set1	ecasollan@senate.gov	99	malecockn
25	https://robohash.org/mollitiaisteprovident.png?size=50x50&set=set1	gjonuzio@chicagotribune.com	99	stayloo
26	https://robohash.org/ducimusquiaperiam.png?size=50x50&set=set1	aledwithp@latimes.com	47	fscullyp
27	https://robohash.org/voluptateadeserunt.png?size=50x50&set=set1	flampkeq@skype.com	34	dneissenq
28	https://robohash.org/blanditiisteneturdeserunt.png?size=50x50&set=set1	kmatysikr@answers.com	45	taggusr
29	https://robohash.org/facerequifacilis.png?size=50x50&set=set1	hmccullochs@senate.gov	29	sewans
30	https://robohash.org/asperioresnequelabore.png?size=50x50&set=set1	ngurnert@zdnet.com	96	llinskeyt
31	https://robohash.org/dolorumeumcorrupti.png?size=50x50&set=set1	jparloru@nsw.gov.au	32	ibercheru
32	https://robohash.org/consequaturillovoluptatem.png?size=50x50&set=set1	nbilsfordv@nps.gov	98	nsecretv
33	https://robohash.org/accusantiumporroquae.png?size=50x50&set=set1	lbellwardw@dropbox.com	12	kemmertw
34	https://robohash.org/enimblanditiisenim.png?size=50x50&set=set1	gtwelftreex@newsvine.com	96	langeaux
35	https://robohash.org/quibusdamreiciendissint.png?size=50x50&set=set1	slampingy@indiegogo.com	69	lwhortony
36	https://robohash.org/sintnonsimilique.png?size=50x50&set=set1	cmeddz@arizona.edu	13	rblamphinz
37	https://robohash.org/innesciuntquisquam.png?size=50x50&set=set1	apolle10@eepurl.com	54	jstathor10
38	https://robohash.org/nesciuntplaceatillum.png?size=50x50&set=set1	tbeecham11@domainmarket.com	89	elimrick11
39	https://robohash.org/consecteturquiexplicabo.png?size=50x50&set=set1	ckemetz12@biblegateway.com	56	gclayworth12
40	https://robohash.org/nostrumofficiaquia.png?size=50x50&set=set1	jstoop13@about.me	40	midenden13
41	https://robohash.org/eareprehenderitdoloremque.png?size=50x50&set=set1	imcgrady14@jiathis.com	54	eraff14
42	https://robohash.org/pariaturomnisqui.png?size=50x50&set=set1	ovandervlies15@cafepress.com	11	fblackham15
43	https://robohash.org/doloribusinventoreperspiciatis.png?size=50x50&set=set1	abaline16@unesco.org	13	akrates16
44	https://robohash.org/impeditsimiliqueest.png?size=50x50&set=set1	rcostell17@google.de	50	ddeandreis17
45	https://robohash.org/providentlaboriosamsunt.png?size=50x50&set=set1	bgoodlud18@businessinsider.com	84	ablankenship18
46	https://robohash.org/dolorarchitectoomnis.png?size=50x50&set=set1	mstacy19@twitpic.com	44	aremirez19
47	https://robohash.org/laborumaliastempore.png?size=50x50&set=set1	pchesley1a@wikia.com	84	rruecastle1a
48	https://robohash.org/delenitieiusquia.png?size=50x50&set=set1	mgolson1b@yahoo.co.jp	64	lhuitson1b
49	https://robohash.org/nihilcorporisperferendis.png?size=50x50&set=set1	rwabb1c@phoca.cz	63	jreddin1c
50	https://robohash.org/evenietrationeeum.png?size=50x50&set=set1	esackler1d@nih.gov	38	vwinyard1d
51	https://robohash.org/utlaboreaut.png?size=50x50&set=set1	lcolliver1e@prnewswire.com	74	tknatt1e
52	https://robohash.org/suntaliassed.png?size=50x50&set=set1	nmounsey1f@t.co	54	cfaloon1f
53	https://robohash.org/velitomnisconsequatur.png?size=50x50&set=set1	dbranford1g@mtv.com	10	amcaw1g
54	https://robohash.org/quiareiciendisdebitis.png?size=50x50&set=set1	dkeable1h@craigslist.org	69	fhanigan1h
55	https://robohash.org/quisequiquas.png?size=50x50&set=set1	fspellsworth1i@bing.com	11	eateridge1i
56	https://robohash.org/autofficiisullam.png?size=50x50&set=set1	btorrie1j@utexas.edu	73	idomotor1j
57	https://robohash.org/veritatisfugiatquo.png?size=50x50&set=set1	cgoldsack1k@businessinsider.com	96	aoene1k
58	https://robohash.org/mollitiasedmagni.png?size=50x50&set=set1	carrighini1l@sina.com.cn	68	agirardini1l
59	https://robohash.org/dolorumperferendisminus.png?size=50x50&set=set1	mhoulahan1m@google.nl	50	jchrister1m
60	https://robohash.org/ducimusnesciuntrerum.png?size=50x50&set=set1	sgeator1n@google.com	18	mnapolitano1n
61	https://robohash.org/autquidemquis.png?size=50x50&set=set1	itwiddle1o@google.com.hk	41	avasile1o
62	https://robohash.org/numquamaccusamusaut.png?size=50x50&set=set1	cficken1p@ca.gov	90	wpickburn1p
63	https://robohash.org/quiaexpeditadolorem.png?size=50x50&set=set1	mziehms1q@ustream.tv	58	vswayne1q
64	https://robohash.org/rerumminusconsectetur.png?size=50x50&set=set1	ehinstock1r@apache.org	97	bseywood1r
65	https://robohash.org/dignissimoseligendivelit.png?size=50x50&set=set1	bdessaur1s@people.com.cn	82	dtallent1s
66	https://robohash.org/minusprovidentnesciunt.png?size=50x50&set=set1	gcordery1t@tinypic.com	89	caharoni1t
67	https://robohash.org/ducimusquoanimi.png?size=50x50&set=set1	lrankin1u@purevolume.com	15	rdrohane1u
68	https://robohash.org/eosearumdolores.png?size=50x50&set=set1	mskahill1v@csmonitor.com	15	awynne1v
69	https://robohash.org/autfacilisvel.png?size=50x50&set=set1	zdealy1w@oracle.com	64	neary1w
70	https://robohash.org/adipiscialiasveritatis.png?size=50x50&set=set1	asweetzer1x@toplist.cz	40	tlassey1x
71	https://robohash.org/remtemporafacilis.png?size=50x50&set=set1	fmatveiko1y@census.gov	54	alowten1y
72	https://robohash.org/quiaarchitectoprovident.png?size=50x50&set=set1	hbarradell1z@geocities.jp	37	bfrancklin1z
73	https://robohash.org/quasaliquamdolore.png?size=50x50&set=set1	jerrol20@cnbc.com	11	jtweedlie20
74	https://robohash.org/numquamnequedolor.png?size=50x50&set=set1	clindenblatt21@sourceforge.net	80	ntradewell21
75	https://robohash.org/eaquequiconsectetur.png?size=50x50&set=set1	dcullivan22@fema.gov	92	vskaid22
76	https://robohash.org/temporaquisexpedita.png?size=50x50&set=set1	mivamy23@miitbeian.gov.cn	42	dbolgar23
77	https://robohash.org/accusantiumetharum.png?size=50x50&set=set1	fvasyukhichev24@sitemeter.com	54	rlongman24
78	https://robohash.org/cupiditatereiciendisquis.png?size=50x50&set=set1	scarver25@desdev.cn	45	emccaughen25
79	https://robohash.org/quialiquiddebitis.png?size=50x50&set=set1	alorrimer26@issuu.com	47	dwildbore26
80	https://robohash.org/distinctiocumqueaut.png?size=50x50&set=set1	bunitt27@cdbaby.com	30	gollive27
81	https://robohash.org/etutsit.png?size=50x50&set=set1	mmacgaffey28@theguardian.com	15	chamnet28
82	https://robohash.org/laborumsintdistinctio.png?size=50x50&set=set1	hmcgrill29@irs.gov	23	pkerswell29
83	https://robohash.org/autemquasiadipisci.png?size=50x50&set=set1	tyellowley2a@blogger.com	48	nmazzey2a
84	https://robohash.org/voluptatumnesciuntquia.png?size=50x50&set=set1	fmacgebenay2b@wix.com	44	hstrivens2b
85	https://robohash.org/voluptateoditest.png?size=50x50&set=set1	hdedomenico2c@nydailynews.com	56	kedon2c
86	https://robohash.org/cumipsumquia.png?size=50x50&set=set1	pderobertis2d@apple.com	39	cdelmonte2d
87	https://robohash.org/quaequaeratmaiores.png?size=50x50&set=set1	ecurcher2e@netlog.com	20	alansberry2e
88	https://robohash.org/fugasedsimilique.png?size=50x50&set=set1	ijoselevitch2f@plala.or.jp	56	llapree2f
89	https://robohash.org/beataenesciuntexcepturi.png?size=50x50&set=set1	ahasely2g@unicef.org	35	czannelli2g
90	https://robohash.org/facererationerepudiandae.png?size=50x50&set=set1	jcardinale2h@springer.com	28	fginsie2h
91	https://robohash.org/eaqueettenetur.png?size=50x50&set=set1	jegginson2i@mediafire.com	10	ggrumble2i
92	https://robohash.org/architectoveritatisnemo.png?size=50x50&set=set1	creynoldson2j@parallels.com	63	slower2j
93	https://robohash.org/iuretotamdolores.png?size=50x50&set=set1	lcanavan2k@blinklist.com	17	mredon2k
94	https://robohash.org/dolorillumsit.png?size=50x50&set=set1	craffan2l@altervista.org	51	jsalmen2l
95	https://robohash.org/quibusdamprovidentaut.png?size=50x50&set=set1	icrosland2m@mapy.cz	77	hhannigan2m
96	https://robohash.org/placeatconsequunturinventore.png?size=50x50&set=set1	cgabbotts2n@shop-pro.jp	46	cbachmann2n
97	https://robohash.org/etomnisut.png?size=50x50&set=set1	fsturdy2o@cocolog-nifty.com	62	kkelloway2o
98	https://robohash.org/enimeosunde.png?size=50x50&set=set1	dshakspeare2p@indiegogo.com	10	rarnaldo2p
99	https://robohash.org/accusamuserrorquis.png?size=50x50&set=set1	nantonov2q@discovery.com	27	acrocombe2q
100	https://robohash.org/laborepraesentiumaut.png?size=50x50&set=set1	alammers2r@phoca.cz	44	cbrighouse2r
\.


--
-- Data for Name: jugadores_juegos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jugadores_juegos (cod_jugador, cod_juego) FROM stdin;
70	20
61	10
9	73
42	4
20	33
23	1
87	42
24	44
46	79
43	14
58	22
3	12
86	81
76	98
49	10
29	23
16	6
64	28
27	43
76	45
63	58
12	46
44	31
39	72
11	4
52	96
60	98
29	2
57	1
16	52
45	63
60	1
35	56
14	45
94	12
47	77
71	40
1	75
60	99
35	30
61	13
57	95
95	65
54	39
95	96
94	82
21	71
88	88
89	12
1	53
17	54
32	25
44	43
7	45
77	34
97	20
44	11
43	99
38	21
73	72
14	37
31	96
82	68
73	36
3	22
30	34
35	10
40	20
99	46
80	71
60	71
24	33
68	11
83	66
80	5
66	32
12	31
84	47
41	62
90	68
71	60
21	99
50	60
36	48
55	95
3	3
34	12
41	25
84	80
26	82
16	14
55	20
83	27
31	42
52	62
77	100
83	10
2	28
83	99
52	2
\.


--
-- Name: companies_cod_company_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_cod_company_seq', 100, true);


--
-- Name: generos_cod_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.generos_cod_genero_seq', 14, true);


--
-- Name: juegos_cod_juego_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.juegos_cod_juego_seq', 100, true);


--
-- Name: juegos_desarrolladora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.juegos_desarrolladora_seq', 1, false);


--
-- Name: juegos_distribuidora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.juegos_distribuidora_seq', 1, false);


--
-- Name: juegos_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.juegos_genero_seq', 1, false);


--
-- Name: jugadores_cod_jugador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jugadores_cod_jugador_seq', 100, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (cod_company);


--
-- Name: generos generos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generos
    ADD CONSTRAINT generos_pkey PRIMARY KEY (cod_genero);


--
-- Name: juegos juegos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT juegos_pkey PRIMARY KEY (cod_juego);


--
-- Name: jugadores_juegos jugadores_juegos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadores_juegos
    ADD CONSTRAINT jugadores_juegos_pkey PRIMARY KEY (cod_jugador, cod_juego);


--
-- Name: jugadores jugadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadores
    ADD CONSTRAINT jugadores_pkey PRIMARY KEY (cod_jugador);


--
-- Name: juegos fk7fkwpee8xhpn4wibmc7vn9gmc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT fk7fkwpee8xhpn4wibmc7vn9gmc FOREIGN KEY (desarrolladora) REFERENCES public.companies (cod_company);


--
-- Name: juegos fk9bgfv7tb50tebb341u6o70min; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT fk9bgfv7tb50tebb341u6o70min FOREIGN KEY (distribuidora) REFERENCES public.companies (cod_company);


--
-- Name: jugadores_juegos fkbhnasxhmjeob8tk74dbpe8xam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadores_juegos
    ADD CONSTRAINT fkbhnasxhmjeob8tk74dbpe8xam FOREIGN KEY (cod_juego) REFERENCES public.juegos (cod_juego);


--
-- Name: juegos fketfwvdjp3x2lr29s3yk6loctf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT fketfwvdjp3x2lr29s3yk6loctf FOREIGN KEY (genero) REFERENCES public.generos (cod_genero);


--
-- Name: jugadores_juegos fkpfofyv307rfmpo0r5j0o1rwf8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadores_juegos
    ADD CONSTRAINT fkpfofyv307rfmpo0r5j0o1rwf8 FOREIGN KEY (cod_jugador) REFERENCES public.jugadores (cod_jugador);


--
-- PostgreSQL database dump complete
--

