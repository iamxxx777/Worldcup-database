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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 189, 190, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 191, 192, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 190, 192, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 189, 191, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 190, 193, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 192, 194, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 191, 195, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 189, 196, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 192, 197, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 194, 198, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 191, 199, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 195, 200, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 190, 201, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 193, 202, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 196, 203, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 189, 204, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 205, 204, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 206, 195, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 204, 206, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 205, 195, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 206, 207, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 204, 191, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 195, 197, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 205, 189, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 195, 208, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 197, 196, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 189, 209, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 205, 210, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 206, 200, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 207, 211, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 204, 198, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 191, 212, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (189, 'France');
INSERT INTO public.teams VALUES (190, 'Croatia');
INSERT INTO public.teams VALUES (191, 'Belgium');
INSERT INTO public.teams VALUES (192, 'England');
INSERT INTO public.teams VALUES (193, 'Russia');
INSERT INTO public.teams VALUES (194, 'Sweden');
INSERT INTO public.teams VALUES (195, 'Brazil');
INSERT INTO public.teams VALUES (196, 'Uruguay');
INSERT INTO public.teams VALUES (197, 'Colombia');
INSERT INTO public.teams VALUES (198, 'Switzerland');
INSERT INTO public.teams VALUES (199, 'Japan');
INSERT INTO public.teams VALUES (200, 'Mexico');
INSERT INTO public.teams VALUES (201, 'Denmark');
INSERT INTO public.teams VALUES (202, 'Spain');
INSERT INTO public.teams VALUES (203, 'Portugal');
INSERT INTO public.teams VALUES (204, 'Argentina');
INSERT INTO public.teams VALUES (205, 'Germany');
INSERT INTO public.teams VALUES (206, 'Netherlands');
INSERT INTO public.teams VALUES (207, 'Costa Rica');
INSERT INTO public.teams VALUES (208, 'Chile');
INSERT INTO public.teams VALUES (209, 'Nigeria');
INSERT INTO public.teams VALUES (210, 'Algeria');
INSERT INTO public.teams VALUES (211, 'Greece');
INSERT INTO public.teams VALUES (212, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 212, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

