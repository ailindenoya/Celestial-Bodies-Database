--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    galaxy_id integer NOT NULL,
    life_possibilities integer NOT NULL,
    distance_from_earth integer NOT NULL,
    has_black_hole boolean,
    description text
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
    planet_id integer NOT NULL,
    name character varying(30),
    rock_quantity integer NOT NULL,
    size integer NOT NULL
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
    star_id integer NOT NULL,
    age_in_light_years integer NOT NULL,
    name character varying(30),
    size integer NOT NULL,
    has_life boolean
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
-- Name: resource; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.resource (
    planet_id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(30),
    amount integer NOT NULL,
    quality integer NOT NULL
);


ALTER TABLE public.resource OWNER TO freecodecamp;

--
-- Name: resource_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.resource_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_resource_id_seq OWNER TO freecodecamp;

--
-- Name: resource_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.resource_resource_id_seq OWNED BY public.resource.resource_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    age_in_light_years integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30),
    size integer NOT NULL,
    radiation numeric(4,1)
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
-- Name: resource resource_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource ALTER COLUMN resource_id SET DEFAULT nextval('public.resource_resource_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Canis Major Dwarf Galaxy', 1, 7, 4892, false, 'Greater Dog');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 10, 0, true, 'Spiral Galaxy');
INSERT INTO public.galaxy VALUES ('Cygnus A', 3, 4, 6197, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Milky Way', 4, 10, 0, true, 'Via Lactea');
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 4, 5080, false, 'Messier 104');
INSERT INTO public.galaxy VALUES ('Virgo', 6, 2, 5444, true, 'Virgo Cluster');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'The Moon', 3345, 20);
INSERT INTO public.moon VALUES (2, 3, 'S-22', 3222, 15);
INSERT INTO public.moon VALUES (3, 3, 'S-500', 2514, 21);
INSERT INTO public.moon VALUES (4, 3, 'K-34', 8945, 36);
INSERT INTO public.moon VALUES (5, 10, 'Block', 589, 65);
INSERT INTO public.moon VALUES (6, 12, 'Fairy', 5, 455);
INSERT INTO public.moon VALUES (7, 12, 'The Glow Of The Night', 4, 899);
INSERT INTO public.moon VALUES (8, 12, 'Thunderbolt', 5, 899);
INSERT INTO public.moon VALUES (9, 11, 'Monkey Island', 68, 22);
INSERT INTO public.moon VALUES (10, 12, 'Banana Moon', 789, 58);
INSERT INTO public.moon VALUES (11, 12, 'Cat Whiskers', 699, 2667);
INSERT INTO public.moon VALUES (12, 12, 'The Dark Emperor', 556, 12);
INSERT INTO public.moon VALUES (13, 12, 'Crayola', 158, 967);
INSERT INTO public.moon VALUES (14, 12, 'Hawaii Tragedy', 695, 11112);
INSERT INTO public.moon VALUES (15, 12, 'Countless Nightmares', 268, 94564);
INSERT INTO public.moon VALUES (16, 10, 'Asgardian Hay', 144, 9456);
INSERT INTO public.moon VALUES (17, 10, 'The Underwaters Of Hell', 256, 2889);
INSERT INTO public.moon VALUES (18, 10, 'Impossible Wishes', 695, 14668);
INSERT INTO public.moon VALUES (19, 10, 'Witches of Regardia', 694, 3664);
INSERT INTO public.moon VALUES (20, 10, 'The Dreams Of Dakota', 365, 3697);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 200, 'Earth', 200, true);
INSERT INTO public.planet VALUES (2, 1, 350, 'Mars', 250, true);
INSERT INTO public.planet VALUES (3, 1, 500, 'Jupiter', 900, false);
INSERT INTO public.planet VALUES (4, 1, 400, 'Venus', 366, false);
INSERT INTO public.planet VALUES (5, 1, 550, 'Mercury', 50, false);
INSERT INTO public.planet VALUES (6, 1, 670, 'Pluto', 5, false);
INSERT INTO public.planet VALUES (7, 1, 690, 'Uranus', 602, false);
INSERT INTO public.planet VALUES (8, 1, 699, 'Saturn', 366, false);
INSERT INTO public.planet VALUES (9, 3, 258, 'G-22', 342, false);
INSERT INTO public.planet VALUES (10, 5, 288, 'Unknown Mystery', 2588, true);
INSERT INTO public.planet VALUES (11, 6, 269, 'Gorilla Planet', 966, true);
INSERT INTO public.planet VALUES (12, 4, 369, 'Mystic Garden', 2556, false);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.resource VALUES (1, 1, 'Metal', 31251, 10);
INSERT INTO public.resource VALUES (3, 2, 'Carbon', 65, 5);
INSERT INTO public.resource VALUES (2, 3, 'Minerals', 623, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 253, 10, 'K-99', 1220, 0.0);
INSERT INTO public.star VALUES (2, 500, 11, 'K-500', 125, 12.5);
INSERT INTO public.star VALUES (2, 650, 12, 'N-22', 234, 3.4);
INSERT INTO public.star VALUES (4, 600, 1, 'Sol', 200, 10.2);
INSERT INTO public.star VALUES (4, 500, 7, 'Sirius', 300, 20.2);
INSERT INTO public.star VALUES (4, 700, 8, 'Canopus', 800, 57.2);
INSERT INTO public.star VALUES (4, 565, 9, 'Arcturus', 300, 33.4);
INSERT INTO public.star VALUES (4, 5000, 5, 'Alpha', 10, 70.2);
INSERT INTO public.star VALUES (4, 400, 6, 'Beta', 250, 6.2);
INSERT INTO public.star VALUES (4, 800, 2, 'Gamma', 50, 50.3);
INSERT INTO public.star VALUES (4, 600, 4, 'Vega', 400, 22.6);
INSERT INTO public.star VALUES (4, 8900, 3, 'Rigel', 900, 99.2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: resource_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.resource_resource_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_id);


--
-- Name: resource resource_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_resource_id_key UNIQUE (resource_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: resource resource_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

