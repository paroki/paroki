--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Ubuntu 11.3-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.3 (Ubuntu 11.3-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: sc_user; Type: TABLE; Schema: public; Owner: toni
--

CREATE TABLE public.sc_user (
    id uuid NOT NULL,
    paroki_id uuid,
    username character varying(180) NOT NULL,
    username_canonical character varying(180) NOT NULL,
    email character varying(180) NOT NULL,
    email_canonical character varying(180) NOT NULL,
    enabled boolean NOT NULL,
    salt character varying(255) DEFAULT NULL::character varying,
    password character varying(255) NOT NULL,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    confirmation_token character varying(180) DEFAULT NULL::character varying,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    nama character varying(255)
);


ALTER TABLE public.sc_user OWNER TO toni;

--
-- Name: COLUMN sc_user.roles; Type: COMMENT; Schema: public; Owner: toni
--

COMMENT ON COLUMN public.sc_user.roles IS '(DC2Type:array)';


--
-- Name: tr_keuskupan; Type: TABLE; Schema: public; Owner: toni
--

CREATE TABLE public.tr_keuskupan (
    id uuid NOT NULL,
    kode character varying(3) NOT NULL,
    no_urut integer DEFAULT 0,
    nama character varying(100) DEFAULT NULL::character varying,
    nama_latin character varying(50) DEFAULT NULL::character varying,
    alamat character varying(150) DEFAULT NULL::character varying,
    kota character varying(50) DEFAULT NULL::character varying,
    telepon character varying(50) DEFAULT NULL::character varying,
    fax character varying(50) DEFAULT NULL::character varying,
    website character varying(50) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    nama_uskup_saat_ini character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.tr_keuskupan OWNER TO toni;

--
-- Name: tr_lingkungan; Type: TABLE; Schema: public; Owner: toni
--

CREATE TABLE public.tr_lingkungan (
    id character varying(50) NOT NULL,
    wilayah_id character varying(50) DEFAULT NULL::character varying,
    wilayah_bagian_id integer,
    paroki_id uuid,
    kode character varying(50) DEFAULT NULL::character varying,
    nama character varying(255) DEFAULT NULL::character varying,
    no_urut integer DEFAULT 0,
    ketua character varying(255) DEFAULT NULL::character varying,
    f5 character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.tr_lingkungan OWNER TO toni;

--
-- Name: tr_paroki; Type: TABLE; Schema: public; Owner: toni
--

CREATE TABLE public.tr_paroki (
    id uuid NOT NULL,
    keuskupan_id uuid,
    kode character varying(7) NOT NULL,
    no_urut integer,
    nama character varying(50) DEFAULT NULL::character varying,
    nama_gereja character varying(150) DEFAULT NULL::character varying,
    alamat character varying(255) DEFAULT NULL::character varying,
    kota character varying(50) DEFAULT NULL::character varying,
    telepon character varying(50) DEFAULT NULL::character varying,
    fax character varying(50) DEFAULT NULL::character varying,
    website character varying(50) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    pastor character varying(100) DEFAULT NULL::character varying,
    wilayah_keuskupan character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.tr_paroki OWNER TO toni;

--
-- Name: tr_wilayah; Type: TABLE; Schema: public; Owner: toni
--

CREATE TABLE public.tr_wilayah (
    id character varying(50) NOT NULL,
    wilayah_bagian_id integer,
    kode character varying(255) DEFAULT NULL::character varying,
    nama character varying(100) DEFAULT NULL::character varying,
    ketua character varying(255) DEFAULT NULL::character varying,
    ref_duk integer
);


ALTER TABLE public.tr_wilayah OWNER TO toni;

--
-- Data for Name: sc_user; Type: TABLE DATA; Schema: public; Owner: toni
--

COPY public.sc_user (id, paroki_id, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, confirmation_token, password_requested_at, roles, nama) FROM stdin;
89d1f9c0-b13b-494b-ae69-060d00be746b	cf0b6181-d4f6-4998-811f-def05ea98c4f	admin	admin	me@itstoni.com	me@itstoni.com	t	\N	$2y$13$Xl76aTyT3wLq3PlFKtKir.x.AhIp5B7.858CV7OnLzop7X0gbJ3LC	\N	\N	\N	a:0:{}	\N
\.


--
-- Data for Name: tr_keuskupan; Type: TABLE DATA; Schema: public; Owner: toni
--

COPY public.tr_keuskupan (id, kode, no_urut, nama, nama_latin, alamat, kota, telepon, fax, website, email, nama_uskup_saat_ini) FROM stdin;
91977b8a-c746-47fc-974d-45c71643c04f	000	0	Non Keuskupan			Jakarta					
d5a618eb-33ad-42e7-8b53-db32f434adf7	001	1	Keuskupan Agats Asmat			Asmat					
61e249e3-a79d-40f6-9571-ebf78d21b025	002	2	Keuskupan Amboina			Ambon					
8e8c8548-c97f-4c4a-b31f-f78a45423676	003	3	Keuskupan Atambua	Dioecesis Atambuensis		Atambua					
335cb05c-75cf-4351-9ef9-81df3f91a1d7	004	4	Keuskupan Bandung			Bandung					
a5c23ef6-19df-44d9-b327-c1ee41470dd8	005	5	Keuskupan Banjarmasin			Banjarmasin					
612cae46-7dfa-485d-bb21-a1d787792ba6	006	6	Keuskupan Bogor			Bogor					
dbb04881-7771-40b1-b3f3-c6451c93015c	007	7	Keuskupan Denpasar			Denpasar					
7ae43790-6b59-45c8-965f-535cd37e8542	008	8	Keuskupan Agung Ende			Ende					
34dbcc1d-25e8-4ebb-b465-5506e50ad111	009	9	Keuskupan Agung Jakarta	Archidioecesis Jakartaensis	Jl. Katedral 7	Jakarta 10710	021-3813345, 3814322, 3511141	021-3855681	http://www.kaj.or.id	...	Mgr. Ignatius Suharyo Hardjoatmodjo Pr 
d59fb337-72ec-4166-b7eb-08315c438066	010	10	Keuskupan Jayapura	Dioecesis Jayapuraensis		Jayapura					
4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011	11	Keuskupan Ketapang			Ketapang					
0d5576ab-1219-4a37-9c53-2949e9f58fd4	012	12	Keuskupan Agung Kupang			Kupang					
99fee764-eab0-4b8b-b50a-cfefff2f7aba	013	13	Keuskupan Larantuka			Larantuka					
47ad2bd6-f40b-45ec-8313-04ac148ef025	014	14	Keuskupan Agung Makassar	Archidioecesis Makassarensis		Makassar					
e87e4b32-bf21-4824-846c-a16e45e631c4	015	15	Keuskupan Malang	Diocecis de Malangensis		Malang					
01c9571d-e28d-454f-b721-7badcb32ce9f	016	16	Keuskupan Manado			Manado					
8ead8fa0-b067-4c26-a6af-0ce807b79132	017	17	Keuskupan Manokwari - Sorong			Sorong					
025912db-e08f-4096-9fbe-f770dddbde50	018	18	Keuskupan Agung Medan			Medan					
64a32549-130a-4f89-9c6c-3c2aa734701c	019	19	Keuskupan Agung Merauke			Merauke					
8d73e770-431b-48fd-bdf9-c9611634f401	020	20	Keuskupan Padang			Padang					
eace39cd-c5f0-49fc-a907-758a664e6281	021	21	Keuskupan Palangkaraya			Palangkaraya					
0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022	22	Keuskupan Agung Palembang	Archidiocesis Palembangensis		Palembang					
24b9060b-e5e6-49e4-a7fb-78e856d899fd	023	23	Keuskupan Pangkalpinang			Pangkal Pinang					
640d1cf1-b5c6-4f69-92eb-86fde75e974f	024	24	Keuskupan Agung Pontianak			Pontianak					
599cd77f-3856-4fd0-a4ee-65c82bfa1001	025	25	Keuskupan Purwokerto			Purwokerto					
5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026	26	Keuskupan Ruteng	Dioecesis Rutengensis		Ruteng					
a8085a56-b337-4425-888e-4525fc4e677a	027	27	Keuskupan Agung Samarinda			Samarinda					
00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028	28	Keuskupan Sanggau			Sanggau					
721545e6-f3c9-42b4-aa62-85086a7d2b6d	029	29	Keuskupan Agung Semarang			Semarang					
8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030	30	Keuskupan Sibolga			Sibolga					
a168e082-5dd7-441b-b784-39627f9b76fb	031	31	Keuskupan Sintang			Sintang					
13877b72-5f74-4c1e-8b41-f87b9dec7354	032	32	Keuskupan Surabaya	Diocesis Surabaya		Surabaya					
cf35e0aa-4157-471f-8733-18e66fedf332	033	33	Keuskupan Weetebula			Weetebula					
51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034	34	Keuskupan Tanjungkarang	Diocesis Tanjungkarangensis		Tanjung Karang					
5e2f62c8-8dd7-4003-843c-9a75789aba0d	035	35	Keuskupan Tanjung Selor			Samarinda					
812df38d-e018-4c66-8eb3-6432e1245caf	036	36	Keuskupan Timika			Merauke					
49c290a4-589d-4617-9189-d31af0d988fe	037	37	Keuskupan Maumere			Ende					
10851ad8-6e66-4e7a-b48c-00abf224d55e	038	38	Keuskupan Dili	Diocese de Dili		Maubisse					
\.


--
-- Data for Name: tr_lingkungan; Type: TABLE DATA; Schema: public; Owner: toni
--

COPY public.tr_lingkungan (id, wilayah_id, wilayah_bagian_id, paroki_id, kode, nama, no_urut, ketua, f5) FROM stdin;
\.


--
-- Data for Name: tr_paroki; Type: TABLE DATA; Schema: public; Owner: toni
--

COPY public.tr_paroki (id, keuskupan_id, kode, no_urut, nama, nama_gereja, alamat, kota, telepon, fax, website, email, pastor, wilayah_keuskupan) FROM stdin;
212a1c1b-6bf7-43c2-9131-10619178b5ff	91977b8a-c746-47fc-974d-45c71643c04f	000.000	0	Non Paroki	Non Gereja	-	-	-	-	-	-	-	\N
8cfd4c6a-6740-4975-b13d-6efedda3b571	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.001	1	Agats	Salib Suci	Pastoran Katolik Agats 99677	Papua	(0902) 31059				-	\N
3169740f-a7b7-4926-b212-82d69786a855	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.002	2	Atsy	St. Paulus	Pastoran Katolik Distrik Atsy Kab. Asmat 99777,	Agats-Papua					-	\N
53f66b8d-eebd-4eeb-b8af-c01782857d49	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.003	3	Ayam	St. Martinus De Pores	Pastoran Katolik Ayam, Distrik Akats, Kab. Asmat 99777	Agats-Papua					-	\N
5c69e740-3cbc-41c3-b0ea-a5addb943661	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.004	4	Basiem	Hati Kudus Maria	Pastoran Katolik Basiem, Distrik Fayit, Kab. Asmat 99777, 	Agats-Papua					-	\N
95be628a-5ad0-418d-9c56-8f94c6d0e6fa	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.005	5	Bayun	Roh Kudus	Pastoran Katolik Bayun, Distrik Kamur, Kab. Asmat 99777	Agats-Papua					-	\N
ef5f2d57-0bd0-4571-a772-5057e072d3f6	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.006	6	Ewer	St. Petrus	Pastoran Katolik Ewer, Distrik Agats. Kab. Asmat 99777	Agats-Papua					-	\N
8122a0a1-1e5d-4291-a141-fcbffc98de1e	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.007	7	Komor	Martir-martir Uganda	Pastoran Katolik Komor, Distrik Pos Sawa Erma Kab. Asmat 99777	Agats-Papua					-	\N
d10a55a8-5edb-4016-bee7-db5301209dba	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.008	8	Pirimapun	Hati Kudus	Pastoran Katolik Pirimapun, Distrik Kamur. Kab. Asmat 99777	Agats-Papua					-	\N
ce29a144-304d-48eb-8b41-7edf62809ce4	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.009	9	Sawa-Erma	Kristus Amore	Pastoran Katolik Sawa-Erma, Kab. Asmat 99777	Agats-Papua					-	\N
ce20055f-0116-4d0a-9f7f-0b05a8f605ee	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.010	10	Senggo	St. Yosep	Pastoran Katolik Senggo, Distrik Cilak Mitak Kab. Mapi	Papua					-	\N
6f46bda7-2c95-44bc-8b8c-25b978df97f1	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.011	11	Yamas	St. Silvia	Pastoran Katolik Yamas, Distrik Citak Mitak, Kab. Mapi	Papua					-	\N
99a17409-5549-4853-814d-a690c3a53a36	d5a618eb-33ad-42e7-8b53-db32f434adf7	001.012	12	Yaosakor	St. Anna	Pastoran Katolik Yaosakor, Distrik Atsy, Kab. Asmat 99777	Agats-Papua					-	\N
253c1ec6-8e06-4a58-b1f4-c3cafc486099	61e249e3-a79d-40f6-9571-ebf78d21b025	002.001	1	Ahuru	St. Yakobus	Jl. Pattimura No. 26	Ambon	(0911) 344231	(0911) 352556			-	\N
11647446-5bcf-42df-b726-17b520fa3288	61e249e3-a79d-40f6-9571-ebf78d21b025	002.002	2	Batu Gantung	Hati Kudus Yesus	Biara Emaus Jl. Siwabessy 31 	Ambon	(0911) 353355	(0911) 312889, 335337		msc_maluku@yahoo.co.id	-	\N
e596aec1-dbb0-4531-b415-fc266f072b76	61e249e3-a79d-40f6-9571-ebf78d21b025	002.003	3	Benteng	St. Maria Bintang Laut	Pastoran Katolik MBL Jl. Dr. Malaihollo RT. 004/05, Benteng 97117	Ambon	(0911) 344204	(0911) 355337		msc_maluku@yahoo.co.id	-	\N
068b90fe-e57b-4a63-89e9-87b0ddd66698	61e249e3-a79d-40f6-9571-ebf78d21b025	002.004	4	Katedral	St. Fransiskus Xaverius	Jl. Pattimura 32 	Ambon	(0911) 352123, 314446	(0911) 314446		yan_album@yahoo.co.id	-	\N
b3689161-9947-4c1a-bbbc-093bcc673011	61e249e3-a79d-40f6-9571-ebf78d21b025	002.005	5	Laha	St. Ignatius	Pastoran Katolik Kompleks LANUD Pattimura, Laha 	Ambon	0911-344807				-	\N
3301fa33-ca66-4663-8479-3b291f2112b9	61e249e3-a79d-40f6-9571-ebf78d21b025	002.006	6	Passo	St. Yoseph	Pastoran Katolik Passo Jl. Karel Satsuitubun Passo,	Ambon	(0911) 361132				-	\N
c1ab9b72-a7c6-427e-a2f0-70ec64dda90d	61e249e3-a79d-40f6-9571-ebf78d21b025	002.007	7	Poka Rumah Tiga	St. Yoseph	Pastoran katolik Poka-Rumah Tiga 	Ambon	(0911) 3301625			stpakambon@gmail.com	-	\N
43633919-4408-49a4-b95f-ee400465ba09	61e249e3-a79d-40f6-9571-ebf78d21b025	002.008	8	Tantui-Halong	Santo Yohanes Maria Vianney	Pastoran Katolik Kompleks LANAL, Halong 	Ambon	(0911) 342747				-	\N
affad48f-1d23-4d38-a873-fb2b8347ca20	61e249e3-a79d-40f6-9571-ebf78d21b025	002.009	9	Bemun / Aru Selatan	St. Maria Bunda Hati Kudus	Pastoran Katolik Bemun da Pastrn Katolik Dobo	Dobo, Kab. PP Aru	0917-21065				-	\N
a6d6b965-f161-4d14-9835-71e706982b43	61e249e3-a79d-40f6-9571-ebf78d21b025	002.010	10	Berdafan / Aru Utara	St. Yosafat	Pastoran Katolik Berdafan d/a Pastrn Katolik Dobo	Dobo Kab. PP Aru	0917-21065				-	\N
ae0777c2-9add-445b-a587-997c344aadf7	61e249e3-a79d-40f6-9571-ebf78d21b025	002.011	11	Dobo / P. Aru	St. Perawan Maria de Fatima	Pastoran Katolik Dobo 	Dobo Kab. PP Aru	(0917) 21065				-	\N
ec0458d0-0497-42d0-ad23-5f5bd429658f	61e249e3-a79d-40f6-9571-ebf78d21b025	002.012	12	Elat / Kei Besar	Emmanuel	Pastoran Katolik Katlarat Elat 97661, Kei Besar	Maluku Tenggara	(0916) 23018				-	\N
7b4622dd-6e65-4896-9a99-86b561aaea7c	61e249e3-a79d-40f6-9571-ebf78d21b025	002.013	13	Haar	St. Maria Bunda Allah	Pastoran Katolik Haar d/a Pastrn Katolik Katlarat, Elat 97661	Kei Besar, Maluku Tenggara	0916-23018				-	\N
7d0b6dac-d47b-4523-b2e9-f05aa97531f0	61e249e3-a79d-40f6-9571-ebf78d21b025	002.014	14	Hollat / Kei Besar 	St. Petrus Dan Paulus	Pastoran Katolik Hollat d/a Pastoran Katolik Katlarat, Elat 97661 	Kei Besar, Maluku Tenggara	(0916) 23018				-	\N
4d524b69-b752-4350-a8f0-dee2468ceca6	61e249e3-a79d-40f6-9571-ebf78d21b025	002.015	15	Uwat Bombay / Kei Besar	St. Joseph	Pastoran Katolik Bombay, Elat 97661	Kei Besar, Maluku Tenggara	(0916) 23018				-	\N
1661e17c-4456-41ba-b47e-469d4d48e434	61e249e3-a79d-40f6-9571-ebf78d21b025	002.016	16	Jailolo	St. Fransiskus Xaverius	Pastoran Katolik Jailolo d/a Gereja Batu Jl Salim Fabanyo No.57	Ternate, Maluku Utara	0922-21333				-	\N
fe9a743d-1e83-4f4b-91b5-24c0a5e3a026	61e249e3-a79d-40f6-9571-ebf78d21b025	002.017	17	Hollat / Kei Besar 	St. Petrus Dan Paulus	Pastoran Katolik Hollat d/a Pastoran Katolik Katlarat, Elat 97661 	Kei Besar, Maluku Tenggara	(0916) 23018				-	\N
4011a0dd-8816-4282-b815-568b0e93aa6d	61e249e3-a79d-40f6-9571-ebf78d21b025	002.018	18	Gelanit / Kei Kecil	St. Petrus	Pastoran Katolik Gelanit d/a Wisma Unio Projo Langgur, Jl. Jend. Sudirman, Tual 	Tual, Kei Kecil, Maluku Tenggara.	(0916) 22838	(0916) 22845			-	\N
42c24908-9c91-4586-9dfd-4af2050c85a0	61e249e3-a79d-40f6-9571-ebf78d21b025	002.019	19	Langgur / Kei Kecil	St. Perawan Maria Yang Tak Bernoda	Pastoran Katolik Langgur, Jl. Jend. Sudirman, Tual 	Kei Kecil, Maluku Tenggara	(0916) 22547				-	\N
43cf9341-8219-4c4e-b19e-0376f7ec321e	61e249e3-a79d-40f6-9571-ebf78d21b025	002.020	20	Larat / Pp. Tanimbar	St. Pius X.	Pastoran Katolik Larat,	Maluku Tenggara Barat	0918-31057				-	\N
0f49a013-03e7-4719-ae3c-728b00de41a6	61e249e3-a79d-40f6-9571-ebf78d21b025	002.021	21	Lorulun / Pp. Tanimbar	St. Petrus Dan Paulus	Pastoran Katolik  Lorulun d/a Wisma Unio Projo Saumlaki,	Maluku Tenggara Barat	0918-21054				-	\N
9f93f79c-2675-40c6-8607-864d646b740f	61e249e3-a79d-40f6-9571-ebf78d21b025	002.022	22	Masohi / P. Seram	St. Yohanes Penginjil	Pastoran Katolik Masohi, Jl Abdullah Soulisda, Masohi 97511.	Maluku Tengah	0914-21054				-	\N
4dcd4263-8fca-430f-8c98-33c760fe4cc5	61e249e3-a79d-40f6-9571-ebf78d21b025	002.023	23	Namar / Kei Kecil	St. Petrus dan Paulus	Pastoran Katolik Namar d/a Wisma Unio Projo Langgur, Jl. Jend. Sudirman, Tual, Langgur 	Kei Kecil, Maluku Tenggara	(0916) 22838	(0916) 22845			-	\N
c61c3403-2929-403f-83de-7c323a3180a6	61e249e3-a79d-40f6-9571-ebf78d21b025	002.024	24	Namlea / P. Buru	St. Maria Bintang Laut	Pastoran Katolik Namlea  Jl Flamboyan SK7/29 Namlea 97571	Buru Utara Timur, Kab. Pulau Buru	0913-21155,  21146				-	\N
58a46428-cea5-4ea3-860b-0624ace9da61	61e249e3-a79d-40f6-9571-ebf78d21b025	002.025	25	Ohoidertutu / Kei Kecil	Hati Kudus Yesus	Pstrn Katolik Ohoidertutu d/a Wisma Unio Projo Langgur, Jl Jend.Sudirman	Tual, Kei Kecil, Maluku Tenggara	0916-22838	0916-22845			-	\N
8df39192-f3c7-4e53-bca5-6a80d915ce6c	61e249e3-a79d-40f6-9571-ebf78d21b025	002.026	26	Ohoijang	St. Yosep	Pastoran Katolik Ohoijang. Jl. Jend. Sudirman Ohoijang, Tual 	Kei Kecil, Maluku Tenggara	(0916) 22717				-	\N
bd256a66-ee90-471e-87dd-1e1a6b574dfb	61e249e3-a79d-40f6-9571-ebf78d21b025	002.027	27	Olilit Barat	Hati Kudus Yesus	Pastoran Katolik Olilit Barat d/a Wisma Unio Projo Saumlaki	Maluku Tenggara Barat	0918-21075,  21031	0918-21237			-	\N
2aef85bd-06d7-4837-868a-0ee3c8f35ce9	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.030	30	Oeolo	St. Maria Ratu	Pastoran Katolik Oeolo, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
cb7b33a1-057c-4205-8f12-c37d6b59206d	61e249e3-a79d-40f6-9571-ebf78d21b025	002.028	28	Rumat / Kei Kecil	St. Petrus dan Paulus	Pastoran Katolik Rumat d/a Wisma Unio Projo Langgur, Jl. Jend. Sudirman, Tual 	Kei Kecil, Maluku Tenggara	(0916) 22838	(0916) 22845			-	\N
84a9118f-e543-428c-8c60-ef083e2c68e2	61e249e3-a79d-40f6-9571-ebf78d21b025	002.029	29	Saumlaki	Santo Mathias	Pastoran Katolik Saumlaki, Saumlaki 97664	Maluku Tenggara Barat	0918-21073,  21031	0918-21237			-	\N
e94b17eb-5ad7-4a6f-8248-30e0490574cd	61e249e3-a79d-40f6-9571-ebf78d21b025	002.030	30	Haar	St. Maria Bunda Allah	Pastoran Katolik Haar d/a Pastrn Katolik Katlarat, Elat 97661	Kei Besar, Maluku Tenggara	0916-23018				-	\N
66c847a9-1def-4cd2-8e2c-86bb15eab298	61e249e3-a79d-40f6-9571-ebf78d21b025	002.031	31	Ternate	St. Willibrordus	Gereja Batu, Pastoran Katolik Ternate Jl Salim Fabanyo No.57	Ternate, Maluku Utara	0921-21569	0921-23630			-	\N
30ce7c89-de17-4325-91f8-f2c0b54cb24a	61e249e3-a79d-40f6-9571-ebf78d21b025	002.032	32	Tobelo	Santa Maria	Pastoran Katolik Tobelo, Jl Gura Belakang,	Tobelo, Maluku Utara	0924-21476	0924-21476			-	\N
313cd4d5-11f4-4fa7-8613-2e06f7296b25	61e249e3-a79d-40f6-9571-ebf78d21b025	002.033	33	Tual (Kota Tual)	St. Fransiskus Xaverius	Pastoran Katolik Tual, Jl. Lodar El, Tual 97611	Tual	(0916) 21073				-	\N
3db5884b-a5cb-4ecd-b5ab-5baabc58bcfc	61e249e3-a79d-40f6-9571-ebf78d21b025	002.034	34	Uwat Bombay / Kei Besar	St. Joseph	Pastoran Katolik Bombay, Elat 97661	Kei Besar, Maluku Tenggara	(0916) 23018				-	\N
c4544776-aadc-480d-ac5d-538ea17f14d0	61e249e3-a79d-40f6-9571-ebf78d21b025	002.035	35	Faan	St. Ludovikus	Pastrn Katolik Faan d/a Wisma Unio Projo Langgur, Jl Jend.Sudirman, Tual	Kei Kecil, Maluku Tenggara	0916-22838	0916-22845			-	\N
6e60be37-cc61-4976-9245-3ebb2fa1f2bb	61e249e3-a79d-40f6-9571-ebf78d21b025	002.036	36	Waisarissa	St. Maria Ratu Rosario	Pastoran Katolik Kamal Waisarissa, Kab. Seram Bag. Barat	Ambon	0913-61292,  361461				-	\N
56728709-8307-4d4d-9c5d-81b67dd55d54	61e249e3-a79d-40f6-9571-ebf78d21b025	002.037	37	Waur - Watuar	Hati Kudus Tuhan Yesus	Pastoran Katolik Waur Elat 97661	Kei Besar, Maluku Tenggara	(0916) 23018				-	\N
cc716fca-c3ec-4354-9d4e-f39204544ad6	61e249e3-a79d-40f6-9571-ebf78d21b025	002.038	38	Olilit Timur	Ratu Rosario Suci	Pastoran Katolik Olilit Timur d/a Wisma Unio Projo Saumlaki	Maluku Tenggara Barat	0918-21075,  21031	0918-21237			-	\N
c384c922-6e90-4d65-9802-1d90f8b6604f	61e249e3-a79d-40f6-9571-ebf78d21b025	002.039	39	Kao - Malifut	St. Andreas	Pastoran Katolik Kao Malifut d/a Gereja Batu Jl Salim Fabanyo No.57	Ternate, Maluku Utara	0922-21333				-	\N
bdbb66c2-7158-4e45-86f3-dbe54bed26f2	61e249e3-a79d-40f6-9571-ebf78d21b025	002.040	40	Sanana	Mater Dei	Pastoran Katolik Sanana d/a Gereja Batu Pastrn Katolik Ternate Jl Salim Fabanyo No.57	Ternate, Maluku Utara	0922-21333				-	\N
d5e73219-3288-4d5b-ab40-0bd915250df2	61e249e3-a79d-40f6-9571-ebf78d21b025	002.041	41	Dobo / Kepulauan Aru	Santo Yosep Dobo	Dobo	Dobo					-	\N
05004489-0d2d-42ba-9bf7-6385a7f2f03d	61e249e3-a79d-40f6-9571-ebf78d21b025	002.079	79	Waisarissa	St. Maria Ratu Rosario	Pastoran Katolik Kamal Waisarissa, Kab. Seram Bag. Barat	Ambon	0913-61292,  361461				-	\N
8fdb91d9-13dd-4bf0-afc1-3f7c4ef3ec76	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.001	1	Alas	Salib Suci	Pastoran Katolik Alas, Pos Atambua 85702	Timor-NTT					-	\N
6032e8eb-c45f-40a4-9b5c-c3ca4cdfbdf6	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.002	2	Katedral	St. Maria Imakulata	Pastoran Katolik Atambua, Atambua 85702	Timor-NTT	0389-21046,  217721				-	\N
fea357ce-8650-469b-aeb7-fd5b554c7900	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.003	3	Atapupu	St. Maria Stella Maris	Pastoran Katolik Atapupu, Atambua 85702,	Timor-NTT					-	\N
5c659296-f68d-4e79-9794-10f48fb5c8d2	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.004	4	Besikama	St. Yohanes Pemandi	Pastoran Katolik Besikama, Pos Atambua 85702	Timor-NTT					-	\N
1ba0b005-0144-43cd-9273-af3e055f0ddd	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.005	5	Betun	St. Maria Fatima	Pastoran Katolik Betun, Pos Atambua 85702	Timor-NTT					-	\N
021dd055-2b46-437e-89d7-af323a27def2	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.006	6	Bijaepasu	St. Nikolaus	Pastoran Katolik Bijaepasu, Pos Kefamenanu 85611	Timor-NTT					-	\N
029414fc-6690-487b-bee6-f73c5a42bea0	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.007	7	Biudukfoho	St. Mikhael	Pastoran Katolik Biudukfoho, Pos Atambua 85702,	Timor-NTT					-	\N
b2ad3f36-d8a6-4a1b-ad78-3068df1e7804	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.008	8	Bolan	St. Simon Petrus	Pastoran Katolik Bolan, Pos Atambua 85702	Timor-NTT					-	\N
36118122-2a3b-4bd3-b2e9-6f9232d152cd	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.009	9	Eban	St. Maria Diangkat ke Surga	Pastoran Katolik Eban Pos Kefamenanu 85611	Timor-NTT					-	\N
c8aa927b-8617-438e-a293-b1f30f00e9b2	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.010	10	Fulur	St. Maria Ratu Damai	Pastoran Katolik Fulur, Atambua 85702	Timor-NTT					-	\N
2ea284a2-14ed-466b-8bdb-da914aa5bb51	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.011	11	Halilulik	St. Odulfus		Atambua					-	\N
7104b74b-c29f-4b83-be6e-adfbc8c0fdfc	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.012	12	Haumeni	Kristus Raja	Pastoran Katolik Haumeni, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
bfa380af-cd0d-4707-b1e3-009bb8584603	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.013	13	Kada	St. Mikael	Pastoran Katolik Kada, Pos Atambua 85702	Timor-NTT					-	\N
6110f592-c036-4b2d-9bfc-dc40b6b7ae9d	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.014	14	Kefamenanu	St. Theresia	Pastoran Katolik Santa Theresia, Kefamenanu 85611	TTU-Timor-NTT	0388-31053				-	\N
f498cacc-5073-4844-8d38-f284df806d51	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.015	15	Kiupukan	St. Maria Penyelenggara Segala Rahmat	Pastoran Katolik Kiupukan, Pos Kefamenanu 85611	TTU-Timor-NTT	0868-12111968				-	\N
01c2c08f-a311-4217-8aeb-bb3c2cfc92ee	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.016	16	Kotafoun	St. Sesilia	Pastoran Katolik Kotafoun, Pos Atambua 85702	Timor-NTT					-	\N
cb66f136-a8ab-42a4-9c86-5633226bc4a7	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.017	17	Lahurus	St. Petrus	Pastoran Katolik Lahurus, Atambua 85702	Timor-NTT					-	\N
2f1d9619-6c0b-4848-b806-48f9659acf99	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.018	18	Lurasik	St. Petrus dan  Paulus	Pastoran Katolik Lurasik, Atambua 85702	Timor-NTT					-	\N
a6a00ba0-9f8d-44fb-a0ad-2d7201bc5b6b	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.019	19	Mamsena	St. Fransiskus Asisi	Pastoran Katolik Mamsena, Pos Kefamenanu 85611,	TTU-Timor-NTT					-	\N
28310370-f08e-4515-86da-a44f8cb94890	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.020	20	Manamas	St. Josef	Pastoran Katolik Manamas, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
e9594221-1bc0-40bb-9a09-769200a37f51	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.021	21	Manufui	St. Petrus Kanisius	Pastoran Katolik Manufui, Pos Kefamenanu 85611,	TTU-Timor-NTT					-	\N
9f8fc65f-0e7c-4b5d-9ef0-85661f1f2d3c	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.022	22	Maubesi	St. Yohanes Maria Vianey	Pastoran Katolik Maubesi, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
b13db04f-977a-418a-b05d-6786188b4a4e	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.023	23	Mena	St. Filomena	Pastoran Katolik Mena, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
55a160c8-4c64-455e-9bc3-4e8ec0db5b12	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.024	24	Naekake	St. Bernardus	Pastoran Katolik Naekake, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
f2ef4a71-a32d-4ec1-b822-35b2b9e329df	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.025	25	Naesleu	St. Yohanes Pembaptis	Pastoran Katolik Naesleu, Pos Kefamenanu 85611	TTU-Timor-NTT	0388-31304	0389-31303			-	\N
0fda219c-b7c4-4b76-bcd7-8116c5333532	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.026	26	Nela	St. Antonius Padua	Pastoran Katolik Nela, Atambua 85702	Timor-NTT					-	\N
44b65c4d-1f0e-44f4-a885-d885a735b099	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.027	27	Noemuti	Hati Yesus Yang Maha Kudus	Pastoran Katolik Noemuti, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
0ef210ca-4ab1-43fe-9bf1-a851d6cdf35c	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.028	28	Nualain	St. Gerardus	Pastoran Katolik Nualain, Atambua 85702	Timor-NTT					-	\N
e6a775a4-352d-4b76-bf15-8666d915ac9b	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.029	29	Nurobo	St. Maria Fatima	Pastoran Katolik Nurobo, Pos Atambua 85702	Timor-NTT					-	\N
6d9acb30-8b54-4962-82e2-9a01573b1343	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.031	31	Ponu	St. Maria Bunda Allah	Pastoran Katolik Ponu, Pos Atambua 85702	Timor-NTT					-	\N
ecb7cf64-8e7b-47d2-b1ff-971f1a7e1874	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.032	32	Sadi	Tritunggal Maha Kudus	Pastoran Katolik Sadi, Atambua 85702	Timor-NTT					-	\N
dd5e44c9-9955-4a1e-a9f9-08f103be63f4	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.033	33	Seon	Kristus Raja	Pastoran Katolik Seon, Pos Atambua 85702	Timor-NTT					-	\N
ec601f46-ca3c-47fd-bd18-86bd7618a82a	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.034	34	Tukuneno	St. Petrus	Pastoran Katolik Tukuneno, Atambua 85702	Timor-NTT	0389-22003				-	\N
e8086a38-de5d-426d-b9a6-12f4e569c8de	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.035	35	Tunbaba	St. Andreas Rasul	Pastoran Katolik Tunbaba, Pos Kefamenanu 85611	TTYimor-NTT					-	\N
d0e09900-5634-489b-992c-bd789d9c567d	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.036	36	Webriamata	St. Yohanes Rasul	Pastoran Katolik Webriamata, Pos Atambua 85702	Timor-NTT					-	\N
8632e91b-00d6-468e-a87d-43fa0106617c	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.037	37	Wedomu	St. Paulus	Pastoran Katolik Wedomu, Atambua 85702	Timor-NTT					-	\N
b0fcdf5a-b067-4f46-8b9b-bfbf50a423b5	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.038	38	Weluli	St. Theodorus	Pastoran Katolik Weluli, Atambua 85702	Timor-NTT					-	\N
14fb7881-5eee-4d01-8d60-d4cc557dbcb8	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.039	39	Weoe	Salib Suci	Pastoran Katolik Weoe, Pos Atambua 85702	Timor-NTT					-	\N
9d97d016-14c6-4cfc-9570-60e1ae847363	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.040	40	Bakitolas	St. Yohanes Pemandi	Pastoran Katolik Bakitolas, Pos Kefamenanu 85611,	TTU-Timor-NTT					-	\N
78fad3d2-5835-453b-a907-a8b26bcf2d81	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.041	41	Fafinesu	St. Antonius Padua	Pastoran Katolik Fafinesu, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
0c123877-cdca-4938-bc30-4d34a54e1970	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.042	42	Fatubenao	St. Agustinus	Pastoran Katolik Fatubenao, Atambua 85702	Timor-NTT	0389-22484				Aurelius Lorenzo Tae Lake, Pr	\N
aa94c9b1-f2ee-41fc-b570-b3d2c99b4ea1	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.043	43	Fatuketi	St. Maria Bunda Penebus	Pastoran Katolik Fatuketi, Atambua 85702,	Timor-NTT					-	\N
abc26275-5b2f-4501-abde-9076ff35b12d	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.044	44	Fatuoni	St. Fransiskus Xaverius	Pastoran Katolik Fatuoni, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
78f71f4d-18fe-4286-b84c-c46eb4807cc1	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.045	45	Haekesak	St. Aloysius Gonzaga	Pastoran Katolik Haekesak, Atambua 85702	Timor-NTT					-	\N
2bf31542-249c-436f-923c-03474ff1aefd	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.046	46	Kamanasa	Kristus Raja	Pastoran Katolik Kamanasa, Pos Atambua 85702	Timor-NTT					-	\N
2c5b2558-2925-4c96-9301-a573bd1519a7	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.047	47	Kaputu	St. Yohanes Pemandi	Pastoran Katolik Kaputu, Pos Atambua 85702	Timor-NTT					-	\N
e26c2ef8-b28c-488e-8fbc-54f99e5c4fcc	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.048	48	Kleseleon	St. Antonius Padua	Pastoran Katolik Kleseleon, Pos Atambua 85702	Timor-NTT					-	\N
65beda56-dd9e-4d04-a332-7e7f0c78358a	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.049	49	Laktutus	Hati Kudus Yesus	Pastoran Katolik Laktutus, Pos Atambua 85702	Timor-NTT					-	\N
105eb363-1475-497f-99c0-c6236e3c373a	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.050	50	Manumean	Hati Kudus Yesus	Pastoran Katolik Manumean, Pos Atambua 85702	Timor-NTT					-	\N
be45fda0-9c94-4973-973f-4bc052136758	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.051	51	Maubam	St. Paulus	Pastoran Katolik Maubam, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
ce8b4fea-19ac-4508-b96b-1a9f4f3b0f5e	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.052	52	Rafau	St. Yohanes Rasul	Pastoran Katolik Rafau, Pos Atambua 85702	Timor-NTT					-	\N
946a0b23-c291-4223-8acf-4f75d5e4fba5	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.053	53	Sasi	St. Antonius Padua	Pastoran Katolik Sasi, Pos Kefamenanu 85611	TTU-Timor-NTT					-	\N
7c1022cf-02fe-45c2-9ab9-d97d353bc2ce	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.054	54	Webora	St. Mikhael	Pastoran Katolik Webora, Atambua 85702	Timor-NTT					-	\N
e1361607-212e-44f8-ba3f-06d7f3965a06	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.055	55	Wekfau	St. Lukas	Pastoran Katolik Wekfau, Pos Atambua 85702	Timor-NTT					-	\N
7e95f714-eaf1-4f89-aa2b-097c07a3804e	8e8c8548-c97f-4c4a-b31f-f78a45423676	003.056	56	Wemasa	St. Laurensius	Pastoran Katolik Wemasa, Pos Atambua 85702	Timor-NTT					-	\N
6af8db09-875f-4c4b-8ffe-70159964f28d	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.001	1	Buah Batu	Hati Tak Bernoda S. P. M.	Jl Suryalaya No.3, Buah Batu	Bandung	022-7303922,  7323297			sekrehtbspm@yahoo.co.uk	-	\N
e2292f00-de36-46a2-93e8-477761abaf6f	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.002	2	Cicadas	St. Odilia	Jl Cikutra No.7, Cicadas	Bandung	022-7271501	022-7271501			-	\N
9b19a4b2-8dc7-474a-b538-255d01dbb4f6	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.003	3	Kamuning	Salib Suci	Jl Kamuning No.25, Kamuning	Bandung	022-7271310				-	\N
ef672682-faa7-420a-943c-896f73e39cba	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.004	4	Katedral	St. Petrus	Jl Merdeka No.14,	Bandung	022-4235537, 4235035, 4236386	022-4200262			-	\N
96520fd5-e3ae-4cd4-b27d-3c80722ebac1	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.005	5	Margahayu	St. Martinus	Kompl Kopo Permai I No.H/4 (Pastoran)	Bandung	022-5404263 (Pastrn) 5425038 (Grj)	022-5421545			-	\N
25d6675b-adce-48b8-9083-a9d73ba9e585	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.006	6	Melania	St. Melania	Jl Melania No. 1-3 (blkg. RRI)	Bandung	022-7210226				-	\N
5782420a-9d24-4d34-86f0-b8bd05c644c1	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.007	7	Mohammad Toha	St. Paulus	Jl Moh. Toha No.19,	Bandung	022-5207404,   52308368	022-5202430			-	\N
c2207547-5d5b-43bb-9608-e6526b7a788a	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.008	8	Pandu	St. Perawan Maria Sapta Kedukaan	Jl Pandu No.4, Pandu	Bandung	022-6011138				-	\N
25fbb528-1041-413d-a09d-ef02eb818ee2	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.009	9	Sukajadi	St. Laurentius	Jl Sukajadi No.223, Sukajadi	Bandung	022-2038462	022-2038183			-	\N
e96919bc-4e74-467c-96bf-f9044d263db0	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.010	10	Waringin	St. Michael	Jl Waringin No.51	Bandung	022-6018769 (Sekret) 6029628 (Pastrn)			stmichel@bdg.centrin.net.id	-	\N
2a673722-b70d-4e93-9001-fb5a5cfd3011	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.011	11	Kuningan	Kristus Raja	Jl Rumah Sakit No.7, Cigugur	Kuningan	0232-873210 (Past.Cigugur) 871767 (Past. Kuningan)				-	\N
804250d4-d4ea-4a15-9665-27d109081436	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.012	12	Cimahi	St. Ignatius	Jl Baros No.8, Cimahi	Bandung	022-6654052 (Sekr), 6640693 (Pastr)				-	\N
65168a18-7027-46dc-bc86-3b9b05efc65b	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.013	13	Dukuh Semar	Bunda Maria	Jl Dukuh Semar No.34,	Cirebon	0231-206232				-	\N
8fdb2ec2-ed71-40de-9472-6a7e51709c86	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.014	14	Yos Sudarso	St. Yusuf	Jl Yos Sudarso No.20,	Cirebon	0231-202200	0231-203691			-	\N
279f919b-70b6-4cfe-b022-d3886518fc33	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.015	15	Garut	St. Perawan Maria Yang Terkandung Tak Bernoda	Jl Bank No.50,	Garut	0262-233139			par@bdg.centrin.net.id	RD. Agus Nindia Nikolas	\N
969754ea-0279-46f9-92f5-5bd02cad6456	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.016	16	Indramayu	St. Mikael	Jl Bima Basuki No.14	Indramayu	0234-272023				-	\N
4e65c104-3b50-44a8-ab06-7f87d8270b23	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.017	17	Karawang	Kristus Raja	Jl Parahyangan No.45, 	Karawang	0267-412641	0267-400876			-	\N
3f138eaf-a40e-4c71-bd71-6f4478d8060e	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.018	18	Lembang	St. Maria Fatima	Jl Karmel I Np.51, Lembang	Bandung	022-2787331				-	\N
14b6011e-8bed-49b3-afcb-d3b430175312	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.019	19	Pamanukan	Maria Bunda Pembantu Abadi	Jl E.Tirtapraja No.31,	Pamanukan	0260-551167				-	\N
1828a92d-fb6d-47e5-9229-4288313cd63a	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.020	20	Purwakarta	Salib Suci	Jl Sudirman No.45	Purwakarta	0264-202789				-	\N
cbbd67a4-853c-4bbe-ba28-9e333d66ac1e	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.021	21	Subang	Kristus Sang Penabur	Jl Natasukarya No.18	Subang	0260-411338	0260-421805			-	\N
c8e2702c-32fe-4bcc-a37d-220e18d9ba7e	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.022	22	Tasikmalaya	Hati Kudus Yesus	Jl Sutisna Senjaya No.50,	Tasikmalaya	0265-331570	0265-331570			-	\N
4dfde9f1-dcb9-4f7c-9e30-a497d065456c	335cb05c-75cf-4351-9ef9-81df3f91a1d7	004.023	23	Sumber Sari	St. Gabriel	Jl Sumber Mekar 1-7 No.14, Komp Sumber Sari Indah	Bandung	022-6017177 (Sekr) 6121774 (Pastrn)			gandarusa@bdg.centrin.net.id	-	\N
34778a9e-83eb-4e44-97a9-3afac2415681	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.001	1	Banjarbaru	Bunda Maria	Jl A.Yani Km 36, Banjarbaru 70714	Kalimantan Selatan	0511-4772315	0511-4773385			-	\N
76d21f7a-ab0b-4b33-8cab-abf6c09de237	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.002	2	Katedral	Keluarga Kudus	Jl Lambung Mangkurat No.40, Banjarmasin 70111	Kalimantan Selatan	0511-3354725	0511-3363484			-	\N
86c50807-1b19-40bf-af6c-65cca02f4c41	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.003	3	Kelayan	Santa Perawan Maria Yang Terkandung Tanpa Noda	Jl Rantauan Timur I No.37, RT 32, Banjarmasin 70241	Kalimantan Selatan	0511-3260 669,   32637	0511-326 3712			-	\N
92de4567-0877-45c5-a0ea-531161d86f97	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.004	4	Veteran	Hati Yesus Yang Maha Kudus 	Jl Veteran No.2, Banjarmasin 70714	Kalimantan Selatan	0511-3255002				-	\N
739079fb-20bc-445c-8b14-7a9ce319cbdd	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.005	5	Batulicin	St. Vincentius a Paulo	Jl Sungai Kecil Km 3,5 Kotak Pos 125, Batulicin-Tanah Bumbu 72171	Kalimantan Selatan	0518-71129				-	\N
e07b0945-a022-48b7-ac82-48c5f52a7c08	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.006	6	Kota Baru	St. Yusup	Jl Singabana No.94, Kota Baru 72113	Kalimantan Selatan	0518-24526				-	\N
0157a5b8-0504-45a3-ba5b-b5c1296aaaf1	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.007	7	Pelaihari	St. Theresia	Jl Parit Mas No.15, Pelaihari 70814, Tanah Laut	Kalimantan Selatan	0512-21159				-	\N
41fd3149-8f25-4b90-87c5-f2cf322b716f	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.008	8	Tanjung	Ave Maria	Wisma Ave Maria Jl Ir PHM Noor No.36 Sulingan-Tanjung, Tabalong 71571 	Kalimantan Selatan	0526-2021046				-	\N
855ccb8f-55c0-4d18-a138-b737bc150a03	a5c23ef6-19df-44d9-b327-c1ee41470dd8	005.009	9	Sungai Danau	Stella Maris	Jl Propinsi Km 164,5 Simpang Empat Sumpol, Kec. Satui	Kab. Tanah Bambu	05125-61587				-	\N
6d81e502-e315-4292-a1e7-b56598027e57	612cae46-7dfa-485d-bb21-a1d787792ba6	006.001	1	Katedral	St. Perawan Maria	Jl Kapten Muslihat No.22	Bogor	0251-8321188, 8350813	0251-8370211			-	\N
4a3cf126-857b-431d-96a2-32a1845c36a8	612cae46-7dfa-485d-bb21-a1d787792ba6	006.002	2	Sukasari	St. Fransiskus dari Asisi	Jl Siliwangi No.50,	Bogor	0251-8324621				-	\N
1ddd1ec3-c01a-40a2-90ce-bc2ce2c75c54	612cae46-7dfa-485d-bb21-a1d787792ba6	006.003	3	Cianjur	St. Petrus	Jl Siliwangi No.66,	Cianjur	0263-261239	0263-271060			-	\N
b51ebdf8-30d1-4d80-b496-29ac14bc0348	612cae46-7dfa-485d-bb21-a1d787792ba6	006.004	4	Cibadak	St. Fransiskus Assisi	Jl Perintis Kemerdekaan No.27,	Cibadak	0266-531364				-	\N
4dbd946b-fd37-4b62-aa94-98d00e4cc8d4	612cae46-7dfa-485d-bb21-a1d787792ba6	006.005	5	Cibinong	Keluarga Kudus	Jl Mayor Oking No.15/527, Cibinong	Bogor	021-8753404	021-87900217			-	\N
aa273b41-855a-4452-86f3-478232ac4852	612cae46-7dfa-485d-bb21-a1d787792ba6	006.006	6	Cicurug	Hati Maria Tak Bernoda	Jl Siliwangi  35/87,	Cicurug	0266-731014				-	\N
655a8863-ab8d-4c70-832d-46622c0e96f9	612cae46-7dfa-485d-bb21-a1d787792ba6	006.007	7	Ciluar	St. Andreas	Jl BKIA No.9 RT 02/01, Cimandala, Sukaraja	Bogor	0251-8652953, 8655320	0251-8655320		st.andreaspparoki@yahoo.com	-	\N
55d7d1fa-d38d-4374-b09c-1156db5c5ec8	612cae46-7dfa-485d-bb21-a1d787792ba6	006.008	8	Cinere	St. Matias	Jl Baros No.3, Komplek A.L., Pangkalan Jati,	Cinere, Bogor	021-7667427,  7665872	021-7667427			RD. Paulus Haruna	\N
81e46264-efa9-4998-99fd-66552a12dce1	612cae46-7dfa-485d-bb21-a1d787792ba6	006.009	9	Cipanas	St. Maria Ratu Para Malaikat	Jl Raya Cipanas No.93, Cipanas	Cianjur	0263-512317				-	\N
2ca07af5-16b5-49ea-a1a8-b928b81a1b70	612cae46-7dfa-485d-bb21-a1d787792ba6	006.010	10	Depok Jaya	St. Herkulanus	Jl Irian Jaya No.1, Perumnas I,	Depok Jaya	021-7773536, 7521729				-	\N
14098108-b95e-45d4-9243-eff64035c38d	612cae46-7dfa-485d-bb21-a1d787792ba6	006.011	11	Depok Tengah	St. Matheus	Jl Sadewa Raya No.1,	Depok II Tengah	021-7701614				-	\N
af949fec-04cb-4792-b923-0225719e6531	612cae46-7dfa-485d-bb21-a1d787792ba6	006.012	12	Depok Timur	St. Markus	Jl Kerinci Raya No.11,	Depok II Timur	021-7703229	021-77820656			-	\N
0c56eb9a-6615-488c-bbdb-1333c6afe0e2	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.029	29	Wlingi	St. Petrus & St. Paulus	\N	Surabaya	\N	\N	\N	\N	-	Blitar
88db9dc9-279b-46e5-9021-30c202705c4d	612cae46-7dfa-485d-bb21-a1d787792ba6	006.013	13	Depok Lama	St. Paulus	Jl Melati No.4,	Depok	021-7520334	021-77204851			Yosef Paleba Tolok, OFM	\N
0c056535-68ad-42d5-b8f7-025ba66dadd5	612cae46-7dfa-485d-bb21-a1d787792ba6	006.014	14	Kelapa Dua	St. Thomas	Ksatrian Korps Brimob Amji Atak, Kelapa Dua	Cimanggis	021-8715526	021-87706362			-	\N
60ca57d4-02de-4d6f-992d-87be27395064	612cae46-7dfa-485d-bb21-a1d787792ba6	006.015	15	Mega Mendung	St. Yakobus	Jl Kelud, Komp. Pertamina, Cipayung, Megamendung	Bogor	0251-8252919				-	\N
15f90cd2-f0af-4a9d-b406-df1bc76e7138	612cae46-7dfa-485d-bb21-a1d787792ba6	006.016	16	Parung	St. Joannes Baptista	Jl Metro Parung No.36, Kp Tulang Kuning RT 01/06, Desa Waru, Kec.Parung	Bogor	0251-610067				-	\N
59420612-ec18-4e5c-ab0c-a2b2b622624b	612cae46-7dfa-485d-bb21-a1d787792ba6	006.017	17	Rangkasbitung	St. Maria Tak Bernoda	Jl Multatuli No.38, 	Rangkasbitung	0252-201652				-	\N
d7198a90-e7dc-4793-ac0f-417ef596d0df	612cae46-7dfa-485d-bb21-a1d787792ba6	006.018	18	Serang	Kristus Raja	Jl H. Sbdullah No.2,	Serang	0254-200034	0254-200034			-	\N
0501688e-6706-42c5-8446-5f007fb07097	612cae46-7dfa-485d-bb21-a1d787792ba6	006.019	19	Sukabumi	St. Yoseph	Jl Suryakencana No11,	Sukabumi	0266-224574				-	\N
6e24c94b-8b67-442b-bc8a-b9242b0df345	612cae46-7dfa-485d-bb21-a1d787792ba6	006.020	20	Sentul City	St. Maria Fatima	Ruko Plaza Amsterdam Blok D No.26-28	Sentul City, Bogor	021-87962476				-	\N
be53526e-6301-4d8b-aeab-34678b869619	612cae46-7dfa-485d-bb21-a1d787792ba6	006.021	21	Cileungsi	Maria Bunda Segala Bangsa	Jl Transyogi Km 6, Kota Wisata, Cibubur	Bogor	021-84932402				-	\N
250c1f47-fae0-4077-ba93-18b4599c5b37	dbb04881-7771-40b1-b3f3-c6451c93015c	007.001	1	Amlapura/Karangasem	St. Fransiskus Asisi	Gereja Katolik St Fransiskus Asisi, Jl Untung Surapati	Amlapura	0363-21255				-	\N
7e71e58e-f320-44a3-94c0-8e4fddf1940f	dbb04881-7771-40b1-b3f3-c6451c93015c	007.002	2	Ampenan / Lombok Barat	St. Antonius	Jl Majapahit No.10, Ampenan, Lombok 83114,	NTB	0370-634397				-	\N
2ae6401d-8a3c-4c86-b6c8-9b2fc5ca7fdf	dbb04881-7771-40b1-b3f3-c6451c93015c	007.003	3	Babakan/Bali	Roh Kudus	Pastoran Katolik Babakan/Canggu, Kec. Kuta Utara, Kab. Badung	Bali	0361-7441206				-	\N
43a54758-9258-4bb8-830f-ec93848b3597	dbb04881-7771-40b1-b3f3-c6451c93015c	007.004	4	Denpasar/Bali	St. Yoseph	Jl Kepundung No.2, Kotak Pos 28,	Denpasar	0361-222729				-	\N
00022325-8ba2-47ad-be1d-9931d364464a	dbb04881-7771-40b1-b3f3-c6451c93015c	007.005	5	Dompu / Sumbawa	St. Maria - St. Yoseph	Jl Pinus No.3, Dompu	NTB	0373-21655				-	\N
e254243e-ac2f-4085-8827-981e4f5fa035	dbb04881-7771-40b1-b3f3-c6451c93015c	007.006	6	Donggo / Bima-Sumbawa-NTB	St. Yohanes Maria Vianney	Gereja Katolik St Yoseph, Jl Pepaya No.1, Raba	Bima	0374-43258				-	\N
51e27459-6e76-453d-bb37-e7e4aad84ddb	dbb04881-7771-40b1-b3f3-c6451c93015c	007.007	7	Gianyar/Bali	St. Maria Ratu Rosari	Gereja Katolik St Maria Ratu Rosari, Jl Mulawarman 92A,	Gianyar, Bali	0361-943457				-	\N
d560d758-f3aa-45d2-9688-5286ead15b6f	dbb04881-7771-40b1-b3f3-c6451c93015c	007.008	8	Gumbrih/Bali	St. Maria Ratu	Pastoran Katolik St Maria Ratu, Jl Gereja No.4 Gumbrih, Pekutatan, Jembrana,	Bali	0365-43325				-	\N
8cec1edd-4caf-452b-86ac-520f2dc1dcc7	dbb04881-7771-40b1-b3f3-c6451c93015c	007.009	9	Katedral	Roh Kudus	Gereja Katolik Katedral Roh Kudus, Jl Tukad Musi No.1 Renon, 	Denpasar, Bali	0361-241303				-	\N
3d267bdd-a463-4d34-a2db-92a2907d9eb1	dbb04881-7771-40b1-b3f3-c6451c93015c	007.010	10	Klungkung-Stasi/Bali	St. Caecilia	Graha St Caecilia, Jl Dewi Sartika, Klungkung	Bali	0366-21596				-	\N
7ac0520d-02ff-48fc-88c6-060dc944318a	812df38d-e018-4c66-8eb3-6432e1245caf	036.012	12	Nabire	Kristus Sahabat Kita		Jayapura					-	\N
362d45f7-546c-46c1-900c-8e68ef00c447	dbb04881-7771-40b1-b3f3-c6451c93015c	007.011	11	Kulibul/Badung-Bali	St. Paulus	Gereja Katolik St Paulus, Jl Raya Padonan No.65, Kulibul, Cangu, Kuta Utara,	Bali	0361-437082				-	\N
e9b26a3e-0f00-4898-ab80-ccb59949b1d7	dbb04881-7771-40b1-b3f3-c6451c93015c	007.012	12	Mataram / Lombok Barat	St. Maria Immaculata	Pastoran Katolik Mataram, Jl Pejanggik No.37,	Mataram	0370-641707	0370-632092			-	\N
d0c4a156-459e-473a-9bae-e4addc93816a	dbb04881-7771-40b1-b3f3-c6451c93015c	007.013	13	Monang Maning/Denpasar	St. Petrus	Pastrn. Katolik Monang Maning, Jl Gunung Batok I/1 Monang Maning, Denpasar Barat,	Bali.	0361-482568				-	\N
37554adf-9183-4652-b707-ed3803b1e436	dbb04881-7771-40b1-b3f3-c6451c93015c	007.014	14	Negara/Bali	St. Petrus	Pastorn Katolik Negara, Jl Gatot Subroto 1, Negara 82213,	Bali.	0365-41296				-	\N
561bc8d2-37e4-46ce-b94d-6029ab6f4496	dbb04881-7771-40b1-b3f3-c6451c93015c	007.015	15	Nusa Dua-Stasi/Bali	Maria Bunda Segala Bangsa	Kompleks Puja Mandala, Jl Bukit Kampial	Nusa Dua	0361-774811				-	\N
a8cff16e-b1cd-4b31-8dd4-379e588292f2	dbb04881-7771-40b1-b3f3-c6451c93015c	007.016	16	Palasari/Jembrana-Bali	Hati Kudus Yesus	Jl Gereja, Palasari, Melaya, 	Jembrana	0365-42201				-	\N
76041737-5bca-436f-8dee-7a9e9fd6229d	dbb04881-7771-40b1-b3f3-c6451c93015c	007.017	17	Praya / Lombok Tengah	St. Yohanes Pemandi	d/a Dekenat NTB, Jl Pejanggik No.37, Mataram	Lombok.	0370-632092				-	\N
e56630d3-4024-4de9-93a5-d5f1a0533e38	dbb04881-7771-40b1-b3f3-c6451c93015c	007.018	18	Raba / Bima NTB	St. Yoseph	Pastoran Katolik Raba Bima, Jl Pepaya No.1, Raba, Bima	Sumbawa, NTB.	0374-43258				-	\N
6c9c4951-02b4-478c-a475-c3ab8729eac3	dbb04881-7771-40b1-b3f3-c6451c93015c	007.019	19	Singaraja/Buleleng-Bali	St. Paulus	d/a Keuskupan Denpasar, Jl Rambutan No.27, Denpasar 80030,	Bali.	0361-222020  -  0362-21919				-	\N
d1192a81-9adc-4453-85f4-e1f4afb57237	dbb04881-7771-40b1-b3f3-c6451c93015c	007.020	20	Sumbawa Besar / Sumbawa NTB	Sang Penebus	Jl Diponegoro No.34,	Sumbawa Besar-NTB.	0371-21718				-	\N
727895f9-406f-4e32-b732-f79dec841336	dbb04881-7771-40b1-b3f3-c6451c93015c	007.021	21	Tabanan/Bali	St. Maria Immaculata	Pastoran Katolik, Jl Singosari No.5A, Tabanan 82113	Bali.	0361-813165				-	\N
bd1a7371-ba1d-4c97-898f-2de49ee8dab5	dbb04881-7771-40b1-b3f3-c6451c93015c	007.022	22	Tangeb/Tangeb-Bali	St. Theresia	Banjar Tengah, Tangeb-Kapal Mengwi, Kab.Badung,	Bali.	0361-428134				-	\N
fb789c13-bc67-41bf-a2c6-f84dcabdbdfb	dbb04881-7771-40b1-b3f3-c6451c93015c	007.023	23	Kuta/Bali	St. Fransiskus Xaverius	Pastrn. Katolik St. Fransiskus Xaverius, Jl Dewi Sartika 107, Kuta 80361	Bali.	0361-751144,  750043				-	\N
dc75f778-232a-4bd7-9594-c5bbca2b3e28	dbb04881-7771-40b1-b3f3-c6451c93015c	007.024	24	Tuka (Badung-Bali)	Tritunggal Maha Kudus	Banjar Tuka Desa Dalung, Kec.Kuta, Kab.Badung,	Bali.	0361-439820				-	\N
7acce5b5-68ee-40d1-8613-efa2ae8720b2	7ae43790-6b59-45c8-965f-535cd37e8542	008.001	1	Aimere / Kombos	St. Fransiskus Asisi dan St. Clara	Pastoran Katolik Aimere, Flores, Pos Bajawa 86452,	Flores NTT.					-	\N
c3898f44-2cf7-4201-938a-99b01fa0eeac	7ae43790-6b59-45c8-965f-535cd37e8542	008.002	2	Bajawa 1	St. Maria Mater Boni Consili (Bunda Penasihat Baik)	Pastoran Katolik MBC, Jl Mgr Sugijopranoto, Bajawa 86412,	Flores NTT	0384-21084				-	\N
20c4b959-a010-41d8-9e8c-f1fe98505d30	7ae43790-6b59-45c8-965f-535cd37e8542	008.003	3	Bajawa 2	St. Yosef	Pastoran Katolik St.Yosef, Jl S.Parman,	Bajawa.					-	\N
88544a7b-ea68-4373-b775-3af3c05ce48e	7ae43790-6b59-45c8-965f-535cd37e8542	008.004	4	Bekek	St. Petrus Dan Paulus	Pastoran Katolik Bekek, Ngada, Bajawa 86471,	Flores NTT					-	\N
402c1a9b-0bbd-4b08-9287-df9201089b1e	7ae43790-6b59-45c8-965f-535cd37e8542	008.005	5	Boanio	Hati Yesus Dan Hati Maria	Pastoran Katolik Boanio, Nagekeo,	Flores-NTT					-	\N
b3b87c48-50c2-4311-a532-75818ddfeae1	7ae43790-6b59-45c8-965f-535cd37e8542	008.006	6	Boawae	St. Fransiskus Xaverius	Pastoran Katolik Boawae, Nagekeo, 	Flores NTT					-	\N
038c111e-e03b-4261-8f74-cb23212321a7	7ae43790-6b59-45c8-965f-535cd37e8542	008.007	7	Boba	Salvatoris Resurgentis	Pastoran Katolik Boba, Ngada, Bajawa 86461,	Flores NTT.					-	\N
847cd9a4-fd0d-456e-a084-99df8bf64854	7ae43790-6b59-45c8-965f-535cd37e8542	008.008	8	Danga	Stella Maris	Pastoran Katolik Danga, Nagekeo,	Flores-NTT					-	\N
11220ef5-6df9-4e40-bc8c-4e3e2e56b0d6	7ae43790-6b59-45c8-965f-535cd37e8542	008.009	9	Detukeli	Roh Kudus	Pastoran Katolik Detukeli, Ende 86371,	Flores NTT.					-	\N
03fc54a8-127c-4ec5-a150-5630bab63ba4	7ae43790-6b59-45c8-965f-535cd37e8542	008.010	10	Detusoko	St. Yosef	Pastoran Katolik Detusoko, Ende 86371	Flores-NTT.					-	\N
16c09889-cfae-434d-8fff-69ee5b830be1	7ae43790-6b59-45c8-965f-535cd37e8542	008.011	11	Dhoki	St. Yosef	Pastoran Katolik Dhoki, Nagekeo,	Flores-NTT.					-	\N
576e8a54-db61-4992-801d-6a66c376cdd6	7ae43790-6b59-45c8-965f-535cd37e8542	008.012	12	Ende	Kristus Raja	Pastoran Katolik Katedral, Jl Katedral No.5, Ende 86312	Flores-NTT.	0381-21145				-	\N
fb6550c1-269a-49d4-b00e-f278f74d9be6	7ae43790-6b59-45c8-965f-535cd37e8542	008.013	13	Jerebuu	St. Paulus	Pastoran Katolik Jerebuu, Ngada,	Flores-NTT					-	\N
73696fcf-b805-404f-94ef-833338467574	7ae43790-6b59-45c8-965f-535cd37e8542	008.014	14	Jopu	St. Perawan Maria Yang Terkandung Tanpa Noda	Pastoran Katolik Jopu, Ende 86372,	Flores-NTT.					-	\N
c87fa885-603b-48cc-acfc-6dd7d1bfe1c3	7ae43790-6b59-45c8-965f-535cd37e8542	008.015	15	Kombandaru	St. Maria Magdalena Sophia Barat	Pastoran Katolik Kombandaru, Ende,	Flores-NTT					-	\N
516df0f4-de15-46e7-b541-898d74ad8664	7ae43790-6b59-45c8-965f-535cd37e8542	008.016	16	Kotabaru	St. Dominikus	Pastoran Katolik Kotabaru Lio Utara, Ende 86381,	Flores-NTT					-	\N
7d549272-1025-4772-b5dc-8b85545e6ab1	7ae43790-6b59-45c8-965f-535cd37e8542	008.017	17	Laja	St. Yosef		Ende					-	\N
847c0f1b-4e3a-4873-9900-84a761ec70ab	7ae43790-6b59-45c8-965f-535cd37e8542	008.018	18	Langa	St. Mariae Matris Salvatoris	Pastoran Katolik Langa, Bajawa,	Flores-NTT					-	\N
e71cf89e-533f-4440-9bfb-c0faec1f7958	7ae43790-6b59-45c8-965f-535cd37e8542	008.019	19	Mangulewa	Matris Dolorosae	Pastoran Katolik Mangulewa, Bajawa 86461,	Flores-NTT					-	\N
68ba869e-d53a-4a79-8f6a-6a0286675d90	7ae43790-6b59-45c8-965f-535cd37e8542	008.020	20	Maronggela	Maria Diangkat Ke Surga	Pastoran Katolik Maronggela, Bajawa 86471,	Flores-NTT.					-	\N
961375a3-311d-4da7-9135-88629ed25fd1	7ae43790-6b59-45c8-965f-535cd37e8542	008.021	21	Mataloko	Roh Kudus	Pastoran Katolik Mataloko, Ngada,	Flores-NTT					-	\N
3cb3bd50-d71a-4056-99a0-0edcf873912f	7ae43790-6b59-45c8-965f-535cd37e8542	008.022	22	Maukeli	St. Mikael	Pastoran Katolik Maukeli, Nagekeo,	Flores-NTT					-	\N
6d47e669-4239-45ae-9b6c-515ae7c39e2e	7ae43790-6b59-45c8-965f-535cd37e8542	008.023	23	Maunori	Hati Kudus Yesus	Pastoran Katolik Maunori, Nagekeo,	Flores-NTT					-	\N
334478a3-e4bc-425d-9c46-b67c5ac5dd3e	7ae43790-6b59-45c8-965f-535cd37e8542	008.024	24	Maurole	Salib Suci	Pastoran Katolik Maurole, Ende 86381,	Flores-NTT					-	\N
fbe4f522-8da7-461c-bbd6-9a091d4ff1cb	7ae43790-6b59-45c8-965f-535cd37e8542	008.025	25	Mautapaga	St.Yosef Frainademetz	Pastoran Katolik Mautapaga, Jl Gatot Subroto, Ende 86317	Flores-NTT	0381-22027				-	\N
445968ae-5396-43dd-958b-9b59dcfc6143	7ae43790-6b59-45c8-965f-535cd37e8542	008.026	26	Mautenda	Emanuel	Pastoran Katolik Mautenda, Welamosa, Ende 86371,	Flores-NTT					-	\N
2e95ad14-5469-4058-a87e-a7f4e5cca26a	7ae43790-6b59-45c8-965f-535cd37e8542	008.027	27	Moni	Hati Amat Kudus S.P. Maria	Pastoran Katolik Moni, Ende 86372,	Flores-NTT					-	\N
999f6f61-70a5-4dc1-84fe-f6759549493d	7ae43790-6b59-45c8-965f-535cd37e8542	008.028	28	Mukusaki	Kristus Raja	Pastoran Katolik Mukusaki, Ende 86371	Flores-NTT					-	\N
d64e0f4b-bf6f-47a4-9fb5-028bcb79b88a	7ae43790-6b59-45c8-965f-535cd37e8542	008.029	29	Mundemi	St. Mikhael	Pastoran Katolik Mundemi, Nagekeo,	Flores-NTT					-	\N
3bdc4d99-9c55-47f5-bacc-ff15fb34d5cb	7ae43790-6b59-45c8-965f-535cd37e8542	008.030	30	Nangaroro	St. Martinus	Pastoran Katolik Nangaroro, Nagekeo,	Flores-NTT					-	\N
56a1eef7-487a-4df0-a5d4-2329df8f87f2	7ae43790-6b59-45c8-965f-535cd37e8542	008.031	31	Nangapanda	St. Eduardus	Pastoran Katolik Ngapanda, Ende 86352,	Flores-NTT					-	\N
65df04df-838b-4666-a98f-5da9545ca546	7ae43790-6b59-45c8-965f-535cd37e8542	008.032	32	Ndona	Maria Immaculata	Pastoran Katolik Ndona, Pos Ende 86361,	Flores-NTT					-	\N
2960b856-0a0d-40e8-b6af-391898d39d2e	7ae43790-6b59-45c8-965f-535cd37e8542	008.033	33	Ndondo	St. Fransiskus Xaverius	Pastoran Katolik Ndondo, Loboniki, Ndondo, Ende	Flores-NTT					-	\N
c25ab3fc-49f2-4f4b-85aa-068fef2b9f86	7ae43790-6b59-45c8-965f-535cd37e8542	008.034	34	Ndora	Petrus Martir	Pastoran Katolik Ndora, Nagekeo,	Flores-NTT					-	\N
6b1a0dd2-678c-420a-a719-a19fde95850d	7ae43790-6b59-45c8-965f-535cd37e8542	008.035	35	Nggela	St. Theresia Kanak-kanak Yesus	Pastoran Katolik Nggela, Ende,	Flores-NTT.					-	\N
ec2c9b38-7a1a-48f7-91f0-21bac894d9cc	7ae43790-6b59-45c8-965f-535cd37e8542	008.036	36	Onekore	St. Yosef	Pastoran Katolik Onekore, Jl Wijaya, Ende,	Flores-NTT	0381-21156				-	\N
7a2db436-a2f8-482d-a9dc-c5b52381f404	7ae43790-6b59-45c8-965f-535cd37e8542	008.037	37	Raja	St. Yosef	Pastoran Katolik Raja, Nagekeo,	Flores-NTT					-	\N
d735f2a2-6584-43b2-9c56-6524c95df947	7ae43790-6b59-45c8-965f-535cd37e8542	008.038	38	Ratesuba	St. Vincentius A Paulo	Pastoran Katolik Ratesuba, Ende,	Flores-NTT					-	\N
55cb569f-426a-4dac-8c34-274980ee71eb	7ae43790-6b59-45c8-965f-535cd37e8542	008.039	39	Riti	Kristus Raja	Pastoran Katolik Riti, Nagekeo,	Flores-NTT					-	\N
5734862b-9ab6-4178-9ae0-ec8869e89c80	7ae43790-6b59-45c8-965f-535cd37e8542	008.040	40	Roworeke	St. Martinus	Pastoran Katolik Roworeke, ende 86319,	Flores-NTT					-	\N
363991b6-5d6f-4369-bbfa-924d470364f6	7ae43790-6b59-45c8-965f-535cd37e8542	008.041	41	Ruto	St. Martinus	Pastoran Katolik Ruto, Ngada, Bajawa 86452,	Flores-NTT					-	\N
4ec83ce2-1d91-4eeb-b0ab-b1073a8b6532	7ae43790-6b59-45c8-965f-535cd37e8542	008.042	42	Soa	Salib Suci	Pastoran Katolik Soa, Bajawa 86451,	Flores-NTT					-	\N
ec5a1a24-09f7-4c5b-b573-6edba6324c8a	7ae43790-6b59-45c8-965f-535cd37e8542	008.043	43	Wangka	Hati Kudus Yesus	Pastoran Katulik Wangka, Bajawa 86471,	Flores-NTT					-	\N
7fac39a5-1652-4bb6-ac93-82a80e0ddd12	7ae43790-6b59-45c8-965f-535cd37e8542	008.044	44	Watuneso	Hati Kudus Tuhan Yesus	Pastoran Katolik Watuneso, Ende 86372,	Flores-NTT					-	\N
ae1e450d-27a9-4db3-9e92-bbbf7f38fde6	7ae43790-6b59-45c8-965f-535cd37e8542	008.045	45	Wekaseko	St. Hubertus	Pastoran Katolik Wekaseko, Nagekeo,	Flores-NTT					-	\N
78323e42-0e92-4a8d-9d4d-e549787785cd	7ae43790-6b59-45c8-965f-535cd37e8542	008.046	46	Wolosambi	St. Yohanes Baptista	Pastoran Katolik Wolosambi, Nagekeo,	Flores-NTT					-	\N
fd104858-5c86-4414-a8d7-6e0e779fc590	7ae43790-6b59-45c8-965f-535cd37e8542	008.047	47	Wolotolo	Kristus Raja	Pastoran Katolik Wolotolo, Ende 86371,	Flores-NTT					-	\N
ed3a9274-b479-4c4c-afae-b05758290b19	7ae43790-6b59-45c8-965f-535cd37e8542	008.048	48	Wolotopo	St. Fransiskus Xaverius	Pastoran Katolik Wolotopo, Ende 86361,	Flores-NTT					-	\N
3e33954b-4b60-4223-b627-ea186ca8439f	7ae43790-6b59-45c8-965f-535cd37e8542	008.049	49	Wolowaru	Hati Kudus Tuhan Yesus	Pastoran Katolik Wolowaru, Ende 86372,	Flores-NTT	0381-41030				-	\N
c5f1d9bc-8ffb-48f8-9274-4bdbefadc55e	7ae43790-6b59-45c8-965f-535cd37e8542	008.050	50	Wonda	Maria Diangkat Ke Surga	Pastoran Katolik Wonda, Ende,	Flores-NTT					-	\N
e0e75bbb-984d-4952-b197-001f7fd3e4e3	7ae43790-6b59-45c8-965f-535cd37e8542	008.051	51	Worhonio	St. Maria	Pastoran Katolik Worhonio, Ende 86319	Flores-NTT	0381-23283				-	\N
4a0fcaaf-bc08-4adc-87a2-d8b25f797e66	7ae43790-6b59-45c8-965f-535cd37e8542	008.052	52	Wudu	Immaculati Cordis Mariae	Pastoran Katolik Wudu, Nagekeo,	Flores-NTT					-	\N
c3c69e49-8e84-4850-9ca1-add1c5e584bc	7ae43790-6b59-45c8-965f-535cd37e8542	008.053	53	Aeramo	Yesus Kerahiman Ilahi	Pastoran Katolik Aeramo-Nagekeo,	Flores NTT					-	\N
a6763d0c-9523-44f7-88a7-a258b6ad63cb	7ae43790-6b59-45c8-965f-535cd37e8542	008.054	54	Gako	St. Fransiskus Asisi	Pastoran Katolik Gako, Nagekeo,	Flores-NTT.					-	\N
9a6f0414-9992-4688-80bc-6ad5be3287ab	7ae43790-6b59-45c8-965f-535cd37e8542	008.055	55	Rajawawo	St. Maria Bunda Karmel	Pastoran Katolik Rajawawo, Ende 86352,	Flores-NTT					-	\N
9705a470-b5c5-4510-9add-985c022a11a9	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.001	1	Bekasi	St. Arnoldus	Jl. Ir. H. Juanda No.164	Bekasi	021-8801763	021-88347168		b-arnoldus@yahoo.com	-	\N
9e3c0e47-46c2-4499-a019-c3f136cae4b6	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.002	2	Bekasi Utara	St. Klara	Taman Wisma asri, Blok T/4-6	Bekasi	021-8870327	021-8870327		kapbekasi@hotmail.com	-	\N
15732226-01fe-49f6-8462-746ec88d8a2e	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.003	3	Bidaracina	St. Antonius Padua	Jl Otto Iskandardinata No.76A	Jakarta	021-8192305,  85905064	021-8508304			-	\N
9274363a-e5ce-43cb-b88d-bd81e4b24ec8	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.004	4	Bintaro	St. Matius Penginjil	Jl. Raya Utama I, Pondok Karya, Bintaro	Tangerang	021-7358123,  73882716	021-73882715	www.santomatius.org	stmatius@cbn.net.id	Pastor Silvano Laurenzi, SX	\N
29477688-fc62-4ebd-9519-75a9c2b62dac	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.005	5	Blok B	St. Yohanes Penginjil	Jl Melawai Raya No.197	Jakarta	021-7220763	021-7220558		gstyohan@bit.net.id	-	\N
96b5a497-e21b-4f3a-902a-353d54590eb0	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.006	6	Blok Q	St. Perawan Maria Ratu	Jl Suryo No.62,	Jakarta	021-7208640	021-7268611		spmratu@cbn.net.id	-	\N
440f6522-2ba9-43b2-9bf6-c43f6e15fc88	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.007	7	Bojong Indah	St. Thomas Rasul	Jl Pakis Raya Blok G V No.20,	Jakarta	021-5810977,  5811602	021-5810978		sathora@centrin.net.id	-	\N
59c02393-9fb1-4596-90fa-5559b625af4b	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.008	8	Cempaka Putih	St. Paskalis	Jl Letjen Suprapto Kav. C1/23	Jakarta	021-4202793	021-4203743		paskalis@indosat.net.id	-	\N
ebc84caf-6cc3-4d18-9241-232887aaed83	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.009	9	Cengkareng	Trinitas	Jl Bambu Kuning IX No.1-2, Cengkareng Barat	Jakarta	021-6193882	021-6191628		omitrin@dnet.net.id	-	\N
8d5f5762-f602-48a7-b181-5a502af3b3b8	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.010	10	Cideng	St. Maria Bunda Perantara	Jl Tanah Abang II No.105	Jakarta	021-3843784,  past 021-3453305	021-3522407			-	\N
0873cb9a-5971-4c07-a408-cb7953ea6019	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.011	11	Cijantung	St. Aloysius Gonzaga	Jl Pendidikan III No.2, Cijantung II	Jakarta	021-8400465	021-8408958		gonzalo@dnet.net.id	-	\N
48929b26-0ea3-43d2-b8d2-a1db09acf35c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.012	12	Cilandak	St. Stephanus	Jl Muhasyim IV No.2 Rt 012/06, Cilandak	Jakarta	021-7512669,  7501629	021-7501628			-	\N
6a7faa92-5049-44ae-b6c3-495970c8079c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.013	13	Cilangkap	St. Yohanes Maria Vianney	Jl Bambu Wulung No.60, Rt 033/05 Cipayung	Jakarta	021-8444893	021-8444893			-	\N
7e5e2563-624e-4367-86bf-8a5b9ef7b500	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.014	14	Ciledug	St. Bernadet	Jl Barata Raya No.32, Kompl. Barata	Tangerang	021-7306550,  7338483	021-7338483			Paulus Dalu Lubur, CICM	\N
525f04d6-f759-45ed-8c88-04b7a00b975c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.015	15	Cililitan	St. Robertus Bellarminus	Jl Kelapa Gading III No.38, Kramatjati	Jakarta	021-8001550,  8007054	021-8007053		Bellarminusrobertus@yahoo.com	-	\N
5a57f006-d629-458b-9465-39074964f6ed	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.016	16	Cilincing	Salib Suci	Jl Raya Tugu No.12 Rt 003/014, Semper	Jakarta	021-4405740	021-4400769			-	\N
b75ac23c-52ca-4e50-952e-beb9841afe6c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.017	17	Duren Sawit	St. Anna	JL. Laut Arafuru Blok A VII No.7 Komp TNI-AL	Jakarta	(021) 861 2817, 8660 2879	021-8660 2881	http://gerejastanna.org	st-anna@centris.net.id	-	\N
07f6d494-7950-4ea0-bedf-e72e905902bc	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.018	18	Grogol	St. Kristoforus	Jl Satria IV Blok C/68, Jelambar	Jakarta	021-5602644,  5602650	021-567 2361			-	\N
ea0faf1e-dba3-45b4-9890-5fa5a0a7b48c	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.030	30	Tulungagung	St. Maria Medali Wasiat	\N	Surabaya	\N	\N	\N	\N	-	Blitar
9e9f249f-7bca-4294-a599-72a64a364c83	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.019	19	Jagakarsa	Ratu Rosari	Jl Sirsak No.14 Rt 006/07,	Jakarta	021-7864570,  7863845	021-7864570			-	\N
6def5d54-5523-44e7-947e-4fcada418ed4	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.020	20	Jalan Malang	St. Ignatius	Jl Malang No.22	Jakarta	021-3151324,  3150924	021-3151324			-	\N
b2a33506-f500-489e-ae3f-e0fd28393434	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.021	21	Jatibening	St. Leo Agung	Jl Manunggal Pratama No.6, Komp KODAM , Jatiwaringin	Jakarta	021-8629945,  8628967	021-8628967			-	\N
f0dec9c9-64d4-4a44-93c2-5fe786b0aa13	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.022	22	Kampung Duri	Damai Kristus	Jl Duri Selatan V No.29 RT 015/05	Jakarta	021-6303147	021-63855547			-	\N
5217342f-9e61-472f-88e6-27dfa700ac8f	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.023	23	Kampung Sawah	St. Servatius	Jl Gereja No.75 RT 006/04, Pondok Gede	Bekasi	021-8449967	021-84599809			-	\N
c6cec91f-7ef0-42cf-a161-ec16c70246ad	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.024	24	Kapuk	St. Philipus Rasul	Jl Teluk Agung Raya No.19BC RT 010/07	Jakarta	021-6613595	021-6683472			-	\N
3ba4432a-fff7-41b3-83b7-d2830db17946	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.025	25	Karawaci	St. Agustinus	Jl Prambanan No.1A, Perumnas II, Karawaci	Tangerang	021-5916622,  55652266	021-5536972			-	\N
ae236be0-23bb-4e59-9218-a9a866e6f31c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.026	26	Katedral	St. Perawan Maria Diangkat Ke Surga	Jl Katedral No.7B	Jakarta	021-3457746,  3519186	021-3509952			Albertus Hani Rudi Hartoko, SJ	\N
163302b2-25f2-4c28-8922-9c9899ef22c2	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.027	27	Kedoya	St. Andreas	Green Garden Blok J V/1 Rt 008/04	Jakarta	Sekr.021-5824971,5824972, Past.5824973	021-5804059			-	\N
424f9072-c030-4a1d-8dff-f01f8341de60	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.028	28	Kelapa Gading	St. Yakobus	Kompleks TNI AL, Jl Sunter Kodamar, Kelapa Gading Barat	Jakarta	021-4501028	021-45841432			-	\N
b11d9bf0-4ccd-487d-806f-9ae36018dd90	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.029	29	Kemakmuran	Bunda Hati Kudus	Jl Hasyim Ashari No.28,	Jakarta	021-6337363,  6339343	021-6339348		parbhk@centrin.net.id	-	\N
5449d5a7-367f-4918-b725-601e7a0e7dc4	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.030	30	Kramat	Hati Kudus	Jl Kramat Raya No.134,	Jakarta	021-3909689,  3928738	021-3928738			P. Yustinus Agung Setiadi, OFM	\N
5cc4df7c-cbd2-41d8-a5c0-1a2b51ad9474	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.031	31	Kranji	St. Mikael	Jl Bintara Raya Gg Strada I No.38, Kranji	Bekasi	021-8846838,  88851155	021-8846838		paroki_st.mikael@yahoo.co.id	Yoseph Jaga Dawan, SVD	\N
7ccd2d95-ae17-4588-a9c6-789d68fefa14	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.032	32	Lubang Buaya	Kalvari	Jl Masjid Al Umar No.1B, Lubang Buaya	Jakarta	021-87791911	021-87791911			-	\N
66540c1f-6ef5-4e9c-a871-ef5b50c809fb	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.033	33	Mangga Besar	St. Petrus dan Paulus	Jl Raya Mangga Besar No.55,	Jakarta	021-6294867,  6011893	021-6011894			Adrianus Padmasaputra, SJ	\N
b5b6a5da-139e-4981-b545-fc498c86d2f8	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.034	34	Matraman	St. Yoseph	Jl Matraman Raya No.127	Jakarta	021-8583782	021-8568417			-	\N
57b1cc93-d4f2-4956-acf4-7b84d2085c75	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.035	35	Meruya	St. Maria Kusuma Karmel	Jl Kusuma No.1, Kav. DKI Meruya Selatan	Jakarta	021-5858047,  5858048	021-5866509		makuka@indosat.net.id	-	\N
e6fe9251-1211-4fe7-a29e-a48360772204	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.036	36	Pademangan	St. Alphonsus Rodriguez	jl Pademangan II Gg VII No.7,	Jakarta	021-64712610,  64715681	021-64715681			-	\N
35f93039-1f29-42f2-bec8-1d0dae66bd06	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.037	37	Pamulang	Rasul Barnabas	Jl Salam No.3 Rt 002/05, Pd Cabe Udik, Pamulang	Tangerang	021-74713568	021-4713567		barnabas@cbn.net.id	-	\N
6ce30426-2067-4cbd-b2e1-a8d502b88000	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.038	38	Pasar Minggu	Keluarga Kudus	Jl Pertanian III No.26, Pasar Minggu	Jakarta	021-7806237	021-78843851		kkpsm_326@msn.com	-	\N
97779c05-c6f6-4ea5-9116-46c0df661a6a	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.039	39	Pejompongan	Kristus Raja  (Grj Jl Danau Toba No.58)	Pstrn. Jl Danau Buyan F1 No.25A, Pejompongan,	Jakarta	021-5733383	021-5733383			-	\N
03a47733-b01d-4d24-a7bf-52234b48c867	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.040	40	Pluit	Stella Maris  (Grj. Jl Taman Pluit Permai Timur 17)	Pstrn. Jl Pluit Utara Raya No.63E,	Jakarta	021-6691642,  66944557	021-6694557			-	\N
c2197717-6771-4406-981c-c42b2dbc24bc	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.041	41	Pulogebang	St. Gabriel	Perum Pulo Gebang Permai Blok J6 No.1-2	Jakarta	021-48702005,  48702007	021-48700164			-	\N
7c5e229f-29d8-4b9c-a19a-66bf4d768a73	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.042	42	Pulomas	St. Bonaventura	Jl Pacuan Kuda No.7, Pulomas	Jakarta	021-4897347,  4754780	021-4703339			-	\N
62459b38-6e14-4520-ac93-41609f1be84a	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.043	43	Rawamangun	Keluarga Kudus	Jl Balai Pustaka Baru Rt 001/07, Rawamangun 13220	Jakarta	021-4892346,  4755665	021-4755688			-	\N
1e385fa3-e9c5-48db-91be-61a80845b227	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.044	44	Serpong	Sta. Monika	Jl Alamanda, Sektor 1.2, Bumi Serpong Damai	Tangerang	021-5377427, 53152546, 5383195	021-5373737			Y. D. Widyasuhardjo, OSC	\N
5627b6bf-4c11-43de-9df9-c3dd21091de2	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.045	45	Slipi	Kristus Salvator	Jl K. Satsuitubun No.128, Slipi,	Jakarta	021-5481844	021-5483938			-	\N
d22a1671-76e1-456c-98c7-39b12a27aa6d	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.046	46	Sunter	St. Lukas	Jl Ancol Selatan II, Rt 004/07, Sunter Agung	Jakarta	021-6401373, 6523218 (Pastrn: 6401372)	021-6523282			-	\N
ab20f6ea-80f6-435f-8088-6a8ae99dfaf9	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.047	47	Taman Galaksi	St. Bartolomeus	Jl Gardenia Raya Utara, Villa Galaxy Blok AA1 No.35	Bekasi	021-82410916	021-82419074		bartoway@cbn.net.id	-	\N
3bb1239f-d5f9-44c5-93ae-c596697da6a9	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.048	48	Tangerang	St. Maria	Jl Daan Mogot No.14	Tangerang	021-5523169,  5583745	021-5521044		stmariatangerang@cbn.net.id	-	\N
e0b2bd82-5138-4732-82d2-037be9e2c4fb	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.049	49	Tanjung Priok	St. Fransiskus Xaverius	Jl Melati No.1, Tanjung Priok	Jakarta	021-43931808	021-4372557			-	\N
f85084e0-c7b3-45cf-a5ab-b058f2cc08c6	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.050	50	Tebet	St. Fransiskus Asisi	Jl. Haji Ramli No.24, Menteng Dalam Rt 005/03	Jakarta	021-8303111	021-8318217		capusintbt@centrin.net.id	Heribertus OFM.Cap	\N
23c261e9-be23-47dd-802d-05d6ef1b9c7c	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.051	51	Theresia	Sta. Theresia	Jl Gereja Theresia No.2	Jakarta	021-3917708	021-3917709		theresjkt@yahoo.com	-	\N
d5e274de-d703-45a3-86be-1c566333d880	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.052	52	Toasebio	St. Maria De Fatima	Jl Kemenangan III No.47, Kel. Glodok	Jakarta	021-6293527,  6594952	021-6250421			-	\N
449c0a4e-1aac-438f-a0f5-c7a65218ec32	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.053	53	Tomang	Maria Bunda Karmel	Jl Karmel Raya No.2, Kebon Jeruk	Jakarta	021-5350435,  5483853	021-5350434	www.parokimbk.or.id	sekretariat_mbk@yahoo.co.id	Pastor Aegidius Eko Aldilanto O. Carm	\N
e95010b0-05b0-4be3-a92c-9309e88b3abd	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.054	54	Ciputat	St. Nikodemus	Jl Wijayakusuma II/V.388 Komp MABAD Rempoa, Ciputat     	Tangerang	021-7425516	021-7425568			-	\N
6e68744f-7561-4a8a-87b4-8fd3f9671749	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.055	55	Cikarang	Ibu Teresa	Jl Pinus VII No.11A, Meadowgreen, Lippo 	Cikarang	021-8972982	021-8972982			-	\N
e04bacba-c615-480b-8079-d8fe5acbe2f1	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.056	56	Citra Raya	St. Odilia	Jl Citra Raya Utama Timur Blok L2 Kav.31	Tangerang	021-59408565	021-59408564			-	\N
d85bf9a4-6cf7-4621-9880-9a9bd515f630	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.057	57	Curug	St. Helena	Jl Permata Kasih VI Blok C 12 No.1, Taman Permata	Tangerang	021-55657370	021-3151324			-	\N
91e00a38-2a5d-4213-8b6c-c4f948e9d40a	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.058	58	Danau Sunter	St. Yohanes Bosco	Jl Taman Sunter Indah  Blok A3 No.13-21	Jakarta	021-65300109	021-65300112		info@st-yohanesbosco.org	-	\N
44e758b8-5b50-404b-9702-c015967aeb45	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.059	59	Kosambi Baru	St. Matias Rasul	Jl Taman Kosambi Barat Blok A ext.I No.20,  Kosambi Baru	Jakarta	021-5411509,  54393323,  64715681	021-4375687			-	\N
1fea59ef-4dee-47a7-9599-86490cd01d31	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.060	60	Pantai Indah Kapuk	Regina Caeli	Jl Mediterania Boulevard No.1, Pantai Indah Kapuk	Jakarta	021-55964379	021-55964380			-	\N
5f596ae2-3dcc-4829-bf2a-55bb20254cee	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.061	61	Bintaro Jaya	Sta. Maria Regina		Tangerang					-	\N
38d71557-9f2a-43d0-97de-e8774b0c4e80	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.062	62	Alam Sutera	St. Laurensius	Jl. Sutera Utama No. 2, Alam Sutera - Serpong Utara	Tangerang Selatan 15326	53120587	53124087	www.santo-laurensius.org	sekretariatstlaurensius@gmail.com	P. Sangker Sihotang, OSC	\N
e9ac51fa-8e33-4bf0-85ba-e4ee352361b8	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.063	63	Kotabumi	St. Gregorius	Kotabumi - Tangerang	Tangerang					RD. Andi Gunardi	\N
55554f96-12d8-4bf4-9a45-7652944c64b7	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.064	64	Harapan Indah	St. Albertus Agung	Jl. Bulevar Raya Kav. 23, Kota Harapan Indah	Bekasi					RD Kesaryanto	\N
c751f408-52ab-49e8-a4ec-31e1ff4437ed	34dbcc1d-25e8-4ebb-b465-5506e50ad111	009.065	65	Kalideres	St. Maria Immakulata		Jakarta					Rm. A. Andri Atmaka, OMI	\N
f460ed02-cad5-4b4a-9f55-96da4ac842be	d59fb337-72ec-4166-b7eb-08315c438066	010.001	1	A.P.O/Jayapura	St. Fransiskus Asisi	Pastoran Katolik St Fransiskus Asisi, APO, Jl Kartini No.7, Kotak Pos 1379	Jayapura	0967-534834				-	\N
ccb52cc7-fdd8-4910-b212-5e142541dc50	d59fb337-72ec-4166-b7eb-08315c438066	010.002	2	Abepura	Gembala Baik	Pastoran Katolik Gembala Baik, Jl Sentai No.3	Abepura.	0967-581024				-	\N
c13bd561-621e-41d2-81ba-600d95999101	d59fb337-72ec-4166-b7eb-08315c438066	010.003	3	Abmisibil	Bintang Timur	Pastoran Katolik Bintang Timur, Abmisibil, via AMA, Sentanin Tromol Pos 2	Sentani.					-	\N
31f3640d-6fe9-42e8-a605-a57af1ba7186	d59fb337-72ec-4166-b7eb-08315c438066	010.004	4	Argapura	St. Petrus Dan Paulus	Pastoran Katolik St. Petrus Dan Paulus, Jl Argapura No.40,	Jayapura					-	\N
5506c718-25ca-4965-86cd-b99256a367a1	d59fb337-72ec-4166-b7eb-08315c438066	010.005	5	Arso	St. Willibrordus	Pastrn Katolik St Willibrordus, Arso d/a Keusk.Jayapura, Jl Kesehatan No.6, Kotak Pos 1379,	Jayapura					-	\N
20043905-dfe7-4472-a20f-058ceeae8fe4	d59fb337-72ec-4166-b7eb-08315c438066	010.006	6	Elagaima	St. Emanuel	Pastoran Katolik Emmanuel, Elagaima, d/a Deknt Jayawijaya, Jl Jawa, Kotak Pos 125	Wamena					-	\N
be5bb591-4e1f-46d1-bb3f-3deb75d887e0	d59fb337-72ec-4166-b7eb-08315c438066	010.007	7	Hepuba	Kristus Penebus	Pastoran Katolik Kristus Penebus, Hepuba, d/a Deknt Jayawijaya, Jl Jawa, Kotak Pos 125,	Wamena					-	\N
0f51cbb8-924b-45e6-9c10-99c8a5603aec	d59fb337-72ec-4166-b7eb-08315c438066	010.008	8	Katedral	Kristus Raja	Pastoran Katolik Kristus Raja (Katedral), Jl Sulawesi, Dok V,	Jayapura	0969-533089				-	\N
84ed69f6-752a-4dda-92e3-a6cd25348232	d59fb337-72ec-4166-b7eb-08315c438066	010.009	9	Kimbim / Woogi	St. Stephanus	Pastoran Katolik St Stefanus, Kimbim d/a Dknt Jayawijaya, Jl Jawa, Kotak Pos 125,	Wamena					-	\N
3cd0cca1-8497-4cc6-ae2d-13d2ae8b1045	d59fb337-72ec-4166-b7eb-08315c438066	010.010	10	Mabilabol/Oksibil	Roh Kudus	Pastoran Katolik Roh Kudus, Mabilabol Via AMA Sentani, Tromol Pos 2,	Sentani					-	\N
9ccd228d-b526-48c1-b697-a979ccf1aa23	d59fb337-72ec-4166-b7eb-08315c438066	010.011	11	Musatfak	St. Fransiskus Asisi	Pastoran Katolik St Fransiskus Asisi Musatfak d/a Dknt Jayawijaya Jl Jawa, Kotak Pos 125	Wamena					-	\N
39fff71b-dbd2-464c-8082-a9b8dfd228b8	d59fb337-72ec-4166-b7eb-08315c438066	010.012	12	Pikhe	Bunda Maria	Pastoran Katolik Bunda Maria, Pikhe d/a Dknt Jayawijaya, Jl Jawa, Kotak Pos 125,	Wamena.					-	\N
0528f20e-dc42-4a2d-a5e7-6aae2c7ea505	d59fb337-72ec-4166-b7eb-08315c438066	010.013	13	Pugima	Kristus Gembala Kita	Pastoran Katolik Kristus Gembala Kita, Pugima d/a Dknt Jayawijaya, Jl Jawa, Kotak Pos 125	Wamena					-	\N
ac7b63d8-e308-4694-8f6a-3a58b81c6a2c	d59fb337-72ec-4166-b7eb-08315c438066	010.014	14	Sarmi	St. Antonius	Pastrn Katolik St Antonius, Sarmi d/a Pastrn Katolik Sang Penebus, Tromol Pos 2,	Sentani	0967-591332				-	\N
c99bb126-4731-4d00-9e64-825cc44b1cb7	d59fb337-72ec-4166-b7eb-08315c438066	010.015	15	Sentani	Sang Penebus	Pastoran Katolik Sang Penebus, Tromol Pos 2,	Sentani	0967-591332				-	\N
4e8ae78a-741c-4274-843f-7327264ba630	d59fb337-72ec-4166-b7eb-08315c438066	010.016	16	Ubrub	St. Bonifasius	Pastoran Katolik St.Bonifasius, Ubrub Via AMA Sentani, Tromol Pos 2,	Sentani					-	\N
f908c437-1c29-4cf7-9790-75d9be8b2a8a	d59fb337-72ec-4166-b7eb-08315c438066	010.017	17	Wamena	Kristus Jaya	Pastoran Katolik Kristus Jaya, Wamena, Jl Jawa, Ktk Pos 125,	Wamena	0969-31728				-	\N
64100d97-acf9-439b-89d4-1ddc5ce847b9	d59fb337-72ec-4166-b7eb-08315c438066	010.018	18	Waris	St. Mikael	Pastoran Katolik St Mikael, Waris d/a Kantor Keusk.Jayapura, Jl Kesehatan No.6, Ktk Pos 1379,	Jayapura					-	\N
67309cd6-7006-4a07-a0eb-7a630847d3f1	d59fb337-72ec-4166-b7eb-08315c438066	010.019	19	Yiwika	Kristus Terang Dunia	Pastoran Katolik Kristus Terang Dunia, Yiwika d/a  Dknt Jayawijaya Jl Jawa, Ktk Pos 125,	Wamena					-	\N
aa6a90fb-0e46-4920-a134-d0ea7c5a5dda	d59fb337-72ec-4166-b7eb-08315c438066	010.020	20	Iwur	Kristus Bangkit	Pastoran Kristus Bangkit Iwur, via AMA Sentani, Tromol Pos 2	Sentani.					-	\N
c83d1d9b-98ca-4e96-8705-1c3cdc4879fd	d59fb337-72ec-4166-b7eb-08315c438066	010.021	21	Oklip	St. Petrus	Pastoran Katolik St Petrus, Oklip Via AMA Sentani, Tromol Pos 2,	Sentani					-	\N
044eefde-9938-4994-9d39-678e69464071	d59fb337-72ec-4166-b7eb-08315c438066	010.022	22	Kotaraja	Kristus Juruselamat	Pastoran Katolik Kristus Juruselamat, Jl Kotaraja Dalam, Cigombong,	Kotaraja.	0967-582254				-	\N
625da9ca-51b2-45f0-abc9-abadb60dc8dd	d59fb337-72ec-4166-b7eb-08315c438066	010.023	23	Skamto	Sang Penabur	Pastrn Katolik Sang Penabur, Skamto d/a Kantor Keusk. Jayapura, Jl Kesehatan No.6 Ktk Pos 1379,	Jayapura					-	\N
de3e9b94-736b-489f-b616-af75c14e3a73	d59fb337-72ec-4166-b7eb-08315c438066	010.024	24	Taja	St. Clara	Pastrn Katolik St Clara, Taja-Bonggo, d/a Pastrn Katolik Sang Penebus, Tromol Pos 2,	Sentani	0967-591332				-	\N
4cdd76e7-b1ee-4094-a8e6-215dc43dc0db	d59fb337-72ec-4166-b7eb-08315c438066	010.025	25	Waena	Kristus Terang Dunia	Pastoran Katolik Kristus Terang Dunia, Jl Proyek, Yabansai-Heram,	Waena					-	\N
bf736692-c561-4510-8abf-9d3bfa8734f5	d59fb337-72ec-4166-b7eb-08315c438066	010.026	26	Welesi	St. Paulus	Pastoran St. Paulus, Welesi, d/a Dknt Jayawijaya, Jl Jawa, Ktk Pos 125,	Wamena.					-	\N
38cb8c72-0124-495c-b8bd-38366689e1ae	d59fb337-72ec-4166-b7eb-08315c438066	010.027	27	Yuruf	Bunda Allah	Pastoran Katolik Bunda Allah, Amgotro-Yuruf, Via AMA Sentani, Tromol Pos 2,	Sentani					-	\N
6dd7a4ca-adf7-4bb2-ac21-0d775d0dfff7	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.001	1	Balai Berkuak	St. Martinus	Pastoran Katolik Balai Berkuak Kec.Simpang Hulu, d/a keusk.Ketapang, Jl A>Yani 74, Ktk Pos 175, Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
4359f52e-9132-456b-8c88-554933bf1d22	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.002	2	Balai Semandang	St. Yohanes Rasul	Pastrn Katolik Balai Semandang, Kec.Simpang Hulu d/a Keusk.Ketapang Jl A.Yani 74 Ktk Pos 175, Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
0cef4f71-ea2c-4ef2-ab28-9f79eb0c830f	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.003	3	Kendawangan	St. Stefanus	Pastrn Katolik Kendawangan, Kec.Kendawangan d/a Kesuk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
3cba5e83-5485-4827-a8b0-a741faaeb7b6	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.004	4	Ketapang	St. Gemma Galgani	Pastrn Katolik Ketapang, Kab.Ketapang d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32769	0534-31008			-	\N
5a7e83e9-aa2f-4324-8190-83de0e587003	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.005	5	Marau	Kanak-kanak Yesus	Pastrn Katolik Marau, Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
9064565c-a482-4bcd-8d80-aab4757a7251	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.006	6	Menyumbung	Salib Suci	Pastrn Katolik Menyumbung, Kec.Menyumbung Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
30edf26b-5290-450e-9781-2872ce622b6a	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.007	7	Nanga Tayap	St. Petrus Dan Paulus	Pastrn Katolik Nanga Tayap, Kec.Nanga Tayap Kab.Ketapang, d/a Keusk.Ketapang Jl A.Yani 74, Ktk Pos 175 Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
f5d37301-e62d-4d05-88c1-f32384a590ad	025912db-e08f-4096-9fbe-f770dddbde50	018.024	24	Parlilitan	St. Lusia	Pastoran Katolik Parlilitan 22456,	Parlilitan					-	\N
6191117e-ee60-4175-845b-ca1a8f5f2dd8	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.008	8	Randau	Hati Kudus Tuhan Yesus	Pastrn Katolik Randau, Kec.Sandai, Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
2bdbf6c5-2ee8-4096-8691-e0636710fe5e	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.009	9	Sandai	St. Gabriel	Pastrn Katolik Sandai, Kec.Sandai, Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
1ec79040-4df0-45d2-aaa2-45e09125eec5	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.010	10	Sepotong	Keluarga Kudus	Pastrn Katolik Sepotong, Kec.Sungai Laur, Kab.Ketapang d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
c00204c8-6f73-4b62-820f-13097f994afa	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.011	11	Serengkah	St. Yoseph	Pastrn Katolik Serengkah, Kec.Tumbang Titi, Kab.Ketapang d/a Keusk.Ketapang Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
9db2c213-39f8-491f-9e42-975bf294b7a2	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.012	12	Simpang Dua	St. Mikhael	Pastrn Katolik Simpang Dua, Kec.Simpang Dua, Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
8161197c-6f1a-4a79-b443-774f52b61734	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.013	13	Sukadana	Emmanuel	Pastrn Katolik Sukadana, Kec.Sukadana, Kab.Ketapang d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
100548ea-b161-4588-8e23-e6ee65343179	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.014	14	Tanjung	St. Maria Assumpta (maria Diangkat Ke Surga)	Pastrn Katolik Tanjung, Kec.Jelai Hulu, Kab.Ketapang, d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
02b4270a-e492-4784-b2b0-e398d4e7b739	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.032	32	Sorowako	Maria Immaculata	Jl Hasanuddin No.1-3, Sorowako 91984,	Luwu Timur, Sul-Sel.	0475-321512				-	\N
bad38486-b0c6-4882-9670-361e33831ed4	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.015	15	Tembelina	St. Carolus Borromeus	Pastrn Katolik Tembelina, Kec.Tumbang Titi, Kab.Ketapang d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
cd36c199-5f44-4db8-87df-c8dcefa56cd7	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.016	16	Tumbang Titi	St. Paulus Rasul	Pastrn Katolik Tumbang Titi, Kec.Tumbang Titi d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
76bb099d-bb93-4d74-8b4b-173ea415cadd	4db2804f-382d-41f9-b4b7-e30ec6a62d8d	011.017	17	Air Upas	Maria Ratu Pencinta Damai	Pastrn Katolik Tumbang Titi, Kec.Tumbang Titi d/a Keusk.Ketapang, Jl A.Yani 74, Ktk Pos 175, Ketapang 78811,	Ketapang, Kal-Bar.	0534-32181	0534-31008			-	\N
f44fd4a3-35f3-4110-a669-ab05f9824903	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.001	1	BAA / P. Rote	St. Kristoforus	Pastoran Katolik Baa-Rote, Via Keusk. Agung Kupang	Kupang	0380-871079				-	\N
1f6f363a-039c-427a-abe7-2b7415f928e1	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.002	2	Bonipoi / Katedral	Kristus Raja	Jl Ir. Soekarno No.1,	Kupang	0380-822158	0380-822158			-	\N
325c5ac9-1ebe-451a-a7fd-90519778362f	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.003	3	Buraen	St. Yohanes Pemandi	Pastoran Katolik Buraen, via Keuskupan Agung Kupang,	Kupang					-	\N
c9c48657-7de8-4ffc-b11d-0688e6e02c69	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.004	4	Camplong	St. Helena	Pastoran Katolik Camplong, via Keuskupan Agung Kupang,	Kupang	0380-850031				RD. Anselmus Leu	\N
4990b512-ba72-4d8a-96f5-e049549b38e8	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.005	5	Kalabahi	Gembala Baik	Pastoran Katolik Gembala Baik, Jl Jend. Sudirman, Lipa-Kalabahi 85812,	Alor	0386-21228				-	\N
1d121a6a-02fa-492d-a626-7eca25e97b8a	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.006	6	Kapan	St. Maria Immaculata	Pastoran Katolik Kapan, via Keusk.Agung Kupang,	Kupang					-	\N
14a0cc6a-bf26-42d5-8634-df4b9bce3ebd	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.007	7	Kotabaru / Kupang	St. Maria Assumpta	Pastoran Katolik St Maria Assumpta, Jl Perintis Kemerdekaan, Walikota Baru,	Kupang-Timor	0380-831870				-	\N
7b5fad68-f58a-41b5-8795-547dc143fbe5	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.008	8	Naikliu	St. Stephanus	Pastoran Katolik St Stephanus, Naikliu, via Keusk.Agung Kupang,	Kupang					-	\N
61772c50-b4df-4d1b-a3a0-68df9fa7975d	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.009	9	Naikoten	St. Joseph	Jl E.R. Herewila No.33,	Naikoten II	0380-821881				-	\N
c909171b-154d-4c03-a775-bc9ba43ed258	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.010	10	Niki-niki	St. Arnoldus-Josef (Aryos)	Pastoran Katolik Niki-Niki, via Keusk.Agung Kupang,	Kupang	0388-81218				-	\N
a4368926-7dc9-48be-b568-9dc4a6bd4124	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.011	11	Noelmina	St. Maria Bunda Orang Miskin	Pastoran Katolik Noelmina, via Keusk. Agung Kupang,	Kupang					-	\N
3eab1895-99b1-476e-85c7-d471963db8c5	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.012	12	Oeekam	Hati Tersuci Maria	Pastoran Katolik Oeekam, via Keuskupan Agung Kupang,	Kupang					-	\N
adc5fc06-1bad-4839-831d-2a98a9688ed4	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.013	13	Oeleta	St. Gregorius Agung	Pastoran Katolik Oeleta, via Keuskupan Agung Kupang,	Kupang	0380-838600				-	\N
89f26794-24f1-4168-8033-e319e1eb220b	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.014	14	Oinlasi	St. Paulus	Pastoran Katolik Oinlasi, via Keuskupan Agung Kupang,	Kupang					-	\N
5ae183fb-f775-4f95-8127-dc6e029cf013	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.015	15	Panite	St. Theresia Dari Kanak-kanak Yesus	Pastoran Katolik Panite, via Keuskupan Agung Kupang,	Kupang					-	\N
0aacf30c-a82f-42c8-9b58-e94f15a5e2fc	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.016	16	Penfui	St. Yoseph Pekerja	Pastoran Katolik St Yoseph Pekerja, Penfui, Jl Adisucipto Penfui,	Kupang-Timor	0380-881165				-	\N
ab3bb6cd-af5e-4231-bb0c-f98bd2c6d0d6	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.017	17	Putain	St. Columba	Pastoran Katolik Putain, via Keuskupan Agung Kupang,	Kupang					-	\N
2edf2f22-ff8b-4ec5-b2f5-ce402fd30b65	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.018	18	Sikumana	St. Familia	Pastoran Katolik St. Familia Sikumana, Jl H.R.Koroh, Sikumana,	Kupang	0380-822937				-	\N
53340e7f-2e81-4820-9335-820c8b9e1b5e	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.019	19	Soe	St. Maria Dolorosa	Pastoran Katolik Soe, Jl Tompello No.7, Soe,	T T S	0388-21135				Dagobertus Sota Ringgi, SVD	\N
77a108f4-c161-42ea-ae7a-d45dc69b0024	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.020	20	Sulamu	St. Petrus	Pastoran Katolik Sulamu, via Keuskupan Agung Kupang,	Kupang					-	\N
d13b0c1a-e88b-42d2-8c3d-1c10bbe848dd	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.021	21	Benlutu	St. Vincentius	Pastoran Katolik Benlutu, via Keusk.Agung Kupang,	Kupang					-	\N
74b8d071-a1c7-4478-816c-d6c33acc2239	0d5576ab-1219-4a37-9c53-2949e9f58fd4	012.022	22	Sabu	St. Paulus	Pastoran Katolik Sabu, via Keuskupan Agung Kupang,	Kupang	0380-861293				-	\N
27b63bc7-4c37-43ec-a2f7-86602408d873	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.001	1	Aliuroba / Lambata	St. Maria Pembantu Abadi	Pastoran Katolik Aliuroba, Lembata,	Flores Timur-NTT					-	\N
e714c575-1abc-4b69-acdb-fb10f409e1a8	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.002	2	Bama-Lewokluo/Flores Timur	St. Maria Diangkat Ke Surga	Pastoran Katolik Bama-Lewokluo, Larantuka,	Flores Timur-NTT					-	\N
1e37118c-43dc-4c12-909a-aa8ad4cd31b8	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.003	3	Baniona / Adonara	St. Maria Hati Tak Bernoda	Pastoran Katolik Baniona, Adonara,	Flores Timur-NTT					-	\N
64ec364f-c213-4409-8803-5109fcc3f1f3	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.004	4	Belogili-Leworahang/Flores Timur	St. Herman Josef	Pastoran Katolik Belogili, Tanjung Bunga,	Flores Timur-NTT					-	\N
8ae08f90-3bee-4680-a8f1-a1d4f9ec7101	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.005	5	Boto-kluang / Lembata	St. Josef	Pastoran Katolik Boto, Lembata,	Flores Timur-NTT					-	\N
0758e59d-2917-46d9-8507-60fba2463f10	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.006	6	Hadakewa	St. Laurensius	Pastoran Katolik Hadakewa, Lembata,	Flores Timur-NTT					-	\N
751e489d-3b63-4286-aa8a-2d32222003b7	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.007	7	Hinga / Adonara	St. Martinus	Pastoran Katolik Hinga, Adonara,	Flores Timur-NTT.					-	\N
2b0edeeb-f95a-40d9-80b8-344fcd6229e0	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.008	8	Hoeleaq / Lembata	Salib Suci	Pastoran Katolik Hoeleaq, Kedang, Lembata,	Flores Timur-NTT					-	\N
c8da6c74-07fc-4fcf-8cf0-2319ef962385	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.009	9	Hokeng / Flores Timur	Maria Ratu Semesta Alam	Pastoran Katolik Hokeng, Wulanggitang,	Flores Timur-NTT					-	\N
98b83c44-6e49-4cd1-8ab3-f4a0e523b805	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.010	10	Kalikasa / Lembata	St. Antonius	Pastoran Katolik Kalikasa, Atedei, Lembata,	Flores Timur-NTT					-	\N
e73b11d0-d43b-4e88-b0a0-a5c7f65a99d9	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.011	11	Kalike / Solor	St. Mikhael	Pastoran Katolik Kalike, Solor,	Flores Timur-NTT					-	\N
e0d57f56-38bf-4d94-a6f7-6087b5163170	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.012	12	Kiwangona / Adonara	Sta. Theresia Dari Kanak-kanak Yesus	Pastoran Katolik Kiwangona, Adonara,	Flores Timur-NTT					-	\N
b8f1dfa7-1e56-49de-b618-8b615889b333	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.013	13	Koli-Sagu / Adonara	St. Tarcisius	Pastoran Katolik Sagu, Adonara,	Flores Timur-NTT					-	\N
0603f80f-75d7-446d-903c-2b4dc8e8283d	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.014	14	Lamalera / Lembata	St. Petrus Dan Paulus	Pastoran Katolik Lamalera, Lembata,	Flores Timur-NTT					-	\N
277d5fef-42da-426b-b927-60cfd7774f2d	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.015	15	Larantuka / Katedral	Ratu Rosario Tersuci (Reinha Rosari)	Pastoran Katedral Reinha Rosari, Larantuka 86213,	Flores Timur-NTT	0383-21180,  21829				-	\N
7f0496e7-5fe9-4d96-b488-e54d57d4f75e	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.016	16	Lebao / Flores Timur	St. Johannes Pembaptis	Pastoran Katolik San Juan, Lebao Tengah, Larantuka,	Flores Timur-NTT	0383-21314,  21329				-	\N
ab3d6636-e3ff-4126-a814-5b0916a77175	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.017	17	Lerek / Lembata	Hati Amat Kudus	Pastoran Katolik Lerek, Lembata,	Flores Timur-NTT					-	\N
d2b2e567-1857-4582-8e05-439806c3c62c	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.018	18	Lewolaga / Flores Timur	St. Maria Tak Bernoda Asal	Pastoran Katolik Lewolaga, Wulanggitang, Larantuka,	Flores Timur-NTT					-	\N
b866580e-2506-4ab7-8592-e744e0ded2f5	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.019	19	Lewoleba / Lembata	St. Maria Banneux	Pastoran Katolik Lewoleba, Lembata,	Flores Timur-NTT	0383-41135				-	\N
d6171b7f-dfc6-4a21-8d32-4f78872684ca	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.020	20	Lewotobi / Flores Timur	St. Josef	Pastoran Katolik Lewotobi, Nurabelen, Wulanggitang, Larantuka,	Flores Timur-NTT					-	\N
06d6a0d1-2fc4-4da3-914c-79e420b0acdd	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.021	21	Lite / Adonara	St. Josef	Pastoran Katolik Lite, Adonara Barat, Larantuka,	Flores Timur-NTT					-	\N
0151bb8f-3c08-48a9-9faf-4fdf6deeeedb	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.022	22	Menanga / Solor	St. Fransiskus Xaverius	Pastoran Katolik Menanga, Solor,	Flores Timur-NTT					-	\N
004cbe8d-7976-4d38-9e83-c781f54f4d0f	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.023	23	Mingar / Lembata	St. Maria Ratu Damai	Pastoran Katolik Mingar, Lembata,	Flores Timur-NTT					-	\N
8e4104e4-e002-4398-acbd-88fddf7451a7	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.024	24	Pamakayo / P. Solor	Kunjungan St. Perawan Maria	Pastoran Katolik Pamakayo, Larantuka,	Flores Timur-NTT					-	\N
e62a8c89-7a34-4f57-9873-0298b7e510b1	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.006	6	Karanganyar	St. Yoseph Pekerja	Jl Revolusi No.31,	Karanganyar	0287-551314				-	\N
945554a2-388c-4559-9203-7c88611d2346	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.025	25	Pukaona / Adonara	St. Bernadeth Soubirous	Pastoran Katolik Pukaona, Tanah Boleng Adonara,	Flores Timur-NTT					-	\N
191dbfc4-d9ba-4945-b740-87760dde64d6	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.026	26	Riangkemie / Flores Timur	St. Josef	Pastoran Katolik Riangkemie, Larantuka,	Flores Timur-NTT					-	\N
5a877798-0c9b-4052-b1fc-d40782e020c1	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.027	27	Ritaebang / P. Solor	St. Johannes Pembaptis	Pastoran Katolik Ritaebang, Solor,	Flores Timur-NTT					-	\N
02810b8b-ee91-4bef-9b7d-168c7a82712d	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.028	28	Tanah Boleng / Adonara	St. Joseph	Pastoran Katolik Tanah Boleng, Adonara,	Flores Timur-NTT					-	\N
c1e9aa9c-8f1e-4d2d-8a32-233f8e1b6913	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.029	29	Tokojaeng / Lembata	St. Bernardus Abbas	Pastoran Katolik Toko Jaeng, IIeape, Lembata,	Flores Timur-NTT					-	\N
7d726ee0-4c84-4ebc-847f-99849fe143e9	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.030	30	Waipukang / Lembata	St. Maria Bintang Laut	Pastoran Katolik Waipukang, Lembata,	Flores Timur-NTT					-	\N
5b73a7f9-3616-4d96-9133-fec05569e73e	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.031	31	Waibalun / Flores Timur	St. Ignatius	Pastoran Katolik Waibalun, Larantuka,	Flores Timur-NTT					-	\N
101ae604-452e-42f7-9cee-ba4161d7ecb2	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.032	32	Waiklibang / Flores Timur	St. Ludovikus	Pastoran Katolik Waiklibang, Tanjung Bunga,	Flores Timur-NTT					-	\N
92669cbd-3864-400e-beb8-4fa61a03ca7c	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.033	33	Waikomo / Lembata	St. Arnoldus Janssen	Pastoran Katolik Waikomo, Lebatukan,	Lembata, NTT					-	\N
e874fcd2-bfa2-459e-bd1d-22c8f7a413c6	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.034	34	Waiwadan / Adonara	St. Maria Goretti	Pastoran Katolik Waiwadan, Adonara,	Flores Timur-NTT					-	\N
ec597395-bc73-4b97-a010-bcb330b84c97	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.035	35	Waiwerang / Adonara	Kristus Raja	Pastoran Katolik Waiwerang, Adonara,	Flores Timur-NTT					-	\N
ab15874c-00dc-4e6f-824b-9ad080ae5343	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.036	36	Witihama / Adonara	St. Maria Pembantu Abadi	Pastoran Katolik Witihama, Adonara,	Flores Timur-NTT					-	\N
13bb3016-1a08-4fb8-87d2-ff9302fe996f	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.037	37	Lamahora / Lembata	St. Fransiskus Asisi	Pastoran Katolik Lamahora, d/a Dekenat Lembata,	Flores Timur-NTT	0383-41049				-	\N
b993d81e-3ccd-466b-8400-5555014eeea0	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.038	38	Lato / Flores Timur	St. Perawan Maria La Salete	Pastoran Katolik Lato,	Flores Timur-NTT					-	\N
427a18c3-6c9b-46f2-b700-a9d3b7cb7a2e	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.039	39	Lambunga / Adonara	St. Werenfried	Pastoran Katolik Lambunga, Adonara,	Flores Timur-NTT					-	\N
bfbe09b2-f53e-438b-9398-dea4c8e8ddc9	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.040	40	Ledobelolong / Lembata	St. Wilhelmus	Pastoran Katolik Ledobelolong, Lembata,	Flores Timur-NTT					-	\N
fb4dc7be-c76b-4b2a-b2b0-6629d2cbfd1c	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.041	41	Lewotala / Flores Timur	St. Alfonsus de Ligouri	Pastoran Katolik Lewotala,	Flores Timur-NTT					-	\N
ad93da4b-60de-4aef-96d0-a8ede6700184	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.042	42	Riangpuho / Flores Timur	St. Darius	Pastoran Katolik Riangpuho, Tanjung Bunga, Larantuka,	Flores Timur-NTT					-	\N
57bcc1ec-32c2-4fd7-8e3b-ee50093eee2b	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.043	43	Wangatoa / Lembata	Kristus Raja	Pastoran Katolik Wangatoa, d/a Dekenat Lembata	Flores Timur-NTT	0383-41049				-	\N
a8d95a22-e3db-445c-ab93-05c031232087	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.044	44	Watobuku	Kristus Raja Semesta Alam	Pastoran Katolik Watobuku, Hokeng,	Flores Timur-NTT					-	\N
472d643c-052d-4055-844b-0c5f301ce08a	99fee764-eab0-4b8b-b50a-cfefff2f7aba	013.045	45	Weri	St. Maria Pembantu Abadi	Pastoran Katolik Weri,	Flores Timur-NTT	0383-2325046				-	\N
d6ae88ed-c6a3-414e-8a2e-a600699fc21e	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.001	1	Andalas	Kristus Raja	Jl Andalas No.61,	Makassar	0411-317457				-	\N
e7194232-14f5-434b-a4d7-0c6cf72bd1b7	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.002	2	Bantaeng	Siti Fatima	Jl Raya Lanto No.45, 	Bantaeng, Sul-Sel.	0413-21368				-	\N
7b4bfce8-a8fb-4330-b84b-baa046feea89	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.003	3	Bau-Bau	St. Paulus	Pastoran Katolik Bau-Bau, Jl A.Yani No.10, Bau-Bau,	Buton, Sul-Tra.	0402-2821530				-	\N
fc4d9663-f720-4c73-865c-6f5e66677264	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.004	4	Bone-Bone	St. Martinus	Pastoran Katolik Bone-Bone, Jl Diponegoro, Kec.Bone-Bone 92966,	Kab.Luwu Utara, Sul-Sel.					-	\N
d9159432-ac6d-4fa8-a7bd-c9229c4c8553	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.005	5	Deri	Renya Rosari	via Pastoran Katolik Rantepao, Jl Monginsidi No.37, Rantepao,	Tator, Sul-Sel.					-	\N
672e7e75-1781-4230-b63f-edb6c2334653	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.006	6	Getengan	St. Paulus	via Pastoran Katolik Makale, Jl Musa No.17-19, Makale 91811,	Tator, Sul-Sel.	0423-22631				-	\N
1fa46e19-b138-49c1-b93d-1b2ce0287093	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.007	7	Gotong-Gotong	St. Yoseph	Jl G. Latimojong No.112,	Makassar, Sul-Sel.	0411-323587				-	\N
d19995a7-1186-4b2e-a4d4-2ee5a1056c85	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.008	8	Kare	Maria Ratu Rosari	Jl Perintis Kemerdekaan No.28, Km 10,	Makassar, Sul-Sel.					-	\N
d5ceb7ef-c5fa-4ddc-b6d1-f83613f266f1	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.009	9	Katedral	Hati Yesus Yang Maha Kudus	Jl Kajaolalido No.14,	Makassar, Sul-Sel.	0411-315745, 323647				-	\N
4fad28ec-a2de-44bf-95b3-2be7e995f347	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.010	10	Kolaka	St. Clemens	Jl Pahlawan No.67,	Kolaka, Sul-Tenggara.	0405-21438				-	\N
2ec752f2-8953-4679-bf80-519902edbdd0	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.011	11	Labasa	St. Mikael	Gereja Katolik Labasa, Kelurahan Lawama, Kec.Tongkuno 93662,	Kab.Muna, Sul-Tenggara.					-	\N
0e8e0baf-98e5-496f-885b-97b1584d5704	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.012	12	Lamasi	St. Yoseph	Gereja Katolik Lamasi, Kec.Lamasi, Jl Poros Lamasi 565, Wiwitan,	Kab.Luwu, Sul-Sel.					-	\N
16d47fba-4101-43b7-8fc0-3466ee1b48ea	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.013	13	Makale	Hati Maria Tak Bernoda	Jl Musa No.17-19, Makale 91811	Tator, Sul-Sel.	0423-22044				-	\N
bfe99ec3-8e4d-4e53-b9b1-0a429a55d357	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.014	14	Mamajang	St. Perawan Maria Diangkat Ke Surga	Jl Tupai No.1,	Makassar, Sul-Sel.	0411-854809				-	\N
9c28298f-f6c4-4865-abee-f9df2b386b07	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.015	15	Mamasa	St. Petrus	Gereja Katolik Mamasa Randanan, Desa Buntu Buda, Kec.Mamasa,	Kab.Mamasa, Sul-Bar.					-	\N
012b556d-cf4c-43ae-8f64-1c0b6e8e67e9	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.016	16	Mamuju	St. Maria	Gereja Katolik Mamuju, Jl Bau Massepe No.14,	Mamuju, Sulbar.	0426-21232				-	\N
061f1f9c-8785-4868-8210-1511ce2bd339	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.017	17	Mangkutana	St. Petrus	Gereja Katolik Mangkutana, Jl Trans Sulawesi Maleku, Mangkutana 91973,	Kab.Luwu Utara, Sul-Sel.					-	\N
66225cb6-2c55-4893-8bed-dbfd2e84f3e6	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.018	18	Mariso	St. Yakobus	Jl Gagak No.21,	Makassar, Sul-Sel.	0411-873532				-	\N
9d79b5f9-0bd2-42ef-b070-b06d83180675	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.019	19	Messawa	St. Fransiskus	Gereja Katolik Messawa, Jl Poros Mamasa Km 36, Kec. Messawa,	Kab.Mamasa, Sul-Bar.					-	\N
7483d2b4-e2c0-4afb-9a4a-4418a571620b	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.020	20	Nonongan	Kristus Raja	Via Gereja Katolik Rantepao, Jl onginsidi No.37, Rantepao 91831,	Tator, Sul-Sel	0423-23109				-	\N
f6b58899-1879-4b19-9089-051b453d62b2	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.021	21	Palopo	St. Mikael	Jl Kartini No.62,	Palopo, Sul-Sel.	0471-21985				-	\N
9cf8e1bd-13c5-47c9-be22-a2757a231e4f	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.022	22	Panakukang	St. Fransiskus Assisi	Jl Hertasning No.102,	Makassar, Sul-Sel.	0411-885234				-	\N
be87f241-91c5-42e9-be06-8c50cace4f64	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.023	23	Pare-pare	St. Petrus Rasul	Jl Veteran No.24,	Pare-Pare, Sul-Sel.	0421-21690				-	\N
33f2fdc7-fd56-47f4-bd50-e7138e802257	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.024	24	Polewali	St. Yoseph	Jl Amanna Pattola Bo.2, Kotak Pos 16,	Polewali, Sul-Bar.	0428-21720				-	\N
76254931-ae61-4d0b-bb27-75612dd5d60a	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.025	25	Raha	St. Yohanes Pemandi	Jl Sudirman No.8, Raha,	Muna, Sul-Tenggara.	0403-22017				-	\N
8d0d65af-f251-4fa9-9a91-a4b8bf52a9a0	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.026	26	Rantepao	St. Theresia	Jl Monginsidi No.37, Rantepao 91831,	Tator, Sul-Sel.	0423-21056,  23840				-	\N
324d3409-c294-42eb-a3e6-bceeefd6013e	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.027	27	Rantetayo	St. Paulus	via Gereja Katolik Makale, Jl Musa No.17-19, Makale,	Tator, Sul-Sel.	0423-24450				-	\N
87016e2d-8ffd-40f1-8669-f7d7e1a2febf	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.028	28	Rembon	St. Antonius	via Gereja Katolik Makale, Jl Musa No.17-19, Makale 91811,	Tator, Sul-Sel.					-	\N
d7ac5ab8-73ea-4323-8345-823aaada06fa	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.029	29	Saluampak	Siti Maryam	Gereja Katolik Saluampak, Desa Pongko, Kec.Lamasi,	Kab.Luwu, Sul-sel.					-	\N
2c2091d6-7bc8-4829-9344-e4d9310ae5d8	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.030	30	Sangalla	Kristus Imam Agung Abadi	via Gereja Katolik Makale, Jl Musa No.17-19, Makale 91811,	Tator, Sul-Sel.	0423-22774				-	\N
6ce013c7-2515-4e03-b618-7228cbb7f4db	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.031	31	Soppeng	St. Perawan Maria Bunda Pengharapan Suci	Jl Samudera No.48,	Watansoppeng, Sul-Sel.	0484-21362				-	\N
b2f79fdd-a285-4fd9-adae-00893c70cbf7	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.027	27	Blitar I	St. Yusuf		Blitar					Silvano Laurenzi, SX	Blitar
eabf0eba-fa24-46d9-b85a-11b192328d41	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.033	33	Sungguminasa	Simon Petrus Gembala Yang Baik	Jl Mangka Dg.Bombong No.34, Sungguminasa 92111,	Kab.Gowa, Sul-Sel	0411-866230				-	\N
289e8414-7f6f-4e4b-82c2-52d011b88f1e	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.034	34	Tello	St. Paulus	via Guest House CICM, Jl Pelanduk No.72,	Makassar, Sul-Sel.	0411-830691				-	\N
20218da7-2436-4cfb-a9ce-97a40b07e078	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.035	35	Unaaha	Roh Kudus	Gereja Katolik Unaaha, Desa Sendang Mulyasari, Tromol Pos 1,	Unaaha, Sul-Tenggara.	0408-21711				-	\N
6ddb2bf3-ee84-44ca-870b-8b46d8da9be3	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.036	36	Baras	St. Yusuf Pekerja	Via Gereja Katolik Mamuju, Jl Bau Massepe No.14,	Mamuju, Sul-Bar.					-	\N
6e2d5d31-a2f8-4b4d-8ddf-582326e36fac	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.037	37	Mandai	Bunda Maria	Jl Dakota No.1, Lanud Hasanuddin Mandai,	Maros, Sul-Sel.	0411-4813479				-	\N
2584833a-0d8b-4a26-9069-8afcd271699a	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.038	38	Mandonga	St. Clemens	Jl Saranani No.1-2, Mandonga,	Kendari, Sul-Tenggara	0401-327521				-	\N
ac6e93a0-0b35-4339-8029-4e3e19614d01	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.039	39	Nanggala	St. Petrus	Via Gereja Katolik Rantepao, Jl Monginsidi 37, Rantepao,	Tator, Sul-Sel.	0423-21056				-	\N
9fe8d6ca-73f4-4ba2-9c00-34f5561890be	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.040	40	Padang Sappa	St. Petrus	Gereja Katolik Padang Sappa, Jl Jend.Sudirman No.33, Dusun Padang Cendrana, Kel.Padang Sappa, Kec.Ponrang,	Kab. Luwu.					-	\N
c81bdd71-aa4d-45d3-ab1c-8d9f082f355c	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.041	41	Pangli	St. Petrus	via Gereja Katolik Rantepao, Jl Monginsidi No.37, Rantepao 91831,	Tator, Sul-Sel					-	\N
d3bff7ae-1b58-4b14-ac33-ef51dfbde873	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.042	42	Sadohoa	St. Fransiskus Xaverius	Jl Dr.Moh.Hatta No.63A, Kotak Pos 1,	Kendari, Sultra.	0401-321868				-	\N
e13b4259-7163-4cc2-a7e7-c88d066efffb	47ad2bd6-f40b-45ec-8313-04ac148ef025	014.043	43	Tombanglambe	St. Maria	via Gereja Katolik Rantepao, Jl Monginsidi No.37, Rantepao 91831,	Tator, Sul-Sel.					-	\N
9168863f-f52c-4ad3-8730-8bdaad55408e	e87e4b32-bf21-4824-846c-a16e45e631c4	015.001	1	Ambulu	St. Paulus	Jl Candradimuka No.4, Ambulu,	Ambulu	0336-882233	-	-	parokist.paulus@yahoo.co.id	Rm. Fransiskus Eli Heri Harianto, O. Carm	\N
c0e48ae9-fad1-4b8f-9929-7ef983acd856	e87e4b32-bf21-4824-846c-a16e45e631c4	015.002	2	Bangkalan / Madura	Maria Dari Fatima	Jl Letnan Mestu No.13, PO Box 13,	Bangkalan	031-3095289	\N	\N	\N	-	\N
4eda4b5d-623b-4fda-8ce8-442ce5f5f14e	e87e4b32-bf21-4824-846c-a16e45e631c4	015.003	3	Banyuwangi	Maria Ratu Damai	Jl J.A.Suprapto No.35,	Banyuwangi	0333-424693	0333-417377	\N	\N	-	\N
603def3e-5a46-48fc-82cf-b0073880a952	e87e4b32-bf21-4824-846c-a16e45e631c4	015.004	4	Batu	Gembala Baik	Jl Ridwan No.16,	Batu	0341-592326	\N	\N	\N	-	\N
243d029f-37e0-49ef-b95c-1cec2376f194	e87e4b32-bf21-4824-846c-a16e45e631c4	015.005	5	Bondowoso	St. Yohannes Pengarang Injil	Jl Jend. A.Yani No.20	Bondowoso	0332-421538	0332-429993	\N	\N	-	\N
2f53ef98-3363-47d5-aab3-c7edd1c10e02	e87e4b32-bf21-4824-846c-a16e45e631c4	015.006	6	Curahjati	Maria Ratu Para Rasul	Pastoran Maria Ratu Para Rasul Curahjati, Kotak Pos 206, Purwoharjo,	Banyuwangi	0333-7721547	0333-5599055	\N	\N	-	\N
c783d781-51a5-43c1-b462-ffa501407a9b	e87e4b32-bf21-4824-846c-a16e45e631c4	015.007	7	Genteng	Kristus Raja	Jl Hasanudin No.73, Genteng 68465,	Banyuwangi	0333-845645	\N	\N	\N	-	\N
abb469b6-2aeb-4def-a7a2-fee9fa32db97	e87e4b32-bf21-4824-846c-a16e45e631c4	015.008	8	Jember	St. Yusup	Jl R.A.Kartini No.26,	Jember	0331-488943,  486478	0331-425732	\N	\N	-	\N
4b9b9536-eec7-484f-b0a4-d6fda2006329	e87e4b32-bf21-4824-846c-a16e45e631c4	015.009	9	Lawang	St. Perawan Maria Tak Bernoda	Jl Argopuro No.28,	Lawang	0341-426627	\N	\N	\N	-	\N
3a75f117-cdf4-4c61-97d7-94b358c85ded	e87e4b32-bf21-4824-846c-a16e45e631c4	015.010	10	Lodalem	Maria Annunciata	Jl Trisula No.57, Desa Arjowillangun, Kalipare 65166,	Malang Selatan	0341-379629	\N	\N	\N	-	\N
7e847140-dfc6-4f3f-b179-73da22950fd1	e87e4b32-bf21-4824-846c-a16e45e631c4	015.011	11	Lumajang	Maria Ratu Damai	Jl Yos Sudarso No.42,	Lumajang	0334-881462	\N	\N	parada@telkom.net	-	\N
cc6e5993-8d2d-4dc3-805f-2ad624762d24	e87e4b32-bf21-4824-846c-a16e45e631c4	015.012	12	Malang / Blimbing	St. Albertus de Trapani	Jl Jend. A.Yani No.22,	Malang	0341-491842	0341-411270	\N	\N	-	\N
8759782f-889a-4762-862a-c84e68b9ea8a	e87e4b32-bf21-4824-846c-a16e45e631c4	015.013	13	Malang / Celaket	Maria Diangkat Ke Surga	Jl Lely No.17,	Malang	0341-493280	\N	\N	bmv_assumtionis@telkom.net	-	\N
d3417e7e-32fe-4f8b-a191-1a7278003c09	e87e4b32-bf21-4824-846c-a16e45e631c4	015.014	14	Malang / Katedral	St. Perawan Maria Dari Gunung Karmel	Jl Buring No.60,	Malang	0341-362454	\N	\N	\N	-	\N
c45d4511-05ab-4f76-8309-bd667e509200	e87e4b32-bf21-4824-846c-a16e45e631c4	015.015	15	Malang / Kayutangan	Hati Kudus Yesus	Jl Mgr. Sugijopranoto No.2,	Malang	0341-323938,  364351	0341-353267	\N	\N	-	\N
ba0ecb61-cecd-4707-99b4-d8c961041394	e87e4b32-bf21-4824-846c-a16e45e631c4	015.016	16	Malang / Kepanjen	St. Perawan Maria Tak Bernoda	Jl Punten No.8,	Kepanjen	0341-395577	\N	\N	\N	-	\N
0d3e2231-5f2f-4479-9e98-3a834b3895fe	e87e4b32-bf21-4824-846c-a16e45e631c4	015.017	17	Malang / Kesatrian	Ratu Rosari	Jl Plongkowati No.2,	Malang	0341-366371	0341-331511	\N	\N	-	\N
bc85650e-901f-44d8-a282-82760cf9f150	e87e4b32-bf21-4824-846c-a16e45e631c4	015.018	18	Malang / Langsep	St. St. Vincentius A Paulo	Jl Ananas No.41,	Malang	0341-561336	\N	\N	\N	-	\N
0bd3438b-cfe3-4621-be69-96fc3e503715	e87e4b32-bf21-4824-846c-a16e45e631c4	015.019	19	Malang / Tidar	St. Andreas	Pastrn. Jl Puncak Esberg 22,  Gereja: Jl Mahameru  	Malang	Pastrn: 0341-555611/2,  Gereja: 0341-561765	\N	\N	\N	-	\N
9a39b239-58f7-4821-9ac6-8912734a3373	e87e4b32-bf21-4824-846c-a16e45e631c4	015.020	20	Malang / Janti	St. Yohanes Pemandi	Jl Keben II Surya Timur No. 9-10	Malang	0341-800441	\N	\N	\N	-	\N
9af8a7cf-bdbd-46a6-a92d-5ae6d5b8d838	e87e4b32-bf21-4824-846c-a16e45e631c4	015.021	21	Pamekasan / Madura	Maria Ratu Para Rasul	Jl Jokotole No.2,	Pamekasan	0324-322836	0324-331675	\N	\N	-	\N
9f0ded6e-0d25-48af-8500-1f364ef26186	e87e4b32-bf21-4824-846c-a16e45e631c4	015.022	22	Pandaan	St. Theresia	Jl A.Yani No.70	Pandaan	0343-631141	\N	\N	\N	-	\N
f59e5942-0aeb-40aa-b545-18e207cd9d8e	e87e4b32-bf21-4824-846c-a16e45e631c4	015.023	23	Pasuruan	St. Antonius	Jl Balai Kota No.1,	Pasuruan	0343-424740	\N	\N	\N	-	\N
d948593f-3235-4d7a-9720-f3c8417d2da6	e87e4b32-bf21-4824-846c-a16e45e631c4	015.024	24	Probolinggo	St. Maria Bunda Karmel	Jl Suroyo No.5,	Probolinggo	0335-423004, 421087	0335-428237	\N	\N	-	\N
963baaf5-4f22-4332-ae77-00109c7cfc35	e87e4b32-bf21-4824-846c-a16e45e631c4	015.025	25	Purworejo / Malang Selatan	Permaisuri Damai	Jl Trisula, Purworejo, Donomulyo,	Malang Selatan	0341-881133	\N	\N	\N	-	\N
08498c79-b22b-4273-808f-85cb0aab7a98	e87e4b32-bf21-4824-846c-a16e45e631c4	015.026	26	Situbondo	Maria Bintang Samodra	Jl Mawar No.50,	Situbondo	0338-677460,  671801	\N	\N	\N	-	\N
b2062923-d811-4ad9-b014-385167fe1eb7	e87e4b32-bf21-4824-846c-a16e45e631c4	015.027	27	Sumenep / Madura	Maria Gunung Karmel	Jl Slamet Riyadi No.33,	Sumenep	0328-662836	\N	\N	\N	-	\N
1578bc5d-f0db-43d4-82d8-c755c5bb8999	e87e4b32-bf21-4824-846c-a16e45e631c4	015.028	28	Tanggul	St. Maria Tak Bernoda	Jl P.B. Sudirman No.15,	Tanggul	0341-441348	\N	\N	\N	-	\N
a629851e-eab6-41ce-aca8-726f89088f23	e87e4b32-bf21-4824-846c-a16e45e631c4	015.029	29	Tumpang / Malang	Sancta Trinitas	Jl Kebonsari No.220,	Tumpang	0341-787709	\N	\N	\N	-	\N
09fdee50-ce69-49e6-b8ab-e7739cb853a5	e87e4b32-bf21-4824-846c-a16e45e631c4	015.030	30	Jajag	St. Paulus	Jl. Bung Tomo no. 8 RT 2 / RW 1, Dusun Jatisari Desa Wringinagung Kec. Gambiran Kab. Banyuwangi	Banyuwangi					-	\N
deb5fe04-c250-43d2-b37e-73fe3b4e329e	01c9571d-e28d-454f-b721-7badcb32ce9f	016.001	1	Amurang	Kebangkitan Kristus	Kel. Buyungon, Dusun VII, Tambosian 95354,	Amurang, Min-Sel.	0430-21124				-	\N
d1d3385e-b683-4a2e-a1a1-015ee13af202	01c9571d-e28d-454f-b721-7badcb32ce9f	016.002	2	Bitung	Stella Maris	Jl Sam Ratulangi No.89, Kadoodan,	Bitung	0438-35870,  21307				Aloisius M. Pondaag, Pr	\N
d9807c56-a46e-4a50-a917-9c52dd6dff60	01c9571d-e28d-454f-b721-7badcb32ce9f	016.003	3	Gorontalo	St. Christoforus	Jl Jend. A.Yani No.12,	Gorontalo	0435-821229				-	\N
476ccd27-c7bd-4bf3-87f7-dd43bfcbaf6b	01c9571d-e28d-454f-b721-7badcb32ce9f	016.004	4	Kakaskasen	St. Fransiskus Xaverius	Kel. Kakaskasen I, Lingk.VII,	Kec.Tomohon	0431-351705				-	\N
7ec9544f-43f6-4608-b742-2221f55ec006	01c9571d-e28d-454f-b721-7badcb32ce9f	016.005	5	Kali	St. Antonius	Desa Kali Lingk.VIII,	Kec.Pineleng					-	\N
a8ad2c50-a0c3-4a92-86f9-3f175851211b	01c9571d-e28d-454f-b721-7badcb32ce9f	016.006	6	Kembes	Kristus Raja	Desa Kembes I,	Kec.Tombulu	0431-878255,  841767				-	\N
5f563754-2328-4985-a725-ae0bcaa11fff	01c9571d-e28d-454f-b721-7badcb32ce9f	016.007	7	Kokoleh	St. Fransiskus de Sales	Desa Kokoleh I,  Jl Manado-Likupang,	Kec.Likupang Timur.	0431-8894334				-	\N
ac230714-fad1-424f-8d1a-75522df050bc	01c9571d-e28d-454f-b721-7badcb32ce9f	016.008	8	Tomohon I	Hati Kudus Yesus	Kolongan-Tomohon,	Tomohon	0431-351445,  352063				Benedictus Salettia, Pr	\N
582a449d-5a52-433a-8dbf-ad983435f1df	01c9571d-e28d-454f-b721-7badcb32ce9f	016.009	9	Kosio - Dumoga	St. Maria Pengantara	Desa Pinonobatuan Kab. Bolmong Induk,	Sul-Ut.	0434-2626919				-	\N
4ea3c65f-075f-4757-8e33-99c034c67637	01c9571d-e28d-454f-b721-7badcb32ce9f	016.010	10	Kotamobagu	Kristus Raja	Jl Jend. A.Yani No.797,	Kotamobagu	0434-21326				-	\N
77d877b3-6d6e-41d1-83d5-d2dbb58e3607	01c9571d-e28d-454f-b721-7badcb32ce9f	016.011	11	Laikit	St. Yohanes Penginjil	Kec. Dimembe, Kab. Minahasa Utara,	Manado	0431-893230				-	\N
467f23c6-9d5e-45f2-a769-0b7fd38f894a	01c9571d-e28d-454f-b721-7badcb32ce9f	016.012	12	Langowan	St. Petrus	Desa Koyawas Jaga I,	Langowan	0431-371432				-	\N
9d4952dd-779a-44bf-95d1-f2f5b224e661	01c9571d-e28d-454f-b721-7badcb32ce9f	016.013	13	Lembean	St. Paulus	Jl A.Mononutu (Minawerot-Tonsea), Kec.Kauditan,	Kab.Minahasa Utara	0431-891414				-	\N
3fd9a989-b531-43c9-8274-b9aa3cdbd158	01c9571d-e28d-454f-b721-7badcb32ce9f	016.014	14	Lotta	St. Johanes dan Kornelius	Jl Imam Bonjol Jaga IX Lotta, dan Wisma Lorenzo Jl Imam Bonjol No.20, Lotta,	Pineleng	0431-823587, 822587, 823790	0431-824607			-	\N
9ee2edc0-be1e-4756-b0fb-d7837732cda1	01c9571d-e28d-454f-b721-7badcb32ce9f	016.015	15	Luwuk	St. Maria Bintang Kejora	Jl S>Parman No.50, Luwuk 94711,	Sul-Tengah	0461-21525	0461-22277			-	\N
98cbcc69-565b-491a-93d0-3141f9e1ffc5	01c9571d-e28d-454f-b721-7badcb32ce9f	016.016	16	Malalayang	St. Theresia	Jl WR Monginsidi, Kel.Malalayang I Barat, 	Kec.Malalayang.	0431-3310852, 833821, 824510				Marcel Lintong, Pr	\N
c35e520a-b911-41a8-b1e9-b53c1c7ba04f	01c9571d-e28d-454f-b721-7badcb32ce9f	016.017	17	St. Ignatius	St. Ignatius	Jl Jend. Sudirman No.121,	Manado	0431-864561,  853698				-	\N
8d86f095-9158-4405-963b-82483f281c02	01c9571d-e28d-454f-b721-7badcb32ce9f	016.018	18	Karombasan	Hati Kudus Yesus	Lingkungan VIII, Karombasan,	Manado	0431-824902				-	\N
041d1266-a71d-4d90-b23a-35ff9d242f6a	01c9571d-e28d-454f-b721-7badcb32ce9f	016.019	19	Katedral	Hati Tersuci Maria	Jl Sam Ratulangi No.55A,	Manado	0431-855858,  846156				-	\N
c1348592-7e10-4338-b4f6-280a107fe5ba	01c9571d-e28d-454f-b721-7badcb32ce9f	016.020	20	Kleak	St. Yosef Pekerja	Jl Gereja St. Yosep No.17,	Manado	0431-852297				-	\N
54268fd9-b45a-4dc0-b803-c4ca9fac1f32	01c9571d-e28d-454f-b721-7badcb32ce9f	016.021	21	Tikala Baru	Raja Damai	Jl Daan Mogot No.73,	Manado	0431-860887				-	\N
96755567-2707-454d-8faa-3804dd0e69ae	01c9571d-e28d-454f-b721-7badcb32ce9f	016.022	22	Tuminting	Ratu Rosari Tersuci	Jl Pogidon I No.26, Tuminting,	Manado	0431-851928				-	\N
62b3a2cf-45ac-427d-9f44-6c94ebac448a	01c9571d-e28d-454f-b721-7badcb32ce9f	016.023	23	Wanea - Rike	Yesus Gembala Yang Baik	Jl  Bebe Palar No.48, Wanea Lingk.II,	Manado	0431-867106				-	\N
3fadf121-6a0f-47ed-8f9b-c6d8891bac86	01c9571d-e28d-454f-b721-7badcb32ce9f	016.024	24	Mangaran	St. Familia	Mangaran, Pos Lirung, Kec.Kabaruan, 	Kab.Talaud					-	\N
15d37371-8a86-4311-b09f-7476b869894c	01c9571d-e28d-454f-b721-7badcb32ce9f	016.025	25	Tomohon II - Matani	Roh Kudus	Kel. Matani I, Lingk.II,	Tomohon	0431-351470,  353140				-	\N
bd920382-3e7f-4a0c-ae2f-d8e602d735e2	01c9571d-e28d-454f-b721-7badcb32ce9f	016.026	26	Nulion	St. Petrus	Desa Nulion, Kec.Totikum Selatan, Kab.	Banggai Kepulauan	0462-2705355				-	\N
e7b6df48-a8fe-4b6e-9751-cec4db1bb192	01c9571d-e28d-454f-b721-7badcb32ce9f	016.027	27	Palu	St. Paulus	Jl Tangkasi No.8, Palu 94112,	Sul-Tengah	0451-482870				-	\N
fcef0ff7-31d4-41ce-9610-532bef59f50c	01c9571d-e28d-454f-b721-7badcb32ce9f	016.028	28	Paniki	Yesus Gembala Baik	Jl Mr. A.A. Maramis, Paniki Bawah, Kec.Mapanget,	Manado	0431-811034				-	\N
87623a09-6476-4715-958f-2b08c706e1d1	01c9571d-e28d-454f-b721-7badcb32ce9f	016.029	29	Pineleng	St. Fransiskus Xaverius	Jl Raya Manado-Tomohon,	Tomohon	0431-825595				Joutje Palit, Pr	\N
234dd29c-8681-435b-b2f8-1ad5b9d88b69	01c9571d-e28d-454f-b721-7badcb32ce9f	016.030	30	Poso	St. Theresia	Sebelumnya di Paroki St.Paulus,	Palu.					Pastor Jacob Adilang, Pr	\N
605e2070-7f62-4516-ad13-2bb60f0f72c0	01c9571d-e28d-454f-b721-7badcb32ce9f	016.031	31	Sambiut	Bunda Hati Kudus	Kec.Totikum, Kab.Banggai Kepulauan,	Sul-Tengah.	0868-12114306				-	\N
78853d0a-b4e6-4e51-b33b-838836e80a22	01c9571d-e28d-454f-b721-7badcb32ce9f	016.032	32	Sarongsong	St. Yosef	Jl Pangolombian, Walian-Uluindano,	Tomohon	0431-351508				-	\N
8e3946e4-dbb7-4106-bbf2-61e65a79902a	01c9571d-e28d-454f-b721-7badcb32ce9f	016.033	33	Sonder / Kiawa	Hati Kudus	Jl Gereja No.110, Tounelet,	Kec.Sonder	0431-356363				-	\N
e0e29595-bb66-4b4e-ab64-d583d6435c73	01c9571d-e28d-454f-b721-7badcb32ce9f	016.034	34	Sulubombong	Kristus Raja	Jl S.Parman No.50, Luwuk 94711	Sul-Tengah					-	\N
bc2402c2-5809-4341-812a-7e210dce2698	01c9571d-e28d-454f-b721-7badcb32ce9f	016.035	35	Tahuna	St. Yohanes Rasul	Jl Malahasa No.19, Soataloara, Tahuna 95813,	Sangihe Talaud	0432-21489				-	\N
1599d26e-fd52-435e-91a6-303ed63a1cfc	01c9571d-e28d-454f-b721-7badcb32ce9f	016.036	36	Tanawangko	Hati Kudus Yesus 	Jl Sarani-Matani, Tombariri,	Minahasa	0431-837552				-	\N
89b752f9-c5c1-4124-b259-20e5b42f4c94	01c9571d-e28d-454f-b721-7badcb32ce9f	016.037	37	Taratara	St. Antonius Padua	Desa Taratara, Dusun VI,	Tomohon Barat	0431-355406				-	\N
a3a8036e-0850-4a7d-9667-9e35557fd5f5	01c9571d-e28d-454f-b721-7badcb32ce9f	016.038	38	Tataaran	St. Antonius Padua	Jl Raya Tomohon-Tondano No.172, Kel. Tataaran II, Lingk. II,	Kec. Tondano	0431-321524				-	\N
8604116b-c9bb-46b2-a19d-bf033a4ba4cb	01c9571d-e28d-454f-b721-7badcb32ce9f	016.039	39	Tolai	St. Petrus	Jurusan Lebagu-Malakosa, Palu, Parigi 94372	Sul-Tengah	0450-26100				-	\N
b9ebcaf1-8f90-441c-848c-b2e3e3d2ae8f	01c9571d-e28d-454f-b721-7badcb32ce9f	016.040	40	Tolitoli	Kristus Raja		Tolitoli					-	\N
7436b62c-9635-48b5-9aeb-dee6a5b6bcf3	01c9571d-e28d-454f-b721-7badcb32ce9f	016.041	41	Tompaso Baru	St. Paulus	Jl RSU Cantia, Pinaesaan,	Tompaso Baru	0430-2424447				-	\N
3344c6ae-9615-48b1-8919-64ac23016cb7	01c9571d-e28d-454f-b721-7badcb32ce9f	016.042	42	Tondano	St. Rosa De Lima	Jl Wolter Monginsidi No.36, Watulambot,	Tondano Barat	0431-321539				-	\N
e4de3263-97fd-421e-87d6-4fe5df7ac1cc	01c9571d-e28d-454f-b721-7badcb32ce9f	016.043	43	Warembungan	St. Petrus	Desa Warembungan, Dusun XIII,	Kec.Pineleng					-	\N
54417258-ebcb-4ed4-af5f-7aa99eabf282	01c9571d-e28d-454f-b721-7badcb32ce9f	016.044	44	Woloan	Bunda Hati Kudus Yesus	Kel. Woloan II, Kec. Tomohon Barat,	Tomohon	0431-352212				-	\N
91951ecc-9d59-435e-ab77-195928af7eb2	01c9571d-e28d-454f-b721-7badcb32ce9f	016.045	45	Perkamil	St. Mikael	Jl Flaminggo No.78,	Manado	0431-856662				-	\N
7c3e20aa-2a6b-4128-bbd6-eb51fb2a2d11	01c9571d-e28d-454f-b721-7badcb32ce9f	016.046	46	Mokupa	St. Fransiskus Xaverius	Desa Mokupa Jaga VII, Kec.Tombariri 95351,	Kab. Minahasa	0431-826723,  831363				-	\N
28c48e2e-1e00-4cb9-adcf-0dcace9e0b53	01c9571d-e28d-454f-b721-7badcb32ce9f	016.047	47	Watutumou	Sta. Ursula	Jl Raya Manado-Bitung Km.10, Watutumou, Kec.Kalawat,	Minahasa-Utara	0431-816826				-	\N
6e39ec7f-5b9d-4317-93d7-263240539624	01c9571d-e28d-454f-b721-7badcb32ce9f	016.048	48	Tomohon III - Uluindano	Sta. Maria Ratu Damai	Jl. Pangolombian, Walian,	Uluindano	0431-351508				-	\N
386bdbb2-7d8f-4e70-be8d-341a2ae82e1d	01c9571d-e28d-454f-b721-7badcb32ce9f	016.049	49	Pantai Utara	St. Andreas	Jl Trans Sulawesi Km.178, Desa Lalow Kec.Lolak,	Bolaang Mongondow	0852-56981060				-	\N
29fd89e0-fdf4-4cf6-aecb-62a34a82a5e0	01c9571d-e28d-454f-b721-7badcb32ce9f	016.050	50	Banggai	Raja Damai	Jl Sudirman No.17, Kel. Lompio, Kec.Banggai,	Kab.Banggai Kepulauan.	0462-21011				-	\N
9ad624be-e1fc-4d19-b13c-4b5697019498	01c9571d-e28d-454f-b721-7badcb32ce9f	016.051	51	Melongoane	Sta. Maria Ratu Damai	Pastoran Katolik Kab.Melonguane, Kel.Melonguane No.22 Kode Pos 95885	Melongoane					-	\N
2728b5d7-6c62-407a-aa39-2e94b1cb696c	01c9571d-e28d-454f-b721-7badcb32ce9f	016.052	52	Tentena	Ratu Rosari Suci	Jl Panorama No.2, Kode Pos 94633,	Tentena	0458-21190				-	\N
e0726bf9-4d07-472a-bdd8-26cf75c1a0c7	01c9571d-e28d-454f-b721-7badcb32ce9f	016.053	53	Beteleme	St. Maria	Kecamatan Lembo, Kabupaten Morowali,	Sul-Teng.					-	\N
ba51324c-9b0e-45cb-85e7-100d8b69b8bc	01c9571d-e28d-454f-b721-7badcb32ce9f	016.054	54	Toli-Toli	Kristus Raja	Jl Jend. Sudirman No.74, Toli-Toli 94511,	Sul-Teng	0453-21778	0453-21385			-	\N
034ca548-cf59-42f9-ada1-30382420313d	01c9571d-e28d-454f-b721-7badcb32ce9f	016.055	55	Girian	St. Antonius De Padua	Jl. Wolter Monginsidi Kel. Girian Atas Kec. Girian	Bitung					Wilhemus Thome, Pr	\N
b96936bb-5251-46a7-b09b-240eaad7ebae	01c9571d-e28d-454f-b721-7badcb32ce9f	016.056	56	Guaan	St. Fransiskus Xaverius	Desa Guaan Kec. Modayag	Bolaang Mongondow Timur					Marcelino Ronny Singal, Pr	\N
a426f03e-c8e2-4278-ada5-415f6b874e91	01c9571d-e28d-454f-b721-7badcb32ce9f	016.057	57	Kawangkoan	St. Yosep	Kawangkoan	Kawangkoan					Yohanes Hermanus Lasut, Pr	\N
54e27485-9f34-4329-a60f-7c1345685214	01c9571d-e28d-454f-b721-7badcb32ce9f	016.058	58	Manembo Nembo	Maria Ratu Para Rasul	Jl. Efraim Lengkong Kel. Manembo Nembo Kec. Matuari	Bitung					Damianus Yangko Alo, Pr	\N
192bff6a-81b4-43e6-bf62-342cb3b4b035	01c9571d-e28d-454f-b721-7badcb32ce9f	016.059	59	Modo	St. Thomas	Desa Modo Kec. Bukal	Buol					Ciprianus Cornelius Motoh, Pr	\N
d47b1321-3ff9-41f5-a70c-1df2fca714f7	01c9571d-e28d-454f-b721-7badcb32ce9f	016.060	60	Modoinding	Sta. Perawan Maria Ratu Rosari Suci	Desa Sinisir Kec. Modoinding Jl. Trans Sulawesi Utara	Modoinding					Yan Silvanus Alo Koraag, Pr	\N
5352ee28-286f-4d0e-9ec7-6c91108eed83	01c9571d-e28d-454f-b721-7badcb32ce9f	016.061	61	Palu II	Sta. Maria Bunda Hati Kudus	Jl. Tangkasi No. 6	Palu					Herry Zet Purasa, Msc	\N
51dd14a5-9be3-4f16-8e29-7e00d3340ef1	01c9571d-e28d-454f-b721-7badcb32ce9f	016.062	62	Ratahan	St. Lukas	Jl. Raya Ratahan	Tombatu					Sirilius Made Yono, Pr	\N
4709ef37-dfb4-47d6-b1dc-4e55927cfc23	01c9571d-e28d-454f-b721-7badcb32ce9f	016.063	63	Ulu Siau	Sta. Maria	Pastoran Katolik Ulu Siau	Ulu Siau					Louis Marselinus Boyak, Pr	\N
f77c12cc-ea97-4bbc-aef9-0de80c40a68e	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.001	1	Aimas/Kab. Sorong	St. Fransiskus Xaverius	Pastrn Katolik St Fransiskus Xaverius, Desa Makbusun, Kec.Salawati	Kab. Sorong	0951-327838				-	\N
bd303f33-64f5-443e-9b01-d6f022b7f7c2	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.002	2	Ayawasi/Kab.Sorong Selatan	St. Yosef	Pastoran Katolik St Yosef Ayawasi 98463,	Kab. Sorong Selatan					-	\N
dcd96c0f-1c68-4b38-ab41-cca314b67e95	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.003	3	Bintuni/Kab.Teluk Bintuni	St. Yohanes	Pastoran Katolik St Yohanes, Jl Raya Bintuni Km.2	Bintuni	0955-31010				-	\N
73e92314-c878-4df2-a90e-f08b42dd0921	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.004	4	Fakfak/Kab. Fakfak	St. Yosef	Jl Mohammad Yamin Rt 1/02 Kel.Fakfak Utara, Distrik Fakfak, Kab.Fakfak,	Papua Barat	0956-22245				-	\N
8d716170-7a1b-445c-8867-2380949f19d2	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.005	5	Merapi /Kab. Fakfak	St. Maria	Paroki St Maria Merapi, Jl Trikora 02, Rt 12, Kp Merapi, Kel.Danaweria, Distrik Fakfak Tengah, Kab. Fakfak	Papua Barat	0956-23707				-	\N
e966f188-fcc0-444a-ac39-367a835d97ab	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.006	6	Wagom/Kab. Fakfak	St. Paulus	Paroki St Pulus Fakfak, Jl Imam Bonjol Rt 12, Kel.Wagom, Distrik Fakfak, Kab.Fakfak,	Papua Barat	0956-24432				-	\N
2d2fc371-94f8-459d-b1b3-8cb04059f71c	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.007	7	Kaimana/Kab.Kaimana	St. Martinus	Pastoran Katolik St Martinus, Jl Diponegoro, Kotak Pos 1,	Kaimana	0957-21248				-	\N
bc582312-581b-4e5d-a850-393b9acf4020	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.008	8	Manokwari/Kab.Manokwari	St. Agustinus	Pastoran Katolik St Agustinus, Jl Brawijaya No.40,	Manokwari	0986-211078	0986-6215062			-	\N
bf1b77fd-c6a1-4a35-966c-33e662b9a555	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.009	9	Sanggeng/Kab.Manokwari	Immanuel	Pastoran Katolik Immanuel, Jl Pahlawan, Kotak Pos 198,	Manokwari	0986-212023				-	\N
f55d2164-0bf8-42dc-b4a0-9464b75bd34d	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.010	10	Merdey/Kab. Teluk Bintuni	Salib Suci	d/a Pastoran Katolik St Agustinus, Jl Brawijaya No.40,	Manokwari					-	\N
f3fc8f34-3f54-4b35-a97f-85744cf190c3	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.011	11	Masni - SP8/Kab. Manokwari	Sang Gembala Baik	Pastoran Katolik Gembala Baik, Jl Jeremias No.1, Wariori-SP-8	Distrik Masni.					-	\N
bb9112af-0694-4c24-b014-b7b3d08520ce	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.012	12	Senopi / Kab.Manokwari	St. Yosef	Pastoran Katolik St Yosef, via Jl Brawijaya No.40,	Manokwari	0986-211078				-	\N
5f88be05-10f0-4b6c-8e0f-f3b556892e51	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.013	13	HBM / Kodya Sorong	Emaus	Pastoran Katolik Emaus, Jl Belibis No.1-3,	Sorong	0951-325903				-	\N
0a414de4-ab19-483e-9604-a10aaccc9d0c	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.014	14	Doom/Kodya Sorong	Maria Bintang Laut	Pastoran Katolik St Maria Bintang Laut, Jl Kartini,	Sorong	0951-321840				-	\N
95d28cef-8ff1-4dee-b138-8a0a567edbc7	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.015	15	Katedral / Kodya Sorong	Kristus Raja	Pastoran Katolik Kristus Raja, Jl RA Kartini No.2, Kampung Baru,	Sorong	0951-321533			wiamapi@yahoo.co.uk	-	\N
99fe3787-f193-4cc4-bdc3-334943e00205	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.016	16	Remu / Kodya Sorong	St. Petrus	Pastoran katolik St Petrus, Jl Rajawali No.43,	Sorong	0951-321181				-	\N
1ed81896-6986-4199-a966-16ad1f34113a	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.017	17	Prafi - SP4/Kab.Manokwari	St. Christoforus	Pastoran Katolik St Christoforus, Jl Dahlia, Udapi Hilir,	Prafi - SP-4	0986-811014				-	\N
4307f0ab-5854-4eeb-acd9-31f9ac22aab0	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.018	18	Mamur/Kab. Fakfak	Sta. Bernadeth	Paroki St Bernadeth Mamur, Distrik Kramamongga, Kab. Fakfak,	Papua Barat	0956-24432				-	\N
1be1bc33-b6cc-4470-808b-2ad5fdfb1d78	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.019	19	Malanu / Kodya Sorong	Arnoldus Janssen	Pastoran Katolik St Arnoldus Janssen, Jl S.Mambramo Malam,	Sorong	0951-333241				-	\N
2d4cc2ca-fd82-45e8-9348-9e7242639f2e	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.020	20	Klasaman / Kodya Sorong	Yohanes Pemandi	Pastoran Katolik St Yohanes Pemandi, Jl Basuki Rahman Km.14,	Klasaman, Sorong	0951-331194				-	\N
c7426656-955d-4128-95af-7bfd268ee6a4	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.021	21	Teminabuan/Kab.Sorong Sltn	St. Albertus Agung	Pastoran Katolik Salib Suci,	Teminabuan	0952-31162				-	\N
c1644b9e-19a5-4a96-86a2-ad3abb0b6192	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.022	22	Amban / Kab.Manokwari	St. Thomas Aquinas	d/a Pastoran Katolik, Jl Brawijaya No.40,	Manokwari					-	\N
0b7b98d2-ca07-469c-b989-fedf752a4530	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.023	23	Kelapa Dua/Kab.Teluk Bintuni	Kristus Terang Dunia	Pastoran Katolik Kristus Terang Dunia,	Kelapa Dua-Tofoi					-	\N
ed1a1144-fe3f-459d-b66b-f7ead8185d3b	8ead8fa0-b067-4c26-a6af-0ce807b79132	017.024	24	FEF / Kab. Tambrauw	St. Benediktus	Pastoran Katolik Distrik Fef, Kab.Tambrauw/Keusk. Manokwari-Sorong, Jl Jend.A.Yani No.83,	Sorong					-	\N
730b6c31-d356-4bb4-8e98-c9ddd97cc612	025912db-e08f-4096-9fbe-f770dddbde50	018.001	1	Aek Kanopan	Pius X	Jl Serma Maulana S No.48,	Aek Kanopan	0624-92289				-	\N
d0063371-d198-4320-a47c-253d1356ec27	025912db-e08f-4096-9fbe-f770dddbde50	018.002	2	Aek Nabara	St. Fransiskus Dari Assisi	Pastoran Katolik Jl Ampera,	Aek Nabara	0624-29149				-	\N
a84bc73b-6553-437e-8796-69d6920998ca	025912db-e08f-4096-9fbe-f770dddbde50	018.003	3	Balige	St. Josef	Pastoran Katolik Jl Pardede Onan,	Balige	0632-21192				-	\N
f771bda7-7537-4726-956b-f5e56f9b1835	025912db-e08f-4096-9fbe-f770dddbde50	018.004	4	Banda Aceh	Hati Mahakudus Yesus	Jl Jend. A.Yani No.2, Kotak Pos 33,	Banda Aceh	0651-21205				-	\N
7011cfaa-13c0-4188-871b-fa4f16300901	025912db-e08f-4096-9fbe-f770dddbde50	018.005	5	Bandar Baru	Sang Penebus	Pastoran Katolik Jl Medan Berastagi Km.47,	Bandar Baru	0628-97264				-	\N
70e8ab8e-4c3f-4e7b-b703-70c1c7409419	025912db-e08f-4096-9fbe-f770dddbde50	018.006	6	Binjai	Bunda Pertolongan Abadi	Pastoran Katolik, Jl Soekarno Hatta No.178,	Binjai	061-8821657				-	\N
89d0b3a0-3e3a-49df-acd9-b12cb8d5abe0	025912db-e08f-4096-9fbe-f770dddbde50	018.007	7	Delitua	St. Josef	Jl Biru-biru No.1, Rt 002/003, Delitua 20355,	Medan	061-7030115				-	\N
9c85f883-7f09-4c8e-94b4-e8c6a0e9be46	025912db-e08f-4096-9fbe-f770dddbde50	018.008	8	Dolok Sanggul	St. Fidelis	Pastoran Katolik Jl Merdeka No.47,	Dolok Sanggul	0633-31067				-	\N
06483161-736f-45cc-bc61-85770b073b28	025912db-e08f-4096-9fbe-f770dddbde50	018.009	9	Kabanjahe I	St. Perawan Maria Diangkat Ke Surga	Pastoran Katolik Jl Letnan Rata Perangin-angin,	Kabanjahe	0628-20015	0628-20469			-	\N
a555a3f5-8d08-4f03-bfc1-b4bad2635ce6	025912db-e08f-4096-9fbe-f770dddbde50	018.010	10	Kisaran	Sakramen Mahakudus	Jl Hamka No.6C,	Kisaran	0623-41011				-	\N
c3deee08-b0f5-4e8b-b04d-f69753cf178a	025912db-e08f-4096-9fbe-f770dddbde50	018.011	11	Lawe Deski	St. Yosef	Pastoran Katolik Jl Kotacane, Kec.Sigala-gala,	Lawe Deski					-	\N
7ca666ca-d014-4e03-a466-723ead07e638	025912db-e08f-4096-9fbe-f770dddbde50	018.012	12	Lintongnihuta	St. Konrad Parzham	Jl Tugu No.19, Onan Baru,	Lintongnihuta					-	\N
89007ef2-99d5-4d06-bced-38d0797106ee	025912db-e08f-4096-9fbe-f770dddbde50	018.013	13	Medan / Hayam Wuruk	St. Antonius	Jl Hayam Wuruk No.1,	Medan	061-4152740				-	\N
32d88a63-ac48-41c5-9997-32fae60543d1	025912db-e08f-4096-9fbe-f770dddbde50	018.014	14	Medan / Katedral	St. Maria Yang Terkandung Tak Bernoda Asal	Jl Pemuda No.1,	Medan	061-4552753				-	\N
762ba61a-287a-4ac8-87d1-9c6d35973829	025912db-e08f-4096-9fbe-f770dddbde50	018.015	15	Medan / Nusantara	Kristus Raja	Jl Merapi No.2,	Medan	061-4142144	061-4556828			-	\N
44796ab0-cfef-4fef-ba48-47860b43229a	025912db-e08f-4096-9fbe-f770dddbde50	018.016	16	Medan / Pasar Merah	St. Paulus	Jl H.M. Joni No.64 A,	Medan	061-7365680				-	\N
61cc2017-5a3d-478b-955a-1a275d931f8d	025912db-e08f-4096-9fbe-f770dddbde50	018.017	17	Medan / Tanjung Selamat	St. Maria	Jl Flamboyan V No.1/9 Komplek Polri, Tanjung Selamat,	Medan	Grj: 061-8365163,  Pastrn: 061-8226661				-	\N
b43c2b88-1219-4f4e-a44b-a9d8ae517411	025912db-e08f-4096-9fbe-f770dddbde50	018.018	18	Medan Timur	St. Petrus	Pelita V No.1, Kel. Sidorame Barat, Kec.Medan Perjuangan,	Medan	061-6636168				-	\N
1bd4ecb7-c39b-4d34-b39e-56313b0096fb	025912db-e08f-4096-9fbe-f770dddbde50	018.019	19	Onan Runggu	St. Paulus	Pastoran Katolik Onan Runggu 22394,	Pulau Samosir					-	\N
1f67f9f7-7b9a-4294-8545-2e2dfb5054b7	025912db-e08f-4096-9fbe-f770dddbde50	018.020	20	Pakkat	St. Yohanes Pembaptis	Pastoran Katolik Jl R.A.Kartini,	Pakkat					-	\N
2ed8192d-76c1-4754-baee-57f163f961cb	025912db-e08f-4096-9fbe-f770dddbde50	018.021	21	Palipi	St. Fransiskus Assisi	Pastoran Katolik Palipi 22393,	Pulau Samosir					-	\N
594e29e8-ebb6-4bc1-8437-383c03739705	025912db-e08f-4096-9fbe-f770dddbde50	018.022	22	Pangururan	St. Michael	Jl Uskup Agung Soegijopranoto No.1,	Pangururan.	0626-20074				-	\N
c52bbbcf-c66f-4f1b-872c-b24c049f3f11	025912db-e08f-4096-9fbe-f770dddbde50	018.023	23	Parapat	St. Fidelis	Jl Sirikki No.6,	Parapat	0625-41024(Ktr), 0625-41932 (Paroki)	0625-42152			-	\N
bf26bbf8-81b1-4f86-aa60-d385cc7dc125	025912db-e08f-4096-9fbe-f770dddbde50	018.025	25	Parongil	St. Petrus Dan Paulus	Jl Sisingamangaraja Atas No.62,	Parongil	0627-434048				-	\N
3fbeb1a1-384e-455c-98d2-c4ba5c8e14f1	025912db-e08f-4096-9fbe-f770dddbde50	018.026	26	Parsoburan	St. Josep	Pastrn Katolik Parsoburan d/a Pastrn Katolik Jl Pardede Onan,	Balige	0632-341884				-	\N
25a97261-aff4-4043-9557-094b38d68f69	025912db-e08f-4096-9fbe-f770dddbde50	018.027	27	Pematang Siantar III - Jl. Bali	St. Yosef	Pastoran Katolik Jl Bali / Kain Batik,	Pematang Siantar	0622-25783				-	\N
a504dbab-ee7b-49f2-a758-648f3dd465c4	025912db-e08f-4096-9fbe-f770dddbde50	018.028	28	Pematang Siantar II - Jl. Medan	St. Petrus Dan Paulus	Jl Medan KM 5,6 Kotak Pos 54	Pematang Siantar	0622-7553478				-	\N
f5e4319d-773d-4330-86bd-9a777fa1823b	025912db-e08f-4096-9fbe-f770dddbde50	018.029	29	Pematang Siantar I - Jl. Sibolga	St. Laurentius A Brundisio	Jl Sibolga,	Pematang Siantar	0622-21400				-	\N
8d431078-75c6-44a3-8e02-55810f025bab	025912db-e08f-4096-9fbe-f770dddbde50	018.030	30	Perdagangan	Kristus Raja	Jl Jenderal Sudirman No.3,	Perdagangan	0622-96191				-	\N
4f21b945-4fa4-4232-830c-c5bd51b943f1	025912db-e08f-4096-9fbe-f770dddbde50	018.031	31	Seribudolok	St. Fransiskus Dari Assisi	Pastoran Katolik Jl Sutomo No.16,	Seribudolok	0622-370711				-	\N
dcc27c53-bed1-47aa-827c-2bde07d6456a	025912db-e08f-4096-9fbe-f770dddbde50	018.032	32	Sidikalang	St. Maria Pertolongan Orang Kristen	Pastoran Katolik Jl Merga Silima No.1, PO Box 19,	Sidikalang	0627-21240				-	\N
09bc0726-4a29-432e-aef0-15d04b99d12c	025912db-e08f-4096-9fbe-f770dddbde50	018.033	33	Sumbul	St. Dionysius	Jl Sisingamangaraja Atas No.37,	Sumbul	0627-450014				-	\N
9cd1df66-098d-412d-aa05-b967e19ee2b9	025912db-e08f-4096-9fbe-f770dddbde50	018.034	34	Tiga Lingga	Maria Dari Gunung Karmel	Jl Kota Bunga No.16,	Tiga Lingga	0627-7436116				-	\N
4b7f8ce0-d47a-4096-82f7-d748e2f39e5c	025912db-e08f-4096-9fbe-f770dddbde50	018.035	35	Tanjung Balai	St. Mikael	Jl Gereja No.12,	Tanjung Balai	0623-92047				-	\N
e19d81e4-8a04-4a98-b759-37e25811af30	025912db-e08f-4096-9fbe-f770dddbde50	018.036	36	Tarutung	St. Maria	Jl D.I. Panjaitan No.39,	Tarutung	0633-21164				-	\N
958f262c-c16f-4fd8-a557-56fdb26112fd	025912db-e08f-4096-9fbe-f770dddbde50	018.037	37	Tebing Tinggi	St. Yosef	Jl Pahlawan No.13,	Tebing Tinggi	0621-21396				-	\N
c395630f-1c08-4b3c-8731-8cbe0ae4fe3e	025912db-e08f-4096-9fbe-f770dddbde50	018.038	38	Tiga Binanga	St. Fransiskus Assisi	Pastoran Katolik Jl Kotacaned KM 2,5	Tiga Binanga	0628-410025				-	\N
01a2556f-96ff-4ada-89e0-b6d6a3f17707	025912db-e08f-4096-9fbe-f770dddbde50	018.039	39	Berastagi	St. Fransiskus Assisi	Pastoran Katolik Berastagi, Jl Jamin Ginting,	Berastagi					-	\N
c69f7e95-f456-4741-9849-67357a25c43b	025912db-e08f-4096-9fbe-f770dddbde50	018.040	40	Kabanjahe II	St. Petrus Dan Paulus	Jl Irian Barat No.1,	Kabanjahe	0628-20185				-	\N
94378b09-b9fd-4110-87eb-af6153643231	025912db-e08f-4096-9fbe-f770dddbde50	018.041	41	Lubuk Pakam	Gembala Baik	Pastoran Katolik Jl Siantar No.111,	Lubuk Pakam	061-7951805				-	\N
dfbf3a98-47c8-4574-b527-3cb1dc3a5868	025912db-e08f-4096-9fbe-f770dddbde50	018.042	42	Medan / Helvetia	Padre Pio	Pastoran Katolik Jl Beringin III, Helvetia,	Medan	061-8474293	061-8474291			-	\N
de8bc2b0-f568-4154-8210-84f034f8e609	025912db-e08f-4096-9fbe-f770dddbde50	018.043	43	Medan / Mandala	St. Yohanes	Jl Mestika No.24, 	Medan	061-7369989				-	\N
0b43254f-1c5e-44fa-8bd6-414caa14d437	025912db-e08f-4096-9fbe-f770dddbde50	018.044	44	Medan / Martubung	St. Konrad	Jl Pancing I No.7, Martubung,	Medan	061-6840715, 6854525	061-6840716		svdverbodivino@plasa.com	-	\N
c9d2bb77-5bc1-46d4-937e-13159175f326	025912db-e08f-4096-9fbe-f770dddbde50	018.045	45	Medan / Padang Bulan	St. Fransiskus Dari Assisi	Jl Bunga Ester No.93 B, Padang Bulan Selayang II,	Medan	061-8214761	061-8214762			-	\N
e352c5af-4d89-491d-81d2-eb0c15b99ff2	025912db-e08f-4096-9fbe-f770dddbde50	018.046	46	Pangkalan Brandan	St. Paulus	d/a Pastoran Katolik Jl Soekarno Hatta No.178,	Binjai	0620-21479				-	\N
31528de2-d23d-4ebe-86a8-358d8281b6d1	025912db-e08f-4096-9fbe-f770dddbde50	018.047	47	Pematang Siantar IV - Tanah Jawa	Kristus Raja	d/a Jl Sibolga No.21,	Pematang Siantar					-	\N
40fc65e6-3940-4ff9-83de-fbb108deb093	025912db-e08f-4096-9fbe-f770dddbde50	018.048	48	Pematang Siantar V	St. Fransiskus Assisi	Jl Medan Km 5,6	Pematang Siantar	0622-29015				-	\N
9d743205-1a41-41f4-8e37-30526c8d8d38	025912db-e08f-4096-9fbe-f770dddbde50	018.049	49	Tomok - Simanindo	St. Antonio Mario Claret	Tomok, Pos Ambarita 22395,	Pulau Samosir	HP 081370027604				-	\N
18af1026-5493-42c8-aaa9-a08bac0a263c	64a32549-130a-4f89-9c6c-3c2aa734701c	019.001	1	Aboge	St. Yosef	Pastoran Katolik Aboge di Eci d/a K.A.Merauke 99602,	Papua					-	\N
5cde7f28-72dd-46d5-9354-7ef8f3ea60d3	64a32549-130a-4f89-9c6c-3c2aa734701c	019.002	2	Arare	St. Wilhelmus	Pastoran Katolik Arare, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
ce1e32a9-ac7a-4f5c-89c6-85d1cd14ce17	64a32549-130a-4f89-9c6c-3c2aa734701c	019.003	3	Bade	St. Antonius	Pastoran Katolik Bade d/a K.A.Merauke, Merauke 99602,	Papua	0974-21052				-	\N
a8d1da60-47bc-4ed2-a92c-88c3acc26c05	64a32549-130a-4f89-9c6c-3c2aa734701c	019.004	4	Bambu Pemali	St. Yoseph	Pastoran Katolik Jl Raya Mandala No.171, Merauke 99602,	Papua	0971-321003	0971-321003			Antonius Fanumbi, MSC	\N
4e3fafc1-649b-498d-ba04-3d87eb8b31b4	64a32549-130a-4f89-9c6c-3c2aa734701c	019.005	5	Batu Merah	St. Isidorus	Pastoran Katolik Batu Merah d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
3681ac3c-a17a-4110-b179-cf67663d9b8f	64a32549-130a-4f89-9c6c-3c2aa734701c	019.006	6	Buti	St. Theresia	Pastoran Katolik Buti, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
466926ab-b964-465f-aeeb-e01280748e66	64a32549-130a-4f89-9c6c-3c2aa734701c	019.007	7	Getentiri	St. Matias	Pastoran Katolik Getentiri, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
b0eb9641-ba00-4e64-91ec-7620631719ff	64a32549-130a-4f89-9c6c-3c2aa734701c	019.008	8	Kelapa Lima	St. Maria Fatima	Pastoran Katolik Kelapa Lima, d/a K.A.Merauke, Merauke 99602,	Papua	0971-321916				-	\N
d602ea68-8412-47c4-9d82-01962fe96e17	64a32549-130a-4f89-9c6c-3c2aa734701c	019.009	9	Kepi	Kristus Raja	Pastoran Katolik Kepi d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
85a940bb-577b-46d3-acc1-b3bcd88f5d6d	64a32549-130a-4f89-9c6c-3c2aa734701c	019.010	10	Kimaam	Kristus Raja	Pastoran Katolik Kimaam, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
e9bc64b4-7ad4-47ad-b491-b50032bd9c76	64a32549-130a-4f89-9c6c-3c2aa734701c	019.011	11	Kuda Mati - Kampung Baru	Sang Penebus	Pastrn Katolik Kuda Mati, Kp Baru d/a K.A.Merauke,, Merauke 99602,	Papua	0971-325229				-	\N
902312b0-a26d-45a6-9c09-887db55fc568	64a32549-130a-4f89-9c6c-3c2aa734701c	019.012	12	Kumbe	Petrus Dan Paulus	Pastoran Katolik Kumbe d/a K.A.Merauke, Merauke 99602,	Papua	0971-324396				-	\N
8a72883d-daf8-486b-93f8-2d70acd95119	64a32549-130a-4f89-9c6c-3c2aa734701c	019.013	13	Kuper	Rasul-rasul	Pastoran Katolik Kuper d/a K.A.Merauke, Merauke 99602,	Papua	0971-324630				-	\N
518bf8f1-42d0-465d-ad57-3d17055c7246	64a32549-130a-4f89-9c6c-3c2aa734701c	019.014	14	Merauke / Katedral	St. Fransiskus Xaverius	Pastoran Katolik K.A.Merauke, Jl Mandala No.30, Merauke 99602,	Papua	0971-321012				-	\N
1f5928f7-0a26-4c49-85f3-27998e452453	64a32549-130a-4f89-9c6c-3c2aa734701c	019.015	15	Mindiptana	Kristus Raja	Pastoran Katolik Mindiptana, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
17429603-1ccd-4189-be55-25c776a3bef1	64a32549-130a-4f89-9c6c-3c2aa734701c	019.016	16	Muting	St. Theresia	Pastoran Katolik Muting d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
2da72ada-d038-44cc-9304-cecd8f8121c9	64a32549-130a-4f89-9c6c-3c2aa734701c	019.017	17	Mur	St. Kristoforus	Pastoran Katolik Nambai, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
65b18245-6119-4b97-bc4d-136c913c3281	64a32549-130a-4f89-9c6c-3c2aa734701c	019.018	18	Okaba	St. Antonius	Pastoran Katolik Okaba d/a K.A.Merauke, Merauke 99602,	Okaba, Papua					-	\N
c939f201-46cd-4be2-a9f7-726ba3e72669	64a32549-130a-4f89-9c6c-3c2aa734701c	019.019	19	Tanah Merah	Hati Kudus	Pastoran Katolik Tanah Merah, d/a K.A.Merauke, Merauke 99602,	Papua	0975-31041				Jhems Kumolontang, MSC	\N
3f63c9af-54b4-4c8e-82ae-b504f5eb314e	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.011	11	Purbalingga	St. Agustinus	Jl Jend. Sudirman No.188,	Purbalingga	0281-891127				-	\N
ecd6c7f8-9278-434d-8e4f-08a64ee85036	64a32549-130a-4f89-9c6c-3c2aa734701c	019.020	20	Wakereop	Kristus Bangkit	Pastoran Katolik Wakereop d/a K.A.Merauke, Merauke 99602, 	Papua					-	\N
23c46e99-cbdb-4fef-902c-e2be49fb8092	64a32549-130a-4f89-9c6c-3c2aa734701c	019.021	21	Wanggete	Gembala Yang Baik	Pastoran Katolik Wanggete d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
97ddd101-7cd3-4901-9e34-0d32b38059e7	64a32549-130a-4f89-9c6c-3c2aa734701c	019.022	22	Waropko - Muyu Utara	Sakramen Mahakudus	Pastoran Katolik Waropko, d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
cb409b0f-916d-4526-9c9a-9d9192c74ebf	64a32549-130a-4f89-9c6c-3c2aa734701c	019.023	23	Wendu	Bunda Hati Kudus	Pastoran Katolik Wendu d/a K.A.Merauke, Merauke 99602, 	Wendu, Papua					-	\N
904b64ce-66aa-4ecb-a854-9e0549ac7e17	64a32549-130a-4f89-9c6c-3c2aa734701c	019.024	24	Mokbiran-Muyu Selatan	Hati Kudus Yesus	Pastoran Katolik Mokbiran d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
b11e8893-834d-43c4-8bfb-8aab17b09be2	64a32549-130a-4f89-9c6c-3c2aa734701c	019.025	25	Bamol	St. Lukas	d/a Keuskupan Agung Merauke, Merauke 99602,	Papua					-	\N
ad70abcc-a048-4677-ba4f-9493f7d6b51f	64a32549-130a-4f89-9c6c-3c2aa734701c	019.026	26	Asikie	St. Fransiskus Xaverius	Pastoran Katolik Asikie d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
a3e99cd5-df0f-4d02-924d-33595c57fb6d	64a32549-130a-4f89-9c6c-3c2aa734701c	019.027	27	Bupul	Pelindung Rasul-Rasul	d/a Keuskupan Agung Merauke, Merauke 99602,	Papua					-	\N
9fedbc45-07a1-4ec6-b8e3-e3911c9ed18b	64a32549-130a-4f89-9c6c-3c2aa734701c	019.028	28	Palipi	St. Fransiskus Assisi	Pastoran Katolik Palipi 22393,	Pulau Samosir					-	\N
f84ffdda-c899-4409-8687-2f00238879fe	64a32549-130a-4f89-9c6c-3c2aa734701c	019.029	29	Pangkalan Brandan	St. Paulus	d/a Pastoran Katolik Jl Soekarno Hatta No.178,	Binjai	0620-21479				-	\N
ec3c84c8-9bda-46ed-bec8-31d1470a048e	64a32549-130a-4f89-9c6c-3c2aa734701c	019.030	30	Pangururan	St. Michael	Jl Uskup Agung Soegijopranoto No.1,	Pangururan.	0626-20074				-	\N
36638c1f-001e-4d57-9e71-fe95de22ec76	64a32549-130a-4f89-9c6c-3c2aa734701c	019.031	31	Parapat	St. Fidelis	Jl Sirikki No.6,	Parapat	0625-41024(Ktr), 0625-41932 (Paroki)	0625-42152			-	\N
aa17c399-0ae4-48a6-acaf-091aa9b6c31a	64a32549-130a-4f89-9c6c-3c2aa734701c	019.032	32	Parlilitan	St. Lusia	Pastoran Katolik Parlilitan 22456,	Parlilitan					-	\N
41e2b15a-56e3-4277-b640-201812ad6526	64a32549-130a-4f89-9c6c-3c2aa734701c	019.033	33	Parongil	St. Petrus Dan Paulus	Jl Sisingamangaraja Atas No.62,	Parongil	0627-434048				-	\N
5325b961-8c01-437c-947d-361c0066d2fe	64a32549-130a-4f89-9c6c-3c2aa734701c	019.034	34	Parsoburan	St. Josep	Pastrn Katolik Parsoburan d/a Pastrn Katolik Jl Pardede Onan,	Balige	0632-341884				-	\N
5235c5ef-0571-45ab-864b-21700259ba0f	64a32549-130a-4f89-9c6c-3c2aa734701c	019.035	35	Pematang Siantar I - Jl. Sibolga	St. Laurentius A Brundisio	Jl Sibolga,	Pematang Siantar	0622-21400				-	\N
8c94266d-5c2f-48a6-8f01-6d26ef5dc6ae	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.028	28	Blitar II	St. Maria		Blitar					-	Blitar
ab4e1789-ded3-4696-8e56-9e4e4f937035	64a32549-130a-4f89-9c6c-3c2aa734701c	019.036	36	Pematang Siantar II - Jl. Medan	St. Petrus Dan Paulus	Jl Medan KM 5,6 Kotak Pos 54	Pematang Siantar	0622-7553478				-	\N
f0c08e20-130f-482b-9de6-2061a2028783	64a32549-130a-4f89-9c6c-3c2aa734701c	019.037	37	Pematang Siantar III - Jl. Bali	St. Yosef	Pastoran Katolik Jl Bali / Kain Batik,	Pematang Siantar	0622-25783				-	\N
e8f9ba88-73d8-478f-89b8-a91421d7ee06	64a32549-130a-4f89-9c6c-3c2aa734701c	019.038	38	Pematang Siantar IV - Tanah Jawa	Kristus Raja	d/a Jl Sibolga No.21,	Pematang Siantar					-	\N
f314b80f-2e2f-4355-9dc6-c26f1d577cb0	64a32549-130a-4f89-9c6c-3c2aa734701c	019.039	39	Pematang Siantar V	St. Fransiskus Assisi	Jl Medan Km 5,6	Pematang Siantar	0622-29015				-	\N
8effa284-95fb-48ff-98c8-92186675146a	64a32549-130a-4f89-9c6c-3c2aa734701c	019.040	40	Perdagangan	Kristus Raja	Jl Jenderal Sudirman No.3,	Perdagangan	0622-96191				-	\N
a769b28f-b93e-4d99-acb4-e070b836771b	64a32549-130a-4f89-9c6c-3c2aa734701c	019.041	41	Seribudolok	St. Fransiskus Dari Assisi	Pastoran Katolik Jl Sutomo No.16,	Seribudolok	0622-370711				-	\N
c21ef98c-540d-4010-8935-8d3227821011	64a32549-130a-4f89-9c6c-3c2aa734701c	019.042	42	Sidikalang	St. Maria Pertolongan Orang Kristen	Pastoran Katolik Jl Merga Silima No.1, PO Box 19,	Sidikalang	0627-21240				-	\N
eb199acb-36d4-466c-a4be-6829d389c843	64a32549-130a-4f89-9c6c-3c2aa734701c	019.043	43	Sumbul	St. Dionysius	Jl Sisingamangaraja Atas No.37,	Sumbul	0627-450014				-	\N
d696659a-6365-40d0-b8e5-17122731ea52	64a32549-130a-4f89-9c6c-3c2aa734701c	019.044	44	Tanjung Balai	St. Mikael	Jl Gereja No.12,	Tanjung Balai	0623-92047				-	\N
45520a19-796a-4c61-b1c5-6025a20ca54e	64a32549-130a-4f89-9c6c-3c2aa734701c	019.045	45	Tarutung	St. Maria	Jl D.I. Panjaitan No.39,	Tarutung	0633-21164				-	\N
b0b67a49-7ab2-49b2-93ad-267cb01cdef1	64a32549-130a-4f89-9c6c-3c2aa734701c	019.046	46	Tebing Tinggi	St. Yosef	Jl Pahlawan No.13,	Tebing Tinggi	0621-21396				-	\N
a0ac95e5-9a65-4932-a11d-4d985bd2e856	64a32549-130a-4f89-9c6c-3c2aa734701c	019.047	47	Tiga Binanga	St. Fransiskus Assisi	Pastoran Katolik Jl Kotacaned KM 2,5	Tiga Binanga	0628-410025				-	\N
d857f6f5-82d2-481c-87a2-fb24be3cb423	64a32549-130a-4f89-9c6c-3c2aa734701c	019.048	48	Tiga Lingga	Maria Dari Gunung Karmel	Jl Kota Bunga No.16,	Tiga Lingga	0627-7436116				-	\N
e1ba5104-71b0-4539-9f1c-c495cace51d4	64a32549-130a-4f89-9c6c-3c2aa734701c	019.049	49	Tomok - Simanindo	St. Antonio Mario Claret	Tomok, Pos Ambarita 22395,	Pulau Samosir	HP 081370027604				-	\N
596c8142-b049-4ecb-95a8-8f1c128eff61	8d73e770-431b-48fd-bdf9-c9611634f401	020.001	1	Airmolek	St. Theresia Dari Kanak-kanak Yesus	Pastoran Katolik Air Molek, Jl P.Tendean, Kotak Pos 7,	Rinsat	0761-41072	0761-41160			-	\N
c96b1a22-1be7-4259-b4bb-b41fd1fa969c	8d73e770-431b-48fd-bdf9-c9611634f401	020.002	2	Bagansiapi-api	St. Petrus Dan Paulus	Pastoran Katolik Jl Mawar No.42,	Bagansiapi-api	0625-21224				-	\N
ef84b1d4-98aa-42d4-b564-04111136fb47	8d73e770-431b-48fd-bdf9-c9611634f401	020.003	3	Bukittinggi	St. Petrus Klaver	Pastoran Katolik Jl Jenderal Sudirman No.67,	Bukittinggi	0752-21467				-	\N
c4d05ccb-09a8-4c7f-a8e4-dd01c2ca45cb	8d73e770-431b-48fd-bdf9-c9611634f401	020.004	4	Dumai	St. Fransiskus Xaverius	Pastoran Katolik Jl Datuk Laksamana No.99, Kotak Pos 16,	Dumai, Riau	0765-31238				-	\N
d5de642d-80b1-492e-a76b-1e14cef64c89	8d73e770-431b-48fd-bdf9-c9611634f401	020.005	5	Duri	St. Yosef	Pastoran Katolik, Jl Gajah Mada No.107, Sebanga Ktak Pos 42,	Duri, Riau	0755-92370				-	\N
b8af06bf-9a56-4a72-92a1-632f5875e76c	8d73e770-431b-48fd-bdf9-c9611634f401	020.006	6	Kayu Aro	St. Maria Diangkat Ke Surga	Pastoran Katolik Bedeng VIII Seberang,	Kayuaro, Kerinci					-	\N
54542ea5-e6fd-409e-bba3-359271c28ff6	8d73e770-431b-48fd-bdf9-c9611634f401	020.007	7	Labuhbaru	St. Paulus	Pastoran Katolik Jl Soekarno Hatta No.10, Labuhbaru, Pekanbaru,	Riau	0761-587497				-	\N
cc2a33a9-2c01-4d89-958f-9cd11f79d493	8d73e770-431b-48fd-bdf9-c9611634f401	020.008	8	Padang / Katedral	St. Theresia Dari Kanak-kanak Yesus	Pastoran Katolik Katedral, Jl Bundo Kandung No.31,	Padang	0751-25572	0751-812416			-	\N
c44106fd-a2c1-4ae6-9cc9-5d4c548e34cc	8d73e770-431b-48fd-bdf9-c9611634f401	020.009	9	Padang / Tirtonadi	St. Maria Bunda Yesus	Pastoran Katolik Jl Kampung Batu No.55,	Padang	0751-26070				-	\N
6fcd9602-37ac-4751-9fbd-ef1dbf7e0864	8d73e770-431b-48fd-bdf9-c9611634f401	020.010	10	Padang Baru	St. Fransiskus Assisi	Pastoran Katolik Padang Baru, Jl Jenderal Sudirman No.50,	Padang	0751-23201				-	\N
c0c5ed0e-4c0e-45d0-8c78-30f07d53461c	8d73e770-431b-48fd-bdf9-c9611634f401	020.011	11	Padang Panjang	St. Petrus Rasul	Pastoran Katolik Jl Jend.Sudirman No.67,	Bukittinggi	0752-8252 / 21467				-	\N
5f13c6d5-1935-4aa4-81d3-ffe036c49d30	8d73e770-431b-48fd-bdf9-c9611634f401	020.012	12	Pasaman	Keluarga Kudus	Pastoran Katolik Keluarga Kudus Mahakarya, Kotak Pos 5,	Pasaman, Sumbar					-	\N
3eff4d01-a1a1-4cec-bea3-24f08b00e6d9	8d73e770-431b-48fd-bdf9-c9611634f401	020.013	13	Payakumbuh	St. Fidelis A Sigmaringa	Pastoran Katolik Jl Pemuda No.74,	Payakumbuh	0752-92148				-	\N
68c68ebb-d339-4f74-bf66-ac516a34af97	8d73e770-431b-48fd-bdf9-c9611634f401	020.014	14	Pekanbaru	St. Maria Dari Fatima	Pastoran Katolik Jl Yani No.48, Kotak Pos 13,	Pekanbaru, Riau	0761-21031				-	\N
4a863615-47fe-43d5-8b43-91cebc5f12bd	8d73e770-431b-48fd-bdf9-c9611634f401	020.015	15	Sawahlunto	St. Barbara	Pastoran Katolik Sawah Lunto, Jl Yos Sudarso No.45,	Sawahlunto, Sum-Bar.	0754-61028				-	\N
87b3fbba-6e70-48fd-afea-f79540197a09	8d73e770-431b-48fd-bdf9-c9611634f401	020.016	16	Siberut	St. Maria Diangkat Ke Surga	Pastoran Katolik Muara Siberut, Siberut Selatan 25393,	Mentawai	0759-21015				-	\N
a94ebcce-0187-4e5d-bc61-149ae07742bd	8d73e770-431b-48fd-bdf9-c9611634f401	020.017	17	Sikabaluan	Maria Auxilium Christianorum	Pastoran Katolik Sikabaluan, Siberut Utara 25394,	Mentawai	via Radio/SSB				-	\N
77a42e47-1ad6-4083-873b-26636c3f3f8f	8d73e770-431b-48fd-bdf9-c9611634f401	020.018	18	Sikakap	St. Maria Assumpta	Pastoran Katolik Sikakap, Pagai Utara Selatan 25391,	Mentawai	0759-322127				-	\N
8a98d43e-5ca6-440d-9b1d-508a018b6cf1	8d73e770-431b-48fd-bdf9-c9611634f401	020.019	19	Sipora	St. Yoseph	Pastoran Katolik Sioban,	Padang	0759-323084				-	\N
b8a981a6-d000-4cdd-821b-81070afb97b9	8d73e770-431b-48fd-bdf9-c9611634f401	020.020	20	Bagan Batu	St. Maria Ratu Rosari	Gereja Katolik Bagan Batu, Jl Tuanku Tambusai, Kotak Pos 15, 	Bagan Batu, Riau	0765-51639				-	\N
db1104aa-aac0-42bd-967c-f2570b95e79c	8d73e770-431b-48fd-bdf9-c9611634f401	020.021	21	Pangkalan Kerinci	Hati Kudus	Gereja Katolik Pangkalan Kerinci Jl  Arbes Ujung, PO Box 11 Pangkalan Kerinci,	Kab.Palalawan, Riau	0819682767 dan 081275460640				-	\N
d86be55b-1924-4b19-81d7-4d26a464489c	8d73e770-431b-48fd-bdf9-c9611634f401	020.022	22	Pasir Pangarayan	St. Ignatius	Pastoran Katolik Pasir Pangarayan, Jl Hang Tuah 977,	Rokan Hulu, Ridar	0762-91126				-	\N
d240a66c-e354-4f20-a7cb-097b7720bd6e	8d73e770-431b-48fd-bdf9-c9611634f401	020.023	23	Kumbe	Petrus Dan Paulus	Pastoran Katolik Kumbe d/a K.A.Merauke, Merauke 99602,	Papua	0971-324396				-	\N
e3ef990c-a7a1-4b5f-9378-6dbcad664060	8d73e770-431b-48fd-bdf9-c9611634f401	020.024	24	Kuper	Rasul-rasul	Pastoran Katolik Kuper d/a K.A.Merauke, Merauke 99602,	Papua	0971-324630				-	\N
229d8816-9758-46b6-be99-a504ad65f8c8	8d73e770-431b-48fd-bdf9-c9611634f401	020.025	25	Muting	St. Theresia	Pastoran Katolik Muting d/a K.A.Merauke, Merauke 99602,	Papua					-	\N
529efdbf-5f13-4f5e-94ba-c031472ba258	8d73e770-431b-48fd-bdf9-c9611634f401	020.026	26	Okaba	St. Antonius	Pastoran Katolik Okaba d/a K.A.Merauke, Merauke 99602,	Okaba, Papua					-	\N
829485e6-84a6-44ae-a83f-872567154ced	8d73e770-431b-48fd-bdf9-c9611634f401	020.027	27	Wendu	Bunda Hati Kudus	Pastoran Katolik Wendu d/a K.A.Merauke, Merauke 99602, 	Wendu, Papua					-	\N
6f63d6de-6fe8-4ae4-8056-6e2718413637	eace39cd-c5f0-49fc-a907-758a664e6281	021.001	1	Ampah	St. Petrus Dan Paulus	Pastoran Katolik Jl Negara No.40,	Ampah, Kalteng.	0522-31203				-	\N
818333a9-bf54-4f43-ac51-a06bab75f5f2	eace39cd-c5f0-49fc-a907-758a664e6281	021.002	2	Buntok	St. Paulus	Jl Panglima Batur No.6, Tromol Pos 4,	Buntok, Kalteng.	0525-21072				-	\N
8a7c02c2-8a7e-478f-8a3c-c23afde9f704	eace39cd-c5f0-49fc-a907-758a664e6281	021.003	3	Kandui	St. Petrus Kanisius	d/a Pastoran Katolik , Jl Cempaka Putih No.50, Kotak Pos 35	Muara Teweh	0519-21215				-	\N
12937b8b-599d-4540-a05d-7300ec8f53a3	eace39cd-c5f0-49fc-a907-758a664e6281	021.004	4	Katingan	St.Yosef Freinademetz	Pastrn Katolik Katingan d/a Biara Soverdi, Jl Cilik Riwut KM 5,5	Palangkaraya, Kalteng.	0536-3231220				-	\N
f2f221ba-85a7-4e99-904b-e78ee9c8ed4f	eace39cd-c5f0-49fc-a907-758a664e6281	021.005	5	Kuala Kapuas	St. Matheus	Jl Kapten Pierre Tendean V/46, Kotak Pos 141,	Kuala Kapuas, Kalteng.	0513-21340				-	\N
3c7d17ac-9166-4203-a2f0-2864bd54143d	eace39cd-c5f0-49fc-a907-758a664e6281	021.006	6	Kuala Kurun	St. Arnoldus Yanssen	Pastoran Katolik Kuala Kurun, Jl Damang Gaman No.1, Kuala Kurun,	Kab.Gunung Mas, Kalteng.	0537-31523				-	\N
8ac5df40-bc3b-48fe-8c4f-56720ddaf7ef	eace39cd-c5f0-49fc-a907-758a664e6281	021.007	7	Muara Teweh	St. Maria De La Salette	Jl Cempaka Putih No.50, Kotak Pos 35,	Muara Teweh, Kalteng.	0519-21215				-	\N
295bcfc6-0cec-4322-b6c1-05fa784fb021	eace39cd-c5f0-49fc-a907-758a664e6281	021.008	8	Nanga Bulik	Raja Semesta Alam	Pastoran Katolik, Jl JC Rangkap No.61, RT 7, Nanga Bulik 74162,	Kab.Lamandau, Kalteng.	0532-2071348				-	\N
59534b12-4109-410c-81b9-89f9ff3fd42a	eace39cd-c5f0-49fc-a907-758a664e6281	021.009	9	Palangkaraya	St. Perawan Maria	Jl Cilik Riwut KM 1 No.05,	Palangkaraya, Kalteng.	0536-3221624				-	\N
4c53cb74-d7b7-41ff-9cfa-913751e99972	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.031	31	Madiun I	St. Cornelius	\N	Madiun	\N	\N	\N	\N	-	Madiun
8a24034f-ff53-43dc-a467-aa8f349c0d88	eace39cd-c5f0-49fc-a907-758a664e6281	021.010	10	Pangkalan Bun	St. Paulus	Jl Diponegoro No.9,	Pangkalan Bun, Kalteng.	0532-21066				-	\N
18f0f1b4-4698-4017-9c70-de60056bebab	eace39cd-c5f0-49fc-a907-758a664e6281	021.011	11	Parenggean	Ecce Homo	Pastoran Katolik Parenggean, Jl Kali Kasa Km 1,5 Parenggean 74335,	Kotawaringin Timur	0531-2051171				-	\N
e55bdd7d-e5fc-480e-95fc-a3f2c35f9969	eace39cd-c5f0-49fc-a907-758a664e6281	021.012	12	Patas	St. Yohanes	d/a PLP Putai IDI, Jl Kapten Raden Susilo No.259,	Ampah	0522-31147				-	\N
7ba6c228-6a7e-45fc-bd54-8f3e9c234ae4	eace39cd-c5f0-49fc-a907-758a664e6281	021.013	13	Puruk Cahu	St. Clemens	Pastoran Katolik, Jl Veteran No.50, 	Puruk Cahu, Kalteng.	0528-31156				-	\N
c07d4698-b78e-4548-b4db-d9dfbce11f48	eace39cd-c5f0-49fc-a907-758a664e6281	021.014	14	Rantau Pulut	Hati Kudus Yesus	Pastoran Katolik Rantau Pulut, Jl Kom.Laut Yos Sudarso, Kotak Pos 103,	Sampit, Kalteng.	0531-21174				-	\N
7a4378c4-56c7-452f-b566-e8074169fe6c	eace39cd-c5f0-49fc-a907-758a664e6281	021.015	15	Rungan / Manuhing	St. Theresia	Pastoran Katolik Jl Cilik Riwut No.05,	Palangkaraya, Kalteng.	0536-3221624				-	\N
8dcfbbc6-dcce-456e-80e4-fc86446a4e68	eace39cd-c5f0-49fc-a907-758a664e6281	021.016	16	Sampit	St. Yohanes Don Bosco	Jl Kom. Laut Yos Sudarso, Kotak Pos 103,	Sampit, Kalteng.	0531-21174				-	\N
f8d22053-0d55-4174-98f3-237cb85d9b4e	eace39cd-c5f0-49fc-a907-758a664e6281	021.017	17	Sukamara	St. Petrus	Jl Akau No.32 RT 096 RW III, Kotawaringin Barat,	Sukamara, Kalteng.					-	\N
7f072a1e-e0ee-4b3d-bae4-c266473aac4f	eace39cd-c5f0-49fc-a907-758a664e6281	021.018	18	Tamiang Layang	St. Mikael	Pastoran Katolik, Jl Nan Sarunai RT III No.7,	Tamiang Layang, Kalteng.	0526-2091177				-	\N
228bbc12-7063-4166-8b4b-f66348c6cb20	eace39cd-c5f0-49fc-a907-758a664e6281	021.019	19	Kasongan	Maria Bunda Karmel	Pastoran Katolik Tangkiling, Jl Cilik Riwut KM 29,	Palangkaraya, Kalteng.	0536-3323082				-	\N
82578b64-256f-472a-af21-794bf343aa32	eace39cd-c5f0-49fc-a907-758a664e6281	021.020	20	Kudangan	St. Josef	Gereja Katolik St Yosef, Jl Trans Kalimantan Kudangan, Kec.Delang,	Kab.Lamandau, Kalteng.					-	\N
dd3ecf28-3ca0-47cd-ab3a-b1424b466873	eace39cd-c5f0-49fc-a907-758a664e6281	021.021	21	Pulang Pisau	St. Gabriel	Pastoran Katolik Jl Darung Bawan RT VIII No.50,	Pulang Pisau, Kalteng.					-	\N
f9d7828a-7d79-4eab-8f73-d0b65610b4cf	eace39cd-c5f0-49fc-a907-758a664e6281	021.022	22	Sipora	St. Yoseph	Pastoran Katolik Sioban,	Padang	0759-323084				-	\N
1edb19e4-8389-4dbc-959a-5bd236401470	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.001	1	Bangunsari	Tritunggal Kudus/Trinitas	Pastoran Katolik Trinitas, Bangunsari BK 03, Buaymadang,	OKU-Timur, Sum-Sel.					-	\N
716d9272-b6be-49ef-a9d7-5489b72757e0	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.002	2	Batuputih	Sang Penebus	Pastoran Katolik Batuputih d/a P.A.Rumah Yusuf, Jl Kol.Burlian No.561, Pusar Baturaja 32115,	OKU, Sum-Sel.	0735-320286				RD. Petrus Sukino	\N
0bc1b1a9-4df6-4d5e-a336-75cc2569814a	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.003	3	Baturaja	St. Petrus Dan Paulus	Pastoran Katolik Baturaja d/a P.A. Rumah Yusuf, Jl Kol. Burlian No.561, Pusar Baturaja,	OKU, Sum-Sel.	0735-320286				RD. Makarius Samandi	\N
ddc86ad2-ae99-4aa4-b16d-ee4284b30a37	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.004	4	Bengkulu	St. Yohanes Penginjil	Pastoran Katolik St. Yohanes Penginjil, Jl. Prof Dr Hazairin SH No.12,	Bengkulu.	0736-28578	0736-24493 (via Susteran CB)			-	\N
c2813433-331e-450f-aa39-10493c932bbc	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.005	5	Curup	St. Stephanus Martir	Pastoran Katolik St. Stephanus Martir, Jl.D.I.Panjaitan-Talang Benih, PO Box 145, Curup Rejang Lebong 39101,	Bengkulu	0732-21081	0732-22573			-	\N
b057d3c9-e728-431e-ab17-b2e3922abaa5	812df38d-e018-4c66-8eb3-6432e1245caf	036.013	13	Obano	St. Fransiskus		Jayapura					-	\N
383143f3-8049-4a05-b0f9-6e388f8aea3e	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.006	6	Gumawang	St. Maria Tak Bernoda	Pastoran Katolik St. Maria Tak Bernoda, Jl Charitas No.2, Belitang BK 10,	OKU Timur, Sum-Sel.	0735-450075				-	\N
4ce3299c-e053-41f7-8ea4-10775d9fd7b3	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.007	7	Jambi	St. Theresia	Pastoran Katolik St. Theresia, Jl RD Mattaher No.19, Kotak Pos 13,	Jambi 	0741-23310,  50160	0741-21561			-	\N
5d6cc41c-2237-4efc-a445-7f2c327f09d3	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.008	8	Lahat	St. Maria Pengantara	Pastoran Katolik St. Maria Pengantara, Jl Mayor Ruslan No.1,	Lahat, Sum-Sel.	0731-321826				-	\N
6604c496-c163-4e1d-a5d5-2289bd2d8a47	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.009	9	Lubuk Linggau	Penyelenggara Ilahi	Pastoran Katolik Penyelenggara Ilahi, Jl Garuda No.131,	Lubuk Linggau, Sum-Sel.	0733-321226				-	\N
7934ba83-7bca-4b56-a0ef-c6b6b3e37269	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.010	10	Mojosari	St. Maria Assumpta	Pastoran Katolik St. Maria Assumpta, Mojosari BK 9,	OKU-Timur, Sum-Sel.	0735-450307				-	\N
b9201b09-ce38-4a4e-a9ad-50a843f5e744	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.011	11	Muara Bungo	St. Paulus	Pastoran Katolik St. Paulus, Muara Bungo Lrg. Sepakat RT/RW 006/002, PO Box 10,	Muara Bungo, Jambi.	0747-21155	0747-21145 (via Susteran SJD)			-	\N
c9839cf3-8655-4c42-a90e-5052ae158306	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.012	12	Palembang	Hati Kudus	Jl Kol. Atmo No.132, Kotak Pos 241,	Palembang	0711-350413			phk@mdp.co.id	-	\N
3cc4fb8c-21fa-4f97-8f7d-b3f5eb5b45a3	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.013	13	Palembang	St. Fransiskus De Sales/Sanfrades	Jl Urip Sumoharjo No.14,	Palembang	0711-711620				-	\N
d3c07be2-efb8-4911-8387-4a7842dd26dd	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.014	14	Palembang/Seberang Ulu	St. Maria Ratu Rosari	Jl Jendral A.Yani, Lorong Tembok Baru No.76,  9/10 Ulu,	Palembang	0711-518403	0711-518340			-	\N
20ee067c-a693-4d46-8438-62eb589079a4	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.015	15	Palembang	St. Yoseph	Jl Jendral Sudirman No.128C,	Palembang	0711-352048 /  360257				-	\N
c3048b01-2b85-47fb-bf5f-02a3c7534fa5	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.016	16	Pasang Surut	Allah Maha Murah	Pastoran Katolik Allah Yang Maha Murah, Purwadadi Jalur 20, Air Sugihan 30776,	MUBA, Palembang					-	\N
c8082320-4f4d-4785-90d6-a30e40281db7	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.017	17	Palembang / Plaju	St. Paulus	Jl Pintu Gereja Komperta Plaju, Kotak Pos 02,	Palembang	0711-540222				RD. Paulus Tugiyo	\N
e9d03ac1-f93f-4913-9b0a-86578800bdeb	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.018	18	Katedral	St. Maria	Jl Sutomo No.4,	Palembang	0711-321696	0711-321695			-	\N
a94f3d1f-a75d-477b-835d-233c22553bc5	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.019	19	Singkut	St. Isidorus	Pastoran Katolik St. Isidorus, Desa Bukit Murau, Singkut III 37482,	SARKO, Jambi					-	\N
a62837b2-a49b-4a8c-8706-f41ae29cc943	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.020	20	Palembang / Kenten	St. Petrus	Pastoran Katolik St Petrus, Jl Betawi Raya No.1332, Sako Kenten,	Palembang	0711-810268				-	\N
f92ac3b7-832f-4553-b417-0fd134de657a	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.021	21	Palembang / Talang Betutu	St. Stephanus	Pastoran Gereja Katolik Talangbetutu, Jl Lukman Idris, Alang-Alang Lebar Km 12, Talangbetutu	Palembang	0711-430702				-	\N
168c3ac6-0376-4c64-a133-015f324a407d	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.022	22	Tanjung Enim	St. Yoseph	Pastoran Katolik St.Yoseph, Jl Gereja No.2, Tanjung Enim	Palembang	0734-451420				Archileus Asa, Pr	\N
adaaed9c-a984-4a6c-9b9e-2ba13a920748	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.023	23	Tanjung Sakti	St. Mikael	Pastoran Gereja Katolik St Mikael, Tanjungsakti,	Kab.Lahat, Sum-Sel.	0730-421457				-	\N
9fdb7acb-7611-43ac-a2a2-1e7aa3abe6a7	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.024	24	Tegalsari	Para Rasul Kudus	Pastoran Katolik Para Rasul Kudus, Tegalsari BK 21, Pos Sumberjaya,	Belitang OKU Timur, Sum-Sel.					-	\N
17ca5ea2-9dbc-4103-aa0f-0cd32d131c22	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.025	25	Tugumulyo / Mura	St. Maria	Pastoran Katolik St. Maria Mataram, Tugumulyo 31662,	Musi Rawas, Sum-Sel.	0733-371044				-	\N
1c4fbf8d-0704-444a-8aa1-76e36d29a5d3	0a0c3306-cc09-4dbc-a138-3414ee37e6cc	022.026	26	Tugumulyo / Oki	Kristus Raja	Pastoran Katolik Kristus Raja, Tugumulyo Kp. 2,	Lempuing, OKI, Sum-Sel.	0712-331060				-	\N
7badd7a0-557f-4852-9fa5-c1efbaca90bb	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.001	1	Bengkong - Batam	Beato Damian	Pastoran Katolik Beato Damian, Kompleks Green Town, Bengkong Ratu,	Batam	0778-333142				-	\N
8ad62ea6-c156-46dd-b932-ab54c48364eb	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.002	2	Lubuk Baja - Batam	St. Petrus	Jl Anggrek Blok II, Lubuk Baja,	Batam	0778-457755	0778-451170			-	\N
ce0b839b-7d34-4a7c-bfc1-958f40f2691c	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.003	3	Belinyu - Bangka	St. Perawan Maria Dikandung Tanpa Noda	Pastoran Katolik, Jl Mayor Safrie Rakhman No.107, Belin yu 33254,	Bangka	0715-321331				-	\N
a496b6ce-6b78-45b8-82fc-3967c748ea42	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.004	4	Mentok - Bangka	St. Perawan Maria Pelindung Para Pelaut	Pastoran Katolik, Jl Kartini No.24, Mentok 33313,	Bangka	0716-21200				-	\N
2b18a412-faaf-4fff-b365-f2eea1742b5b	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.005	5	Pangkalpinang - Bangka	St. Yosef (Katedral)	Pastoran Katolik, Jl Gereja No.2, Pangkalpinang 33131,	Bangka	0717-432178	0717-432152			-	\N
31abf6f3-d683-4907-b5d1-f10cc685c062	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.006	6	Sungailiat - Bangka	St. Perawan Maria Pengantara Segala Rahmat	Pastoran Katolik, Jl Jend. Sudirman No.36, Sungailiat 33211,	Sungailiat, Bangka	0717-92268				-	\N
78998c7f-dc3c-4bcd-b0ac-881b3ff36221	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.007	7	Tanjung Balai - Karimun	St. Joseph	Pastoran Katolik, Jl Trikora No.1, Tanjung Balai,	Karimun, Kep. Riau	0777-21013	0777-21013			-	\N
612add85-0750-4713-bbac-b1d1ae4db5bb	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.008	8	Tanjung Pandan - Belitung	Regina Pacis (St. Maria Ratu Damai)	Pastoran Katolik Jl Gegedek No.56 RT 45/14, Tanjung Pandan 33416,	Belitung	0719-21286				-	\N
603df276-38e1-4d57-a85c-359ecaff83e4	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.009	9	Tanjung Pinang - Bintan	Hati St. Perawan Maria Yang Tak Bernoda	Pastoran Katolik, Jl Diponegoro No.12,	Tanjung Pinang	0771-21386	0771-20096			-	\N
d6ee3f01-49c5-447e-a8d4-34a30c6f8a53	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.010	10	Ujung Beting - Lingga	St. Carolus Boromeus	Gereja Katolik St Paulus, Jl Merdeka No.9, Dobo-	Singkep, Kep. Riau.					-	\N
4e171122-8586-4a42-bcb9-ff6b6213dab2	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.011	11	Tembesi - Batam	Maria Bunda Pembantu Abadi	Pastoran Katolik, Jl Suprapto No.41 RT 03/RW 02, Tembesi Lestari,	Batam	0778-7026572				-	\N
78c92285-2880-4a77-9cfe-991df6c07c5c	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.012	12	Tiban - Batam	Kerahiman Ilahi	Jl Gajah Mada Tiban III, Sekupang,	Batam	0778-322886	0778-321800			-	\N
444143bc-03d9-4fc6-9ce1-b3da40377e38	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.013	13	Bernadeth - Bangka	St. Bernadeth	Jl Kota Bumi II,	Pangkalpinang	0717-7001811				-	\N
42565c55-9819-41ff-993d-66cd3c89c6cd	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.014	14	Koba - Bangka	St. Fransiskus Xaverius	Pastoran Katolik, Jl Listrik No.1, Koba 33181,	Bangka	0717-61397				-	\N
8633bb2a-78bd-43ed-905b-e7e59da764c4	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.015	15	Palembang	St. Fransiskus De Sales/Sanfrades	Jl Urip Sumoharjo No.14,	Palembang	0711-711620				-	\N
8dbc9323-2712-48a1-81ae-40686275fcaa	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.016	16	Palembang / Kenten	St. Petrus	Pastoran Katolik St Petrus, Jl Betawi Raya No.1332, Sako Kenten,	Palembang	0711-810268				-	\N
d8785a13-b30f-4d89-8ae9-9134633085e6	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.017	17	Palembang / Plaju	St. Paulus	Jl Pintu Gereja Komperta Plaju, Kotak Pos 02,	Palembang	0711-540222				-	\N
a9dbfcd6-b559-4bf1-9802-32f2c1f2ba00	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.018	18	Palembang/Seberang Ulu	St. Maria Ratu Rosari	Jl Jendral A.Yani, Lorong Tembok Baru No.76,  9/10 Ulu,	Palembang	0711-518403	0711-518340			-	\N
41563b0a-0671-4fdd-b814-08efd37157ec	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.066	66	Sragen	St. Maria Fatima	Jl Patimura No.2, Sragen 57211,	Sragen	0271-891027				-	\N
4d6f98b1-43d2-4e5c-8d74-a939a76b59f2	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.019	19	Palembang / Talang Betutu	St. Stephanus	Pastoran Gereja Katolik Talangbetutu, Jl Lukman Idris, Alang-Alang Lebar Km 12, Talangbetutu	Palembang	0711-430702				-	\N
d1df84e3-66a8-4a75-8a35-e300a2df1b2a	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.020	20	Pasang Surut	Allah Maha Murah	Pastoran Katolik Allah Yang Maha Murah, Purwadadi Jalur 20, Air Sugihan 30776,	MUBA, Palembang					-	\N
ee32d90f-6b76-494e-8860-b527d200a27e	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.021	21	Singkut	St. Isidorus	Pastoran Katolik St. Isidorus, Desa Bukit Murau, Singkut III 37482,	SARKO, Jambi					-	\N
5b356e39-b135-4aac-a2ba-300e2fa76d0a	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.022	22	Tanjung Enim	St. Yoseph	Pastoran Katolik St.Yoseph, Jl Gereja No.2, Tanjung Enim,	LIOT, Sum-Sel.	0734-451420				-	\N
8e60138a-ba9f-4e84-aa96-ce9b78215661	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.023	23	Tanjung Sakti	St. Mikael	Pastoran Gereja Katolik St Mikael, Tanjungsakti,	Kab.Lahat, Sum-Sel.	0730-421457				-	\N
1603f425-9e96-411b-b140-b3941b844678	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.024	24	Tegalsari	Para Rasul Kudus	Pastoran Katolik Para Rasul Kudus, Tegalsari BK 21, Pos Sumberjaya,	Belitang OKU Timur, Sum-Sel.					-	\N
4c3bad7b-1d44-46f7-a3fc-244151055952	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.025	25	Tugumulyo / Mura	St. Maria	Pastoran Katolik St. Maria Mataram, Tugumulyo 31662,	Musi Rawas, Sum-Sel.	0733-371044				-	\N
2ea99cad-132d-45f9-b517-b27f7b86369e	24b9060b-e5e6-49e4-a7fb-78e856d899fd	023.026	26	Tugumulyo / Oki	Kristus Raja	Pastoran Katolik Kristus Raja, Tugumulyo Kp. 2,	Lempuing, OKI, Sum-Sel.	0712-331060				-	\N
0ca82df0-9210-4045-9da1-b37ffd404db8	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.001	1	Sungai Ambawang	St. Fidelis	Pastoran Katolik, Korek Kec.Ambawang, via Pastoran Tanjung Hulu,	Pontianak					-	\N
7bf416f4-dd51-4fb2-a025-8ffb613cf967	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.002	2	Bengkayang	St. Pius X	Pastoran Katolik, Jl Gereja No.54,	Bengkayang, Kal-Bar.	0562-441147				-	\N
e64bc2af-9168-461a-93af-6465c33c9cfb	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.003	3	Darit	St. Agustinus Dan Matius	Pastoran Katolik, Jl Pramuka No.20, Kec.Menyuke, Kab. Landak,	Darit					-	\N
181df0aa-b904-40fe-92f4-18aee65408a3	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.004	4	Delta Kapuas	St. Theresia	Pastoran Adisucipto Km 9,4  PO Box 6300,	Pontianak	0561-721067				-	\N
ea2d31a9-d01e-483b-9b6d-c6bf9bca9848	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.005	5	Menjalin	St. Petrus Dan Paulus	Pastoran Katolik Menjalin, Jl Raya Menjalin, Menjalin,	Kab.Landak, Kal-Bar.					-	\N
33a9a830-b166-4996-81cb-e04aa00e7edc	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.006	6	Ngabang	Salib Suci	Pastoran Katolik Ngabang, Jl Raya Ngabang,	Kab. Landak	0563-21160	0563-21341			-	\N
a11d3f3b-5a16-4745-b4e9-940583b53223	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.007	7	Nyarumkop	St. Maria	Pastoran Katolik Nyarumkop, Kec. Singkawang Timur,	Singkawang	0562-3307623				-	\N
f7587f9e-b39a-4b3a-a71c-184f731a9124	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.008	8	Pahauman	St. Yohanes Pemandi	Pastoran Katolik Pahauman, Kec.Sengahtemila,	Kab.Landak, KalBar.					-	\N
c36ba90d-dd94-4e91-b1bf-2251766bde0d	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.009	9	Pemangkat	St. Yosep	Pastoran Katolik, Jl Gereja No.10,	Pemangkat, KalBar.	0562-241550				-	\N
cfebc8a9-3d6f-4704-b3a5-7f6d29eff9cc	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.010	10	Senghie	Gembala Baik	Pastoran Katolik, Jl Sultan Muhammad No.222,	Pontianak	0561-734827				-	\N
59b4b0df-cba2-49b6-9273-754aba7e8ddf	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.011	11	Katedral	St. Yosef	Pastoran Katolik, Jl Pattimura No.195, PO Box 1119,	Pontianak	0561-734739				Stefanus Erwin, Pr	\N
4f9497aa-f385-4256-be4f-57625e51eabd	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.012	12	Kota Baru	Keluarga Kudus	Jl Sutan Syahrir No.1, PO Box 1119,	Pontianak	0561-734102				-	\N
fc725cda-ec56-4354-8c60-c9c6a25fd3e3	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.013	13	Pancasila	Maria Ratu Pencinta Damai	Pastoran Katolik, Jl Gusti Hamzah, Gang Pancasila V No.1,	Pontianak	0561-732503				-	\N
76571104-c662-43e6-a6d3-3afd3fec6fa4	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.014	14	Siantan	Stella Maris	Pastoran Katolik, Jl Gusti Situt Machmud No.100, Siantan,	Pontianak	0561-885980,  883216				-	\N
20bb562e-51ab-4d42-a1cd-29fe3843687b	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.015	15	Sungai Raya	St. Agustinus	Pastoran Katolik, Sungai Raya, Jl Adisucipto KM 9,4 PO Box 6300,	Pontianak	0561-721067				-	\N
1d17c809-f827-4144-988d-22e7f9b01d18	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.016	16	Tanjung Hulu	St. Hieronymus	Pastoran Tanjung Hulu, Jl Ya,m Sabran No.113,	Pontianak	0561-6592608				-	\N
532e0dd0-e407-4195-b2b9-62f07f540a5f	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.017	17	Sambas	Kristus Raja	Pastoran Katolik Sambas, Jl Gusti Hamzah,	Sambas	0562-391149				-	\N
34a09be8-1b07-4d14-925d-b1169ada2b0f	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.018	18	Singkawang	St. Fransiskus Assisi	Pastoran Katolik, Jl Diponegoro No.1,	Singkawang, KalBar.	0562-631579				-	\N
9f4b4aae-fe3a-4e76-a298-ca33252ca6f6	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.019	19	Sungai Pinyuh	St. Kristoforus	Pastoran Sungai Pinyuh, Jalan Seliung, Kab.Pontianak,	Sungai Pinyuh, KalBar.	0561-652079				-	\N
3fe1bfca-d921-4c56-8de5-5a631fe08025	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.020	20	Jeruju	Bunda Maria	Jl Kom. Yos Sudarso, Jeruju,	Pontianak	0561-7566870				-	\N
05a088e2-f9ea-441c-876c-86423e7bbc7c	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.021	21	Sesilia	Santa Sesilia	Jl Ahmad Yani (Depan Polda), Kompleks Persekolahan Gembala Baik,	Pontianak	0561-3039866				-	\N
9d2c187f-9c04-4740-83fb-baead0d686fe	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.022	22	Sanggau Ledo	St. Petrus	Pastoran Katolik Sanggau Ledo, Jalan Randam, RT 3/RW 2,	Kab. Bengkayang					-	\N
0d20368e-9d6a-4903-8a85-cfd67124a324	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.023	23	Serimbu	St. Yohanes Maria Vianney	Pastoran Katolik Serimbu, Jl Raya Serimbu, Kec. Serimbu,	Kab.Landak					-	\N
4c9a33c3-98fd-4f1d-b0d8-6056fd7b1866	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.024	24	Pakumbang	St. Fransiskus Asisi	-	Kab.Landak	\N	\N	\N	\N	-	\N
19a667cc-7bb1-436b-94cf-8be7ecf76548	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.025	25	Simpang Tiga	St. Theresia dari Kanak-Kanak Yesus	-	Kab.Landak	\N	\N	\N	\N	-	\N
42e7fd6a-7c3d-43cc-ba78-796c7bead572	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.026	26	Karangan	St. Yosef	-	Kab.Landak	\N	\N	\N	\N	-	\N
9cfc85dd-036a-42e4-b4ed-5e76a4b19d80	640d1cf1-b5c6-4f69-92eb-86fde75e974f	024.027	27	Samalantan	St. Yosep	-	Kab.Landak	\N	\N	\N	\N	-	\N
3ebcf86c-03ae-4114-bfac-32a61fc609f3	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.001	1	Banjarnegara	St. Antonius	Jl Pemuda No.47,	Banjarnegara	0286-591507				-	\N
b39c81ad-f72f-4690-ad18-b3df4f2d4866	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.002	2	Banyumas	St. Maria Immakulata	Jl Karangsawah No.507,	Banyumas	0281-796141				-	\N
1debc88b-6e0d-41cd-84f9-8e45a72e8a2d	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.003	3	Cilacap	St. Stephanus	Jl Jend. A.Yani No.23,	Cilacap	0282-533355				-	\N
040f6b1d-b79a-41d4-a8d2-9a9259b82da2	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.004	4	Gombong	St. Mikael	Jl Gereja No.10,	Gombong	0287-471190				-	\N
ea473ac1-76e4-4735-9264-26dbb8edc914	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.005	5	Wonosobo Timur / Kapencar	St. Philipus	Desa Kapencar, Kec. Kertek,	Kab.Wonosobo					-	\N
a803dc9e-d7a8-4398-bba2-82373bca556e	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.032	32	Madiun II	Mater Dei	\N	Madiun	\N	\N	\N	\N	-	Madiun
c8158f06-c6cc-4e40-861f-6911f4ebe989	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.007	7	Kebumen	St. Yohanes Maria Vianney 	Jl Mayjend. Sutoyo No.11,	Kebumen	0287-381771				-	\N
72e8d044-32e6-472c-a5ae-0898adb3e258	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.008	8	Kutoarjo	St. Yohanes Rasul	Jl Marditomo No.27,	Purworejo	0275-641304				Stefanus Tri Supriationo, MSC	\N
0800d04f-559c-48de-9508-fd521307c973	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.009	9	Pekalongan	St. Petrus	Jl Blimbing No.1,	Pekalongan	0285-421039				-	\N
c91106e7-6c0d-466c-943f-c3ceab191960	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.010	10	Pemalang	St. Lukas	Jl Pemuda No.28,	Pemalang	0284-321284			lkspml@indo.net.id	-	\N
f8965049-ab2d-45e3-a7ab-9b99274c049e	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.093	42	Klepu	St. Hilarius		Madiun					-	\N
8eb2da33-d08d-4e37-9b7d-c38862135ce7	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.012	12	Purwokerto Barat / Katedral	Kristus Raja	Jl Gereja No.3,	Purwokerto	0281-637052	0281-630628			-	\N
850a4474-327c-4b92-939b-e22a66379e75	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.013	13	Purwokerto Timur	St. Yosef	Jl Kaliputih No.2,	Purwokerto	0281-637641,  635812				-	\N
9eebccb7-674d-457e-ac6e-92e9380ed334	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.014	14	Purworejo	St. Perawan Maria	Jl K.H.Wahid Hasyim No.1,	Purworejo	0275-325272	0275-321260			AE. Wignyoseputro, MSC	\N
cec0c02a-e035-4ff8-96ff-d17011e3469d	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.015	15	Purwosari	St. Stephanus	Jl Gereja No.12, Purwosari,	Purworejo					-	\N
11793dd0-9b85-415e-ab89-105e5dc92a36	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.016	16	Slawi	St. Maria Immakulata	Jl K.S.Tubun No.1,	Slawi	0283-491160				-	\N
e26a5239-c485-4e4e-a5f9-d60f0a9195a5	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.017	17	Tegal	Hati Kudus Yesus 	Jl Kapten Ismail No.128,	Tegal	0283-353125				-	\N
b6ae8b8a-3a4b-4c28-8b13-eacc3d82d71c	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.018	18	Wonosobo	St. Paulus	Jl Pemuda No.10,	Wonosobo	0286-321604				-	\N
dba64d0b-41d6-4f24-8ba5-d279d499bd3c	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.019	19	Batang	St. Yusuf	Jl Gajah Mada Gg Puter I No.8A,	Batang	0285-392351				-	\N
7cd370e0-625a-401b-a70e-acbec14200ee	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.020	20	Brebes	St. Maria Fatima	Jl Yos Sudarso No.13,	Brebes	0283-671283				-	\N
fca95d59-5c17-4c3f-b020-ef359d7ee451	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.021	21	Kroya	Tyas Dalem	Jl Citanduy No.15A,	Kroya	0281-7621540,  7621486				-	\N
1e749d90-526b-45c1-b7fb-2264f284dd41	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.022	22	Majenang	St. Theresia Dari Kanak-kanak Yesus	Jl Dr Sutomo No.9,	Majenang	0280-621014				-	\N
efaa4f30-01c9-416b-bbaf-4d92ad67d81f	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.023	23	Mejasem	St. Yoseph	Jl Gereja No.1, Mejasem Barat Kramat,	Tegal	0283-358626				-	\N
2dc67fdd-f96f-4e64-b871-5856c0f57f2f	599cd77f-3856-4fd0-a4ee-65c82bfa1001	025.024	24	Sidareja	St. Yosef	Jl Ranggasena 596, Sidareja,	Cilacap	0280-523596				-	\N
3bedda92-4d28-4f5e-a9ca-900c62d648e7	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.001	1	Beanio	St. Mikhael	Pastoran Katolik Beanio, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
d8704b0f-a2aa-4ecd-844b-e5b29370d6b7	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.002	2	Benteng Jawa	St. Josef	Pastoran Katolik Benteng Jawa, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
6406911c-ec6e-4972-ae29-7d12f02ad897	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.003	3	Borong	St. Gregorius	Pastoran Katolik Borong, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
7e3df125-c799-4373-9686-00bff4fe2f7b	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.004	4	Cancar	Maria Fatima	Pastoran Katolik Cancar, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
7cb40776-77d1-498e-812f-f8a61dccabc9	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.005	5	Cewonikit	St. Vitalis	Pastoran Katolik Cewonikit, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-21552				-	\N
60b971b8-2143-433a-af7c-d72a8d9b4875	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.006	6	Colol	St. Petrus	Pastoran Katolik Colol, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
cc80512b-5003-4475-9dd4-8fe5bac78ae9	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.007	7	Dampek	St. Petrus Dan  Paulus	Pastoran Katolik Dampek, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
e8083950-a97b-4da8-98cc-fa65130db4e4	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.008	8	Datak	St. Theresia dari Calkuta	Pastoran Katolik Datak, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
ca97beed-6325-4b52-bc4a-0512c95d1740	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.009	9	Denge	St. Petrus Dan Paulus	Pastoran Katolik Denge, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
a3574b6f-4155-41d2-af05-c9e28e263330	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.010	10	Iteng	St. Stefanus	Pastoran Katolik Iteng, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
4344fb68-4b02-44d8-905a-a49a0a938f00	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.011	11	Ka Redong	Ekaristi Kudus	Pastoran Katolik Ka Redong, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
6450d099-b830-46c5-82ab-2efdfb79bd69	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.012	12	Karot	St. Fransiskus Asisi	Pastoran Katolik Karor, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-21871				-	\N
756d1e85-38fa-40a1-966b-1b0c0b9152c2	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.013	13	Kisol	St. Josef	Pastoran Katolik Kisol, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
90bb786d-f444-479d-b112-77fda47ee4a4	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.014	14	Kumba	St. Mikhael	Pastoran Katolik Kumba, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-21332				-	\N
70393c6d-a158-4901-8c8e-3898ff26d303	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.015	15	Labuan Bajo	Roh Kudus	Pastoran Katolik Labuan Bajo, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-41128				-	\N
b4b4f228-a38e-45ea-bdf9-630c1dc593c9	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.016	16	Lawir	St. Maria Pembantu Abadi	Pastoran Katolik Lawir, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
3c60dde7-7238-4d26-b889-dd7b5730df05	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.017	17	Lempang Paji	St. Klemens Hofbauer	Pastoran Katolik Lempang Paji, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
409c0378-19f1-4435-905b-198deceb109e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.018	18	Lengko Ajang	St. Theresia Kanak-kanak Yesus	Pastoran Katolik Lengko Ajang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
a54e0368-8302-4114-bb51-30b3fd974ce6	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.019	19	Lengko Elar	St. Yohanes Pemandi	Pastoran Katolik Lengko Elar, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
d3043f15-c2de-48be-934f-0af8326e6604	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.020	20	Loce	St. Fransiskus Xaverius	Pastoran Katolik Loce, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
08263a77-44a3-4c1c-b98a-ec2a9d577197	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.021	21	Mano	St. Paulus	Pastoran Katolik Mano, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
a7bdb4dc-5003-49e0-bb28-e5f735bc54ca	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.022	22	Mbaumuku	Kristus Raja	Pastoran Katolik Kristus Raja, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-22296				-	\N
6ea01657-65cd-4931-b150-002f00b3ce28	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.023	23	Mok	St. Agustinus	Pastoran Katolik Mok, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
23a31bf2-cb8b-4e10-b34b-d537a19dc6db	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.024	24	Mukun	St. Pius X	Pastoran Katolik Mukun, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
733a5f5b-7b39-4f7c-b753-ca7d72dd7e95	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.025	25	Nangalanang	St. Wilhelmus	Pastoran Katolik Nangalanang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
6e05d30b-a68d-45ab-a648-6a158453c488	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.026	26	Nunang	St. Mikhael	Pastoran Katolik Nunang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
0132cdd4-45e6-4c8d-9a6b-233de087322e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.027	27	Orong	Hati Suci Santa Perawan Maria Tak Bercela & St. Stanislaus	Pastoran Katolik Orong, Tromol Pos 801, Tuteng 86508,	Flores, NTT					-	\N
41edb8fa-eeff-4ab5-baa9-8c8c7195f1b8	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.028	28	Pacar	St. Nikolaus Dan Roh Kudus	Pastoran Katolik Pacar, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
0ec87fe0-708d-4ff6-be7c-eb964521d7dd	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.029	29	Pagal	Kristus Raja	Pastoran Katolik Pagal, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
37459364-4fa4-44ca-aec7-85d62c0d40af	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.030	30	Poco	St. Monfort	Pastoran Katolik Poco, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
cd4cf42d-34ce-42d2-9821-b5472fed02f0	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.031	31	Poka	ST. FRANSISKUS XAVERIUS	Pastoran Katolik Poka, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
213c38d8-1c18-45ab-870e-6ab299be112e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.032	32	Ponggeok	St. Arnoldus Jansen	Pastoran Katolik Ponggeok, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
93a06f67-b64f-4eea-92d6-d712c83316a6	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.012	12	Sidoarjo / Juanda	St. Paulus	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Selatan
b1f3cdf7-8bee-4036-8106-df632149bc7a	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.033	33	Rangga	St. Theresia Kanak-kanak Yesus & St. Kristoforus	Pastoran Katolik Rangga, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
bc7639c8-654a-48cc-9059-4e4a9f747194	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.034	34	Ranggu	St. Fransiskus Xaverius	Pastoran Katolik Ranggu, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
2f99a02f-d477-469f-8326-d7130018f65b	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.035	35	Pateng / Rego	St. Markus	Pastoran Katolik Pateng, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
388c4dfa-c940-4928-b4d8-9296d0517e05	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.036	36	Rejeng-Ketang	St. Perawan Maria Diangkat Ke Surga	Pastoran Katolik Rejeng, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
7025cfc7-e7db-4ca5-ae70-d5a265276373	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.037	37	Rekas	St. Perawan Maria Penghibur Orang Berdukacita	Pastoran Katolik Rekas, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
670de421-6ca3-456e-adae-3a01cef8ae6b	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.038	38	Reo	St. Maria Ratu Rosario Tersuci	Pastoran Katolik Reo, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-61016				-	\N
7d9d7421-5ba8-4833-bc98-ac86b42a8a40	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.039	39	Reweng	St. Yosef	Pastoran Katolik Reweng, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
cd39df0e-f5f2-49a6-b561-03b02fd3e04f	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.040	40	RII - Beamese	St. Antonius Padua	Pastoran Katolik Beamese, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
91f58a35-7b17-4e2c-a299-2ffd8589a107	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.041	41	Katedral Ruteng	St. Perawan Maria Diangkat Ke Surga	Pastoran Katolik Katedral, Tromol Pos 801, Ruteng 86508,	Flores, NTT	0385-21063, 21772				-	\N
8f25f401-8433-496c-a546-2b96f829f6b8	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.042	42	Sita	St. Perawan Maria Diangkat Ke Surga	Pastoran Katolik Sita, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
6585d81a-bc0e-4418-84c2-00f28cf71d7e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.043	43	Tanggar	St. Petrus	Pastoran Katolik Tanggar, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
79027488-e120-4f17-9171-347098fde7b6	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.044	44	Tentang	St,. Fransiskus Assisi	Pastoran Katolik Tentang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
4a77f92c-e3e7-4b42-9a24-682407cbebf5	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.045	45	Tilir	St. Robertus	Pastoran Katolik Tilir, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
8c748ecd-fcf3-4c67-8520-843297f4da7e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.046	46	Timung	Roh Kudus	Pastoran Katolik Timung, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
3a7822e5-2799-4b46-9b82-36c5c48c8c81	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.047	47	Todo	Ratu Para Rasul & St. Hendrikus	Pastoran Katolik Todo, Tromol Pos 801, Ruteng 86508, 	Flores, NTT					-	\N
514040a7-7745-4b00-afa5-4170f6a4a4a7	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.048	48	Waelengga	St. Arnoldus Yansen & Yosef Freinademets	Pastoran Katolik Waelengga, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
d1cb84e9-26ff-436c-855a-177a83fb940c	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.049	49	Waenakeng	St. Familia	Pastoran Katolik Waenakeng, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
15c5db51-f514-4e0b-a986-6c1c859f62e1	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.050	50	Waerana	St. Maria Menerima Kabar Gembira	Pastoran Katolik Waerana, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
028282a9-6538-4db1-825d-026ff1157460	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.051	51	Wangkung Komodo	St. Maria Dari Fatima	Pastoran Katolik Wangkung Komodo, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
df3a3958-451d-4144-b2f9-f0632db01585	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.052	52	Kuwu	St. Klaus	Pastoran Katolik St Klaus, Kuwu, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
1a885e2e-b258-492e-9e03-7cc8dbdee8e5	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.053	53	Waning	St. Kristoforus	Pastoran Katolik Waning, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
4cde1c6f-b795-4fb5-9b8b-de402e3feefc	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.054	54	Werang	St. Klaus	Pastoran Katolik Werang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
41542009-5eff-4947-9e6e-990457e3489b	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.055	55	Wukir	St. Maximilianus Kobe	Pastoran Katolik Wukir, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
b58d1d45-ea37-4a5d-964b-4794209f0692	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.056	56	Bari	St. Martinus	Pastoran Katolik Bari, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
bd5e94f2-ca9f-4311-8695-8972a0eaa7f5	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.057	57	Beamuring	St. Damian	Pastoran Katolik Beamuring, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
f7ede2a9-bd47-4961-8f0e-8f3af16a29e2	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.058	58	Beokina	St. Antonius	Pastoran Katolik Beokina, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
0980674d-97d5-48f9-b629-7f9d536caa3e	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.059	59	Golowelu	Hati Kudus Yesus	Pastoran Katolik Golowelu, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
4201f033-32fd-424a-b8ef-092f4fb18544	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.060	60	Lando	Hati Kudus Yesus	Pastoran Katolik Lando, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
85eb3368-f55d-44a6-be94-36fe78342145	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.061	61	Langke Majok	St. Pio	Pastoran Katolik Langke Majok, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
417e8b75-fa62-48e5-9f61-0e3f1a3a3c09	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.062	62	Mamba	Salib Suci	Pastoran Katolik Mamba, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
68267d6e-cfb9-445e-9d05-0842738a73ee	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.063	63	Mbata	Teresia dari Kalkuta	Pastoran Katolik Mbata, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
60862722-4032-4da0-b9a7-77bbe0da8d6a	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.064	64	St. Antonius	St. Paulus		Ruteng					-	\N
50c7be51-f724-4e9a-8396-495205943712	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.065	65	Mombok	St. Ambrosius	Pastoran Katolik Mombok, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
e95f90fa-1988-447c-b714-87bad9542891	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.066	66	Nanu	St. Aloisius	Pastoran Katolik Nanu, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
6eb8bc20-f8cb-4bf2-9b50-bf82525d60ea	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.067	67	Narang	St. Maria Bunda Segala Bangsa	Pastoran Katolik Narang, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
a1952789-3828-44b6-9606-0b74b144c280	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.068	68	Ngkor	St. Wilhelmus	Pastoran Katolik Ngkor, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
4d544d3c-08e0-4d66-836f-0b7cabe54d82	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.069	69	Pota	Hati Yesus Maha Kudus	Pastoran Katolik Pota, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
b936007e-13ef-47f4-a9f5-120e735fdaff	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.070	70	RUA	Roh Kudus	Pastoran Katolik Rua, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
89226a4a-b747-4b2c-849d-0f58d8f0b3d4	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.071	71	Sok Rutung	Kerahiman Allah	Pastoran Katolik Sok Rutung, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
a0a2022c-3c71-4206-9b1a-a308d069418a	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.072	72	Waekajong	St. Maria Imaculata	Pastoran Katolik Loce, Tromol 801, Ruteng 86508,	Flores, NTT					-	\N
bf8baf4b-3cd6-4370-a99f-6024247bf7db	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.073	73	Wajur	St. Yosef Freinademetz	Pastoran Katolik Wajur, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
cace275e-4f55-4c76-8ded-bf367c409051	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.074	74	Wangkung Rahong	St. Jakobus	Pastoran Katolik Wangkung, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
8129738e-cbda-4d8e-b344-3231d2f3daac	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.075	75	Watunggong	St. Eduardus	Pastoran Katolik Watunggong, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
25d18ec3-75a7-4480-b1d4-b21a2bac8f24	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.076	76	Weleng	St. Agustinus	Pastoran Katolik Weleng, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
5aad6ba5-86f5-4143-a3f9-88ba47ed3d52	5ff8bdd4-e36d-4a20-a8b7-148b63f19c52	026.077	77	Mbeling	St. Antonius	Pastoran Katolik Mbeling, Tromol Pos 801, Ruteng 86508,	Flores, NTT					-	\N
3383ec22-48fe-4571-82d3-2551a57f7cea	a8085a56-b337-4425-888e-4525fc4e677a	027.001	1	Katedral / Samarinda	St. Maria Pembantu Senantiasa 	Jl Jend. Sudirman No.36, Kotak Pos 102,	Samarinda	0541-742002				-	\N
2a32cb58-467b-4841-be21-20c20204a6df	a8085a56-b337-4425-888e-4525fc4e677a	027.002	2	Temindung / Samarinda	St. Lukas	Pastoran Katolik Jl Jend.A.Yani, Samarinda 75000,	Temindung	0541-741204				Petrus Prillion, MSF	\N
685ad801-bf10-466e-b453-4b52f6aec0e6	a8085a56-b337-4425-888e-4525fc4e677a	027.003	3	Mangkupalas / Samarinda Seberang	Hati Kudus Yesus	Gereja Katolik Mangkupalas, JL SMP Negeri  8, RT 33 Kel.Baqa Samarinda Seberang 75132,	Mangkupalas					-	\N
81236b8e-164b-4043-9e78-7f2699b50b68	a8085a56-b337-4425-888e-4525fc4e677a	027.004	4	Bontang	St. Yosef	Gereja Katolik St Yosef Bontang, Jl Attaka No.01, Kotak Pos 111,	Bontang	Grj: 0548-552227, 552226, Pastrn: 5552212 				-	\N
a15ab3fd-5f27-4aa5-aea3-591f6dc05a40	a8085a56-b337-4425-888e-4525fc4e677a	027.005	5	Sangatta	St. Theresia	Gereja Katolik St.Theresia, Jl Mulawarman, Kab.Kutai Timur	Sangatta Utara	0549-21781				-	\N
9d75058f-9693-49a7-8545-92dc8fcfa16a	a8085a56-b337-4425-888e-4525fc4e677a	027.006	6	Dahor / Kampung Baru / Balikpapan	St. Petrus & Paulus	Pastoran Katolik Jl Dahor No.1, Kotak Pos 357,	Balikpapan	0542-7516567	0542-419669			-	\N
4d535891-91ba-4b8b-8c20-55196144e569	a8085a56-b337-4425-888e-4525fc4e677a	027.007	7	Prapatan - Balikpapan	St. Theresia	Gereja Katolik St Theresia, Jl Prapatan RT 30/11 No.1-A, PO Box 178	Balikpapan	0542-421952,  425737				-	\N
fafecdec-dbc0-4205-bd5e-932cd8cab2b4	a8085a56-b337-4425-888e-4525fc4e677a	027.008	8	Sepinggan - Balikpapan	St. Martinus	Lanud Balikpapan, Jl Mulawarman, Sepinggan,	Balikpapan	0542-763423				Agustinus Doni Tupen, MSF	\N
48a24402-6ab5-407f-9b81-f85ad24398eb	a8085a56-b337-4425-888e-4525fc4e677a	027.009	9	Penajam	St. Maria Dari Fatima	Gereja Katolik St Maria, Jl Suka Maju No.62 RT 04, Gunung Seteleng, Kec.Penajam, Kab.Paser Utara,	Penajam	0542-7200486				-	\N
bd009bad-a52c-4074-ad27-8d2f8aa31f8d	a8085a56-b337-4425-888e-4525fc4e677a	027.010	10	Tanah Grogot	Alleluya	Gereja Katolik Alleluya, Jl P.Hidayat No.50, PO Box 48, Kab.Pasir 76211.	Tanah Grogot	0543-21564				-	\N
9994ce5b-20a4-430b-ba9d-84b877ebaf53	a8085a56-b337-4425-888e-4525fc4e677a	027.011	11	Tenggarong	St. Pius X	Pastoran Katolik St Pius X, Jl Maduningrat No.29, Kotak Pos 116, Kab.Kutai Kartanegara,	Tenggarong	0541-661342				-	\N
c6758c38-9f0d-4879-97d7-bdc452381c2d	a8085a56-b337-4425-888e-4525fc4e677a	027.012	12	Ritan Baru / Sungai Belayan	Gembala Baik	Pastoran Katolik Ritan Baru, Kec.Tabang, Kab.Kutai Kartanegara,	Ritan Baru					-	\N
ef8c859d-4b2d-4668-9766-9fa13eb27f4f	a8085a56-b337-4425-888e-4525fc4e677a	027.013	13	Tanjung Isuy	St. Arnoldus Janssen	Gereja Katolik Tanjung Isuy, Kab.Kutai Barat  (Pos: via K.A.Samarinda),	Tanjung Isuy					-	\N
74f805da-306e-4052-a76a-16018256aa6c	a8085a56-b337-4425-888e-4525fc4e677a	027.014	14	Long Bentuk	St. Paulus	Gereja Katolik Long Bentuk, Kutai Timur,	Long Bentuk					-	\N
73dd6e43-a502-4692-8ec2-4fbaa20bb75e	a8085a56-b337-4425-888e-4525fc4e677a	027.015	15	Nehas Liah Bing	St. Maria Ratu Damai	Pastoran Katolik Nehas Liah Bing, Kec.Muara Wahau, Kab.Kutai Timur,	Nehas Liah Bing					Adipati Yunus Alfred Manek, SVD	\N
1e780b7b-0fe9-4510-b8fb-3d6ff26753de	a8085a56-b337-4425-888e-4525fc4e677a	027.016	16	Lambing / Muara Lawa	St. Paulus	Pastoran Katolik Lambing, Kec.Muara Lawa, Kab. Kutai Barat,	Muara Lawa					-	\N
1a43a4c4-e4db-48f1-8787-ca3a6260d7b2	a8085a56-b337-4425-888e-4525fc4e677a	027.017	17	Melak	St. Markus	Gereja Katolik St. Markus, Kec.Melak, Kab.Kutai Barat,	Melak	0545-41118				-	\N
cf0b6181-d4f6-4998-811f-def05ea98c4f	a8085a56-b337-4425-888e-4525fc4e677a	027.018	18	Barong Tongkok	Kristus Raja	Pastoran Katolik Jl W.R. Soepratman No.04, RT 2,	Barong Tongkok					-	\N
8e5ce251-3ef7-4f58-aac0-5ee6a2b6cfec	a8085a56-b337-4425-888e-4525fc4e677a	027.019	19	Tering	Keluarga Kudus	Pastoran Katolik Tering, Kec.Tering, Kab.Kutai Barat (Pos: via K.A.Samarinda),	Tering					-	\N
f92d578c-fe1d-462f-bde4-df0b1b93686a	a8085a56-b337-4425-888e-4525fc4e677a	027.020	20	Melapeh	St. Yohanes Penginjil	Pastrn Katolik St.Yohanes Penginjil, Jl.Maharaq Hajaq RT 04 Linggang Melapeh , Kec.Linggang Bigung, Kab.Kutai Barat,  	Melapeh					-	\N
96ddb8bc-1055-41cc-8806-52b420a03be5	a8085a56-b337-4425-888e-4525fc4e677a	027.021	21	Long Hubung	St. Maria	Gereja Katolik Desa Long Hubung, Kec.Long Hubung, Kab.Kutai Barat,	Long Hubung					-	\N
657c3b54-a688-4a32-b4f2-240828f4d4e4	a8085a56-b337-4425-888e-4525fc4e677a	027.022	22	Ujoh Bilang	St. Petrus	Pastoran Katolik St Petrus, Jl Lalang 1 Ujoh Bilang, Kec.Long Bangun, Kab.Kutai Barat, (Pos via: K.A.Samarinda),	Ujoh Bilang					-	\N
553d80c2-77ad-4db6-bbd1-f738cbee7e4d	a8085a56-b337-4425-888e-4525fc4e677a	027.023	23	Tiong Ohang	St. Paulus	Pastoran Katolik Tiong Ohang, Kec.Long Apari, Kab.Kutai Barat, (Pos via: K.A.Samarinda),	Tiong Ohang					-	\N
91fd25a4-5359-4588-97e7-521134709880	a8085a56-b337-4425-888e-4525fc4e677a	027.024	24	Long Pahangai	St. Yoseph	Pastoran Katolik Desa Long Pahangai, Kec.Long Pahangai I, Kab.Kutai Barat,	Long Pahangai					-	\N
36f9d7b9-773e-4594-af5d-3b242e7213d8	a8085a56-b337-4425-888e-4525fc4e677a	027.025	25	Laham	Hati Kudus Yesus	Pastoran Katolik Laham, Desa Laham, Kec.Laham-Kutai Barat, (Pos via: K.A.Samarinda),	Laham					-	\N
12388e05-0642-4d32-ab8b-2aecf97d2e28	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.001	1	Batang Tarang	Hati Kudus Tuhan Yesus	Pastoran Katolik Batang Tarang 78563, Kal-Bar,	Batang Tarang, Sanggau					-	\N
1331fa34-7ab3-4baf-b6fd-caebed4f5f0e	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.002	2	Entikong - Sontas	St. Yohanes Maria Vianey	Pastoran Katolik Entikong, Sontas 78556, Kal-Bar.	Entikong, Sontas					-	\N
d44a7b0a-5c82-4fde-9d1c-b4329c1575c1	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.003	3	Erna (Kuasi Paroki)	St. Maria Bunda Allah	Pastrn Katolik Paroki Erna, d/a Sanggau Kapuas, Jl Jendal Sudirman No.43, Sanggau Kapuas 78511, Kal-Bar,	Erna, Sanggau					-	\N
cfaa4b5a-ef10-4f6d-affb-a27bdf08ae70	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.004	4	Jangkang - Balaisebut	St. Perawan Maria Di Angkat Ke Surga	Pastoran Katolik Jangkang Balaisebut 75591, Kal-Bar.	Jangkang, Balaisebut.	0868-12101096				-	\N
e1b57048-ac90-46ce-88f4-60394433c73f	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.005	5	Kuala Dua	Gembala Yang Baik	Pastoran Katolik Kuala Dua, Kembayan 78533,	Kuala Dua, Kal-Bal	0868-12101097				-	\N
53a4dd44-62a8-49ac-a6f6-0d6b318d8a65	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.006	6	Lintang	St. Theresia dari Kanak-kanak Yesus	Pastoran Katolik Lintang, Sanggau Kapuas 78512,	Lintang, Kal-Bar					-	\N
05290a66-e7f6-4927-80ed-b9b5aaa27e3a	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.007	7	Meliau	St. Fransiskus Xaverius	Pastoran Katolik Meliau, Meliau 78571,	Meliau, Kal-Bar					-	\N
a500c7bc-224e-4f2a-be49-1152fb59bf3e	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.008	8	Mukok	St. Paulus Rasul	Pastoran Katolik Mukok, Jl Transmigrasi No.43,	Mukok, Kal-Bar					-	\N
4047381f-cd1d-4c90-b8e7-ab33a8a078f0	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.009	9	Nanga Taman	Kristus Yesus Tersalib	Pastoran Katolik Nanga Taman 78584,	Nanga Taman, Kal-Bar					-	\N
f147b3f0-ca86-46a3-966a-e25e2072268a	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.010	10	Nanga Mahap	Maria Bunda Allah	Paroki Nanga Mahap 78585,	Nanga Mahap, Kal-Bar					-	\N
5e50835d-3bdf-4190-8579-6d4adc12403e	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.011	11	Pusat Damai	St. Maria Tak Bernoda	Pastoran Katolik Pusat Damai Parindu 78561,	Pusat Damai, Kal-Bar	0564-22495	0564-22495			-	\N
fc32bf7d-8f80-48ab-9337-e8faa45e6d64	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.012	12	Rawak	Hati Kudus Tuhan Yesus	Pastoran Katolik Rawak, Sekadau Hulu 78583,	Rawak, Kal-Bar					-	\N
436e0b4d-6730-4cd8-b0b2-6cce9aed0a01	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.013	13	Katedral	Hati Kudus Yesus	Pastoran Katolik Sanggau, Jl Jend.Sudirman No.43, Sanggau Kapuas 78512,	Sanggau, Kal-Bar	0564-21221				-	\N
5c210bc3-79c5-4c26-a1ae-38e2e038a57a	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.013	13	Sidoarjo / Tropodo	Salib Suci	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Selatan
acb7ae0f-1f38-4c67-b7cf-4fdeb82f7539	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.014	14	Sekadau	St. Petrus & Paulus Rasul	Pastoran Katolik Sekadau 78582,	Sekadau, Kal-Bar	0564-41004				-	\N
7bc2cd18-8970-4c5a-bde7-1454add13f87	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.015	15	Sosok	Kristus Raja	Paroki Sosok, Tayan Hulu 78562,	Sosok, Kal-Bar	0563-2024208				-	\N
982b12b6-091a-4189-8863-fda1e846b9a7	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.016	16	Sungai Ayak	St. Maria Yang Di Angkat Ke Surga	Pastoran Katolik Sungai Ayak, Belitang Hilir 78586,	Sungai Ayak, Kal-Bar					-	\N
c85a0702-1392-4cfe-a23f-13579dd2aacc	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.017	17	Tayan	St. Petrus Kanisius	Pastoran Katolik Tayan, Tayan Hilir 78564,	Tayan, Kal-Bar					-	\N
c53fffb4-84cf-41cb-adb6-1e1538918b91	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.018	18	Toba - Teraju	Kristus Raja	Pastoran Katolik Teraju, Toba 78572,	Toba, Kal-Bar					-	\N
93a27312-a6da-4a60-8cbb-f9aa9858f804	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.019	19	Balai Sepuak	Yesus Tersalib	Pastoran Katolik Balai Sepuak, Belitang Hulu 78587,	Balai Sepuak, Sanggau					-	\N
132f3ea8-ece8-4194-9cc1-66b0d25f9ad4	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.020	20	Bonti	St. Alfonsus Maria De Liqueri	Pastoran Katolik Paroki Pusat Damai, Sanggau 78552,	Sanggau					-	\N
2366445a-ee70-4fbf-baf3-367fec9513cc	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.021	21	Beduai	Salib Tersuci	Pastoran Katolik Beduai 78555, Kal-Bar.	Beduai, Sanggau					-	\N
74167e74-66fb-4d46-bd3e-d65b5c145c3d	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.022	22	Sekayam - Balaikarangan	St. Paul Rasul	Pastoran Katolik Balaikarangan 78556,	Sekayam, Kal-Bar	0564-31098				-	\N
2d1bd53d-04e7-4f15-a06f-a3cb84a961ae	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.023	23	Tiong Ohang	St. Paulus	Pastoran Katolik Tiong Ohang, Kec.Long Apari, Kab.Kutai Barat, (Pos via: K.A.Samarinda),	Tiong Ohang					-	\N
97d6a9dc-32cd-415d-99e1-e1063cf89ba7	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.024	24	Ujoh Bilang	St. Petrus	Pastoran Katolik St Petrus, Jl Lalang 1 Ujoh Bilang, Kec.Long Bangun, Kab.Kutai Barat, (Pos via: K.A.Samarinda),	Ujoh Bilang					-	\N
209190c0-fc66-4f9f-ac03-f53c54b897fe	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.025	25	Laham	Hati Kudus Yesus	Pastoran Katolik Laham, Desa Laham, Kec.Laham-Kutai Barat, (Pos via: K.A.Samarinda),	Laham					-	\N
06fdcc2d-b70d-4ad1-84cf-b1c4d23f6a13	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.026	26	Engkuni	St. Yakobus	Dilayani oleh Pastor Paroki Barong Tongkok	Engkuni					-	\N
1f233c54-11a1-48f9-9af9-4311334b14c9	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.027	27	Mamahak Besar	St. Antonius	Dilayani oleh Pastor Paroki Ujoh Bilang,	Mamahak Besar					-	\N
2e489b8c-696d-407b-8e0d-b7c0150d2948	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.028	28	Long Lunuk	St. Yohanes Pemandi	Dilayani oleh Pastor Paroki Long Pahangai	Long Lunuk					-	\N
f36142c3-8015-4996-973b-d4e3fb0d3321	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.029	29	Long Isun (Datah Suling)	St. Maria Magdalena	Dilayani oleh Pastor Paroki Long Pahangai,	Long Isun					-	\N
7aabd3c8-4685-4f07-9316-e3d2dfc29d7d	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.030	30	Long Pakaq (Long Kuling)	Hati Yesus Maha Kudus	Dilayani oleh Pastor Paroki Long Pahangai,	Long Pakaq					-	\N
86077ef1-d918-471e-bf2d-6bdecbb06daf	00f0f5d0-b108-48a4-b87f-1c9bcd9b7e0a	028.031	31	Long Apari	St. Mikhael	Dilayani oleh Pastor Paroki Tiong Ohang,	Long Apari					-	\N
41dda9fe-26b4-49ae-b66c-e6377cb32b67	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.001	1	Ambarawa/Santo Yusuf	St. Yusuf	Jl Mgr Soegijapranata No.56,	Ambarawa	0298-591028	0298-596344			-	\N
12a25b9f-7ea1-4d0e-84d3-e0aed5a7f7c9	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.002	2	Ambarawa / Bedono	St. Regina Pacis	Jl Raya Ambarawa Magelang KM 11 Bedono, Jambu 50663,	Ambarawa	0298-591202				-	\N
58934b6c-cfc0-419b-90a4-11c0a5f87119	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.003	3	Sleman / Banteng	Keluarga Kudus	Jl Kaliurang Km 7,5 Banteng, Ngaglik, Sleman 55581,	Sleman, DIY	0274-880137				-	\N
cc3cf7ee-43d0-4fa8-b83c-f4e500e29faa	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.004	4	Bantul/Klodran	St. Yakobus	Jl Mgr Soegijapranata No.1, Klodran, Bantul 55711,	Bantul, DIY	0274-367409				-	\N
ee10e7e3-4c4c-49d7-8575-6ae75e2735e0	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.005	5	Wonogiri / Baturetno	St. Yusuf	Pastoran Katolik Baturetno, Wonogiri 57673,	Wonogiri	0273-461020				-	\N
9712fb36-1773-447c-b7f3-97639878b109	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.006	6	Kulon Progo / Boro	St. Theresia Lisieux	Banjar Asri, Kalibawang, Kulon Progo 55672,	Kulon Progo, DIY	0274-545335				-	\N
b91249cf-1314-46e6-b543-a7f0c5360759	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.007	7	Boyolali	Hati Tak Bernoda St. Perawan Maria	Jl Merbabu No.24, Boyolali 57311,	Boyolali	0276-321107	0276-3295257			-	\N
accce741-e368-4368-ae52-80374e5a9358	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.008	8	Boyolali / Simo	Hati Kudus Tuhan Yesus	Jl Kebon Ijo No.3, Pos Simo, Boyolali 57377	Boyolali	0276-3294814				-	\N
fc3617fa-7e61-44e1-83ec-d5b192afc96d	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.009	9	Wonogiri / Danan	St. Ignatius	Pastoran Katolik Danan, Sendang Agung Giriwoyo, Tromol Pos 9, Wonogiri 57675,	Wonogiri	0273-461391				-	\N
db14ecf3-2c33-4a1b-9767-aa38c69a4bd5	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.010	10	Klaten / Delanggu	St. Yohanes Rasul	Jl Stasiun No.53, Delanggu 57471,	Delanggu		0272-551205			-	\N
e09e1a9f-91fb-4399-a08d-031cb4b1b775	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.011	11	Sleman / Gamping	St. Maria Assumpta	Ambarketawang, Pos Gamping, Gamping 55294,	Gamping, DIY	0274-798748				-	\N
b0ab9c52-dc2d-4268-b752-a3a41483b321	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.012	12	Bantul/Ganjuran	Hati Kudus Tuhan Yesus	Sumbermulyo, Bambanglipuro, Bantul Yogyakarta 55764	Bantul, DIY	0274-367154				-	\N
79f9d386-4b4e-490a-b3d7-01847f99cf47	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.013	13	Ungaran / Girisonta	St. Stanislaus	Karangjati, Bergas, Ungaran 50552, Kab.Semarang.	Ungaran	0298-522123	0298-522220			-	\N
d957f86d-805b-4761-9975-6e410811356f	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.014	14	Klaten / Jombor	St. Theresia	Pastoran Katolik Jombor, Ceper Klaten 57465,	Klaten	0272-325065				-	\N
eabb20e5-e133-43f2-8d76-a493f54707f5	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.015	15	Sleman / Kalasan	Marganingsih	Jl Solo Km 13, Kalasan, Sleman 55571,	Kalasan, DIY	0274-496023				-	\N
14e298ae-3d91-4efc-8f6d-e0854ace95e7	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.016	16	Sleman / Babadan	St. Petrus & Paulus	Babadan, Wedomartani, Ngemplak, Sleman 55571,	Babadan, DIY					-	\N
b15c7e99-b03d-4880-aa6c-efe86ed5073b	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.017	17	Karanganyar/Purbayan	St. Pius X	Jl Lawu No.362, Karanganyar 57712,	Purbayan, Surakarta	0271-495192				-	\N
46618638-165f-4b68-80fc-0a08dd16bed4	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.018	18	Karanganyar/Jumapolo	St. Stephanus	Pastoran Katolik, Depan Pasar Kota Jumapolo, Karanganyar 57783,	Jumapolo, Surakarta	0271-7002071				-	\N
92d47a79-6f05-46be-8148-47605d803098	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.019	19	Sukoharjo / Kartasura	Santa Maria	Jl Brigjen Slamet Riyadi No.25, Kartasura 57167,	Kartasura	0271-780598				-	\N
972978fb-41b9-41f3-8eea-d1b65b3ce076	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.020	20	Klaten 	St. Maria Assumpta	Jl Andalas No.24, Klaten 57413,	Klaten	0272-321866	0272-327710			-	\N
ff779e32-d8f7-449f-b47b-e3a95e3b3249	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.021	21	Klaten / Kebonarum	Roh Kudus	Dawe, Pluneng, Kebonarum, Klaten 57486,	Klaten	0272-3100854				-	\N
49f9db27-b2d6-45cf-bdba-a6d15f9eec23	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.022	22	Sleman / Klepu	St. Petrus & Paulus	Sendang Mulyo, Minggir, Pos Godean, Sleman 55564, 	Klepu, DIY	082-82744553				senjakita@yahoo.com; de_ajp@yahoo.com.sg	\N
4087cedc-7509-4d4a-a9e6-be2898fa8fe6	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.023	23	Kudus / K.A.Semarang	St. Johannes Evangelista	Jl Sunan Muria No.6, Kudus 59312,	Kudus	0291-437065				-	\N
aa882c18-a8d9-45de-bfec-e05411f1b1bb	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.024	24	Jepara	Stella Maris	Jl A.R.Hakim No.41A,	Jepara	0291-591019				-	\N
826efacb-051e-4dcb-8482-def247a3487d	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.025	25	Magelang / Fatima	St. Maria Fatima	Jl Jend. A.Yani No.123, Magelang 56114,	Magelang	0293-362139	0293-313565			-	\N
054f6fe8-8e10-42cb-b169-b35889330d91	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.026	26	Magelang / Ignatius	St. Ignatius	Jl Laksda Yos Sudarso No.6, Magelang 56117,	Magelang	0293-362136	0293-362137			-	\N
0dcd89ad-0363-4ded-9ed3-cbeabe46c905	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.027	27	Magelang / Panca Arga	St. Mikael	Jl Musi No.10, Komplek Panca Arga I, Magelang 56172,	Magelang	0293-366650				-	\N
c555778d-5a89-4d64-a383-b0b9c59a584c	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.028	28	Sleman / Medari	St. Yosef	Jl Garuda No.14, Murangan VIII, Triharjo, Sleman 55514,	Sleman, DIY	0274-868325				-	\N
3a2eb790-acfa-4445-8b7b-738acf7ca7c0	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.029	29	Sleman / Somohitan	St. Yohanes Rasul 	Pastoran Katolik Somohitan, Girikerto, Turi, Sleman, Yogyakarta 55551,	Sleman, DIY	0274-7416201				-	\N
088e7862-3cc1-494a-8846-b9a0952f187c	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.030	30	Magelang / Mertoyudan	St. Yusuf Pekerja	Jl K.H. Irsyad No.24, Pandansari, Sumber Rejo, Mertoyudan, Magelang 56172,	Magelang	0293-326635				-	\N
08bf257f-ca16-4365-99a5-5d920c70fa55	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.031	31	Magelang / Borobudur	St. Petrus	Jl Balaputra Dewa, Borobudur, Magelang 56553,	Magelang	0293-789351				-	\N
33704be2-8f4b-4a41-a83f-c9653e5d9e7f	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.032	32	Sleman / Minomartani	St. Petrus & Paulus	Jl Bandeng II No.23, Perum Minomartani, Yogyakarta 55581	Sleman, DIY	0274-881580				-	\N
c63417cc-545c-4dc1-9c2e-ca47f6061c91	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.033	33	Sleman / Mlati	St. Aloysius Gonzaga	Jl Magelang Km 7,8 Mlati, Sendangadi, Sleman, Yogyakarta 55285	Sleman, DIY				gerejamelatijogja@yahoo.com	-	\N
96e6aa7c-9a5e-4475-a8ad-6b20e22af3c5	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.034	34	Muntilan / Santo Antonius	St. Antonius	Jl Kartini No.3, Muntilan 56411,	Muntilan	0293-587046				-	\N
8d07fbbe-c5dd-4f5e-b855-0dc253733efc	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.035	35	Muntilan / Ngawen	Emmanuel	Pastoran Katolik Emmanuel, Ngawen, Muntilan Selatan,	Muntilan					-	\N
d96af324-df75-4f2b-9538-aa2858864d48	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.036	36	Muntilan / Sumber	St. Maria Lourdes	Pastoran Katolik Sumber, Dukun Muntilan 56482,	Muntilan	0888-2740300				-	\N
fa8d8f4c-7788-4193-9e0b-fdf54733f0cf	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.037	37	Muntilan / Tumpang	St. Kristoforus	Pastoran Katolik Banyutemumpang, Krogowanan, Sawangan, Magelang 56481,	Muntilan	0888-2752002				-	\N
d32cb986-03d5-4b4d-8c0c-df6a27f1b89d	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.038	38	Kulon Progo / Nanggulan	St. Maria Tak Bercela	Karang, Jatisarono, Nanggulan, Kulon Progo,  Yogyakarta 55671,	Kulon Progo, DIY	0274-522706				-	\N
2d127c35-1977-4562-b47e-5bc063ca9136	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.039	39	Sleman / Pakem	St. Maria Assumpta	Jl Kaliurang Km 17, Pos Pakem, Sleman, Yogyakarta 55582,	Sleman, DIY				pasem_1@telkom.net	-	\N
329404c4-6993-47d6-b862-d8d0aa84353c	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.040	40	Pati	St. Jususf	Jl Kamandawa No.3, Pati 59114,	Pati	0295-381772	0295-385530			-	\N
23e6a29a-1efc-414d-8772-f3d12c1cffd7	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.041	41	Pati / Juwana	St. Maria La Sallete	Jl K.H.A. Dahlan No.39, Juwana 59185,	Juwana	0295-471771				-	\N
21193a28-e473-4142-acb1-db130f675f61	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.042	42	Sleman / Pringwulung	St. Yohanes Rasul	Jl Panuluh 377-A, Pringwulung, Condongcatur, Depok, Sleman, Yogyakarta 55283,	Sleman, DIY	0274-520235				-	\N
e0a2e884-4fca-4fc6-904f-69287426690b	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.043	43	Kulon Progo / Promasan	St. Maria Lourdes	Pastoran Katolik Promasan, Pos Kalibawang, Yogyakarta 55672,	Kulon Progo, DIY	0274-7498896				-	\N
5a6750a9-13e4-47c8-8159-03127251e14a	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.044	44	Purwodadi	Hati Yesus Maha Kudus	Jl Jend.Sudirman NJo.8, Purwodadi 58111, Grobongan,	Purwodadi	0292-421130	0292-423583			-	\N
cc54882c-ddb2-4b93-8eb1-e63cc36fc0cb	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.045	45	Surakarta / Dirjopuran	San Inigo	Jl A.M. Sangaji No.27, Gajahan, Surakarta 57115,	Surakarta	0271-656261,  652262				-	\N
bf4c8cb4-161b-4c17-a414-cd50886c0b13	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.046	46	Surakarta / Kleco	St. Paulus	Jl Belimbing No.18, RT 02 RW 14, Kerten, Surakarta 57143,	Surakarta	0271-716422	0271-716422			-	\N
a7b88dd9-950e-484b-83a7-8281a5795c9f	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.047	47	Karanganyar/Palur	St. Maria Diangkat Ke Surga	Jl Cempaka No.1, Perimnas Palur, Karanganyar 57772,	Palur, Surakarta	0271-826070				-	\N
6b9f9ea1-cef1-4684-9c54-231afc83ef3c	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.048	48	Surakarta / Purbayan	St. Antonius	Jl Arifin No.1, Surakarta 57111,	Surakarta	0271-656636	0271-636324			-	\N
499394ed-b576-4a77-9958-11e73872198a	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.049	49	Surakarta / Purbowardayan	St. Maria Regina	Jl Jend. A.Yani No.10, Surakarta 57128,	Surakarta	0271-656620	0271-664110			-	\N
8f836119-f65a-4794-9f4e-61bfd754ea4e	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.050	50	Surakarta / Purwosari	St. Petrus	Jl Slamet Riyadi No.370, Surakarta 57141,	Surakarta	0271-712300	0271-730528			-	\N
57dda91b-14fe-4b64-87e9-a3738ea69cce	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.051	51	Sukoharjo / Surakarta	Hati Kudus Yesus	Jl Slamet Riyadi No.26, Sukoharjo 57514,	Surakarta	0271-593587				-	\N
fe6a3719-6bc7-4922-a36b-99c8abe25b84	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.052	52	Magelang / Salam	St. Theresia	Pastoran Katolik Salam, Pos Salam, Magelang  56484,	Magelang	0293-588154				-	\N
1a30ab51-548b-4714-899b-eed3bd8ad2cc	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.053	53	Salatiga / Diponegoro	St. Paulus Miki	Jl Diponegoro No.34, Salatiga 50711,	Salatiga	0298-324076 (Pastrn), 327404 (Sekret)	0298-327404			-	\N
63d18362-e9d9-4fe9-a315-31e54617686b	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.054	54	Bantul / Sedayu	St. Theresia	Gubug, Argosari, Pos Sedayu, Yogyakarta 55752,	Bantul, DIY	0274-7823210				-	\N
67376438-f39a-4c6c-91d3-beacbb93eac8	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.055	55	Semarang / Kebondalem	St. Fransiskus Xaverius	Jl Gang Pinggir No.62, Semarang  50137,	Semarang	024-3545492,  3515949				-	\N
4497ad96-e62f-4f3f-b292-87dfa025e9a0	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.056	56	Semarang / Atmodirono	Keluarga Kudus	Jl Atmodirono No.8, Semarang 50242,	Semarang	024-8314781				-	\N
5dc773c7-6bbe-4b61-a2a6-c3c0bba7b4ff	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.057	57	Semarang / Banyumanik	St. Maria Fatima	Jl Kanfer Raya No.49, Semarang 50267,	Semarang	024-7472504				-	\N
47731c9b-90fb-4342-b470-b06e7159a16e	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.058	58	Semarang / Bongsari	St. Theresia Kanak-kanak Yesus	Jl Puspowarno Raya RT 03/009, Semarang 50141,	Semarang	024-760395,  7620928				-	\N
305e2451-6f92-4882-9f8d-a46cef522637	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.059	59	Semarang / Demak	St. Mikael	Jl Sultan Patah No.185, Demak 59511,	Demak	0291-686056				-	\N
5fb57c38-b977-445d-aaae-2b77b8c33b1b	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.060	60	Semarang / Gedangan	St. Yusuf	Jl Ronggowarsito No.11, Semarang 50127,	Semarang	024-3541624,  3552252				-	\N
fba60af2-d5d5-41b8-b1b3-52da04b3d662	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.061	61	Semarang / Gubug	St. Petrus	Jl Jend. A.Yani No.1, Gubug 58164, Purwodati,	Gubug, Purwodadi	0292-533483				-	\N
aa8e9835-12f4-4ebc-9640-23c46ce267aa	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.062	62	Semarang / Karangpanas	St. Athanasius Agung	Jl Dr Wahidin No.108, Semarang 50234,	Semarang	024-8312595,  8505288				-	\N
126c7f92-4b70-4556-9104-503155252480	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.063	63	Semarang / Lampersari	Mater Dei	Jl Lampersari No,73, Semarang 50249,	Semarang	024-8313368				-	\N
230fddfb-cd3b-4ae7-8c8b-906d9f2d9667	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.064	64	Katedral / Randusari	St. Perawan Maria Ratu Rosario Suci	Jl Pandanaran No.9, Semarang 50244,	Semarang	024-8310036	024-8451007		katedral-smg@lenterailahi.org	Stefanus Erwin, MSC	\N
dd9582cd-7f2a-43e0-beb8-7924abe487a4	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.065	65	Semarang / Sendangguwo	St. Paulus	Jl Dr Muwardi No.7, Semarang 50198,	Semarang	024-6711509	024-6708208			-	\N
6f420292-0330-4c6b-b5aa-19c2f2719c12	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.067	67	Kendal / Sukorejo	St. Isidorus	Jl Raya No.36, Sukorejo 51363,	Kendal	0294-451070	0294-452521			-	\N
d27b2ff3-bb12-4abb-942d-03b19255c866	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.068	68	Temanggung	St. Petrus & Paulus	Jl Jend. Sudirman No.15, Temanggung 56216,	Temanggung	0293-491184				-	\N
3a13e391-a1d1-402b-82a5-ce1e451544be	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.069	69	Temanggung / Parakan	Keluarga Kudus	Jl Aip Mungkar 37-C, Parakan, 	Temanggung	0293-596276				-	\N
5592fdc4-bf71-4112-8acb-615e2592dfc1	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.070	70	Ungaran	Kristus Raja	Jl Diponegoro No.101, Ungaran 50511,	Ungaran	024-6921130				-	\N
0cbb19e2-8afe-4202-b209-c3ecbd7580ba	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.071	71	Kulon Progo / Wates	St. Maria Bunda Penasihat Baik	Jl Sanun No.23, Wates, Kulon Progo 55611,	Kulon Progo, DIY	0274-773162				-	\N
6741eb64-d54e-4baf-83e4-b056e752d715	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.072	72	Klaten / Wedi	St. Maria Bunda Kristus	Tanjunganom, Gadungan, Wedi, Klaten 57461,	Klaten	0272-322797				-	\N
6e7dca32-8480-48e6-9383-cc1652cff130	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.073	73	Kendal / Weleri	St. Martinus	Jl Utama Tengah No.119, Wleri 51355,	Kendal	0294-641046,  5706566				-	\N
0bdfebde-ed26-4ca6-b207-c68026bbaef1	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.074	74	Kendal / sub Weleri	St. Antonius Padua	Jl Pemuda No.10, Kendal 51318.	Kendal	0294-381946				-	\N
c9868105-0257-48ee-81ab-0609e05af911	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.075	75	Wonogiri	St. Yohanes Rasul	Jl Murtipranoto No.1, Sanggrahan RT 02 RW 09, Giripurwo, Wonogiri 57612,	Wonogiri	0273-321086				-	\N
14ad0c7d-a799-410b-8ca7-875ccf387daa	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.076	76	Gunung Kidul / Wonosari	St. Petrus Canisius	Jl Mgr Soegijapranata No.29, Wonosari, Gunung Kidul 55811, 	Gunung Kidul	0274-391063				-	\N
9015f5ea-26a1-49a0-8899-155a8a96eb59	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.077	77	Yogyakarta / Baciro	Kristus Raja	Jl Melati Wetan No.47, Yogyakarta 55225,	Yogyakarta	0274-564414				-	\N
f5cac396-5dfb-4dc6-824f-4980f6629e2e	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.078	78	Yogyakarta / Bintaran	St. Yusuf	Jl Bintaran Kidul No.5, Yogyakarta 55151,	Yogyakarta	0274-375231	0274-389190			-	\N
dbd6615b-ed2b-4d49-af33-971bb4abbc27	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.079	79	Yogyakarta / Jetis	St. Albertus Magnus	Jl A.M. Sangaji No.20, Yogyakarta 55233,	Yogyakarta	0274-517809,  512412	0274-571809			-	\N
0f6747f7-5140-47bd-bc4f-15a75c7540f4	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.080	80	Yogyakarta / Kidul Loji	St. Fransiskus Xaverius	Jl P.Senopati No.22, Yogyakarta 55121,	Yogyakarta	Pastrn: 0274-373294, Sekrt: 0274-3683007				-	\N
0162fe21-87e5-4f37-b14e-1e2d3cb42e30	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.081	81	Yogyakarta / Kotabaru	St. Antonius De Padua	Jl I.Dewa Nyoman Oka No.18, Yogyakarta 55224,	Yogyakarta	0274-589803	0274-581829		parant@idola.net.id	-	\N
7acf5838-3cca-4e57-bf82-92b9d67b5056	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.082	82	Yogyakarta / Kumetiran	Hati St. Maria Tak Bercela	Jl Kumetiran No.13, Yogyakarta 55272,	Yogyakarta	0274-518586,  512817	0274-587763			-	\N
4414d92d-ceaf-45b8-a60c-a895c41eaa6c	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.083	83	Yogyakarta / Nandan	St. Alfonsus	Gemawang RT 02 RW 43, Kelurahan Sinduadi, Mlati, Sleman 55284,	Sleman, DIY	0274-624787				-	\N
5146fbfa-90d6-48ee-99ff-c4752644cddc	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.084	84	Yogyakarta / Pugeran	Hati Kudus Tuhan Yesus	Jl Suryaden No.63, Yogyakarta 55141,	Yogyakarta	0274-372295,  382551	0274-419719	http//:www.pugeran.net		-	\N
78fcea2a-384e-4af5-acc7-d3bc326b90d5	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.085	85	Gungung Kidul / Bandung	Santo Yusuf	Jl Wonosari-Yogya Km 6,2 Kepil, Bandung, Playen, Gunung Kidul 55861,	Gunung Kidul. DIY	0274-7487866				-	\N
08fa6d34-ee29-484e-a14d-cc4fb4e28120	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.086	86	Gunung Kidul / Kelor	Santo Petrus dan Paulus	Pastoran Katolik Kelor Karangmojo, Gunung Kidul 55891,	Gunung Kidul, DIY	0274-7494314				-	\N
75d14a8e-dc59-4456-8bc3-2b9345e0fbee	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.087	87	Klaten / Gondangwinangun	Santo Yusuf Pekerja	Minggiran, Plawikan, Jogonalan, Klaten 57452,	Klaten	0272-323911				-	\N
6cafafde-4718-49a4-b13b-d3e9ef31d85d	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.088	88	Kulon Progo / Palem Dukuh	Santa Maria Fatima	Palem Dukuh, Purwosari, Girimulyo, Kulon Progo, Yogyakarta 55671,	Kulon Progo, DIY					-	\N
b52b17b4-6ffd-4c34-9b73-8c0a9cc0bf63	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.089	89	Sleman / Pojok	Santo Yohanes Krisostomus	Pojok, Sendangagung, Minggir, Sleman, Yogyakarta 55562,	Sleman, DIY					-	\N
fb7370ef-858a-437a-9815-9786b07e18eb	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.090	90	Semarang / Tanah Mas	Gereja Hati Kudus	Jl Kokrosono Kav.41-42, Semarang 50177,	Semarang	024-3569485,  3516075				-	\N
6bcab472-f73c-4dc0-9b95-68a307e0a038	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.091	91	Temanggung / Rawaseneng	Santa Maria dan Yusuf	Pastoran Katolik Rawaseneng, Temanggung 56202,	Temanggung					-	\N
b4bc8514-614d-4940-aefe-b473531cd976	721545e6-f3c9-42b4-aa62-85086a7d2b6d	029.092	92	Yogyakarta / Babarsari	Santa Maria Assumpta	Jl Inspeksi Selokan Mataram, 	Sleman, DIY	0274-487202				-	\N
e45e6c44-4f13-4be5-ad9c-359cf794ac74	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.001	1	Alasa / Nias	St. Bonifasius	Pastrn Katolik Alasa d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815, 	Gunung Sitoli.					-	\N
8789da40-90cc-40dd-bd0b-fb3da134775f	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.002	2	Amandraya / Nias Selatan	St. Mathias	Pastrn Katolik Amandraya d/a Pastrn Katolik Bintang Laut, Teluk Dalam 22865,	Teluk Dalam					-	\N
dc1913dd-2ebb-4d70-8575-8225085cb362	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.003	3	Gido / Nias	Kristus Raja	Pastrn Katolik Hiliweto Gido 22871 d/a Pastrn Katolik St Maria, Jl Karet 33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
532ba8f6-89f3-4152-830d-90eca26000d1	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.004	4	Gunung Sitoli / Laverna	St. Fransiskus Assisi	Pastoran Laverna PO Box 1, Gunung Sitoli 22812,	Gunung Sitoli	0639-21587				-	\N
b43c0155-20a4-468a-95ad-fdca29591247	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.005	5	Konkatedral Gunung Sitoli	St. Maria Bunda Para Bangsa	Pastorn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli	0639-21694	0639-22359			-	\N
1d16a911-d996-4694-b7e1-71fd105807b8	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.006	6	Gunung Sitoli / Luar Kota	Kristus Gembala Baik	Pastoran Katolik Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli	0639-21694	0639-22359			-	\N
3d0b3302-ac0d-4902-8235-31309df69c35	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.007	7	Idanogawo	St. Petrus Dan Paulus	Pastoran Katolik Idanogawo d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
00e50951-dd65-42e0-8ce4-858e34bdf934	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.008	8	Lahewa / Nias Utara	St. Maria Bintang Kejora	Pastoran Katolik Lahewa, d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
c84b7b52-3a02-4279-8228-697828d05acc	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.009	9	Lahusa - Gomo / Nias Pantai Timur	Roh Kudus	Pastoran Katolik NPT, d/a Jl Karet No.33A, Gunung Sitoli 22815.	Gunung Sitoli					-	\N
969ee60f-c69a-485f-8e86-667c0fb79eb3	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.010	10	Padang Sidimpuan / Tapanuli Selatan	St. Maria Bunda	Pastoran Katolik, Jl Teuku Umar No.19, Padang Sidimpuan 22723,	Padang Sidimpuan	0634-21755				-	\N
f74b2bac-8616-49ce-8a12-c76a7d846be2	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.011	11	Pangaribuan	St. Fransiskus Assisi	Pastrn Katolik Pangaribuan 22564, atau Keusk.Sibolga Jl AIS Nasution No.27, Sibolga 22513,	Sibolga					-	\N
2f047488-b85b-4225-afc6-70ca405ff170	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.012	12	Katedral - Sibolga	St. Theresia Liseux	Pastoran Katolik Jl Brigjen Katamso No.21, Sibolga No.22522,	Sibolga	0631-22428				-	\N
cf7dab37-5655-41be-b58a-65c734889a14	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.013	13	Pandan	St. Yosef	Pastoran Katolik Jl Brigjen Katamso No.21, Sibolga 22522,	Sibolga	0631-22428				-	\N
86f35b6d-def7-4576-a444-a2a0946fbdb1	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.014	14	Sirombu / Nias Barat	Salib Suci	Pastrn Katoliki Sirombu/Biara OSC Mandrehe d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
adf24982-aa7e-4c88-8b7f-0a7fdfd25e6c	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.015	15	Pinangsori	St. Yohanes Penginjil	Pastrn Katolik Pinangsori Jl Raya Padangsidimpuan KM 29, Pinangsori 22654, Tapanuli Tengah, Sumatera Utara.	Pinangsori	0631-391078				-	\N
5c1b090d-b201-41b6-9c20-55689573e168	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.016	16	Tello (PP. Batu) 	St. Fidelis	Pastrn Katolik P.Tello 22881, d/a Keusk.Sibolga, Jl AIS Nasution No.27, Sibolga 22513, 	Sibolga					-	\N
f1c08deb-a2b6-435e-9363-a672570c0413	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.017	17	Teluk Dalam / Nias Selatan	St. Maria Diangkat ke Surga	Pastoran Bintang Laut, Jl Sugijopranoto, Teluk Dalam 22865, Kab.Nias Selatan	Teluk Dalam	0630-21126				-	\N
fb109ff5-738e-4b62-8a53-7f7ef0dce437	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.018	18	Togizita / Nias Tengah	St. Maria Ratu Surga	Pastrn Katolik Togizita d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
ba614059-2bbe-48b0-bcc7-231ac117e4da	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.019	19	Tuhemberua / Nias	St. Fransiskus Assisi	Pastrn Katolik Tuhemberua d/a Pastrn Katolik St Maria, Jl Karet No.33A, Gunung Sitoli 22815,	Gunung Sitoli					-	\N
c36d0b7b-8caa-4c73-9f51-436d0aced756	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.020	20	Tumba Jae - Manduamas	St. Mikael	Pastrn Katolik Tumba Jae - Manduamas d/a  Keusk.Sibolga Jl AIS Nasution No.27, Sibolga 22513,	Sibolga					-	\N
b83787cf-4e02-4e8d-a2c1-fce0113f007a	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.021	21	Tarutung Bolak - Sorkam	St. Hilarius	Pastrn Katolik Jl Sibolga-Barus Km 30, Tarutung Bolak-Sorkam 22563 d/a Keusk.Sibolga Jl AIS Nasution No.27, Sibolga 22513,	Sibolga					-	\N
a29450b9-ce49-41ed-9cb0-d8620b1d6ac4	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.022	22	Klaten / Kebonarum	Roh Kudus	Dawe, Pluneng, Kebonarum, Klaten 57486	Klaten	0272-3100854				-	\N
f2747af5-ea4f-4bd9-b918-0065288d8856	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.023	23	Klaten / Wedi	St. Maria Bunda Kristus	Tanjunganom, Gadungan, Wedi, Klaten 57461,	Klaten	0272-322797				-	\N
ebab8ae8-b11a-48f6-964c-d1af77dd4567	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.024	24	Kudus / K.A.Semarang	St. Johannes Evangelista	Jl Sunan Muria No.6, Kudus 59312,	Kudus	0291-437065				-	\N
b058c40f-aa2e-4717-b5fa-69a1d958a914	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.025	25	Kulon Progo / Boro	St. Theresia Lisieux	Banjar Asri, Kalibawang, Kulon Progo 55672,	Kulon Progo, DIY	0274-545335				-	\N
20779b70-afb2-42f7-b513-90a23a2627b3	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.026	26	Kulon Progo / Nanggulan	St. Maria Tak Bercela	Karang, Jatisarono, Nanggulan, Kulon Progo,  Yogyakarta 55671,	Kulon Progo, DIY	0274-522706				-	\N
79452d48-7406-424a-bd06-f022aeac6e56	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.027	27	Kulon Progo / Palem Dukuh	Santa Maria Fatima	Palem Dukuh, Purwosari, Girimulyo, Kulon Progo, Yogyakarta 55671,	Kulon Progo, DIY					-	\N
81279d3e-0789-4b7e-910b-ebc8d12c15e6	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.028	28	Kulon Progo / Promasan	St. Maria Lourdes	Pastoran Katolik Promasan, Pos Kalibawang, Yogyakarta 55672,	Kulon Progo, DIY	0274-7498896				-	\N
ffcbfbce-a465-469c-8036-af34801e4502	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.029	29	Kulon Progo / Wates	St. Maria Bunda Penasihat Baik	Jl Sanun No.23, Wates, Kulon Progo 55611,	Kulon Progo, DIY	0274-773162				-	\N
a18936fb-dc75-4394-9096-f5e650a6c6f9	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.030	30	Magelang / Fatima	St. Maria Fatima	Jl Jend. A.Yani No.123, Magelang 56114,	Magelang	0293-362139	0293-313565			-	\N
bf17733a-ba4d-42ff-842f-bbb2f356dcf7	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.031	31	Magelang / Ignatius	St. Ignatius	Jl Laksda Yos Sudarso No.6, Magelang 56117,	Magelang	0293-362136	0293-362137			-	\N
0f4a0a0d-7622-4046-9d8c-e7d5916fb0b1	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.032	32	Magelang / Panca Arga	St. Mikael	Jl Musi No.10, Komplek Panca Arga I, Magelang 56172,	Magelang	0293-366650				-	\N
9bbb2a64-734f-4e7f-868b-f1687671c438	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.033	33	Magelang / Mertoyudan	St. Yusuf Pekerja	Jl K.H. Irsyad No.24, Pandansari, Sumber Rejo, Mertoyudan, Magelang 56172,	Magelang	0293-326635				-	\N
036c8df5-cc02-408e-a823-175e922d71cc	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.034	34	Magelang / Borobudur	St. Petrus	Jl Balaputra Dewa, Borobudur, Magelang 56553,	Magelang	0293-789351				-	\N
bf427ee2-41c7-47fa-ac93-27eca7f7ea2c	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.035	35	Magelang / Salam	St. Theresia	Pastoran Katolik Salam, Pos Salam, Magelang  56484,	Magelang	0293-588154				-	\N
d5573d0f-e2e6-4dec-9cdf-12c0ff61ae9f	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.036	36	Muntilan / Santo Antonius	St. Antonius	Jl Kartini No.3, Muntilan 56411,	Muntilan	0293-587046				-	\N
e5248daa-93ee-42eb-a37e-bc116e2d6623	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.037	37	Muntilan / Ngawen	Emmanuel	Pastoran Katolik Emmanuel, Ngawen, Muntilan Selatan,	Muntilan					-	\N
ced4c7ff-77ae-4c34-a6f6-26422f356a3c	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.038	38	Muntilan / Sumber	St. Maria Lourdes	Pastoran Katolik Sumber, Dukun Muntilan 56482,	Muntilan	0888-2740300				-	\N
d8452c07-a40a-4f7f-b69a-d76b9ed76e84	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.039	39	Muntilan / Tumpang	St. Kristoforus	Pastoran Katolik Banyutemumpang, Krogowanan, Sawangan, Magelang 56481,	Muntilan	0888-2752002				-	\N
ba720f61-54cb-4247-ba57-c379b9fd12d0	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.040	40	Pati	St. Jususf	Jl Kamandawa No.3, Pati 59114,	Pati	0295-381772	0295-385530			-	\N
0c17f4ac-abb4-4a6c-930c-5c72ce2bd228	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.041	41	Pati / Juwana	St. Maria La Sallete	Jl K.H.A. Dahlan No.39, Juwana 59185,	Juwana	0295-471771				-	\N
4a1eee5a-2f29-48f2-9197-2e6d4ad2eaea	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.042	42	Purwodadi	Hati Yesus Maha Kudus	Jl Jend.Sudirman NJo.8, Purwodadi 58111, Grobongan,	Purwodadi	0292-421130	0292-423583			-	\N
de70a98d-5e18-4091-ae04-d80d07bf3023	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.043	43	Salatiga	St. Paulus Miki	Jl Diponegoro No.34, Salatiga 50711,	Salatiga	0298-324076 (Pastrn), 327404 (Sekret)	0298-327404			-	\N
1e7d9fbf-94bb-4ef3-9199-9cfdc20c57bc	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.044	44	Semarang / Atmodirono	Keluarga Kudus	Jl Atmodirono No.8, Semarang 50242,	Semarang	024-8314781				-	\N
99358f60-2668-40a2-8e78-bef2d3bfb9fa	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.045	45	Semarang / Demak	St. Mikael	Jl Sultan Patah No.185, Demak 59511,	Demak	0291-686056				-	\N
78d2de48-a1d8-4340-a48f-fab25ae36bd9	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.046	46	Semarang / Banyumanik	St. Maria Fatima	Jl Kanfer Raya No.49, Semarang 50267,	Semarang	024-7472504				-	\N
44e7c12d-6f60-4214-94d5-8599f2847fa1	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.047	47	Semarang / Bongsari	St. Theresia Kanak-kanak Yesus	Jl Puspowarno Raya RT 03/009, Semarang 50141,	Semarang	024-760395,  7620928				-	\N
6759c44a-079d-4151-aeab-a4d880aad091	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.048	48	Semarang / Gedangan	St. Yusuf	Jl Ronggowarsito No.11, Semarang 50127,	Semarang	024-3541624,  3552252				-	\N
0bb30079-b95b-40f1-b45a-898db27d17e9	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.049	49	Semarang / Karangpanas	St. Athanasius Agung	Jl Dr Wahidin No.108, Semarang 50234,	Semarang	024-8312595,  8505288				-	\N
c3933506-4b46-4196-bc0c-f0234144e4f9	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.050	50	Semarang / Kebondalem	St. Fransiskus Xaverius	Jl Gang Pinggir No.62, Semarang  50137,	Semarang	024-3545492,  3515949				-	\N
290064ff-9a27-43fe-ae1c-ccfe05bf0c48	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.051	51	Semarang / Lampersari	Mater Dei	Jl Lampersari No,73, Semarang 50249,	Semarang	024-8313368				-	\N
9abdf5fe-fc47-45f0-bba1-0761518caffa	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.052	52	Katedral / Randusari (Katedral)	St. Perawan Maria Ratu Rosario Suci	Jl Pandanaran No.9, Semarang 50244,	Semarang	024-8310036	024-8451007		katedral-smg@lenterailahi.org	Stefanus Erwin, MSC	\N
b9142975-41fc-4397-87df-e6175cafec79	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.053	53	Semarang / Sendangguwo	St. Paulus	Jl Dr Muwardi No.7, Semarang 50198,	Semarang	024-6711509	024-6708208			-	\N
9f84e4e9-84d4-4153-ba75-45ced2b498ce	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.054	54	Semarang / Gubug	St. Petrus	Jl Jend. A.Yani No.1, Gubug 58164, Purwodati,	Gubug, Purwodadi	0292-533483				-	\N
0dd53da3-55b0-43af-adbc-da079f1c789c	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.055	55	Semarang / Tanah Mas	Gereja Hati Kudus	Jl Kokrosono Kav.41-42, Semarang 50177,	Semarang	024-3569485,  3516075				-	\N
2e28d9db-dbc7-4573-af1a-c8c680d1c02e	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.056	56	Sleman / Banteng	Keluarga Kudus	Jl Kaliurang Km 7,5 Banteng, Ngaglik, Sleman 55581,	Sleman, DIY	0274-880137				-	\N
f4dee7ff-93fa-412a-a184-68aa586875aa	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.057	57	Sleman / Gamping	St. Maria Assumpta	Ambarketawang, Pos Gamping, Gamping 55294,	Gamping, DIY	0274-798748				-	\N
3623747a-d562-42eb-a8d0-de78d3238381	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.058	58	Sleman / Kalasan	Marganingsih	Jl Solo Km 13, Kalasan, Sleman 55571,	Kalasan, DIY	0274-496023				-	\N
41e7ccff-2269-42c9-9f61-58cfbd6e2c96	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.059	59	Sleman / Babadan	St. Petrus & Paulus	Babadan, Wedomartani, Ngemplak, Sleman 55571,	Babadan, DIY					-	\N
be72d3d7-1177-4303-901f-2e71fc2dcd9d	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.060	60	Sleman / Klepu	St. Petrus & Paulus	Sendang Mulyo, Minggir, Pos Godean, Sleman 55564, 	Klepu, DIY	082-82744553				senjakita@yahoo.com; de_ajp@yahoo.com.sg	\N
d1bd65eb-0060-4715-a0c7-d84120f08d85	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.061	61	Sleman / Pojok	Santo Yohanes Krisostomus	Pojok, Sendangagung, Minggir, Sleman, Yogyakarta 55562,	Sleman, DIY					-	\N
4a55d1a1-3b05-4cf7-a06e-ad0f67245454	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.062	62	Sleman / Medari	St. Yosef	Jl Garuda No.14, Murangan VIII, Triharjo, Sleman 55514,	Sleman, DIY	0274-868325				-	\N
d52672c7-f3b7-4885-9ba9-96b2ef8ef4be	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.063	63	Sleman / Minomartani	St. Petrus & Paulus	Jl Bandeng II No.23, Perum Minomartani, Yogyakarta 55581	Sleman, DIY	0274-881580				-	\N
e4f826a8-e5ff-4fb3-81fe-bad3da9e8105	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.064	64	Sleman / Mlati	St. Aloysius Gonzaga	Jl Magelang Km 7,8 Mlati, Sendangadi, Sleman, Yogyakarta 55285	Sleman, DIY				gerejamelatijogja@yahoo.com	-	\N
788c0f41-3ac5-48fb-812c-687435cc0a45	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.065	65	Sleman / Pakem	St. Maria Assumpta	Jl Kaliurang Km 17, Pos Pakem, Sleman, Yogyakarta 55582,	Sleman, DIY				pasem_1@telkom.net	-	\N
967764c2-4bcc-4667-b4c6-2b5c84f181ff	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.066	66	Sleman / Pringwulung	St. Yohanes Rasul	Jl Panuluh 377-A, Pringwulung, Condongcatur, Depok, Sleman, Yogyakarta 55283,	Sleman, DIY	0274-520235				-	\N
737f0463-821b-4a03-88a1-b4b5d6e35105	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.067	67	Sleman / Somohitan	St. Yohanes Rasul 	Pastoran Katolik Somohitan, Girikerto, Turi, Sleman, Yogyakarta 55551,	Sleman, DIY	0274-7416201				-	\N
d0104ce5-4308-4067-a4bb-d3cd92fcff78	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.068	68	Sragen	St. Maria Fatima	Jl Patimura No.2, Sragen 57211,	Sragen	0271-891027				-	\N
2d324526-b497-4feb-be0b-f5f554bad406	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.069	69	Sukoharjo	Hati Kudus Yesus	Jl Slamet Riyadi No.26, Sukoharjo 57514,	Surakarta	0271-593587				-	\N
c826d4d4-d0d2-41aa-be0f-081808526d43	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.070	70	Sukoharjo / Kartasura	Santa Maria	Jl Brigjen Slamet Riyadi No.25, Kartasura 57167,	Kartasura	0271-780598				-	\N
67a4989f-dc89-4054-979a-237c2318f20b	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.071	71	Surakarta / Dirjopuran	San Inigo	Jl A.M. Sangaji No.27, Gajahan, Surakarta 57115,	Surakarta	0271-656261,  652262				-	\N
dfea5fdc-b520-47a5-887f-aa7fbcf381f0	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.072	72	Surakarta / Kleco	St. Paulus	Jl Belimbing No.18, RT 02 RW 14, Kerten, Surakarta 57143,	Surakarta	0271-716422	0271-716422			-	\N
80ebb198-4df2-4fa6-8275-fc8eab710622	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.073	73	Surakarta / Purbayan	St. Antonius	Jl Arifin No.1, Surakarta 57111,	Surakarta	0271-656636	0271-636324			-	\N
921ef7e5-fbdc-4b1f-84ab-45a25457f7ce	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.074	74	Surakarta / Purbowardayan	St. Maria Regina	Jl Jend. A.Yani No.10, Surakarta 57128,	Surakarta	0271-656620	0271-664110			-	\N
7021d38b-05e7-45b4-92ef-b3770419c737	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.075	75	Surakarta / Purwosari	St. Petrus	Jl Slamet Riyadi No.370, Surakarta 57141,	Surakarta	0271-712300	0271-730528			-	\N
cb7cca33-1e46-4157-a812-aea0c844f516	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.076	76	Temanggung	St. Petrus & Paulus	Jl Jend. Sudirman No.15, Temanggung 56216,	Temanggung	0293-491184				-	\N
cd35bcac-784e-4478-a557-d705cf585727	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.077	77	Temanggung / Rawaseneng	Santa Maria dan Yusuf	Pastoran Katolik Rawaseneng, Temanggung 56202,	Temanggung					-	\N
554aeada-d0bb-45ad-b6e1-1bbf8cadf3d0	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.078	78	Temanggung / Parakan	Keluarga Kudus	Jl Aip Mungkar 37-C, Parakan, 	Temanggung	0293-596276				-	\N
b3800fa1-d030-4b04-a6ba-9de0be27bc65	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.079	79	Ungaran	Kristus Raja	Jl Diponegoro No.101, Ungaran 50511,	Ungaran	024-6921130				-	\N
7af9991e-a999-40af-a3ae-a9e0834b88e8	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.080	80	Ungaran / Girisonta	St. Stanislaus	Karangjati, Bergas, Ungaran 50552, Kab.Semarang.	Ungaran	0298-522123	0298-522220			-	\N
16b7d605-c735-4c4c-ba23-e04115e2d17d	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.081	81	Wonogiri	St. Yohanes Rasul	Jl Murtipranoto No.1, Sanggrahan RT 02 RW 09, Giripurwo, Wonogiri 57612,	Wonogiri	0273-321086				-	\N
60bc4e6b-a8bc-434d-8752-1be3d6b84f6a	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.082	82	Wonogiri / Baturetno	St. Yusuf	Pastoran Katolik Baturetno, Wonogiri 57673,	Wonogiri	0273-461020				-	\N
a1d5910b-9a96-4393-921d-c1b28adeebb6	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.083	83	Wonogiri / Danan	St. Ignatius	Pastoran Katolik Danan, Sendang Agung Giriwoyo, Tromol Pos 9, Wonogiri 57675,	Wonogiri	0273-461391				-	\N
261cd0c7-f829-43e4-bc13-01c574b1fe31	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.084	84	Yogyakarta / Baciro	Kristus Raja	Jl Melati Wetan No.47, Yogyakarta 55225,	Yogyakarta	0274-564414				-	\N
f34fa9d3-3712-4e14-91b9-90e91303d6b4	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.085	85	Yogyakarta / Babarsari	Santa Maria Assumpta	Jl Inspeksi Selokan Mataram, 	Sleman, DIY	0274-487202				-	\N
6a9c2d27-59e9-4925-b7c8-628145774c43	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.086	86	Yogyakarta / Bintaran	St. Yusuf	Jl Bintaran Kidul No.5, Yogyakarta 55151,	Yogyakarta	0274-375231	0274-389190			-	\N
c637037f-6f79-4f87-ae34-10e8af8c4cbc	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.087	87	Yogyakarta / Jetis	St. Albertus Magnus	Jl A.M. Sangaji No.20, Yogyakarta 55233,	Yogyakarta	0274-517809,  512412	0274-571809			-	\N
e076e1ad-95a9-4c63-8869-c2f4f56e45f9	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.088	88	Yogyakarta / Nandan	St. Alfonsus	Gemawang RT 02 RW 43, Kelurahan Sinduadi, Mlati, Sleman 55284,	Sleman, DIY	0274-624787				-	\N
95d79d24-4ee6-4115-8161-8b975688671c	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.089	89	Yogyakarta / Kidul Loji	St. Fransiskus Xaverius	Jl P.Senopati No.22, Yogyakarta 55121,	Yogyakarta	Pastrn: 0274-373294, Sekrt: 0274-3683007				-	\N
fa77d9f2-4baa-4e2e-bd2c-476ab2678c60	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.090	90	Yogyakarta / Kotabaru	St. Antonius De Padua	Jl I.Dewa Nyoman Oka No.18, Yogyakarta 55224,	Yogyakarta	0274-589803	0274-581829		parant@idola.net.id	-	\N
11495f96-d55a-4c03-b1dd-837c6d6f1151	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.091	91	Yogyakarta / Kumetiran	Hati St. Maria Tak Bercela	Jl Kumetiran No.13, Yogyakarta 55272,	Yogyakarta	0274-518586,  512817	0274-587763			-	\N
2f10319c-93cc-47b2-b3ae-af1ee4590349	8a6aebfc-8a96-4c69-8f23-47bb20a6c4e7	030.092	92	Yogyakarta / Pugeran	Hati Kudus Tuhan Yesus	Jl Suryaden No.63, Yogyakarta 55141,	Yogyakarta	0274-372295,  382551	0274-419719	http//:www.pugeran.net		-	\N
a22de05e-15de-4e43-8535-d76f1437426c	a168e082-5dd7-441b-b784-39627f9b76fb	031.001	1	Ambalau	St. Maria Tanpa Noda	Pastoran Katolik Nanga Kemangai, Kec.Ambalau, Sintang 78684,	Sintang, Kal-Bar.					-	\N
18a37445-e735-466e-b5f2-063cccb88e9d	a168e082-5dd7-441b-b784-39627f9b76fb	031.002	2	Belimbing	St. Maria Tanpa Noda	Pastoran Katolik Pemuar, Kec.Belimbing, Kab.Melawi,	Belimbing, Kal-Bar					-	\N
e6368c3f-2458-4617-8454-493143812f75	a168e082-5dd7-441b-b784-39627f9b76fb	031.003	3	Benua Martinus	St. Martinus	Pastoran Katolik Benua Martinus, Kec.Embaloh Hulu Putussibau 78755,	Putussibau, Kal-Bar.					-	\N
d9466164-14e0-48e7-a121-3bfdcb09c1ef	a168e082-5dd7-441b-b784-39627f9b76fb	031.004	4	Bika	Keluarga Kudus	Pastoran Katolik Bika Nasareth, Kec.Manday Putussibau 78753,	Bika, Kal-Bar					-	\N
975c3f3c-175e-4e04-98b8-e579077cb332	a168e082-5dd7-441b-b784-39627f9b76fb	031.005	5	Bunut	St. Paulus	Pastoran Katolik Nanga Kalis, Kec.Kalis Putussibau,	Bunut, Kal-Bar.					-	\N
779d03a8-8c7c-49d7-bb43-3a40a5216ac1	a168e082-5dd7-441b-b784-39627f9b76fb	031.006	6	Dangkan	St. Yohanes Penginjil	Pastoran Katolik Nangan Dangkan, Kec. Silat Hulu Putussibau 78774,	Dangkan, Kal-Bar.					-	\N
87579013-3f96-4007-9378-23f18ec375f6	a168e082-5dd7-441b-b784-39627f9b76fb	031.007	7	Dedai	St. Petrus	Pastoran Katolik Kebong, Kec.Kelam Permai, Sintang Kal-Bar,	Dedai, Kal-Bar.					-	\N
af30c207-a83b-463b-adeb-cc94b8fa2d44	a168e082-5dd7-441b-b784-39627f9b76fb	031.008	8	Kelam	St. Martinus	Pastoran Katolik Kebong, Kec.Kelam Permai, 	Sintang, Kal-Bar.					-	\N
646fa7c8-f871-4a0f-9607-1b041e14a599	a168e082-5dd7-441b-b784-39627f9b76fb	031.009	9	Kota Baru - Tanah Pinoh	St. Maria		Sintang					-	\N
7631e6a5-cc5e-4900-bf95-ebac0a690cf6	a168e082-5dd7-441b-b784-39627f9b76fb	031.010	10	Lanjak	St. Dismas	Pastoran Katolik Lanjak, Kec.Batang Lupar Putussibau 78766,	Lanjak, Kal-Bar.					-	\N
05f22e87-85b5-4bc2-a4ca-fe9925ff4828	a168e082-5dd7-441b-b784-39627f9b76fb	031.011	11	Lebang	Maria Ratu Rosari	Pastoran Katolik Lanjing, Kec.Kelam Permai, Sintang,	Lebang, Kal-Bar.					-	\N
030e39cd-7432-4da2-9c23-2e6560adecc5	a168e082-5dd7-441b-b784-39627f9b76fb	031.012	12	Mendalam	St. Antonius Dari Padua	Pastrn Katolik Putussibau, Jl Ahmad Yani No.34, Putussibau 78711,	Mendalam, Kal-Bar.	0567-22056				-	\N
af883020-f367-440c-8628-b729bb779104	a168e082-5dd7-441b-b784-39627f9b76fb	031.013	13	Menukung - Bondau	St. Lusia	Pastoran Katolik Menukung, Kec.Menukung, Kab.Melawi,	Menukung, Kal-Bar.					-	\N
ff1ad2da-f252-4210-aca9-4281cbdc2b50	a168e082-5dd7-441b-b784-39627f9b76fb	031.014	14	Merakai	Maria Immaculata	Pastoran Katolik Nanga Merakai, Kec.Ketungau Tengah, Sintang 78653, 	Merakai, Kal-Bar.					-	\N
1de0ee5b-9a31-4a63-81fc-c3a38d961906	a168e082-5dd7-441b-b784-39627f9b76fb	031.015	15	Badau	St. Monfort	Pastoran Katolik Nanga Badau, Kec.Badau, Putussibau 78767,	Badau, Kal-Bar.					-	\N
083207c5-f638-4a7a-80c9-0661c37e5f9a	a168e082-5dd7-441b-b784-39627f9b76fb	031.016	16	Ella Hilir	St. Petrus	Pastoran Katolik Nanga Ella Hilir, Kec.Ella Hilir, Kab.Melawi,	Ella Hilir, Kal-Bar.					-	\N
43112d8a-7b52-4c34-bf05-df3b2e501412	a168e082-5dd7-441b-b784-39627f9b76fb	031.017	17	Embaloh	St. Petrus	Pastoran Katolik Bika Nazareth, Kec.Manday Putussibau 78753,	Embaloh, Kal-Bar.					-	\N
db30d6ac-9ed7-4da6-8527-d1e60f965d58	a168e082-5dd7-441b-b784-39627f9b76fb	031.018	18	Kantuk	St. Paulus	Pastoran Katolik Nanga Kantuk, Kec.Empanang Putussibau 78768,	Kantuk, Kal-Bar.					-	\N
cd44814d-08e3-43a4-b028-0877ca29c078	a168e082-5dd7-441b-b784-39627f9b76fb	031.019	19	Nanga Mau	St. Yosef	Pastoran Katolik Nanga Mau, Kec.Kayan Hilir, Sintang 78693,	Nanga Mau, Kal-Bar.					-	\N
78e45d30-32c6-442e-934b-1b04b6836c13	a168e082-5dd7-441b-b784-39627f9b76fb	031.020	20	Peniung	Kunjungan St. Maria	Pastoran Katolik Nanga Kalis, Jl Lintas Selatan, Kec.Kalis, Putussibau,	Peniung, Kal-Bar.					-	\N
85c16779-76f8-4d20-afbf-bc278acb0217	a168e082-5dd7-441b-b784-39627f9b76fb	031.021	21	Pinoh	St. Perawan Maria Di Angkat Ke Surga	Pastrn Katolik Nanga Pinoh, Jl Beringin No.1, Nanga Pinoh Kab.Melawi,	Pinoh, Kal-Bar.	0568-21088	0568-21377			-	\N
1a070dd3-e4ae-4cb9-a00e-dea88d78739b	a168e082-5dd7-441b-b784-39627f9b76fb	031.022	22	Serawai	St. Monfort		Sintang					-	\N
d2ffa1af-1026-405d-96bb-12154abc16b0	a168e082-5dd7-441b-b784-39627f9b76fb	031.023	23	Nobal	St. Theresia Kecil	Pastoran Katolik Nobal, Kec.Sungai Tebelian, Sintang,	Nobal, Kal-Bar.					-	\N
9cc36604-d4df-4cbd-b4ad-42c03a039506	a168e082-5dd7-441b-b784-39627f9b76fb	031.024	24	Pandan	Keluarga Kudus	Pastoran Katolik Nobal, Kec.Sungai Tebelian, Sintang,	Pandan, Kal-Bar.					-	\N
b37cf046-b26e-4ecb-a26b-7e020068af80	a168e082-5dd7-441b-b784-39627f9b76fb	031.025	25	Putussibau	Hati Santa Maria Tak Bernoda	Pastoran Katolik Putussibau, Jl Ahmad Yani No.34, Putussibau 78711,	Putussibau, Kal-Bar.	0567-22056				-	\N
be551515-bcc9-40ed-aa41-924ce22c93be	a168e082-5dd7-441b-b784-39627f9b76fb	031.026	26	Sejiram	St. Fidelis	Pastoran Katolik Sejiram, Kec.Seberuang, Putussibau 78772,	Sejiram, Kal-Bar.					-	\N
f6f71a19-bfb1-4e49-acbb-31de0232095f	a168e082-5dd7-441b-b784-39627f9b76fb	031.027	27	Semitau	St. Fransiskus Xaverius	Pastoran Katolik Semitau, Kotak Pos 2 Semitahu, Putussibau 78767,	Semitau, Kal-Bar.					-	\N
099b7e8b-1444-478b-b897-ce158ab41f9c	a168e082-5dd7-441b-b784-39627f9b76fb	031.028	28	Senaning	St. Yusuf		Sintang					-	\N
7cd75533-03af-4d2c-a296-4b7f31399c48	a168e082-5dd7-441b-b784-39627f9b76fb	031.029	29	Sepauk	St. Petrus Dan St. Andreas		Sintang					-	\N
0b79035f-a337-4d7b-852a-f24ce91b54c7	a168e082-5dd7-441b-b784-39627f9b76fb	031.030	30	Katedral - Sintang	Kristus Raja	Pastoran Katolik Katedral Jl Jend.Ahmad Yani No.8, Sintang 78611,	Sintang, Kal-Bar.	0565-22819				-	\N
7a05c662-630e-48e9-9f9a-dfb004158669	a168e082-5dd7-441b-b784-39627f9b76fb	031.031	31	Melapi - Siut	Epifania		Sintang					-	\N
b92b5b43-d303-45d9-b604-4d4e9cbed358	a168e082-5dd7-441b-b784-39627f9b76fb	031.032	32	Ratu Semesta Alam / Sungai Durian	Maria Ratu Semesta Alam		Sintang					-	\N
15b76ba5-bedd-4851-857c-38d29e1bf9a2	a168e082-5dd7-441b-b784-39627f9b76fb	031.033	33	Tanjung Baung	St. Mikael		Sintang					-	\N
bae36b1c-657d-46de-8db1-b64fa61b046f	a168e082-5dd7-441b-b784-39627f9b76fb	031.034	34	Tebidah	Salib Suci	Pastrn Katolik Nanga Tebidah, Kec.Kayan Hulu, Sintang 78694,	Tebidah, Kal-Bar.					-	\N
22b2e6c5-13f9-4bbf-a587-6c8c0a024c78	a168e082-5dd7-441b-b784-39627f9b76fb	031.035	35	Tempunak	Maria Ratu Damai Semesta		Sintang					-	\N
301f0657-1ec6-4943-a42c-531bd8483270	a168e082-5dd7-441b-b784-39627f9b76fb	031.036	36	Tuguk	St. Paulus		Sintang					-	\N
7410cbf5-c5a6-440d-9e26-ae5cdefbff82	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.001	1	Surabaya / Karangpilang	St. Yusuf	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
c755c2a2-8c63-4563-b922-8ac9fc04fcf5	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.002	2	Surabaya / Pagesangan	Sakramen Mahakudus	Jln Pagesangan Baru Surabaya 60233	Surabaya	031-8291777				-	Surabaya Barat
83872caa-c990-466e-b5a4-55ee6b28c77c	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.003	3	Surabaya / Dukuh Kupang	Redemptor Mundi	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
f84efd82-6920-4232-8af9-bc296f0b4584	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.004	4	Surabaya / Darmo Satelite	St. Aloysius Gonzaga	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
e29b22d7-66dc-45c0-b480-865504ba337d	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.005	5	Surabaya / Citra Raya	St. Yakobus	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
2505f1c9-085e-4045-a115-3134fe92c3e9	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.006	6	Surabaya / Tandes	St. Stefanus	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
87d4bda0-e40f-4507-b626-04d0ea4dee43	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.007	7	Surabaya / Gresik	St. Perawan Maria	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Barat
b912dcab-fdfa-44f7-842f-3398bd2ba747	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.008	8	Surabaya / Katedral	Hati Kudus Yesus	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Selatan
bddcde83-41a2-49e9-bd20-bb4638b43eee	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.009	9	Wonokromo	St. Yohanes Pemandi	Jl. Gadung 15	Surabaya	031 8412166	031 8418728	\N	\N	Krispianus Kia Anen, SVD	Surabaya Selatan
437fa471-f14b-4f2a-a1d0-ce7936eedfdf	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.010	10	Surabaya / Jemur Andayani	Gembala Yang Baik	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Selatan
39439c08-b02a-4444-9032-a9985d38d1b9	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.011	11	Surabaya / Purimas	Roh Kudus		Surabaya					Stefanus I Kadek Adi Subrata, SVD	Surabaya Selatan
18f1bb3c-ec3d-47f5-86ef-916558684008	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.014	14	Sidoarjo	St. Maria Annuntiata	Jln Monginsidi 13 Kode Pos 61218	Sidoarjo	031-8921828 - 8960161				-	Surabaya Selatan
821e253f-837c-46da-a927-a0820c9e5d36	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.015	15	Surabaya / Perak	St. Mikael	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
3a40122d-11f6-485f-92fe-143d53ea542e	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.016	16	Surabaya / Kepanjen	Kelahiran St. Perawan Maria	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
71fd7cc8-e526-4296-be2f-41ed96a2f52e	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.017	17	Surabaya / Kenjeran	St. Marinus Yohanes	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
efb7576e-38b0-44f9-9566-f0c731125ba4	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.018	18	Surabaya / Pogot	Ratu Pencinta Damai	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
cd95d0a7-88ca-4cc8-82be-df84c68ff571	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.019	19	Surabaya - Ketabang	Kristus Raja	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
902e1cdd-a8b2-421e-88ff-4e0039717deb	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.020	20	Surabaya / Sawahan	St. Vincentius A Paulo	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
60b8f337-940d-44fe-9298-2a9ac36821d1	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.021	21	Surabaya / Ngagel	St. Maria Tak Bercela	\N	Surabaya	\N	\N	\N	\N	-	Surabaya Utara
7edf0363-35d6-4c05-8583-af4e056069c5	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.022	22	Kediri I	St. Vincentius A Paulo	\N	Surabaya	\N	\N	\N	\N	-	Kediri
607fe595-ae04-4727-b907-267854c3623a	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.023	23	Kediri II	St. Yosef	\N	Surabaya	\N	\N	\N	\N	-	Kediri
be9542a0-f284-49cc-8337-817c1b1b98b7	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.024	24	Pare	St. Mateus	\N	Surabaya	\N	\N	\N	\N	-	Kediri
7172ad16-44ef-41eb-a4d8-dca719fd939d	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.025	25	Jombang	St. Maria	\N	Jombang	\N	\N	\N	\N	-	Kediri
f3ebc281-5abc-42b7-9e63-b748bf44c67e	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.026	26	Mojokerto	St. Yosef	\N	Surabaya	\N	\N	\N	\N	-	Kediri
c801506d-c6c4-47d2-8a4d-c0793067afea	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.033	33	Ngawi	St. Yosef	Jl. J.A. Suprapto 6 Ngawi 63211	Ngawi	0351-749153				-	Madiun
83ffe9e0-2413-4b10-a9d6-e9d497d7328b	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.034	34	Nganjuk	St. Paulus & St. Petrus	\N	Surabaya	\N	\N	\N	\N	-	Kediri
579db1aa-f439-42db-9420-441ba41a67d9	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.035	35	Magetan	Regina Pacis	Jln Raya Panekan KPR. Selosari Magetan 63313	Magetan	894050				-	Madiun
65114711-ab6e-4279-a065-c74cd92737d1	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.036	36	Ponorogo	St. Maria	\N	Surabaya	\N	\N	\N	\N	-	Madiun
75846fda-4fa4-47ed-8b58-8226d03e9310	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.037	37	Blora	St. Pius X		Blora					-	Cepu
f589e0d0-d274-4973-a05b-7793f746b408	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.038	38	Bojonegoro	St. Paulus	\N	Surabaya	\N	\N	\N	\N	-	Cepu
92564557-7a27-4995-ab26-6a0096dd004b	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.039	39	Cepu	St. Wilibrordus	Jl. Ronggolawe 46, Cepu 58312	Surabaya	(0295) 691048	\N	\N	\N	RD. Siprianus Yitno	Cepu
2b89bd03-70fb-4646-8193-f19c2d199832	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.040	40	Rembang	St. Petrus & St. Paulus	\N	Surabaya	\N	\N	\N	\N	-	Cepu
fd271e06-b360-4f26-9fad-0c1610a7ff9b	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.041	41	Tuban	St. Petrus	\N	Surabaya	\N	\N	\N	\N	-	Cepu
ca7a0532-0c0b-4cc1-8c73-a2480bc66f86	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.042	42	Klepu	St. Hilarius	\N	Madiun	\N	\N	\N	\N	-	Madiun
8500f9c6-3454-40d0-9f8b-35b1b24ec0d2	13877b72-5f74-4c1e-8b41-f87b9dec7354	032.043	43	Resapombo	St. Fransiskus Asisi	\N	Blitar	\N	\N	\N	\N	-	Blitar
32967225-d8d3-40c7-a5bc-b29cacf32211	cf35e0aa-4157-471f-8733-18e66fedf332	033.001	1	Bondo Kodi	St. Elisabeth		Weetebula					-	\N
543a27ba-260e-46c8-8bd2-55bac745aa5a	cf35e0aa-4157-471f-8733-18e66fedf332	033.002	2	Elopada	St. Mikael		Weetebula					-	\N
ba33d6fc-7dc4-4978-96fb-ad414abfaa83	cf35e0aa-4157-471f-8733-18e66fedf332	033.003	3	Homba Karipit	St. Maria		Weetebula					-	\N
d9e6dd7f-8ce9-4bd6-824c-a58680976341	cf35e0aa-4157-471f-8733-18e66fedf332	033.004	4	Kalembu Weri	St. Geraldus Mayella		Weetebula					-	\N
07f8634d-9d32-4a9e-9d81-3494781927ae	cf35e0aa-4157-471f-8733-18e66fedf332	033.005	5	Katikuloku	St. Klemens Maria Hofbauer		Weetebula					-	\N
33e6dedb-fb9f-4e10-96f5-cbbcb14c687a	cf35e0aa-4157-471f-8733-18e66fedf332	033.006	6	Lewa	Sang Sabda		Weetebula					-	\N
52363635-cc5f-4d9e-9065-e004a31c193b	cf35e0aa-4157-471f-8733-18e66fedf332	033.007	7	Melolo	St. Hendrikus		Weetebula					-	\N
50db36c3-a1d1-4082-ae93-aebb3f265492	cf35e0aa-4157-471f-8733-18e66fedf332	033.008	8	Ngallu	St. Andreas		Weetebula					-	\N
aee5ce94-ae22-40e0-ad2f-659dc163fbb6	cf35e0aa-4157-471f-8733-18e66fedf332	033.009	9	Palla	St. Mateus		Weetebula					-	\N
6663348b-0bd3-403f-90a9-1a9c116ba48e	cf35e0aa-4157-471f-8733-18e66fedf332	033.010	10	Tambolaka	Beato Arnoldus Janssen		Weetebula					-	\N
ec0f9edd-be29-40a3-b666-edd8cfd5e42c	cf35e0aa-4157-471f-8733-18e66fedf332	033.011	11	Tana Mali	St. Agustinus		Weetebula					-	\N
4b845155-e889-43af-8828-1dd226659afd	cf35e0aa-4157-471f-8733-18e66fedf332	033.012	12	Waikabubak	St. Petrus & St. Paulus		Weetebula					-	\N
9d799ba6-403c-45dc-ab9f-43d0a5c8894a	cf35e0aa-4157-471f-8733-18e66fedf332	033.013	13	Waimangura	Krsitus Raja		Weetebula					-	\N
fb387ac9-0232-41ca-b8a9-1ed99823b199	cf35e0aa-4157-471f-8733-18e66fedf332	033.014	14	Waimarama	St. Yosef		Weetebula					-	\N
7ed41d9e-1f9b-4de7-b8ce-95168afff6a8	cf35e0aa-4157-471f-8733-18e66fedf332	033.015	15	Wara-Waingapu	Sang Penebus		Weetebula					-	\N
9e6f5e54-41ce-44d1-af86-600268077441	cf35e0aa-4157-471f-8733-18e66fedf332	033.016	16	Wee Kombaka	Hati Kudus		Weetebula					-	\N
71dd41f1-95a1-4fe8-8d78-dbf14e4f2d45	cf35e0aa-4157-471f-8733-18e66fedf332	033.017	17	Weetebula	Roh Kudus		Weetebula					-	\N
518c50b6-a126-49a6-b4ed-62cd86abb31d	cf35e0aa-4157-471f-8733-18e66fedf332	033.018	18	Ande Ate	St. Paulus		Weetebula					-	\N
a6f1f588-a344-4aa2-a5c7-fe47065f9a19	cf35e0aa-4157-471f-8733-18e66fedf332	033.019	19	Kambajawa	Maria Bunda Yang Selalu Menolong		Weetebula					-	\N
e1916455-bff7-4df8-b36f-7746f2f73566	cf35e0aa-4157-471f-8733-18e66fedf332	033.020	20	Kererobbo	St. Alfonsus		Weetebula					-	\N
8b3fd766-10f8-4577-8798-302ca77cea55	cf35e0aa-4157-471f-8733-18e66fedf332	033.021	21	Lendi Wacu	St. Yosef		Weetebula					-	\N
d566ed9e-92d2-4f5e-99f6-f14026d2ceb6	cf35e0aa-4157-471f-8733-18e66fedf332	033.022	22	Nggongi	Sta. Maria Magdalena		Weetebula					-	\N
599ca606-cccd-426c-abef-a116c6e1622f	cf35e0aa-4157-471f-8733-18e66fedf332	033.023	23	Manola	St. Yosef		Weetebula					-	\N
461e455e-90c1-44db-96a2-d754d5c8148b	cf35e0aa-4157-471f-8733-18e66fedf332	033.024	24	Wanno Kaza	St. Agustinus		Weetebula					-	\N
5ce3388b-ee22-42a6-a514-b93ff8c14ee6	cf35e0aa-4157-471f-8733-18e66fedf332	033.025	25	Mojokerto	St. Yosef	Jl. Pemuda 9 Kode Pos 61319	Mojokerto	0321-322722				-	\N
014176f1-368d-458b-86e2-8d5c291dad9b	cf35e0aa-4157-471f-8733-18e66fedf332	033.026	26	Pare	St. Mateus	Jl. LetJend Sutoyo 78 Kode Pos 64211	Pare	0354-391188	0354-391188			-	\N
ff6c0e7a-dc11-4d75-9e86-e44d8b6707ff	cf35e0aa-4157-471f-8733-18e66fedf332	033.027	27	Blitar I	St. Yusuf	Jl. Diponegoro 40-42 Kode Pos 66133	Blitar	0342-801624				Silvano Laurenzi, SX	\N
6d047ed8-39c6-46ba-bd68-17a92371c1dd	cf35e0aa-4157-471f-8733-18e66fedf332	033.028	28	Blitar II	St. Maria	Jl. Cempaka 8 Kode Pos 66121	Blitar	0342-802973				-	\N
24433412-5a61-408f-9539-a0e55bc2337d	cf35e0aa-4157-471f-8733-18e66fedf332	033.029	29	Wlingi	St. Petrus & St. Paulus	Jl. Bromo 4 Kode Pos 66184	Wlingi	0342-691171				-	\N
5581b255-d191-4de5-b7fd-e2cc90be9472	cf35e0aa-4157-471f-8733-18e66fedf332	033.030	30	Tulungagung	St. Maria Dengan Tidak Bernoda Asal	Jl. A. Yani Timur IV/1 Kode Pos 66218	Tulungagung	0355-321727 / 335643				-	\N
c61d53fe-acbc-4832-83b6-aa225eeef249	cf35e0aa-4157-471f-8733-18e66fedf332	033.031	31	Madiun I	St. Cornelius	Jl. Jend. A. Yani 3 Kode Pos 63121	Madiun	0351-452247 / 458858	0351-495359			-	\N
2c966406-e4ca-4c62-b3cd-55d345d713ab	cf35e0aa-4157-471f-8733-18e66fedf332	033.032	32	Madiun II	Mater Dei	Jl. AURI No. A 11-12 Kode Pos 63117	Madiun	0351-492424				-	\N
779bf59c-c9b5-4572-ad86-7110fcd637f5	cf35e0aa-4157-471f-8733-18e66fedf332	033.033	33	Magetan	Regina Pacis	Jl. Raya Panekan KPR Selosari Kode Pos 63313	Magetan	0351-894050				-	\N
aef5690e-79a0-4274-9014-d06e2a847fae	cf35e0aa-4157-471f-8733-18e66fedf332	033.034	34	Nganjuk	St. Paulus & St. Petrus	Jl. Diponegoro 63-65 Kode Pos 64411	Nganjuk	0358-321743 / 321586				-	\N
ed1bf4af-2053-4b3f-b68f-fd9ec8255ce4	cf35e0aa-4157-471f-8733-18e66fedf332	033.035	35	Ngawi	St. Yosef	Jl. Jaksa Agung Suprapto 6 Kode Pos 63211	Ngawi	0351-749153				-	\N
207df99c-a192-4572-bf4d-258155dca2b1	cf35e0aa-4157-471f-8733-18e66fedf332	033.036	36	Ponorogo	St. Maria	Jl. Gajah Mada 45 Kode Pos 63419	Ponorogo	0352-481184	0352-488870			-	\N
54a58b59-5b33-40fb-a1f4-b03cb3fa1bf3	cf35e0aa-4157-471f-8733-18e66fedf332	033.037	37	Blora	St. Pius X	Jl. Pemuda 42 Kode Pos 58215	Blora	0296-531182				-	\N
c3d7e8ad-96aa-4518-9b84-48188db7b498	cf35e0aa-4157-471f-8733-18e66fedf332	033.038	38	Bojonegoro	St. Paulus	Jl. Panglima Sudirman 21-25 Kode Pos 62111	Bojonegoro	0353-881160	0353-886793			-	\N
1ad1d401-ef9b-4e5c-b05d-25a94b7c5d21	cf35e0aa-4157-471f-8733-18e66fedf332	033.039	39	Cepu	St. Wilibrordus	Jl. Ronggolawe 46 Kode Pos 58312	Cepu	0295- 691048 / 423182				RD. Siprianus Yitno	\N
3d963c01-81c4-4688-a823-395e9e7cdbf1	cf35e0aa-4157-471f-8733-18e66fedf332	033.040	40	Rembang	St. Petrus & St. Paulus	Jl. Diponegoro 91-93 Kode Pos 59211	Rembang	0295-691048				-	\N
b259b643-5b39-4f47-9d08-3b8cb64ac27c	cf35e0aa-4157-471f-8733-18e66fedf332	033.041	41	Tuban	St. Petrus	Jl. Panglima Sudirman 159 Kode Pos 62312	Tuban	0356-320963 / 320964	0356-321579			-	\N
6f8ac191-e646-4e6e-aa45-b63a1356ca5e	cf35e0aa-4157-471f-8733-18e66fedf332	033.042	43	Resapombo	St. Fransiskus Asisi		Blitar					-	\N
8fc8be83-9cc6-4ea7-85af-0c176da0ad0c	cf35e0aa-4157-471f-8733-18e66fedf332	033.043	43	Resapombo	St. Fransiskus Asisi		Blitar					-	\N
d32dffec-65b9-47f9-a4b5-1d5cba616bf8	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.001	1	Bandar Jaya / Kabupaten Lampung	St. Liduina		Tanjung Karang					-	\N
32eb25a1-d303-4069-850c-ac798b896847	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.002	2	Baradatu / Way Kanan	St. Pius X		Tanjung Karang					-	\N
0a101601-271c-4a09-ad4b-0cebaf153eb8	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.003	3	Murnijaya / Tulangbawang	St. Yohanes dan St. Paulus		Tanjung Karang					-	\N
f36b056f-adf1-4d7f-a5d8-48fd6828f026	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.004	4	Pajar Mataram / Lampung Tengah	St. Maria		Tanjung Karang					-	\N
2078b27a-2c4e-48ff-8d4d-81f88ef01fce	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.005	5	Gisting / Kab. Tanggamus	St. Pius X.		Tanjung Karang					-	\N
d1345a4d-5c7f-42a7-bf21-97bf509eb41c	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.006	6	Kalirejo / Kab. Lampung Tengah	St. Petrus		Tanjung Karang					-	\N
b6167a6e-16dc-471b-b43c-f0479ae18f59	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.007	7	Kedaton / Kodya Bandar Lampung	St. Yohanes Rasul		Tanjung Karang					-	\N
1e68e456-2eb9-452f-9276-b27dc28fdc81	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.008	8	Kotabumi / Kab. Lampung Utara	Kabar Gembira		Tanjung Karang					-	\N
d434e4d0-e2e9-4886-b782-e868483ccafb	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.009	9	Kotagajah / Kab. Lampung Tengah	St. Paulus		Tanjung Karang					-	\N
9182cd38-bc08-43d6-a1ff-018a79e6254a	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.010	10	Liwa / Kab. Lampung Barat	St. Theodorus		Tanjung Karang					-	\N
1b27b3f4-dcf0-4516-8a83-a206bb13e5ec	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.011	11	Margo Agung / Lampung Selatan	St. Andreas Rasul		Tanjung Karang					-	\N
794ecc6f-fb3c-4a11-8aa2-11c4a5d5edf1	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.012	12	Mesuji / Kab. Tulang Bawang	St. Andreas		Tanjung Karang					-	\N
9e25092b-bbfd-40d4-947c-239b5caac76d	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.013	13	Metro / Kodya Metro - Lampung Tengah	Hati Yesus Yang Maha Kudus		Tanjung Karang					-	\N
4974cab3-c585-4555-b5eb-a9fc15b9e75f	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.014	14	Pringsewu / Kab. Tanggamus	St. Yusuf		Tanjung Karang					-	\N
ba72af96-9de4-4f56-853a-281d4d5d3977	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.015	15	Sidomulyo / Kab. Lampung Selatan	Keluarga Kudus		Tanjung Karang					-	\N
3cac4c44-980f-427b-8ead-e8edcdd419ed	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.016	16	Sribawono / Kab. Lampung Timur	St. Thomas		Tanjung Karang					-	\N
9e130b77-5853-4daf-be51-2a711859e24e	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.017	17	Tanjung Karang / Kodya Bandar Lampung	Kristus Raja		Tanjung Karang					-	\N
07a68adf-375b-48a9-a0fc-eb32030c7647	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.018	18	Teluk Betung / Kodya Bandar Lampung	Ratu Damai		Tanjung Karang					-	\N
ef3f27f1-dc7b-4946-b35b-b963dd0029c9	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.019	19	Tulang Bawang	St. Yusuf Pekerja	Jl. Kesehatan Pringsewu	Punggur ( Lampung)	(0729) 21022				-	\N
bba96124-8cfd-42b7-929f-af6f25eb9350	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.020	20	Bandarsakti / Lampung Tengah	Tritunggal Maha Kudus		Tanjung Karang					-	\N
89634403-6f40-456a-b094-ab5503bbf016	51e1c004-62e6-4de9-a6aa-b6cc58e78d90	034.021	21	Bakauheni / Lampung Selatan	St. Kristoforus		Tanjung Karang					-	\N
3c6da4c8-2995-4290-892d-d8d9bff56ae7	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.001	1	Tarakan	Santa Maria Imakulata / Terkandung Tanpa Noda		Tanjung Selor					-	\N
db0f60f5-c9c4-4a60-9769-3068d404843f	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.002	2	Malinau	Santo Stefanus		Tanjung Selor					-	\N
48ab9197-26ea-4095-affc-3d1880f40d8f	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.003	3	Sungai Kayan	Santo Petrus		Tanjung Selor					-	\N
c4219464-8c81-4b3a-b663-af57685d8aa6	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.004	4	Tanjung Redeb	Santo Eugenius de Mazenod		Tanjung Selor					-	\N
06c66005-354b-4d5a-a017-22bdca297cab	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.005	5	Nunukan	Santo Gabriel		Tanjung Selor					-	\N
be3e0f93-ba00-4e31-8a48-94e274c8c80e	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.006	6	Mansalong	Santa Maria Bunda Karmel		Tanjung Selor					-	\N
68995a0e-3602-429e-bad1-4657768e87bc	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.007	7	Pulau Sapi	Rasul Yohanes		Tanjung Selor					-	\N
693e671c-9ec7-44d4-bc52-deb73edd0918	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.008	8	Tidung Pale	Santo Paulus		Tanjung Selor					-	\N
adc4aed5-efd5-458d-8cec-67a656e4673c	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.009	9	Tanjung Selor	Santa Maria Assumpta		Tanjung Selor					-	\N
49803026-85d9-4133-823b-69363c22176e	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.010	10	Apo Kayan	Santo Lukas		Tanjung Selor					-	\N
64748b3b-af3b-45a5-8395-5c9e5e6a28ac	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.011	11	Dumaring	Santo Yoseph		Tanjung Selor					-	\N
391275f6-c544-4905-b1a1-636df9fba814	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.012	12	Sekatak	Santo Carolus		Tanjung Selor					-	\N
a32cdcfa-721c-4b6b-b4d8-631b952a50e2	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.013	13	Sebuku	Santo Yosef		Tanjung Selor					-	\N
db0542d1-402d-47cc-bbfd-00541b4157c2	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.014	14	Segah	Hati Kudus		Tanjung Selor					-	\N
7dfc16ca-da9d-4577-9a3e-03bdfc32de38	5e2f62c8-8dd7-4003-843c-9a75789aba0d	035.015	15	Juata Permai	St. Yosef Pekerja	-	Juata Permai	\N	\N	\N	\N	-	\N
0dd1c66b-4da3-4bd1-83d3-fd8f5dbc547a	812df38d-e018-4c66-8eb3-6432e1245caf	036.001	1	Aramsolki / Akimuga	Kebangkitan		Jayapura					-	\N
e8ca99e2-bcdc-463f-b434-2a7c9d1d9745	812df38d-e018-4c66-8eb3-6432e1245caf	036.002	2	Atuka / Mimika Timu Dekat	St. Yoseph		Jayapura					-	\N
72624d88-6f8b-4059-aff5-50d1200c0f3c	812df38d-e018-4c66-8eb3-6432e1245caf	036.003	3	Biak	St. Maria Diangkat Ke Surga		Jayapura					-	\N
1023cc2c-b674-4b11-9227-42face82cd38	812df38d-e018-4c66-8eb3-6432e1245caf	036.004	4	Bilai	St. Yohanes Pemandi		Jayapura					-	\N
d98a09d4-4f85-401f-bc9a-33b902dfa61c	812df38d-e018-4c66-8eb3-6432e1245caf	036.005	5	Bilogai	St. Mikael		Jayapura					-	\N
79d697c9-0456-48ac-8d27-c2b314324056	812df38d-e018-4c66-8eb3-6432e1245caf	036.006	6	Diyai	Segala Orang Kudus		Jayapura					-	\N
79b812b5-382b-4a2f-8729-171cb281ee5a	812df38d-e018-4c66-8eb3-6432e1245caf	036.007	7	Enarotali	St. Yusup		Jayapura					-	\N
3b047228-15e3-4668-9356-e7484c542fc6	812df38d-e018-4c66-8eb3-6432e1245caf	036.008	8	Epouto / Tage Biru	St. Fransiskus Asisi		Jayapura					-	\N
6fd9889c-c664-406b-ae53-c3f96485ea72	812df38d-e018-4c66-8eb3-6432e1245caf	036.009	9	Komopa	Kristus Jaya		Jayapura					-	\N
6e78af3e-a3c7-4388-a290-f55d5a40fe67	812df38d-e018-4c66-8eb3-6432e1245caf	036.010	10	Moanemani	St. Maria Immaculata		Jayapura					-	\N
ef759f50-82e8-4f5a-8e6e-d51138f7a959	812df38d-e018-4c66-8eb3-6432e1245caf	036.011	11	Modio	St. Maria Rosari		Jayapura					-	\N
40216ec4-0e90-417a-b077-177c9de7fa42	812df38d-e018-4c66-8eb3-6432e1245caf	036.014	14	Mimika Barat / Paraoka	Maria Fatimaca		Jayapura					-	\N
3d7bb4c7-351c-4996-91c5-00b1c4556b34	812df38d-e018-4c66-8eb3-6432e1245caf	036.015	15	Serui	St. Bunda Maria		Jayapura					-	\N
6cd92f1c-abd9-48e7-b97a-147229cc9306	812df38d-e018-4c66-8eb3-6432e1245caf	036.016	16	Timeepa	Kristus Penebus		Jayapura					-	\N
ba09559a-327c-4484-9a79-b4b675720ec7	812df38d-e018-4c66-8eb3-6432e1245caf	036.017	17	Katedral	Tiga Raja		Jayapura					-	\N
5b9a42a0-966f-4ac8-888f-6f2bc7577019	812df38d-e018-4c66-8eb3-6432e1245caf	036.018	18	Waghete	St. Yohanes Pemandi		Jayapura					-	\N
4bcb00fd-9b59-4c66-a8d9-dbc52f31f0a6	812df38d-e018-4c66-8eb3-6432e1245caf	036.019	19	Bomomani	Maria Menerima Kabar Baik		Jayapura					-	\N
86d896ad-388c-42c6-88e3-1d3780ce48c6	812df38d-e018-4c66-8eb3-6432e1245caf	036.020	20	Idakebo	Maria Ratu Rosari		Jayapura					-	\N
f6620312-d435-414f-8b99-e3394effa51e	812df38d-e018-4c66-8eb3-6432e1245caf	036.021	21	Ilaga	St. Petrus		Jayapura					-	\N
9edfcbbc-7529-4572-a228-6fc8d41f713c	812df38d-e018-4c66-8eb3-6432e1245caf	036.022	22	Karang Senang SP 3	St. Petrus		Jayapura					-	\N
d9e262ef-cb40-4edf-84ef-1506ba54d32d	812df38d-e018-4c66-8eb3-6432e1245caf	036.023	23	Kokonau	Stella Maris		Jayapura					-	\N
aca09a5d-dcf7-4ef4-bf6e-d0bccb8f9fd9	812df38d-e018-4c66-8eb3-6432e1245caf	036.024	24	Mapurujaya	St. Emanuel		Jayapura					-	\N
efc0c263-1d94-4246-bcc7-e1f0e7635bf2	812df38d-e018-4c66-8eb3-6432e1245caf	036.025	25	Siriwini	Kristus Raja		Jayapura					-	\N
4151c874-3157-4526-b13b-8b130566bfca	812df38d-e018-4c66-8eb3-6432e1245caf	036.026	26	Sempan	St. Stefanus		Jayapura					-	\N
074691f4-3264-4090-b5d6-8760aa992b0e	49c290a4-589d-4617-9189-d31af0d988fe	037.001	1	Bloro	Sanctissima Trinitas	Pastoran Katolik Bloro, Maumere 86152,	Flores-NTT					-	\N
3d5c573b-db69-406b-a872-65fb7247107c	49c290a4-589d-4617-9189-d31af0d988fe	037.002	2	Boganatar	St. Yohanes Baptista	Pastoran Katolik Boganatar, Maumere 86183,	Flores-NTT					-	\N
6d2dc63b-8d37-49ed-affb-42f513ac9a64	49c290a4-589d-4617-9189-d31af0d988fe	037.003	3	Bola	St. Martinus	Pastoran Katolik Bola, Maumere 86171,	Flores-NTT					-	\N
5ad562e1-7d5f-471d-afb3-2099be7c978f	49c290a4-589d-4617-9189-d31af0d988fe	037.004	4	Habi	St. Maria Imaculata	Pastoran Katolik Habi, Maumere 86181,	Flores-NTT					-	\N
a69a8e82-47ce-49cf-8d0b-1e7ec550079b	49c290a4-589d-4617-9189-d31af0d988fe	037.005	5	Halehebing	Renha  Rosari	Pastoran Katolik Halehebing, Maumere 86171,	Flores-NTT					-	\N
0843a467-b541-48ce-8240-7c998b3cb373	49c290a4-589d-4617-9189-d31af0d988fe	037.006	6	ILI / Nara	Hati Yesus Yang Maha Kudus	Pastoran Katolik Ili, Maumere 86181,	Flores-NTT					-	\N
b9ab5eee-2649-4da3-9f89-4dbc2a052a52	49c290a4-589d-4617-9189-d31af0d988fe	037.007	7	Kewapante	Ratu Rosari	Pastoran Katolik Kewapante, Maumere 86181,	Flores-NTT					-	\N
aca7cc5c-87c2-4303-86ce-8613ad2a9df6	49c290a4-589d-4617-9189-d31af0d988fe	037.008	8	Kloangpopot	St. Petrus	Pastoran Katolik Kloangpopot, Maumere 86181,	Flores-NTT					-	\N
ea6a9f05-bc87-45ba-a574-35116f87eb95	49c290a4-589d-4617-9189-d31af0d988fe	037.009	9	Kloangrotat	Salib Suci	Pastoran Katolik Kloangrotat, Maumere 86181,	Flores-NTT					-	\N
7abeceed-b922-4e7e-ad50-82ab81287e46	49c290a4-589d-4617-9189-d31af0d988fe	037.010	10	Koting	St. Fransiskus Xaverius	Pastoran Katolik Koting, Maumere 86152,	Flores-NTT					-	\N
fcd7b1ec-1877-4ebb-9e00-7c4aab8f97a9	49c290a4-589d-4617-9189-d31af0d988fe	037.011	11	Wairpelit	St. Paulus	Pastoran Katolik Wairpelit, Maumere 86152,	Flores-NTT					-	\N
ca5861d1-2e79-4f2b-98d7-bb0bbf3f34f2	49c290a4-589d-4617-9189-d31af0d988fe	037.012	12	Lei / Palue	Keluarga Kudus	Pastoran Katolik Lei/Palue, Maumere 86151,	Flores-NTT					-	\N
ea3fa948-236a-4826-a9d0-59d56dac40ad	49c290a4-589d-4617-9189-d31af0d988fe	037.013	13	Lekebai	St. Perawan Maria Yang Tak Bernoda	Pastoran Lekebai, Maumere 86153,	Flores-NTT					-	\N
28811124-2899-40ca-bce6-337ea9135b42	49c290a4-589d-4617-9189-d31af0d988fe	037.014	14	Lela	St. Perawan Maria Yang Tak Bernoda	Pastoran Katolik Lela, Maumere 86161, 	Flores-NTT					-	\N
e5b182c7-85a5-430e-ae5f-85d1771aa6fa	49c290a4-589d-4617-9189-d31af0d988fe	037.015	15	Magepanda	St. Yohanes Maria Vianney	Pastoran Katolik Magepanda, Maumere 86151,	Flores-NTT					-	\N
047e9564-4cb7-4c24-b27f-2122cfacc1a2	49c290a4-589d-4617-9189-d31af0d988fe	037.016	16	Mauloo	Salib Suci	Pastoran Katolik Mauloo, Maumere 86153,	Flores-NTT					-	\N
06cc1d41-c02b-4d57-92a9-a6d1b3dce9fe	49c290a4-589d-4617-9189-d31af0d988fe	037.017	17	Maumere I	St. Yosef	Pastoran Katolik St Yosef, Jl Mgr Sugiyopranoto No.2, Maumere 86112,	Flores-NTT	0382-21153				-	\N
8eded14d-68d4-4dcb-beb7-e612318e0f03	49c290a4-589d-4617-9189-d31af0d988fe	037.018	18	Maumere II	St. Thomas Morus	Pastoran Katolik Thomas Morus, Jl Kesehatan, Maumere 86111,	Flores-NTT	0382-21332				-	\N
53b8ad7c-e022-4d9d-bd92-0eba1ef77b96	49c290a4-589d-4617-9189-d31af0d988fe	037.019	19	Nangahure	St. Maria Magdalena	Pastoran Katolik Nangahure, Maumere 86113,	Flores-NTT	0382-23335				-	\N
b0969464-6b78-43f9-8c5a-505b39d65d97	49c290a4-589d-4617-9189-d31af0d988fe	037.020	20	Nebe	Maria Bintang Laut	Pastoran Katolik Nebe, Maumere 86183,	Flores-NTT					-	\N
28187293-2248-4081-b3c9-bd485ac2311a	49c290a4-589d-4617-9189-d31af0d988fe	037.021	21	Nele	Roh Kudus	Pastoran Katolik Nele, Maumere 86151,	Flores-NTT					-	\N
64c89702-8527-4fd1-8826-6610e1e2beec	49c290a4-589d-4617-9189-d31af0d988fe	037.022	22	Nita	St Mikhael Malaekat Agung	Pastoran Katolik Nita, Maumere 86152,	Flores-NTT					-	\N
ec9bf6d8-dbdf-4885-87bd-0bd71b00a17c	49c290a4-589d-4617-9189-d31af0d988fe	037.023	23	Sikka	St. Ignatius Loyola	Pastoran Katolik Sikka, Maumere 86161,	Flores-NTT					-	\N
9fb71e9b-ef57-4731-bd3d-8aad500d2bd0	49c290a4-589d-4617-9189-d31af0d988fe	037.024	24	Tanarawa	St. Perawan Maria Ratu	Pastoran Katolik Tanarawa, Kotak Pos 136, Maumere 86101,	Flores-NTT					-	\N
7894b722-9e2a-434b-bb14-dd8abd01a554	49c290a4-589d-4617-9189-d31af0d988fe	037.025	25	Tilang	Hati Tak Bernoda Santa Perawan Maria	Pastoran Katolik Tilang, Maumere 86153,	Flores-NTT					-	\N
510e6a53-b881-4259-bb69-13cf7c329531	49c290a4-589d-4617-9189-d31af0d988fe	037.026	26	Uwa / Palue	Maria Bintang Laut	Pastoran Katolik Uwa/Palue, Maumere 86151,	Flores-NTT					-	\N
3dc59d5e-f97a-4341-921f-6bbbfdb7ac75	49c290a4-589d-4617-9189-d31af0d988fe	037.027	27	Talibura	Kristus Raja	Pastoran Katolik Talibura, Maumere 86183,	Flores-NTT					-	\N
d0c54cf8-cf4c-47ad-b595-f9ad8fefe69a	49c290a4-589d-4617-9189-d31af0d988fe	037.028	28	Watubala	Kenaikan Kristus	Pastoran Katolik Watubala, Maumere 86183,	Flores-NTT					-	\N
e698a60e-a126-4695-b242-95fa2d69402b	49c290a4-589d-4617-9189-d31af0d988fe	037.029	29	Watublapi	Mater Boni Consilii	Pastoran Katolik Watublapi, Maumere 86181,	Flores-NTT					-	\N
bbfd6363-ee70-4576-8816-446885921931	49c290a4-589d-4617-9189-d31af0d988fe	037.030	30	Wolofeo	St. Maria Dari Gunung Karmel	Pastoran Katolik Wolofeo, Maumere 86319,	Flores-NTT					-	\N
13eb1a14-3d64-47fa-9d3e-783209db00d3	49c290a4-589d-4617-9189-d31af0d988fe	037.031	31	Bolawolon	St. Yosef Freinademez	Jl Nairoa-Kewapante, Maumere, 	Flores-NTT					-	\N
dd9771c2-5f87-44bf-b7c5-a1ded391585c	49c290a4-589d-4617-9189-d31af0d988fe	037.032	32	Bu Nuaria	Maria Kusuma Karmel	Pastoran Katolik Bu Nuaria, Maumere 86153,	Flores-NTT					-	\N
e64f6fbc-ffef-4e22-a6f8-6e1ade2f02b0	49c290a4-589d-4617-9189-d31af0d988fe	037.033	33	Feondari	Vincentius A Paulo	Pastoran Katolik Feondari, Maumere,	Flores-NTT					-	\N
06471bc5-3e2e-4556-973c-26182b354a8c	49c290a4-589d-4617-9189-d31af0d988fe	037.034	34	Misir	Spiritu Santu	Pastoran Katolik Misir, Jl Banteng Misir, Maumere 86112,	Flores-NTT	0382-23734				-	\N
3f15c38d-b72c-4303-8dbb-2cccdf2605e7	49c290a4-589d-4617-9189-d31af0d988fe	037.035	35	Runut	Sanctissima Trinitas	Pastoran Katolik Runut, Talib ura Maumere, 	Flores-NTT					-	\N
\.


--
-- Data for Name: tr_wilayah; Type: TABLE DATA; Schema: public; Owner: toni
--

COPY public.tr_wilayah (id, wilayah_bagian_id, kode, nama, ketua, ref_duk) FROM stdin;
\.


--
-- Name: sc_user sc_user_pkey; Type: CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.sc_user
    ADD CONSTRAINT sc_user_pkey PRIMARY KEY (id);


--
-- Name: tr_keuskupan tr_keuskupan_pkey; Type: CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_keuskupan
    ADD CONSTRAINT tr_keuskupan_pkey PRIMARY KEY (id);


--
-- Name: tr_lingkungan tr_lingkungan_pkey; Type: CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_lingkungan
    ADD CONSTRAINT tr_lingkungan_pkey PRIMARY KEY (id);


--
-- Name: tr_paroki tr_paroki_pkey; Type: CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_paroki
    ADD CONSTRAINT tr_paroki_pkey PRIMARY KEY (id);


--
-- Name: tr_wilayah tr_wilayah_pkey; Type: CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_wilayah
    ADD CONSTRAINT tr_wilayah_pkey PRIMARY KEY (id);


--
-- Name: idx_d8183973b972e924; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_d8183973b972e924 ON public.sc_user USING btree (paroki_id);


--
-- Name: idx_ef0455624800990; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_ef0455624800990 ON public.tr_paroki USING btree (keuskupan_id);


--
-- Name: idx_f3b81de3bae15926; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_f3b81de3bae15926 ON public.tr_wilayah USING btree (wilayah_bagian_id);


--
-- Name: idx_f5e9aef042b7f2f7; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_f5e9aef042b7f2f7 ON public.tr_lingkungan USING btree (wilayah_id);


--
-- Name: idx_f5e9aef0b972e924; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_f5e9aef0b972e924 ON public.tr_lingkungan USING btree (paroki_id);


--
-- Name: idx_f5e9aef0bae15926; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX idx_f5e9aef0bae15926 ON public.tr_lingkungan USING btree (wilayah_bagian_id);


--
-- Name: ix_keuskupan_kode; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX ix_keuskupan_kode ON public.tr_keuskupan USING btree (kode);


--
-- Name: ix_kota_paroki; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX ix_kota_paroki ON public.tr_paroki USING btree (kota);


--
-- Name: ix_paroki_gereja; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX ix_paroki_gereja ON public.tr_paroki USING btree (nama_gereja);


--
-- Name: ix_paroki_kode; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX ix_paroki_kode ON public.tr_paroki USING btree (kode);


--
-- Name: ix_paroki_nama; Type: INDEX; Schema: public; Owner: toni
--

CREATE INDEX ix_paroki_nama ON public.tr_paroki USING btree (nama);


--
-- Name: uniq_d818397392fc23a8; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX uniq_d818397392fc23a8 ON public.sc_user USING btree (username_canonical);


--
-- Name: uniq_d8183973a0d96fbf; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX uniq_d8183973a0d96fbf ON public.sc_user USING btree (email_canonical);


--
-- Name: uniq_d8183973c05fb297; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX uniq_d8183973c05fb297 ON public.sc_user USING btree (confirmation_token);


--
-- Name: uniq_f5e9aef0b2a11877; Type: INDEX; Schema: public; Owner: toni
--

CREATE UNIQUE INDEX uniq_f5e9aef0b2a11877 ON public.tr_lingkungan USING btree (kode);


--
-- Name: sc_user fk_d8183973b972e924; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.sc_user
    ADD CONSTRAINT fk_d8183973b972e924 FOREIGN KEY (paroki_id) REFERENCES public.tr_paroki(id);


--
-- Name: tr_paroki fk_ef0455624800990; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_paroki
    ADD CONSTRAINT fk_ef0455624800990 FOREIGN KEY (keuskupan_id) REFERENCES public.tr_keuskupan(id);


--
-- Name: tr_wilayah fk_f3b81de3bae15926; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_wilayah
    ADD CONSTRAINT fk_f3b81de3bae15926 FOREIGN KEY (wilayah_bagian_id) REFERENCES public.tr_jenis_wilayah(id);


--
-- Name: tr_lingkungan fk_f5e9aef042b7f2f7; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_lingkungan
    ADD CONSTRAINT fk_f5e9aef042b7f2f7 FOREIGN KEY (wilayah_id) REFERENCES public.tr_wilayah(id);


--
-- Name: tr_lingkungan fk_f5e9aef0b972e924; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_lingkungan
    ADD CONSTRAINT fk_f5e9aef0b972e924 FOREIGN KEY (paroki_id) REFERENCES public.tr_paroki(id);


--
-- Name: tr_lingkungan fk_f5e9aef0bae15926; Type: FK CONSTRAINT; Schema: public; Owner: toni
--

ALTER TABLE ONLY public.tr_lingkungan
    ADD CONSTRAINT fk_f5e9aef0bae15926 FOREIGN KEY (wilayah_bagian_id) REFERENCES public.tr_jenis_wilayah(id);


--
-- PostgreSQL database dump complete
--

