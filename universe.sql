--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: famous_people; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.famous_people (
    famous_people_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.famous_people OWNER TO freecodecamp;

--
-- Name: famous_people_people_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.famous_people_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.famous_people_people_id_seq OWNER TO freecodecamp;

--
-- Name: famous_people_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.famous_people_people_id_seq OWNED BY public.famous_people.famous_people_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer,
    galaxy_types character varying(30),
    has_life boolean,
    description text,
    population_in_humans numeric,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_million_of_years numeric NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    moon_id integer,
    star_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric,
    planet_type text NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric,
    galaxy_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_million_of_years integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: famous_people famous_people_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_people ALTER COLUMN famous_people_id SET DEFAULT nextval('public.famous_people_people_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: famous_people; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.famous_people VALUES (3, 'Guy Ritchie', NULL, NULL);
INSERT INTO public.famous_people VALUES (5, 'Chris Pratt', NULL, 16);
INSERT INTO public.famous_people VALUES (6, 'Chris Pratt', NULL, 16);
INSERT INTO public.famous_people VALUES (7, 'Guy Ritchie', NULL, 16);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie lactée', NULL, 13000, 'S(B)bc I-II', true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Galaxie Andromède', NULL, 10000, 'SA(s)b', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxie de la Roue de Chariot', NULL, 400, 'S pec(Ring) E-S0', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxie du Cigare', NULL, 500, 'Scd? pec Sd I0 S?', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxie-Comète', NULL, 7000, 'Galaxie spirale', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Objet de Hoag', NULL, 3000, 'SA0(r)', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Inconnue', NULL, 123456789, 'Inconnue', true, 'Vraiment, je ne sais pas', 123456789, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 'Moon 1', 2, 361538303746, 136315394000000, 3, 2);
INSERT INTO public.moon VALUES (20, 'Moon 2', 4, 42912754, 7496063921619, 4, 3);
INSERT INTO public.moon VALUES (21, 'Moon 3', 3, 473253017455850, 745231, 5, 2);
INSERT INTO public.moon VALUES (22, 'Moon 4', 5, 3028103, 95630216, 4, 4);
INSERT INTO public.moon VALUES (23, 'Moon 5', 2, 8420112, 1294000000, 1, 2);
INSERT INTO public.moon VALUES (24, 'Moon 6', 3, 251418405, 410475000, 4, 5);
INSERT INTO public.moon VALUES (25, 'Moon 7', 2, 361538303746, 136315394000000, 3, 2);
INSERT INTO public.moon VALUES (26, 'Moon 12', 4, 42912754, 7496063921619, 4, 3);
INSERT INTO public.moon VALUES (27, 'Moon 8', 3, 473253017455850, 745231, 5, 2);
INSERT INTO public.moon VALUES (28, 'Moon 9', 5, 3028103, 95630216, 4, 4);
INSERT INTO public.moon VALUES (29, 'Moon 10', 2, 8420112, 1294000000, 1, 2);
INSERT INTO public.moon VALUES (30, 'Moon 11', 3, 251418405, 410475000, 4, 5);
INSERT INTO public.moon VALUES (31, 'Moon 13', 2, 361538303746, 136315394000000, 3, 2);
INSERT INTO public.moon VALUES (32, 'Moon 14', 4, 42912754, 7496063921619, 4, 3);
INSERT INTO public.moon VALUES (33, 'Moon 15', 3, 473253017455850, 745231, 5, 2);
INSERT INTO public.moon VALUES (34, 'Moon 16', 5, 3028103, 95630216, 4, 4);
INSERT INTO public.moon VALUES (35, 'Moon 17', 2, 8420112, 1294000000, 1, 2);
INSERT INTO public.moon VALUES (36, 'Moon 18', 3, 251418405, 410475000, 4, 5);
INSERT INTO public.moon VALUES (37, 'Moon 18', 5, 430217, 16304429, 1, 3);
INSERT INTO public.moon VALUES (38, 'Moon 19', 5, 430217, 16304429, 1, 3);
INSERT INTO public.moon VALUES (39, 'Moon 20', 5, 430217, 16304429, 1, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, NULL, 1, 'Mercure', 91000000, 'Rocheuse', false, 4600000, 1);
INSERT INTO public.planet VALUES (3, NULL, 1, 'Vénus', 41000000, 'Rocheuse', false, 4600000, 1);
INSERT INTO public.planet VALUES (4, NULL, 6, 'PA-99-N2 b', 254000000, 'Objet', false, 1000, 2);
INSERT INTO public.planet VALUES (5, NULL, 1, 'Mars', 225000000, 'Géante gazeuse', true, 4600000, 1);
INSERT INTO public.planet VALUES (8, NULL, 4, 'Zorath-3', 250000000, 'Géante gazeuse', true, 3200000, 3);
INSERT INTO public.planet VALUES (9, NULL, 6, 'Elyria Prime', 25000000, 'Rocheuse volcanique', false, 1800000, 5);
INSERT INTO public.planet VALUES (10, NULL, 2, 'Nivara K', 32000000000, 'Océanique', true, 4100000, 7);
INSERT INTO public.planet VALUES (11, NULL, 5, 'Drakon V', 28000000, 'Glaceuse', false, 850000, 3);
INSERT INTO public.planet VALUES (12, NULL, 2, 'Thalor-9', 12000000, 'Super-Terre', false, 2950000, 6);
INSERT INTO public.planet VALUES (13, NULL, 3, 'Vixara II', 160000, 'Méthane gazeuse', true, 5600000, 4);
INSERT INTO public.planet VALUES (14, NULL, 1, 'NKP1JB', 4500000, 'Océanique', true, 5420000, 3);
INSERT INTO public.planet VALUES (15, NULL, 2, 'DPALCE', 721000, 'Méthane gazeuse', false, 8362000, 5);
INSERT INTO public.planet VALUES (16, NULL, 1, 'Earth', NULL, 'Belle', true, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soleil', 10000000000000, 1, 5, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 8600000000000000, 7, 257, NULL);
INSERT INTO public.star VALUES (3, 'Eridani', 10500000000000000, 7, 10, NULL);
INSERT INTO public.star VALUES (4, 'Indi', 118000000000000000, 7, 13900000, NULL);
INSERT INTO public.star VALUES (5, 'Ceti', 119000000000000000, 7, 8, NULL);
INSERT INTO public.star VALUES (6, 'Draconis', 18800000000000000, 7, 27, NULL);


--
-- Name: famous_people_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.famous_people_people_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: famous_people famous_people_famous_people_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_people
    ADD CONSTRAINT famous_people_famous_people_id_key UNIQUE (famous_people_id);


--
-- Name: famous_people famous_people_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_people
    ADD CONSTRAINT famous_people_pkey PRIMARY KEY (famous_people_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: famous_people famous_people_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.famous_people
    ADD CONSTRAINT famous_people_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy galaxy_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

