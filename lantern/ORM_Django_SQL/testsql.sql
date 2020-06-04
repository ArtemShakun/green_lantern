--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: city; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.city (
    id_city integer NOT NULL,
    name character varying(30) NOT NULL,
    id_country integer NOT NULL
);


ALTER TABLE public.city OWNER TO shakun;

--
-- Name: city_id_city_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.city_id_city_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_city_seq OWNER TO shakun;

--
-- Name: city_id_city_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.city_id_city_seq OWNED BY public.city.id_city;


--
-- Name: country; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.country (
    id_country integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.country OWNER TO shakun;

--
-- Name: country_id_country_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.country_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_country_seq OWNER TO shakun;

--
-- Name: country_id_country_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.country_id_country_seq OWNED BY public.country.id_country;


--
-- Name: dish; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.dish (
    id_dish integer NOT NULL,
    name character varying(50) NOT NULL,
    price integer
);


ALTER TABLE public.dish OWNER TO shakun;

--
-- Name: dish_id_dish_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.dish_id_dish_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_id_dish_seq OWNER TO shakun;

--
-- Name: dish_id_dish_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.dish_id_dish_seq OWNED BY public.dish.id_dish;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    category character varying(30) NOT NULL
);


ALTER TABLE public.menu OWNER TO shakun;

--
-- Name: menu_dish; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.menu_dish (
    id_menu integer NOT NULL,
    id_dish integer NOT NULL
);


ALTER TABLE public.menu_dish OWNER TO shakun;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO shakun;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: personnel; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.personnel (
    person_id integer NOT NULL,
    name character varying(30) NOT NULL,
    phone integer,
    "position" character varying(30),
    id_restoran integer NOT NULL
);


ALTER TABLE public.personnel OWNER TO shakun;

--
-- Name: personnel_person_id_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.personnel_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnel_person_id_seq OWNER TO shakun;

--
-- Name: personnel_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.personnel_person_id_seq OWNED BY public.personnel.person_id;


--
-- Name: restoran; Type: TABLE; Schema: public; Owner: shakun
--

CREATE TABLE public.restoran (
    id_restoran integer NOT NULL,
    name character varying(20) NOT NULL,
    street character varying(30) NOT NULL,
    id_city integer NOT NULL
);


ALTER TABLE public.restoran OWNER TO shakun;

--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE; Schema: public; Owner: shakun
--

CREATE SEQUENCE public.restoran_id_restoran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_id_restoran_seq OWNER TO shakun;

--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakun
--

ALTER SEQUENCE public.restoran_id_restoran_seq OWNED BY public.restoran.id_restoran;


--
-- Name: city id_city; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.city ALTER COLUMN id_city SET DEFAULT nextval('public.city_id_city_seq'::regclass);


--
-- Name: country id_country; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.country ALTER COLUMN id_country SET DEFAULT nextval('public.country_id_country_seq'::regclass);


--
-- Name: dish id_dish; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.dish ALTER COLUMN id_dish SET DEFAULT nextval('public.dish_id_dish_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: personnel person_id; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.personnel ALTER COLUMN person_id SET DEFAULT nextval('public.personnel_person_id_seq'::regclass);


--
-- Name: restoran id_restoran; Type: DEFAULT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.restoran ALTER COLUMN id_restoran SET DEFAULT nextval('public.restoran_id_restoran_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.city (id_city, name, id_country) FROM stdin;
1	Chernigiv	1
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.country (id_country, name) FROM stdin;
1	Ukrain
\.


--
-- Data for Name: dish; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.dish (id_dish, name, price) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.menu (id_menu, category) FROM stdin;
\.


--
-- Data for Name: menu_dish; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.menu_dish (id_menu, id_dish) FROM stdin;
\.


--
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.personnel (person_id, name, phone, "position", id_restoran) FROM stdin;
1	Nikolay Kidman	937549575	cook	1
\.


--
-- Data for Name: restoran; Type: TABLE DATA; Schema: public; Owner: shakun
--

COPY public.restoran (id_restoran, name, street, id_city) FROM stdin;
1	Hobbit House	Nezavisimosti, 15 str	1
\.


--
-- Name: city_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.city_id_city_seq', 1, false);


--
-- Name: country_id_country_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.country_id_country_seq', 1, false);


--
-- Name: dish_id_dish_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.dish_id_dish_seq', 1, false);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- Name: personnel_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.personnel_person_id_seq', 1, false);


--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE SET; Schema: public; Owner: shakun
--

SELECT pg_catalog.setval('public.restoran_id_restoran_seq', 1, false);


--
-- Name: city city_name_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id_city);


--
-- Name: country country_name_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);


--
-- Name: dish dish_name_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_name_key UNIQUE (name);


--
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id_dish);


--
-- Name: menu menu_category_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_category_key UNIQUE (category);


--
-- Name: menu_dish menu_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_pkey PRIMARY KEY (id_menu, id_dish);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: personnel personnel_name_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_name_key UNIQUE (name);


--
-- Name: personnel personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (person_id);


--
-- Name: restoran restoran_name_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_name_key UNIQUE (name);


--
-- Name: restoran restoran_pkey; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_pkey PRIMARY KEY (id_restoran);


--
-- Name: restoran restoran_street_key; Type: CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_street_key UNIQUE (street);


--
-- Name: city city_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.country(id_country);


--
-- Name: menu_dish menu_dish_id_dish_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES public.dish(id_dish);


--
-- Name: menu_dish menu_dish_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: personnel personnel_id_restoran_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_id_restoran_fkey FOREIGN KEY (id_restoran) REFERENCES public.restoran(id_restoran);


--
-- Name: restoran restoran_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakun
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.city(id_city);


--
-- PostgreSQL database dump complete
--

