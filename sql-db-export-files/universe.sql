--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    size_in_km numeric(10,2) NOT NULL,
    composition character varying(100),
    discovered_by character varying(100),
    discovery_date date
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    galaxy_types character varying(60) NOT NULL,
    radius_in_km integer NOT NULL,
    color character varying(40)
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
    name character varying(60),
    distance_from_earth numeric(5,2),
    moon_type character varying(40),
    age_in_millions_of_years integer NOT NULL,
    planet_id integer
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
    name character varying(60),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    mass_in_kg integer NOT NULL,
    radius_in_km integer NOT NULL,
    star_id integer
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
    name character varying(60),
    description text,
    galaxy_id integer NOT NULL,
    star_type character varying(40)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 413.70, 939.40, 'rocky', 'Giuseppe Piazzi', '1801-01-01');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 414.50, 512.00, 'rocky', 'Heinrich Wilhelm Olbers', '1802-03-28');
INSERT INTO public.asteroid VALUES (3, 'Vesta', 353.40, 525.40, 'rocky', 'Heinrich Wilhelm Olbers', '1807-03-29');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 470.30, 434.00, 'carbonaceous', 'Annibale de Gasparis', '1849-04-12');
INSERT INTO public.asteroid VALUES (5, 'Eros', 218.50, 16.80, 'stony', 'Carl Gustav Witt', '1898-08-13');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Black Eye', 'Spiral', 510, 'Blue-White');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 3, 'Milky Blur');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Unbarred Spiral', 31, 'Bright Nucleus');
INSERT INTO public.galaxy VALUES (5, 'Milk Way', 'Bar Spiral', 475, 'Pure White');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Spiral Galaxy', 300, 'Blue and white hues');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'Spiral Galaxy', 300, 'Bright core with spiral arms');
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', 'Spiral Galaxy', 8500, 'Blue and pink hues');
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Lenticular Galaxy', 480, 'Dark dust lane with a bright core');
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 'Elliptical Galaxy', 6000, 'Yellowish hue');
INSERT INTO public.galaxy VALUES (11, 'Cartwheel Galaxy', 'Ring Galaxy', 750, 'Bright ring with a blue core');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 62.80, 'icy', 45, 3);
INSERT INTO public.moon VALUES (2, 'Titan', 12.18, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (3, 'Ganymede', 6.28, 'rocky', 4500, 3);
INSERT INTO public.moon VALUES (4, 'Callisto', 6.28, 'rocky', 4500, 3);
INSERT INTO public.moon VALUES (5, 'Io', 628.30, 'volcanic', 4500, 3);
INSERT INTO public.moon VALUES (6, 'Enceladus', 12.70, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (7, 'Triton', 43.45, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (8, 'Rhea', 12.70, 'rocky', 4500, 3);
INSERT INTO public.moon VALUES (9, 'Tethys', 12.70, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (10, 'Iapetus', 12.70, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (11, 'Oberon', 28.71, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (12, 'Titania', 28.71, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (13, 'Umbriel', 28.71, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (14, 'Ariel', 28.71, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (15, 'Miranda', 28.71, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (16, 'Phobos', 7.80, 'rocky', 4500, 3);
INSERT INTO public.moon VALUES (17, 'Deimos', 78.00, 'rocky', 4500, 3);
INSERT INTO public.moon VALUES (18, 'Charon', 59.13, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (19, 'Mimas', 12.70, 'icy', 4500, 3);
INSERT INTO public.moon VALUES (20, 'Mismas', 12.70, 'icy', 4500, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 330123, 24397, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 48624, 60518, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 597224, 6371, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 64123, 338, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 18227, 69911, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 56826, 58232, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 86825, 25362, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 11326, 24622, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 13022, 118, 1);
INSERT INTO public.planet VALUES (10, 'Haumea', false, true, 4006, 816, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', false, true, 31, 715, 1);
INSERT INTO public.planet VALUES (12, 'Eris', false, true, 122, 1163, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'Proxima Centauri is the closest known star to the Sun', 5, 'Red Dwarf Star');
INSERT INTO public.star VALUES (2, 'Sirius', 'Sirius is the brightest star in the night sky', 5, 'Main Sequence Star');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Alpha Centauri A is the primary star in the closest star system to the Solar System', 5, 'Main Sequence Star');
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Alpha Centauri B is the secondary star in the closest star system to the Solar System', 5, 'Main Sequence Star');
INSERT INTO public.star VALUES (5, 'Barnard Star', 'Barnard Star is a red dwarf about six light-years away from Earth', 5, 'Red Dwarf Star');
INSERT INTO public.star VALUES (6, 'Wolf 359', 'Wolf 359 is one of the nearest stars to the Solar System', 5, 'Red Dwarf Star');
INSERT INTO public.star VALUES (7, 'Luhman 16A', 'Luhman 16A is part of a binary brown dwarf system', 5, 'Brown Dwarf');
INSERT INTO public.star VALUES (8, 'Luhman 16B', 'Luhman 16B is part of a binary brown dwarf system', 5, 'Brown Dwarf');
INSERT INTO public.star VALUES (9, 'Epsilon Eridani', 'Epsilon Eridani is a star in the constellation Eridanus', 5, 'Main Sequence Star');
INSERT INTO public.star VALUES (10, '61 Cygni A', '61 Cygni A is part of a binary star system in the constellation Cygnus', 5, 'K-type Main Sequence Star');


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

