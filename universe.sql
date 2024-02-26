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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types character varying(60),
    is_spherical boolean,
    age_in_million_years numeric(8,3)
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
    name character varying(60) NOT NULL,
    description text,
    planet_id integer,
    is_spherical boolean
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
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    object_type character varying(60),
    distance_to_earth_in_lightyears integer,
    is_artificial boolean,
    name character varying(60) NOT NULL
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.objects_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_types character varying(60),
    number_of_moons integer NOT NULL,
    has_life boolean,
    description text,
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
    name character varying(60) NOT NULL,
    age_in_million_years numeric(8,3),
    galaxy_id integer,
    description text
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
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.objects_object_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', false, 13000.500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 12000.300);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', true, 12000.200);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'Spiral', false, 6000.100);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', false, 20000.400);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Spiral', false, 14000.600);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Luna, or the Moon, is Earth''s only natural satellite. It is the fifth largest satellite in the Solar System and the largest among planetary satellites relative to the size of the planet that it orbits.', 7, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is the larger and innermost moon of Mars, orbiting the planet at a distance of about 9,400 km.', 8, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the smaller and outermost of the two natural satellites of Mars. It is about 23,460 km from Mars.', 8, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Ganymede is the largest moon of Jupiter and in the Solar System. It has a diameter of 5,268 km, making it larger than the planet Mercury.', 5, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa is the smallest of the four Galilean moons orbiting Jupiter and the sixth-closest to the planet. It is primarily made of silicate rock and has a water-ice crust.', 5, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede. It is composed of approximately equal amounts of rock and ices.', 5, true);
INSERT INTO public.moon VALUES (7, 'Io', 'Io is the innermost and third-largest of the four Galilean moons of Jupiter. It is the most volcanically active body in the Solar System.', 5, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'Titan is the largest moon of Saturn and the only natural satellite known to have a dense atmosphere, featuring a complex and active hydrocarbon chemistry.', 6, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System. It has a surface that is heavily cratered with several large impact basins.', 6, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Iapetus is the third-largest moon of Saturn and the eleventh-largest in the Solar System. It is best known for its dramatic two-toned coloration.', 6, true);
INSERT INTO public.moon VALUES (11, 'Dione', 'Dione is the fourth-largest moon of Saturn and is composed primarily of water ice.', 6, true);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Enceladus is the sixth-largest moon of Saturn and is known for its active geysers ejecting plumes of water vapor and icy particles into space.', 6, true);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Mimas is a moon of Saturn which is notable for its large impact crater Herschel, which makes it resemble the Death Star from the Star Wars franchise.', 6, true);
INSERT INTO public.moon VALUES (14, 'Triton', 'Triton is the largest moon of Neptune and the seventh-largest moon in the Solar System. It is unusual in that it is the only large moon in the Solar System with a retrograde orbit, which is opposite to its planet''s rotation.', 9, true);
INSERT INTO public.moon VALUES (15, 'Proteus', 'Proteus is the second-largest moon of Neptune and the largest irregularly shaped satellite in the Solar System.', 9, true);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Nereid is the third-largest moon of Neptune and the second-largest irregular moon in the Solar System.', 9, true);
INSERT INTO public.moon VALUES (17, 'Larissa', 'Larissa is one of the inner moons of Neptune. It was first discovered by Harold J. Reitsema, William B. Hubbard, Larry A. Lebofsky and David J. Tholen on May 24, 1981.', 9, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Miranda, also designated Uranus V, is the smallest and innermost of Uranus''s five round satellites. It was discovered by Gerard Kuiper on February 16, 1948 at McDonald Observatory.', 8, true);
INSERT INTO public.moon VALUES (19, 'Ariel', 'Ariel is the fourth-largest of the 27 known moons of Uranus. Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus.', 8, true);
INSERT INTO public.moon VALUES (20, 'Umbriel', 'Umbriel is a moon of Uranus discovered on October 24, 1851, by William Lassell. It was discovered at the same time as Ariel and named after a character in Alexander Pope''s poem ''The Rape of the Lock''.', 8, true);
INSERT INTO public.moon VALUES (21, 'Titania', 'Titania is the largest of the moons of Uranus and the eighth-largest moon in the Solar System at a diameter of 1,578 kilometers.', 8, true);
INSERT INTO public.moon VALUES (22, 'Oberon', 'Oberon is the outermost major moon of Uranus and is second largest and second most massive of the Uranian moons.', 8, true);
INSERT INTO public.moon VALUES (23, 'Charon', 'Charon, also known as Pluto I, is the largest of the five known natural satellites of the dwarf planet Pluto.', 10, true);
INSERT INTO public.moon VALUES (24, 'Nix', 'Nix is a natural satellite of Pluto, with half the diameter and one-eightieth the mass of Charon.', 10, true);
INSERT INTO public.moon VALUES (25, 'Hydra', 'Hydra is the outermost known moon of Pluto. It was discovered along with Nix in June 2005.', 10, true);
INSERT INTO public.moon VALUES (26, 'Kerberos', 'Kerberos is a natural satellite of Pluto. It was discovered in 2011 and was named after the three-headed dog of Greek mythology.', 10, true);
INSERT INTO public.moon VALUES (27, 'Styx', 'Styx is a small natural satellite of Pluto whose discovery was announced on 11 July 2012.', 10, true);
INSERT INTO public.moon VALUES (28, 'Cordelia', 'Cordelia is one of the smallest moons of Uranus. It was discovered from the images taken by Voyager 2 spacecraft.', 8, true);
INSERT INTO public.moon VALUES (29, 'Ophelia', 'Ophelia is one of the inner moons of Uranus. It was named after the wife of Hamlet in William Shakespeare''s play.', 8, true);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'Hubble Space Telescope', 0, true, 'Hubble Space Telescope');
INSERT INTO public.object VALUES (2, 'International Space Station', 0, true, 'International Space Station');
INSERT INTO public.object VALUES (3, 'Voyager 1', 13, true, 'Voyager 1');
INSERT INTO public.object VALUES (4, 'Voyager 2', 11, true, 'Voyager 2');
INSERT INTO public.object VALUES (5, 'Mars Curiosity Rover', 0, true, 'Mars Curiosity Rover');
INSERT INTO public.object VALUES (6, 'Apollo 11 Lunar Module "Eagle"', 0, true, 'Apollo 11 Lunar Module "Eagle"');
INSERT INTO public.object VALUES (7, 'Apollo 13 Command Module "Odyssey"', 0, true, 'Apollo 13 Command Module "Odyssey"');
INSERT INTO public.object VALUES (8, 'Kepler Space Telescope', 0, true, 'Kepler Space Telescope');
INSERT INTO public.object VALUES (9, 'Hubble Ultra-Deep Field', 13, false, 'Hubble Ultra-Deep Field');
INSERT INTO public.object VALUES (10, 'Crab Nebula', 6500, false, 'Crab Nebula');
INSERT INTO public.object VALUES (11, 'Andromeda Galaxy', 3, false, 'Andromeda Galaxy');
INSERT INTO public.object VALUES (12, 'Great Red Spot (Jupiter)', 0, false, 'Great Red Spot (Jupiter)');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 'Gas Giant', 79, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Gas Giant', 82, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth.', 1);
INSERT INTO public.planet VALUES (3, 'Uranus', 'Ice Giant', 27, false, 'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.', 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 'Ice Giant', 14, false, 'Neptune is the eighth and farthest known planet from the Sun in the Solar System. It is named after the Roman god of the sea.', 1);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Terrestrial', 0, false, 'Mercury is the smallest and innermost planet in the Solar System. It is named after the Roman deity Mercury, the messenger of the gods.', 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Terrestrial', 0, false, 'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty.', 1);
INSERT INTO public.planet VALUES (7, 'Earth', 'Terrestrial', 1, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. It is the densest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (8, 'Mars', 'Terrestrial', 2, false, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Rocky Planet', 0, false, 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Waterworld', 0, false, 'Kepler-22b is an exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22.', 3);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 'Hot Jupiter', 0, false, 'HD 189733 b is an exoplanet orbiting close to its star in the constellation of Vulpecula.', 4);
INSERT INTO public.planet VALUES (12, 'PSR B1257+12 b', 'Pulsar Planet', 0, false, 'PSR B1257+12 b is an exoplanet orbiting a millisecond pulsar located approximately 980 light-years away in the constellation of Virgo.', 5);
INSERT INTO public.planet VALUES (13, 'OGLE-2005-BLG-390Lb', 'Super-Earth', 0, false, 'OGLE-2005-BLG-390Lb is an exoplanet orbiting a star in the constellation of Sagittarius.', 6);
INSERT INTO public.planet VALUES (14, 'Gliese 581 c', 'Rocky Planet', 0, false, 'Gliese 581 c is an exoplanet orbiting within the habitable zone of the red dwarf star Gliese 581.', 7);
INSERT INTO public.planet VALUES (15, '51 Pegasi b', 'Hot Jupiter', 0, false, '51 Pegasi b is an exoplanet orbiting the Sun-like star 51 Pegasi in the constellation of Pegasus.', 8);
INSERT INTO public.planet VALUES (16, 'HD 209458 b', 'Hot Jupiter', 1, false, 'HD 209458 b is an exoplanet orbiting the Sun-like star HD 209458 in the constellation of Pegasus.', 9);
INSERT INTO public.planet VALUES (17, 'WASP-12b', 'Hot Jupiter', 0, false, 'WASP-12b is an exoplanet orbiting the Sun-like star WASP-12 in the constellation of Auriga.', 10);
INSERT INTO public.planet VALUES (18, 'TrES-4', 'Hot Jupiter', 0, false, 'TrES-4 is an exoplanet orbiting the G-type main-sequence star GSC 02620-00648 in the constellation of Hercules.', 11);
INSERT INTO public.planet VALUES (19, 'HD 28185 b', 'Gas Giant', 0, false, 'HD 28185 b is an exoplanet orbiting the orange dwarf star HD 28185 in the constellation of Eridanus.', 12);
INSERT INTO public.planet VALUES (20, 'HAT-P-7b', 'Hot Jupiter', 0, false, 'HAT-P-7b is an exoplanet orbiting the F-type main-sequence star HAT-P-7 in the constellation of Cygnus.', 13);
INSERT INTO public.planet VALUES (21, 'HD 80606 b', 'Gas Giant', 0, false, 'HD 80606 b is an exoplanet orbiting the G-type star HD 80606 in the constellation of Ursa Major.', 14);
INSERT INTO public.planet VALUES (22, 'Tau Boötis b', 'Hot Jupiter', 0, false, 'Tau Boötis b is an exoplanet orbiting the A-type star Tau Boötis in the constellation of Boötes.', 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 225.600, 1, 'Sirius, also known as the Dog Star, is the brightest star in the night sky and is located in the constellation Canis Major.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 4000.000, 2, 'Alpha Centauri A is the brightest component of the Alpha Centauri system and is the closest known star system to the Solar System.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 850.000, 3, 'Betelgeuse is a red supergiant star in the constellation of Orion. It is one of the largest and most luminous stars known.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 6500.000, 2, 'Proxima Centauri is a red dwarf star and is the closest known star to the Sun, located in the Alpha Centauri star system.');
INSERT INTO public.star VALUES (5, 'Vega', 455.000, 1, 'Vega is the brightest star in the constellation of Lyra and is one of the most luminous stars in the nearby vicinity of the Sun.');
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 4000.000, 2, 'Alpha Centauri B is a member of the Alpha Centauri system and is a close companion to Alpha Centauri A.');
INSERT INTO public.star VALUES (7, 'Deneb', 2000.000, 3, 'Deneb is one of the brightest stars in the night sky and is located in the constellation of Cygnus. It is one of the vertices of the Summer Triangle.');
INSERT INTO public.star VALUES (8, 'Arcturus', 7000.000, 1, 'Arcturus is the brightest star in the constellation of Boötes and is the fourth brightest star in the night sky.');
INSERT INTO public.star VALUES (9, 'Rigel', 8.000, 3, 'Rigel is a blue supergiant star in the constellation of Orion and is one of the brightest stars in the sky.');
INSERT INTO public.star VALUES (10, 'Altair', 1000.000, 1, 'Altair is one of the brightest stars in the constellation of Aquila and is one of the vertices of the Summer Triangle.');
INSERT INTO public.star VALUES (11, 'Aldebaran', 625.000, 1, 'Aldebaran is a red giant star in the constellation of Taurus and is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (12, 'Regulus', 1150.000, 1, 'Regulus is the brightest star in the constellation of Leo and is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (13, 'Spica', 750.000, 1, 'Spica is a binary star system in the constellation of Virgo and is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (14, 'Antares', 12000.000, 1, 'Antares is a red supergiant star in the constellation of Scorpius and is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (15, 'Pollux', 730.000, 1, 'Pollux is a giant star in the constellation of Gemini and is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (16, 'Sun', 4600.000, 1, 'The Sun is a main-sequence star and the source of light and heat for the planets in the Solar System.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.objects_object_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


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
-- Name: object objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT objects_pkey PRIMARY KEY (object_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: object unique_object_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT unique_object_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

