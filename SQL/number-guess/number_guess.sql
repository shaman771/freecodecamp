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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    attempts integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (334, 443, 613);
INSERT INTO public.games VALUES (335, 443, 716);
INSERT INTO public.games VALUES (336, 444, 91);
INSERT INTO public.games VALUES (337, 444, 409);
INSERT INTO public.games VALUES (338, 443, 195);
INSERT INTO public.games VALUES (339, 443, 684);
INSERT INTO public.games VALUES (340, 443, 888);
INSERT INTO public.games VALUES (341, 445, 184);
INSERT INTO public.games VALUES (342, 445, 781);
INSERT INTO public.games VALUES (343, 446, 443);
INSERT INTO public.games VALUES (344, 446, 280);
INSERT INTO public.games VALUES (345, 445, 286);
INSERT INTO public.games VALUES (346, 445, 749);
INSERT INTO public.games VALUES (347, 445, 526);
INSERT INTO public.games VALUES (348, 447, 780);
INSERT INTO public.games VALUES (349, 447, 224);
INSERT INTO public.games VALUES (350, 448, 768);
INSERT INTO public.games VALUES (351, 448, 203);
INSERT INTO public.games VALUES (352, 447, 370);
INSERT INTO public.games VALUES (353, 447, 833);
INSERT INTO public.games VALUES (354, 447, 270);
INSERT INTO public.games VALUES (355, 449, 755);
INSERT INTO public.games VALUES (356, 449, 758);
INSERT INTO public.games VALUES (357, 450, 152);
INSERT INTO public.games VALUES (358, 450, 552);
INSERT INTO public.games VALUES (359, 449, 481);
INSERT INTO public.games VALUES (360, 449, 614);
INSERT INTO public.games VALUES (361, 449, 515);
INSERT INTO public.games VALUES (362, 451, 397);
INSERT INTO public.games VALUES (363, 451, 841);
INSERT INTO public.games VALUES (364, 452, 826);
INSERT INTO public.games VALUES (365, 452, 905);
INSERT INTO public.games VALUES (366, 451, 141);
INSERT INTO public.games VALUES (367, 451, 68);
INSERT INTO public.games VALUES (368, 451, 689);
INSERT INTO public.games VALUES (369, 453, 12);
INSERT INTO public.games VALUES (370, 453, 686);
INSERT INTO public.games VALUES (371, 454, 557);
INSERT INTO public.games VALUES (372, 454, 191);
INSERT INTO public.games VALUES (373, 453, 230);
INSERT INTO public.games VALUES (374, 453, 957);
INSERT INTO public.games VALUES (375, 453, 160);
INSERT INTO public.games VALUES (376, 455, 118);
INSERT INTO public.games VALUES (377, 455, 738);
INSERT INTO public.games VALUES (378, 456, 823);
INSERT INTO public.games VALUES (379, 456, 691);
INSERT INTO public.games VALUES (380, 455, 146);
INSERT INTO public.games VALUES (381, 455, 772);
INSERT INTO public.games VALUES (382, 455, 537);
INSERT INTO public.games VALUES (383, 457, 634);
INSERT INTO public.games VALUES (384, 457, 397);
INSERT INTO public.games VALUES (385, 458, 547);
INSERT INTO public.games VALUES (386, 458, 578);
INSERT INTO public.games VALUES (387, 457, 22);
INSERT INTO public.games VALUES (388, 457, 706);
INSERT INTO public.games VALUES (389, 457, 537);
INSERT INTO public.games VALUES (390, 459, 189);
INSERT INTO public.games VALUES (391, 459, 532);
INSERT INTO public.games VALUES (392, 460, 371);
INSERT INTO public.games VALUES (393, 460, 998);
INSERT INTO public.games VALUES (394, 459, 826);
INSERT INTO public.games VALUES (395, 459, 698);
INSERT INTO public.games VALUES (396, 459, 987);
INSERT INTO public.games VALUES (397, 461, 232);
INSERT INTO public.games VALUES (398, 461, 973);
INSERT INTO public.games VALUES (399, 462, 359);
INSERT INTO public.games VALUES (400, 462, 37);
INSERT INTO public.games VALUES (401, 461, 134);
INSERT INTO public.games VALUES (402, 461, 784);
INSERT INTO public.games VALUES (403, 461, 767);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (420, 'user_1669122467061');
INSERT INTO public.users VALUES (421, 'user_1669122842821');
INSERT INTO public.users VALUES (422, 'user_1669122842821');
INSERT INTO public.users VALUES (423, 'user_1669122842820');
INSERT INTO public.users VALUES (424, 'user_1669122842820');
INSERT INTO public.users VALUES (425, 'user_1669122842821');
INSERT INTO public.users VALUES (426, 'user_1669122842821');
INSERT INTO public.users VALUES (427, 'user_1669122842821');
INSERT INTO public.users VALUES (428, 'user_1669122882927');
INSERT INTO public.users VALUES (429, 'user_1669122882927');
INSERT INTO public.users VALUES (430, 'user_1669122882926');
INSERT INTO public.users VALUES (431, 'user_1669122882926');
INSERT INTO public.users VALUES (432, 'user_1669122882927');
INSERT INTO public.users VALUES (433, 'user_1669122882927');
INSERT INTO public.users VALUES (434, 'user_1669122882927');
INSERT INTO public.users VALUES (435, 'user_1669123080731');
INSERT INTO public.users VALUES (436, 'user_1669123080730');
INSERT INTO public.users VALUES (437, 'user_1669123110791');
INSERT INTO public.users VALUES (438, 'user_1669123110790');
INSERT INTO public.users VALUES (439, 'user_1669123624269');
INSERT INTO public.users VALUES (440, 'user_1669123624268');
INSERT INTO public.users VALUES (441, 'user_1669123688315');
INSERT INTO public.users VALUES (442, 'user_1669123688314');
INSERT INTO public.users VALUES (443, 'user_1669123910776');
INSERT INTO public.users VALUES (444, 'user_1669123910775');
INSERT INTO public.users VALUES (445, 'user_1669124524281');
INSERT INTO public.users VALUES (446, 'user_1669124524280');
INSERT INTO public.users VALUES (447, 'user_1669124701643');
INSERT INTO public.users VALUES (448, 'user_1669124701642');
INSERT INTO public.users VALUES (449, 'user_1669124739248');
INSERT INTO public.users VALUES (450, 'user_1669124739247');
INSERT INTO public.users VALUES (451, 'user_1669124762685');
INSERT INTO public.users VALUES (452, 'user_1669124762684');
INSERT INTO public.users VALUES (453, 'user_1669124799039');
INSERT INTO public.users VALUES (454, 'user_1669124799038');
INSERT INTO public.users VALUES (455, 'user_1669124830442');
INSERT INTO public.users VALUES (456, 'user_1669124830441');
INSERT INTO public.users VALUES (457, 'user_1669124851684');
INSERT INTO public.users VALUES (458, 'user_1669124851683');
INSERT INTO public.users VALUES (459, 'user_1669124864632');
INSERT INTO public.users VALUES (460, 'user_1669124864631');
INSERT INTO public.users VALUES (461, 'user_1669124911015');
INSERT INTO public.users VALUES (462, 'user_1669124911014');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 403, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 462, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

