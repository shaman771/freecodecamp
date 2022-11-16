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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(255) NOT NULL,
    moon_id integer,
    planet_id integer,
    asteroid_id integer NOT NULL,
    diameter character varying(25),
    rotation_period_hrs numeric,
    orbit_period_yrs numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(255) NOT NULL,
    constellation character varying(100),
    distance integer,
    distance_unit character varying(25),
    galaxy_code character varying(25),
    galaxy_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    moon_id integer NOT NULL,
    mass numeric,
    mass_unit character varying(10),
    radius character varying(20),
    radius_unit character varying(10),
    orbital_period numeric
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
    name character varying(255) NOT NULL,
    star_id integer,
    moons smallint,
    earth_radius real,
    orbital_period numeric,
    planet_id integer NOT NULL,
    earth_gravity numeric,
    has_satellites boolean,
    description text,
    inhabitable boolean
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    potential_planets smallint,
    system character varying(25),
    distance real,
    earth_radius real,
    solar_luminosity real
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

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES ('Ceres', NULL, NULL, 1, '965x961x891', 9.074, 4.60);
INSERT INTO public.asteroid VALUES ('Pallas', NULL, NULL, 2, '582x556x500', 7.813, 4.61);
INSERT INTO public.asteroid VALUES ('Juno', NULL, NULL, 3, '234', 7.210, 4.36);
INSERT INTO public.asteroid VALUES ('Vesta', NULL, NULL, 4, '569x555x453', 5.342, 3.63);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Sagittarius', 0, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 'Dorado/Mensa', 160, 'kly', NULL, 2);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 'Tucana', 200, 'kly', 'NGC 292', 3);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'Andromeda', 3, 'Mly', 'M31, NGC 224', 4);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 'Triangulum', 3, 'Mly', 'M33, NGC 598', 5);
INSERT INTO public.galaxy VALUES ('Centaurus A', 'Centaurus', 14, 'Mly', 'NGC 5128', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Io', 7, 1, 893.2, '10e20 kg', '1821.5', 'km', 1.769138);
INSERT INTO public.moon VALUES ('Europa', 7, 2, 480.0, '10e20 kg', '1560.8', 'km', 3.551181);
INSERT INTO public.moon VALUES ('Ganymede', 7, 3, 1481.9, '10e20 kg', '2631.2', 'km', 7.154553);
INSERT INTO public.moon VALUES ('Callisto', 7, 4, 1075.9, '10e20 kg', '2410.3', 'km', 16.689017);
INSERT INTO public.moon VALUES ('Metis', 7, 5, 0.001, '10e20 kg', '30x20x17', 'km', 0.294779);
INSERT INTO public.moon VALUES ('Adrastea', 7, 6, 0.0002, '10e20 kg', '10x8x7', 'km', 0.298260);
INSERT INTO public.moon VALUES ('Amalthea', 7, 7, 0.075, '10e20 kg', '125x73x64', 'km', 0.498179);
INSERT INTO public.moon VALUES ('Thebe', 7, 8, 0.008, '10e20 kg', '58x49x42', 'km', 0.6745);
INSERT INTO public.moon VALUES ('Themisto', 7, 9, NULL, '10e20 kg', '4', 'km', 130.02);
INSERT INTO public.moon VALUES ('Leda', 7, 10, 0.00006, '10e20 kg', '5', 'km', 240.92);
INSERT INTO public.moon VALUES ('Himalia', 7, 11, 0.095, '10e20 kg', '85', 'km', 250.5662);
INSERT INTO public.moon VALUES ('Lysithea', 7, 12, 0.0008, '10e20 kg', '12', 'km', 259.22);
INSERT INTO public.moon VALUES ('Elara', 7, 13, 0.008, '10e20 kg', '40', 'km', 259.6528);
INSERT INTO public.moon VALUES ('Mimas', 8, 14, 0.379, '10e20 kg', '208x197x191', 'km', 0.9424218);
INSERT INTO public.moon VALUES ('Enceladus', 8, 15, 1.08, '10e20 kg', '257x251x248', 'km', 1.370218);
INSERT INTO public.moon VALUES ('Tethys', 8, 16, 6.18, '10e20 kg', '538x528x526', 'km', 1.887802);
INSERT INTO public.moon VALUES ('Dione', 8, 17, 11.0, '10e20 kg', '563x561x560', 'km', 2.736915);
INSERT INTO public.moon VALUES ('Rhea', 8, 18, 23.1, '10e20 kg', '765x763x762', 'km', 4.517500);
INSERT INTO public.moon VALUES ('Titan', 8, 19, 1345.5, '10e20 kg', '2575', 'km', 15.945421);
INSERT INTO public.moon VALUES ('Hyperion', 8, 20, 0.056, '10e20 kg', '180x133x103', 'km', 21.276609);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 5, 0, 0.382465, 88, 3, 0.378, false, 'https://solarsystem.nasa.gov/planets/mercury/overview/', false);
INSERT INTO public.planet VALUES ('Venus', 5, 0, 0.949, 225, 4, 0.907, false, 'https://solarsystem.nasa.gov/planets/venus/overview/', false);
INSERT INTO public.planet VALUES ('Earth', 5, 1, 1, 365, 5, 1, true, 'https://solarsystem.nasa.gov/planets/earth/overview/', true);
INSERT INTO public.planet VALUES ('Mars', 5, 2, 0.532, 687, 6, 0.377, true, 'https://solarsystem.nasa.gov/planets/mars/overview/', false);
INSERT INTO public.planet VALUES ('Jupiter', 5, 80, 11.21, 4328.9, 7, 2.36, true, 'https://solarsystem.nasa.gov/planets/jupiter/overview/', false);
INSERT INTO public.planet VALUES ('Saturn', 5, 83, 9.45, 10585, 8, 0.916, true, 'https://solarsystem.nasa.gov/planets/saturn/overview/', false);
INSERT INTO public.planet VALUES ('Uranus', 5, 27, 4.01, 30550, 9, 0.889, true, 'https://solarsystem.nasa.gov/planets/uranus/overview/', false);
INSERT INTO public.planet VALUES ('Neptune', 5, 14, 3.88, 59495, 10, 1.12, true, 'https://solarsystem.nasa.gov/planets/neptune/overview/', false);
INSERT INTO public.planet VALUES ('Pluto', 5, 5, 0.187, 90155, 11, 0.071, true, 'https://solarsystem.nasa.gov/planets/pluto/overview/', false);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 6, 0, NULL, NULL, 12, NULL, false, NULL, false);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 6, 0, 3.88, NULL, 13, NULL, false, NULL, false);
INSERT INTO public.planet VALUES ('Proxima Centauri d', 6, 0, NULL, NULL, 14, NULL, false, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 5, 8, 'Solar System', 1.581299e-05, 1, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 1, 6, 1, 'Alpha Centauri', 4.244, 0.1542, 5e-05);
INSERT INTO public.star VALUES ('Centauri A', 1, 7, NULL, 'Alpha Centauri', 4.365, 1.223, 1.519);
INSERT INTO public.star VALUES ('Centauri B', 1, 8, NULL, 'Alpha Centauri', 4.37, 0.863, 0.5002);
INSERT INTO public.star VALUES ('Bernard''s Star', 1, 9, 1, 'Ophiuchus', 5.957, 0.196, 0.0035);
INSERT INTO public.star VALUES ('Wolf 359', 1, 10, 2, 'Leo', 7.856, 0.16, 0.0014);
INSERT INTO public.star VALUES ('Lalande 21185', 1, 11, 1, 'Ursa Major', 8.307, 0.393, 0.026);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: asteroid planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_if_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_if_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

