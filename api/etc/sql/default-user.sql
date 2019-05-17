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

--
-- Data for Name: sc_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sc_user (id, paroki_id, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, confirmation_token, password_requested_at, roles, nama) VALUES ('dd15f929-2e1d-4b14-bdf2-c2b4dd6f05ee', NULL, 'admin', 'admin', 'me@itstoni.com', 'me@itstoni.com', true, NULL, '$2y$13$9q8xhQm4MrW5Z1hfONH5OeAwj3MZ3myCW/CrdGXb.p/WLp9LxUuby', NULL, NULL, NULL, 'a:2:{i:0;s:16:"ROLE_SUPER_ADMIN";i:1;s:10:"ROLE_ADMIN";}', 'Default Administrator');

--
-- PostgreSQL database dump complete
--

