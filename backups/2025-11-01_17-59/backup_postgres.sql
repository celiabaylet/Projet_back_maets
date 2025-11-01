--
-- PostgreSQL database dump
--

\restrict Yh6PlPtAJKA8oVyHYOn1XwanZFZ37mI6m2HDlfqxz3qzeNBeRlSWgRz6eBFPihO

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

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
-- Name: game; Type: TABLE; Schema: public; Owner: maets
--

CREATE TABLE public.game (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    "releaseDate" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.game OWNER TO maets;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: maets
--

CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO maets;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maets
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: maets
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO maets;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: maets
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO maets;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maets
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: maets
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO maets;

--
-- Name: user_game; Type: TABLE; Schema: public; Owner: maets
--

CREATE TABLE public.user_game (
    "userId" integer NOT NULL,
    "gameId" integer NOT NULL,
    "addedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.user_game OWNER TO maets;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: maets
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO maets;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maets
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: maets
--

CREATE TABLE public.user_role (
    id integer NOT NULL,
    "UserId" integer,
    "RoleId" integer,
    "assignedAt" timestamp with time zone
);


ALTER TABLE public.user_role OWNER TO maets;

--
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: maets
--

CREATE SEQUENCE public.user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_id_seq OWNER TO maets;

--
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maets
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- Name: game id; Type: DEFAULT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_role id; Type: DEFAULT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: maets
--

COPY public.game (id, title, description, "releaseDate", "createdAt", "updatedAt") FROM stdin;
1	testupdate	resumé	2005-02-10 00:00:00+00	2025-10-29 19:49:59.006+00	2025-10-30 21:35:47.926+00
3	test2	resuméeeeeeeeeeeeeeeeeeeeeeeeeee	2005-02-11 00:00:00+00	2025-10-31 17:40:18.527+00	2025-10-31 17:40:18.527+00
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: maets
--

COPY public.role (id, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: maets
--

COPY public."user" (id, username, email, password, "createdAt", "updatedAt") FROM stdin;
2	test2	test2@gmail.com	$2b$10$dZ0qnA0BIM3Kln8al4sG6eJ.tyv0zu2GRjZss2GX57ZmoYJSVw8.y	2025-10-31 18:02:38.472+00	2025-10-31 18:02:38.472+00
1	testmodif	test@gmail.com	$2b$10$Lr8pSIepN0aVEni8BbtCYu75jHp24h2Ut1.TAsM28ZBP/yzAarmbK	2025-10-29 18:46:18.284+00	2025-11-01 08:32:13.152+00
\.


--
-- Data for Name: user_game; Type: TABLE DATA; Schema: public; Owner: maets
--

COPY public.user_game ("userId", "gameId", "addedAt") FROM stdin;
1	1	2025-10-31 20:10:41.011+00
2	1	2025-11-01 14:36:42.194+00
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: maets
--

COPY public.user_role (id, "UserId", "RoleId", "assignedAt") FROM stdin;
\.


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maets
--

SELECT pg_catalog.setval('public.game_id_seq', 4, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maets
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maets
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maets
--

SELECT pg_catalog.setval('public.user_role_id_seq', 1, false);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role role_name_key1; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key1 UNIQUE (name);


--
-- Name: role role_name_key10; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key10 UNIQUE (name);


--
-- Name: role role_name_key11; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key11 UNIQUE (name);


--
-- Name: role role_name_key12; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key12 UNIQUE (name);


--
-- Name: role role_name_key13; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key13 UNIQUE (name);


--
-- Name: role role_name_key14; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key14 UNIQUE (name);


--
-- Name: role role_name_key15; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key15 UNIQUE (name);


--
-- Name: role role_name_key16; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key16 UNIQUE (name);


--
-- Name: role role_name_key17; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key17 UNIQUE (name);


--
-- Name: role role_name_key18; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key18 UNIQUE (name);


--
-- Name: role role_name_key19; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key19 UNIQUE (name);


--
-- Name: role role_name_key2; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key2 UNIQUE (name);


--
-- Name: role role_name_key20; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key20 UNIQUE (name);


--
-- Name: role role_name_key21; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key21 UNIQUE (name);


--
-- Name: role role_name_key22; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key22 UNIQUE (name);


--
-- Name: role role_name_key23; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key23 UNIQUE (name);


--
-- Name: role role_name_key24; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key24 UNIQUE (name);


--
-- Name: role role_name_key25; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key25 UNIQUE (name);


--
-- Name: role role_name_key26; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key26 UNIQUE (name);


--
-- Name: role role_name_key27; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key27 UNIQUE (name);


--
-- Name: role role_name_key28; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key28 UNIQUE (name);


--
-- Name: role role_name_key29; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key29 UNIQUE (name);


--
-- Name: role role_name_key3; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key3 UNIQUE (name);


--
-- Name: role role_name_key30; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key30 UNIQUE (name);


--
-- Name: role role_name_key31; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key31 UNIQUE (name);


--
-- Name: role role_name_key32; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key32 UNIQUE (name);


--
-- Name: role role_name_key33; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key33 UNIQUE (name);


--
-- Name: role role_name_key34; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key34 UNIQUE (name);


--
-- Name: role role_name_key35; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key35 UNIQUE (name);


--
-- Name: role role_name_key36; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key36 UNIQUE (name);


--
-- Name: role role_name_key37; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key37 UNIQUE (name);


--
-- Name: role role_name_key38; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key38 UNIQUE (name);


--
-- Name: role role_name_key39; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key39 UNIQUE (name);


--
-- Name: role role_name_key4; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key4 UNIQUE (name);


--
-- Name: role role_name_key40; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key40 UNIQUE (name);


--
-- Name: role role_name_key41; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key41 UNIQUE (name);


--
-- Name: role role_name_key42; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key42 UNIQUE (name);


--
-- Name: role role_name_key43; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key43 UNIQUE (name);


--
-- Name: role role_name_key44; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key44 UNIQUE (name);


--
-- Name: role role_name_key45; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key45 UNIQUE (name);


--
-- Name: role role_name_key46; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key46 UNIQUE (name);


--
-- Name: role role_name_key47; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key47 UNIQUE (name);


--
-- Name: role role_name_key48; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key48 UNIQUE (name);


--
-- Name: role role_name_key49; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key49 UNIQUE (name);


--
-- Name: role role_name_key5; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key5 UNIQUE (name);


--
-- Name: role role_name_key50; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key50 UNIQUE (name);


--
-- Name: role role_name_key51; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key51 UNIQUE (name);


--
-- Name: role role_name_key52; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key52 UNIQUE (name);


--
-- Name: role role_name_key53; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key53 UNIQUE (name);


--
-- Name: role role_name_key54; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key54 UNIQUE (name);


--
-- Name: role role_name_key55; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key55 UNIQUE (name);


--
-- Name: role role_name_key56; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key56 UNIQUE (name);


--
-- Name: role role_name_key57; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key57 UNIQUE (name);


--
-- Name: role role_name_key58; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key58 UNIQUE (name);


--
-- Name: role role_name_key59; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key59 UNIQUE (name);


--
-- Name: role role_name_key6; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key6 UNIQUE (name);


--
-- Name: role role_name_key60; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key60 UNIQUE (name);


--
-- Name: role role_name_key61; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key61 UNIQUE (name);


--
-- Name: role role_name_key62; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key62 UNIQUE (name);


--
-- Name: role role_name_key63; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key63 UNIQUE (name);


--
-- Name: role role_name_key64; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key64 UNIQUE (name);


--
-- Name: role role_name_key65; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key65 UNIQUE (name);


--
-- Name: role role_name_key66; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key66 UNIQUE (name);


--
-- Name: role role_name_key67; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key67 UNIQUE (name);


--
-- Name: role role_name_key68; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key68 UNIQUE (name);


--
-- Name: role role_name_key69; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key69 UNIQUE (name);


--
-- Name: role role_name_key7; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key7 UNIQUE (name);


--
-- Name: role role_name_key70; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key70 UNIQUE (name);


--
-- Name: role role_name_key71; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key71 UNIQUE (name);


--
-- Name: role role_name_key72; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key72 UNIQUE (name);


--
-- Name: role role_name_key73; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key73 UNIQUE (name);


--
-- Name: role role_name_key74; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key74 UNIQUE (name);


--
-- Name: role role_name_key75; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key75 UNIQUE (name);


--
-- Name: role role_name_key76; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key76 UNIQUE (name);


--
-- Name: role role_name_key77; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key77 UNIQUE (name);


--
-- Name: role role_name_key78; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key78 UNIQUE (name);


--
-- Name: role role_name_key79; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key79 UNIQUE (name);


--
-- Name: role role_name_key8; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key8 UNIQUE (name);


--
-- Name: role role_name_key80; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key80 UNIQUE (name);


--
-- Name: role role_name_key81; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key81 UNIQUE (name);


--
-- Name: role role_name_key82; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key82 UNIQUE (name);


--
-- Name: role role_name_key83; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key83 UNIQUE (name);


--
-- Name: role role_name_key84; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key84 UNIQUE (name);


--
-- Name: role role_name_key85; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key85 UNIQUE (name);


--
-- Name: role role_name_key86; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key86 UNIQUE (name);


--
-- Name: role role_name_key87; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key87 UNIQUE (name);


--
-- Name: role role_name_key88; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key88 UNIQUE (name);


--
-- Name: role role_name_key89; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key89 UNIQUE (name);


--
-- Name: role role_name_key9; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key9 UNIQUE (name);


--
-- Name: role role_name_key90; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key90 UNIQUE (name);


--
-- Name: role role_name_key91; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key91 UNIQUE (name);


--
-- Name: role role_name_key92; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key92 UNIQUE (name);


--
-- Name: role role_name_key93; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key93 UNIQUE (name);


--
-- Name: role role_name_key94; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key94 UNIQUE (name);


--
-- Name: role role_name_key95; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key95 UNIQUE (name);


--
-- Name: role role_name_key96; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key96 UNIQUE (name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_email_key1; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key1 UNIQUE (email);


--
-- Name: user user_email_key10; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key10 UNIQUE (email);


--
-- Name: user user_email_key11; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key11 UNIQUE (email);


--
-- Name: user user_email_key12; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key12 UNIQUE (email);


--
-- Name: user user_email_key13; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key13 UNIQUE (email);


--
-- Name: user user_email_key14; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key14 UNIQUE (email);


--
-- Name: user user_email_key15; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key15 UNIQUE (email);


--
-- Name: user user_email_key16; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key16 UNIQUE (email);


--
-- Name: user user_email_key17; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key17 UNIQUE (email);


--
-- Name: user user_email_key18; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key18 UNIQUE (email);


--
-- Name: user user_email_key19; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key19 UNIQUE (email);


--
-- Name: user user_email_key2; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key2 UNIQUE (email);


--
-- Name: user user_email_key20; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key20 UNIQUE (email);


--
-- Name: user user_email_key21; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key21 UNIQUE (email);


--
-- Name: user user_email_key22; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key22 UNIQUE (email);


--
-- Name: user user_email_key23; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key23 UNIQUE (email);


--
-- Name: user user_email_key24; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key24 UNIQUE (email);


--
-- Name: user user_email_key25; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key25 UNIQUE (email);


--
-- Name: user user_email_key26; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key26 UNIQUE (email);


--
-- Name: user user_email_key27; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key27 UNIQUE (email);


--
-- Name: user user_email_key28; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key28 UNIQUE (email);


--
-- Name: user user_email_key29; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key29 UNIQUE (email);


--
-- Name: user user_email_key3; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key3 UNIQUE (email);


--
-- Name: user user_email_key30; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key30 UNIQUE (email);


--
-- Name: user user_email_key31; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key31 UNIQUE (email);


--
-- Name: user user_email_key32; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key32 UNIQUE (email);


--
-- Name: user user_email_key33; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key33 UNIQUE (email);


--
-- Name: user user_email_key34; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key34 UNIQUE (email);


--
-- Name: user user_email_key35; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key35 UNIQUE (email);


--
-- Name: user user_email_key36; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key36 UNIQUE (email);


--
-- Name: user user_email_key37; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key37 UNIQUE (email);


--
-- Name: user user_email_key38; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key38 UNIQUE (email);


--
-- Name: user user_email_key39; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key39 UNIQUE (email);


--
-- Name: user user_email_key4; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key4 UNIQUE (email);


--
-- Name: user user_email_key40; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key40 UNIQUE (email);


--
-- Name: user user_email_key41; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key41 UNIQUE (email);


--
-- Name: user user_email_key42; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key42 UNIQUE (email);


--
-- Name: user user_email_key43; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key43 UNIQUE (email);


--
-- Name: user user_email_key44; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key44 UNIQUE (email);


--
-- Name: user user_email_key45; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key45 UNIQUE (email);


--
-- Name: user user_email_key46; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key46 UNIQUE (email);


--
-- Name: user user_email_key47; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key47 UNIQUE (email);


--
-- Name: user user_email_key48; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key48 UNIQUE (email);


--
-- Name: user user_email_key49; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key49 UNIQUE (email);


--
-- Name: user user_email_key5; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key5 UNIQUE (email);


--
-- Name: user user_email_key50; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key50 UNIQUE (email);


--
-- Name: user user_email_key51; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key51 UNIQUE (email);


--
-- Name: user user_email_key52; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key52 UNIQUE (email);


--
-- Name: user user_email_key53; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key53 UNIQUE (email);


--
-- Name: user user_email_key54; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key54 UNIQUE (email);


--
-- Name: user user_email_key55; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key55 UNIQUE (email);


--
-- Name: user user_email_key56; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key56 UNIQUE (email);


--
-- Name: user user_email_key57; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key57 UNIQUE (email);


--
-- Name: user user_email_key58; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key58 UNIQUE (email);


--
-- Name: user user_email_key59; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key59 UNIQUE (email);


--
-- Name: user user_email_key6; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key6 UNIQUE (email);


--
-- Name: user user_email_key60; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key60 UNIQUE (email);


--
-- Name: user user_email_key61; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key61 UNIQUE (email);


--
-- Name: user user_email_key62; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key62 UNIQUE (email);


--
-- Name: user user_email_key63; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key63 UNIQUE (email);


--
-- Name: user user_email_key64; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key64 UNIQUE (email);


--
-- Name: user user_email_key65; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key65 UNIQUE (email);


--
-- Name: user user_email_key66; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key66 UNIQUE (email);


--
-- Name: user user_email_key67; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key67 UNIQUE (email);


--
-- Name: user user_email_key68; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key68 UNIQUE (email);


--
-- Name: user user_email_key69; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key69 UNIQUE (email);


--
-- Name: user user_email_key7; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key7 UNIQUE (email);


--
-- Name: user user_email_key70; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key70 UNIQUE (email);


--
-- Name: user user_email_key71; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key71 UNIQUE (email);


--
-- Name: user user_email_key72; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key72 UNIQUE (email);


--
-- Name: user user_email_key73; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key73 UNIQUE (email);


--
-- Name: user user_email_key74; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key74 UNIQUE (email);


--
-- Name: user user_email_key75; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key75 UNIQUE (email);


--
-- Name: user user_email_key76; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key76 UNIQUE (email);


--
-- Name: user user_email_key77; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key77 UNIQUE (email);


--
-- Name: user user_email_key78; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key78 UNIQUE (email);


--
-- Name: user user_email_key79; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key79 UNIQUE (email);


--
-- Name: user user_email_key8; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key8 UNIQUE (email);


--
-- Name: user user_email_key80; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key80 UNIQUE (email);


--
-- Name: user user_email_key81; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key81 UNIQUE (email);


--
-- Name: user user_email_key82; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key82 UNIQUE (email);


--
-- Name: user user_email_key83; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key83 UNIQUE (email);


--
-- Name: user user_email_key84; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key84 UNIQUE (email);


--
-- Name: user user_email_key85; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key85 UNIQUE (email);


--
-- Name: user user_email_key86; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key86 UNIQUE (email);


--
-- Name: user user_email_key87; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key87 UNIQUE (email);


--
-- Name: user user_email_key88; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key88 UNIQUE (email);


--
-- Name: user user_email_key89; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key89 UNIQUE (email);


--
-- Name: user user_email_key9; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key9 UNIQUE (email);


--
-- Name: user user_email_key90; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key90 UNIQUE (email);


--
-- Name: user user_email_key91; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key91 UNIQUE (email);


--
-- Name: user user_email_key92; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key92 UNIQUE (email);


--
-- Name: user user_email_key93; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key93 UNIQUE (email);


--
-- Name: user user_email_key94; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key94 UNIQUE (email);


--
-- Name: user user_email_key95; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key95 UNIQUE (email);


--
-- Name: user user_email_key96; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key96 UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_role user_role_UserId_RoleId_key; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "user_role_UserId_RoleId_key" UNIQUE ("UserId", "RoleId");


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: user user_username_key1; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key1 UNIQUE (username);


--
-- Name: user user_username_key10; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key10 UNIQUE (username);


--
-- Name: user user_username_key11; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key11 UNIQUE (username);


--
-- Name: user user_username_key12; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key12 UNIQUE (username);


--
-- Name: user user_username_key13; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key13 UNIQUE (username);


--
-- Name: user user_username_key14; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key14 UNIQUE (username);


--
-- Name: user user_username_key15; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key15 UNIQUE (username);


--
-- Name: user user_username_key16; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key16 UNIQUE (username);


--
-- Name: user user_username_key17; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key17 UNIQUE (username);


--
-- Name: user user_username_key18; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key18 UNIQUE (username);


--
-- Name: user user_username_key19; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key19 UNIQUE (username);


--
-- Name: user user_username_key2; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key2 UNIQUE (username);


--
-- Name: user user_username_key20; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key20 UNIQUE (username);


--
-- Name: user user_username_key21; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key21 UNIQUE (username);


--
-- Name: user user_username_key22; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key22 UNIQUE (username);


--
-- Name: user user_username_key23; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key23 UNIQUE (username);


--
-- Name: user user_username_key24; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key24 UNIQUE (username);


--
-- Name: user user_username_key25; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key25 UNIQUE (username);


--
-- Name: user user_username_key26; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key26 UNIQUE (username);


--
-- Name: user user_username_key27; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key27 UNIQUE (username);


--
-- Name: user user_username_key28; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key28 UNIQUE (username);


--
-- Name: user user_username_key29; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key29 UNIQUE (username);


--
-- Name: user user_username_key3; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key3 UNIQUE (username);


--
-- Name: user user_username_key30; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key30 UNIQUE (username);


--
-- Name: user user_username_key31; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key31 UNIQUE (username);


--
-- Name: user user_username_key32; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key32 UNIQUE (username);


--
-- Name: user user_username_key33; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key33 UNIQUE (username);


--
-- Name: user user_username_key34; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key34 UNIQUE (username);


--
-- Name: user user_username_key35; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key35 UNIQUE (username);


--
-- Name: user user_username_key36; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key36 UNIQUE (username);


--
-- Name: user user_username_key37; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key37 UNIQUE (username);


--
-- Name: user user_username_key38; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key38 UNIQUE (username);


--
-- Name: user user_username_key39; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key39 UNIQUE (username);


--
-- Name: user user_username_key4; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key4 UNIQUE (username);


--
-- Name: user user_username_key40; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key40 UNIQUE (username);


--
-- Name: user user_username_key41; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key41 UNIQUE (username);


--
-- Name: user user_username_key42; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key42 UNIQUE (username);


--
-- Name: user user_username_key43; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key43 UNIQUE (username);


--
-- Name: user user_username_key44; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key44 UNIQUE (username);


--
-- Name: user user_username_key45; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key45 UNIQUE (username);


--
-- Name: user user_username_key46; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key46 UNIQUE (username);


--
-- Name: user user_username_key47; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key47 UNIQUE (username);


--
-- Name: user user_username_key48; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key48 UNIQUE (username);


--
-- Name: user user_username_key49; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key49 UNIQUE (username);


--
-- Name: user user_username_key5; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key5 UNIQUE (username);


--
-- Name: user user_username_key50; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key50 UNIQUE (username);


--
-- Name: user user_username_key51; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key51 UNIQUE (username);


--
-- Name: user user_username_key52; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key52 UNIQUE (username);


--
-- Name: user user_username_key53; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key53 UNIQUE (username);


--
-- Name: user user_username_key54; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key54 UNIQUE (username);


--
-- Name: user user_username_key55; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key55 UNIQUE (username);


--
-- Name: user user_username_key56; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key56 UNIQUE (username);


--
-- Name: user user_username_key57; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key57 UNIQUE (username);


--
-- Name: user user_username_key58; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key58 UNIQUE (username);


--
-- Name: user user_username_key59; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key59 UNIQUE (username);


--
-- Name: user user_username_key6; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key6 UNIQUE (username);


--
-- Name: user user_username_key60; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key60 UNIQUE (username);


--
-- Name: user user_username_key61; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key61 UNIQUE (username);


--
-- Name: user user_username_key62; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key62 UNIQUE (username);


--
-- Name: user user_username_key63; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key63 UNIQUE (username);


--
-- Name: user user_username_key64; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key64 UNIQUE (username);


--
-- Name: user user_username_key65; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key65 UNIQUE (username);


--
-- Name: user user_username_key66; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key66 UNIQUE (username);


--
-- Name: user user_username_key67; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key67 UNIQUE (username);


--
-- Name: user user_username_key68; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key68 UNIQUE (username);


--
-- Name: user user_username_key69; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key69 UNIQUE (username);


--
-- Name: user user_username_key7; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key7 UNIQUE (username);


--
-- Name: user user_username_key70; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key70 UNIQUE (username);


--
-- Name: user user_username_key71; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key71 UNIQUE (username);


--
-- Name: user user_username_key72; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key72 UNIQUE (username);


--
-- Name: user user_username_key73; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key73 UNIQUE (username);


--
-- Name: user user_username_key74; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key74 UNIQUE (username);


--
-- Name: user user_username_key75; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key75 UNIQUE (username);


--
-- Name: user user_username_key76; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key76 UNIQUE (username);


--
-- Name: user user_username_key77; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key77 UNIQUE (username);


--
-- Name: user user_username_key78; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key78 UNIQUE (username);


--
-- Name: user user_username_key79; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key79 UNIQUE (username);


--
-- Name: user user_username_key8; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key8 UNIQUE (username);


--
-- Name: user user_username_key80; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key80 UNIQUE (username);


--
-- Name: user user_username_key81; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key81 UNIQUE (username);


--
-- Name: user user_username_key82; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key82 UNIQUE (username);


--
-- Name: user user_username_key83; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key83 UNIQUE (username);


--
-- Name: user user_username_key84; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key84 UNIQUE (username);


--
-- Name: user user_username_key85; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key85 UNIQUE (username);


--
-- Name: user user_username_key86; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key86 UNIQUE (username);


--
-- Name: user user_username_key87; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key87 UNIQUE (username);


--
-- Name: user user_username_key88; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key88 UNIQUE (username);


--
-- Name: user user_username_key89; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key89 UNIQUE (username);


--
-- Name: user user_username_key9; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key9 UNIQUE (username);


--
-- Name: user user_username_key90; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key90 UNIQUE (username);


--
-- Name: user user_username_key91; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key91 UNIQUE (username);


--
-- Name: user user_username_key92; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key92 UNIQUE (username);


--
-- Name: user user_username_key93; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key93 UNIQUE (username);


--
-- Name: user user_username_key94; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key94 UNIQUE (username);


--
-- Name: user user_username_key95; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key95 UNIQUE (username);


--
-- Name: user user_username_key96; Type: CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key96 UNIQUE (username);


--
-- Name: user_game user_game_gameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT "user_game_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES public.game(id);


--
-- Name: user_game user_game_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT "user_game_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: user_role user_role_RoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "user_role_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_role user_role_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maets
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "user_role_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict Yh6PlPtAJKA8oVyHYOn1XwanZFZ37mI6m2HDlfqxz3qzeNBeRlSWgRz6eBFPihO

