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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.city (
    id_city integer NOT NULL,
    name character varying(50) NOT NULL,
    id_country integer NOT NULL
);


ALTER TABLE public.city OWNER TO admin;

--
-- Name: city_id_city_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.city_id_city_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_city_seq OWNER TO admin;

--
-- Name: city_id_city_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.city_id_city_seq OWNED BY public.city.id_city;


--
-- Name: country; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.country (
    id_country integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.country OWNER TO admin;

--
-- Name: country_id_country_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.country_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_country_seq OWNER TO admin;

--
-- Name: country_id_country_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.country_id_country_seq OWNED BY public.country.id_country;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dishes (
    id_dish integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric
);


ALTER TABLE public.dishes OWNER TO admin;

--
-- Name: dishes_id_dish_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dishes_id_dish_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_dish_seq OWNER TO admin;

--
-- Name: dishes_id_dish_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dishes_id_dish_seq OWNED BY public.dishes.id_dish;


--
-- Name: dishes_menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dishes_menu (
    id_menu integer NOT NULL,
    id_dish integer NOT NULL
);


ALTER TABLE public.dishes_menu OWNER TO admin;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE public.menu OWNER TO admin;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO admin;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: personnel; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personnel (
    id_person integer NOT NULL,
    name character varying(50),
    phone integer,
    "position" character varying(50),
    id_restoran integer NOT NULL
);


ALTER TABLE public.personnel OWNER TO admin;

--
-- Name: personnel_id_person_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.personnel_id_person_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnel_id_person_seq OWNER TO admin;

--
-- Name: personnel_id_person_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.personnel_id_person_seq OWNED BY public.personnel.id_person;


--
-- Name: restoran; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran (
    id_restoran integer NOT NULL,
    name character varying(50),
    street character varying(100) NOT NULL,
    id_city integer NOT NULL,
    id_menu integer NOT NULL
);


ALTER TABLE public.restoran OWNER TO admin;

--
-- Name: restoran_city; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_city (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    id_country_id integer NOT NULL
);


ALTER TABLE public.restoran_city OWNER TO admin;

--
-- Name: restoran_city_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_city_id_seq OWNER TO admin;

--
-- Name: restoran_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_city_id_seq OWNED BY public.restoran_city.id;


--
-- Name: restoran_country; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_country (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.restoran_country OWNER TO admin;

--
-- Name: restoran_country_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_country_id_seq OWNER TO admin;

--
-- Name: restoran_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_country_id_seq OWNED BY public.restoran_country.id;


--
-- Name: restoran_dishes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_dishes (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric(9,2)
);


ALTER TABLE public.restoran_dishes OWNER TO admin;

--
-- Name: restoran_dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_dishes_id_seq OWNER TO admin;

--
-- Name: restoran_dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_dishes_id_seq OWNED BY public.restoran_dishes.id;


--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_id_restoran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_id_restoran_seq OWNER TO admin;

--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_id_restoran_seq OWNED BY public.restoran.id_restoran;


--
-- Name: restoran_menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_menu (
    id integer NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE public.restoran_menu OWNER TO admin;

--
-- Name: restoran_menu_dish; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_menu_dish (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    dishes_id integer NOT NULL
);


ALTER TABLE public.restoran_menu_dish OWNER TO admin;

--
-- Name: restoran_menu_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_menu_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_menu_dish_id_seq OWNER TO admin;

--
-- Name: restoran_menu_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_menu_dish_id_seq OWNED BY public.restoran_menu_dish.id;


--
-- Name: restoran_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_menu_id_seq OWNER TO admin;

--
-- Name: restoran_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_menu_id_seq OWNED BY public.restoran_menu.id;


--
-- Name: restoran_personnel; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_personnel (
    id integer NOT NULL,
    name character varying(50),
    phone integer,
    "position" character varying(50),
    id_restoran_id integer NOT NULL
);


ALTER TABLE public.restoran_personnel OWNER TO admin;

--
-- Name: restoran_personnel_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_personnel_id_seq OWNER TO admin;

--
-- Name: restoran_personnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_personnel_id_seq OWNED BY public.restoran_personnel.id;


--
-- Name: restoran_restoran; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.restoran_restoran (
    id integer NOT NULL,
    name character varying(50),
    street character varying(100) NOT NULL,
    id_city_id integer NOT NULL,
    id_menu_id integer NOT NULL
);


ALTER TABLE public.restoran_restoran OWNER TO admin;

--
-- Name: restoran_restoran_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.restoran_restoran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoran_restoran_id_seq OWNER TO admin;

--
-- Name: restoran_restoran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.restoran_restoran_id_seq OWNED BY public.restoran_restoran.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: city id_city; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city ALTER COLUMN id_city SET DEFAULT nextval('public.city_id_city_seq'::regclass);


--
-- Name: country id_country; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.country ALTER COLUMN id_country SET DEFAULT nextval('public.country_id_country_seq'::regclass);


--
-- Name: dishes id_dish; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id_dish SET DEFAULT nextval('public.dishes_id_dish_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: personnel id_person; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personnel ALTER COLUMN id_person SET DEFAULT nextval('public.personnel_id_person_seq'::regclass);


--
-- Name: restoran id_restoran; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran ALTER COLUMN id_restoran SET DEFAULT nextval('public.restoran_id_restoran_seq'::regclass);


--
-- Name: restoran_city id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_city ALTER COLUMN id SET DEFAULT nextval('public.restoran_city_id_seq'::regclass);


--
-- Name: restoran_country id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_country ALTER COLUMN id SET DEFAULT nextval('public.restoran_country_id_seq'::regclass);


--
-- Name: restoran_dishes id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_dishes ALTER COLUMN id SET DEFAULT nextval('public.restoran_dishes_id_seq'::regclass);


--
-- Name: restoran_menu id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu ALTER COLUMN id SET DEFAULT nextval('public.restoran_menu_id_seq'::regclass);


--
-- Name: restoran_menu_dish id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu_dish ALTER COLUMN id SET DEFAULT nextval('public.restoran_menu_dish_id_seq'::regclass);


--
-- Name: restoran_personnel id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_personnel ALTER COLUMN id SET DEFAULT nextval('public.restoran_personnel_id_seq'::regclass);


--
-- Name: restoran_restoran id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_restoran ALTER COLUMN id SET DEFAULT nextval('public.restoran_restoran_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add city	7	add_city
26	Can change city	7	change_city
27	Can delete city	7	delete_city
28	Can view city	7	view_city
29	Can add country	8	add_country
30	Can change country	8	change_country
31	Can delete country	8	delete_country
32	Can view country	8	view_country
33	Can add dishes	9	add_dishes
34	Can change dishes	9	change_dishes
35	Can delete dishes	9	delete_dishes
36	Can view dishes	9	view_dishes
37	Can add menu	10	add_menu
38	Can change menu	10	change_menu
39	Can delete menu	10	delete_menu
40	Can view menu	10	view_menu
41	Can add restoran	11	add_restoran
42	Can change restoran	11	change_restoran
43	Can delete restoran	11	delete_restoran
44	Can view restoran	11	view_restoran
45	Can add personnel	12	add_personnel
46	Can change personnel	12	change_personnel
47	Can delete personnel	12	delete_personnel
48	Can view personnel	12	view_personnel
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$kS5yrv3VPB2i$2Y6xUbxzxwFfC+sWVN7uYIPHg8SyvXmg6ro9K4JcQRE=	2020-06-03 10:27:14.93037+03	t	shakun			shakun@shakun.com	t	t	2020-06-03 10:27:03.859374+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.city (id_city, name, id_country) FROM stdin;
1	Chernigov	1
2	Lviv	1
3	Chernivci	1
4	Harkov	1
5	Kiev	1
6	Varshava	2
7	Oxford	3
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.country (id_country, name) FROM stdin;
1	Ukrain
2	Poland
3	England
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dishes (id_dish, name, price) FROM stdin;
1	Tugoi Pricep	134
2	Философия урбанистического безвремения	134
3	Тугой прицеп	105
4	Яма в шоколаде	123
5	Жареный Нуминорский цыпленок	154
6	Лосось из Шира	122
7	Топор Дунадайна	179
8	 Нуминорская шлюха в теплом соусе	999
9	Шоколадная куча	123
\.


--
-- Data for Name: dishes_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dishes_menu (id_menu, id_dish) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	restoran	city
8	restoran	country
9	restoran	dishes
10	restoran	menu
11	restoran	restoran
12	restoran	personnel
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-06-03 10:25:02.802735+03
2	auth	0001_initial	2020-06-03 10:25:02.867456+03
3	admin	0001_initial	2020-06-03 10:25:02.952948+03
4	admin	0002_logentry_remove_auto_add	2020-06-03 10:25:02.976322+03
5	admin	0003_logentry_add_action_flag_choices	2020-06-03 10:25:02.990132+03
6	contenttypes	0002_remove_content_type_name	2020-06-03 10:25:03.009809+03
7	auth	0002_alter_permission_name_max_length	2020-06-03 10:25:03.017022+03
8	auth	0003_alter_user_email_max_length	2020-06-03 10:25:03.032137+03
9	auth	0004_alter_user_username_opts	2020-06-03 10:25:03.042405+03
10	auth	0005_alter_user_last_login_null	2020-06-03 10:25:03.055146+03
11	auth	0006_require_contenttypes_0002	2020-06-03 10:25:03.05906+03
12	auth	0007_alter_validators_add_error_messages	2020-06-03 10:25:03.072803+03
13	auth	0008_alter_user_username_max_length	2020-06-03 10:25:03.09255+03
14	auth	0009_alter_user_last_name_max_length	2020-06-03 10:25:03.10681+03
15	auth	0010_alter_group_name_max_length	2020-06-03 10:25:03.122209+03
16	auth	0011_update_proxy_permissions	2020-06-03 10:25:03.132195+03
17	restoran	0001_initial	2020-06-03 10:25:03.213466+03
18	sessions	0001_initial	2020-06-03 10:25:03.274053+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
g8pexmwg24ceumjll5femdwh7wrso75h	MzcwNjI0MmVmYTE4MTVmOWQxZjRjMTdmY2QyMjU4NTViZDZkODM4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NDNkZjhiOGJjZjZiOGUwNTA1N2Q4NjlmYTM2YjZmNGYzZjZhZDM5In0=	2020-06-17 10:27:14.933605+03
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.menu (id_menu, category) FROM stdin;
1	Summer
2	Winter
3	Fall
4	Spring
\.


--
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personnel (id_person, name, phone, "position", id_restoran) FROM stdin;
1	Beggins Bilbo	634855	Повар	1
2	Аристарх Вениаминович	65439	Официант	1
3	Прицепенко Дмитрий	456439	Официант	1
\.


--
-- Data for Name: restoran; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran (id_restoran, name, street, id_city, id_menu) FROM stdin;
1	HobbitHouse	Pobedi, 15 str	1	1
2	HobbtHouse	Chernigivska, 20 str	1	1
3	HobbtHouse	Mikoli Boguna, 125 str	2	1
4	BodkaBur	Petra Bogoluba, 17 str	2	1
5	BodkaBur	Petra Kojeduba, 117 str	3	1
6	HobbitHouse	Petra Koncheduba, 237 str	5	1
7	Punk Revolution	Nezalegnosti, 2 str	1	1
8	Punk Revolution	Purgenovskay, 13 str	3	1
\.


--
-- Data for Name: restoran_city; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_city (id, name, id_country_id) FROM stdin;
\.


--
-- Data for Name: restoran_country; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_country (id, name) FROM stdin;
1	Ukrain
\.


--
-- Data for Name: restoran_dishes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_dishes (id, name, price) FROM stdin;
\.


--
-- Data for Name: restoran_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_menu (id, category) FROM stdin;
\.


--
-- Data for Name: restoran_menu_dish; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_menu_dish (id, menu_id, dishes_id) FROM stdin;
\.


--
-- Data for Name: restoran_personnel; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_personnel (id, name, phone, "position", id_restoran_id) FROM stdin;
\.


--
-- Data for Name: restoran_restoran; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.restoran_restoran (id, name, street, id_city_id, id_menu_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: city_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.city_id_city_seq', 1, false);


--
-- Name: country_id_country_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.country_id_country_seq', 1, false);


--
-- Name: dishes_id_dish_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dishes_id_dish_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- Name: personnel_id_person_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personnel_id_person_seq', 1, false);


--
-- Name: restoran_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_city_id_seq', 1, false);


--
-- Name: restoran_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_country_id_seq', 1, true);


--
-- Name: restoran_dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_dishes_id_seq', 1, false);


--
-- Name: restoran_id_restoran_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_id_restoran_seq', 1, false);


--
-- Name: restoran_menu_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_menu_dish_id_seq', 1, false);


--
-- Name: restoran_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_menu_id_seq', 1, false);


--
-- Name: restoran_personnel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_personnel_id_seq', 1, false);


--
-- Name: restoran_restoran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.restoran_restoran_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: city city_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id_city);


--
-- Name: country country_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);


--
-- Name: dishes dishes_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_name_key UNIQUE (name);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id_dish);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: menu menu_category_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_category_key UNIQUE (category);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: personnel personnel_phone_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_phone_key UNIQUE (phone);


--
-- Name: personnel personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (id_person);


--
-- Name: restoran_city restoran_city_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_city
    ADD CONSTRAINT restoran_city_name_key UNIQUE (name);


--
-- Name: restoran_city restoran_city_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_city
    ADD CONSTRAINT restoran_city_pkey PRIMARY KEY (id);


--
-- Name: restoran_country restoran_country_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_country
    ADD CONSTRAINT restoran_country_name_key UNIQUE (name);


--
-- Name: restoran_country restoran_country_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_country
    ADD CONSTRAINT restoran_country_pkey PRIMARY KEY (id);


--
-- Name: restoran_dishes restoran_dishes_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_dishes
    ADD CONSTRAINT restoran_dishes_name_key UNIQUE (name);


--
-- Name: restoran_dishes restoran_dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_dishes
    ADD CONSTRAINT restoran_dishes_pkey PRIMARY KEY (id);


--
-- Name: restoran_menu restoran_menu_category_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu
    ADD CONSTRAINT restoran_menu_category_key UNIQUE (category);


--
-- Name: restoran_menu_dish restoran_menu_dish_menu_id_dishes_id_dca18986_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu_dish
    ADD CONSTRAINT restoran_menu_dish_menu_id_dishes_id_dca18986_uniq UNIQUE (menu_id, dishes_id);


--
-- Name: restoran_menu_dish restoran_menu_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu_dish
    ADD CONSTRAINT restoran_menu_dish_pkey PRIMARY KEY (id);


--
-- Name: restoran_menu restoran_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu
    ADD CONSTRAINT restoran_menu_pkey PRIMARY KEY (id);


--
-- Name: restoran_personnel restoran_personnel_phone_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_personnel
    ADD CONSTRAINT restoran_personnel_phone_key UNIQUE (phone);


--
-- Name: restoran_personnel restoran_personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_personnel
    ADD CONSTRAINT restoran_personnel_pkey PRIMARY KEY (id);


--
-- Name: restoran restoran_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_pkey PRIMARY KEY (id_restoran);


--
-- Name: restoran_restoran restoran_restoran_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_restoran
    ADD CONSTRAINT restoran_restoran_pkey PRIMARY KEY (id);


--
-- Name: restoran_restoran restoran_restoran_street_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_restoran
    ADD CONSTRAINT restoran_restoran_street_key UNIQUE (street);


--
-- Name: restoran restoran_street_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_street_key UNIQUE (street);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: restoran_city_id_country_id_7d423388; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_city_id_country_id_7d423388 ON public.restoran_city USING btree (id_country_id);


--
-- Name: restoran_city_name_f814301b_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_city_name_f814301b_like ON public.restoran_city USING btree (name varchar_pattern_ops);


--
-- Name: restoran_country_name_60580cba_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_country_name_60580cba_like ON public.restoran_country USING btree (name varchar_pattern_ops);


--
-- Name: restoran_dishes_name_b66fcdd8_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_dishes_name_b66fcdd8_like ON public.restoran_dishes USING btree (name varchar_pattern_ops);


--
-- Name: restoran_menu_category_aa22c4f2_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_menu_category_aa22c4f2_like ON public.restoran_menu USING btree (category varchar_pattern_ops);


--
-- Name: restoran_menu_dish_dishes_id_36df372f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_menu_dish_dishes_id_36df372f ON public.restoran_menu_dish USING btree (dishes_id);


--
-- Name: restoran_menu_dish_menu_id_edea5709; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_menu_dish_menu_id_edea5709 ON public.restoran_menu_dish USING btree (menu_id);


--
-- Name: restoran_personnel_id_restoran_id_ee03c334; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_personnel_id_restoran_id_ee03c334 ON public.restoran_personnel USING btree (id_restoran_id);


--
-- Name: restoran_restoran_id_city_id_48e6da73; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_restoran_id_city_id_48e6da73 ON public.restoran_restoran USING btree (id_city_id);


--
-- Name: restoran_restoran_id_menu_id_64055918; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_restoran_id_menu_id_64055918 ON public.restoran_restoran USING btree (id_menu_id);


--
-- Name: restoran_restoran_street_4ca376e1_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX restoran_restoran_street_4ca376e1_like ON public.restoran_restoran USING btree (street varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city city_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.country(id_country);


--
-- Name: dishes_menu dishes_manu_id_dish_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dishes_menu
    ADD CONSTRAINT dishes_manu_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES public.dishes(id_dish);


--
-- Name: dishes_menu dishes_manu_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dishes_menu
    ADD CONSTRAINT dishes_manu_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personnel personnel_id_restoran_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_id_restoran_fkey FOREIGN KEY (id_restoran) REFERENCES public.restoran(id_restoran);


--
-- Name: restoran_city restoran_city_id_country_id_7d423388_fk_restoran_country_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_city
    ADD CONSTRAINT restoran_city_id_country_id_7d423388_fk_restoran_country_id FOREIGN KEY (id_country_id) REFERENCES public.restoran_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restoran restoran_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.city(id_city);


--
-- Name: restoran restoran_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran
    ADD CONSTRAINT restoran_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: restoran_menu_dish restoran_menu_dish_dishes_id_36df372f_fk_restoran_dishes_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu_dish
    ADD CONSTRAINT restoran_menu_dish_dishes_id_36df372f_fk_restoran_dishes_id FOREIGN KEY (dishes_id) REFERENCES public.restoran_dishes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restoran_menu_dish restoran_menu_dish_menu_id_edea5709_fk_restoran_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_menu_dish
    ADD CONSTRAINT restoran_menu_dish_menu_id_edea5709_fk_restoran_menu_id FOREIGN KEY (menu_id) REFERENCES public.restoran_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restoran_personnel restoran_personnel_id_restoran_id_ee03c334_fk_restoran_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_personnel
    ADD CONSTRAINT restoran_personnel_id_restoran_id_ee03c334_fk_restoran_ FOREIGN KEY (id_restoran_id) REFERENCES public.restoran_restoran(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restoran_restoran restoran_restoran_id_city_id_48e6da73_fk_restoran_city_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_restoran
    ADD CONSTRAINT restoran_restoran_id_city_id_48e6da73_fk_restoran_city_id FOREIGN KEY (id_city_id) REFERENCES public.restoran_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restoran_restoran restoran_restoran_id_menu_id_64055918_fk_restoran_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.restoran_restoran
    ADD CONSTRAINT restoran_restoran_id_menu_id_64055918_fk_restoran_menu_id FOREIGN KEY (id_menu_id) REFERENCES public.restoran_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

