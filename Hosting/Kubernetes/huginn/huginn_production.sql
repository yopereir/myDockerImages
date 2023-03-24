--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: agent_logs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agent_logs (
    id integer NOT NULL,
    agent_id integer NOT NULL,
    message text NOT NULL,
    level integer DEFAULT 3 NOT NULL,
    inbound_event_id integer,
    outbound_event_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.agent_logs OWNER TO root;

--
-- Name: agent_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agent_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_logs_id_seq OWNER TO root;

--
-- Name: agent_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.agent_logs_id_seq OWNED BY public.agent_logs.id;


--
-- Name: agents; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agents (
    id integer NOT NULL,
    user_id integer,
    options text,
    type character varying,
    name character varying,
    schedule character varying,
    events_count integer DEFAULT 0 NOT NULL,
    last_check_at timestamp without time zone,
    last_receive_at timestamp without time zone,
    last_checked_event_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    memory text,
    last_web_request_at timestamp without time zone,
    keep_events_for integer DEFAULT 0 NOT NULL,
    last_event_at timestamp without time zone,
    last_error_log_at timestamp without time zone,
    propagate_immediately boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    service_id integer,
    guid character varying NOT NULL,
    deactivated boolean DEFAULT false
);


ALTER TABLE public.agents OWNER TO root;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO root;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO root;

--
-- Name: control_links; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.control_links (
    id integer NOT NULL,
    controller_id integer NOT NULL,
    control_target_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.control_links OWNER TO root;

--
-- Name: control_links_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.control_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_links_id_seq OWNER TO root;

--
-- Name: control_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.control_links_id_seq OWNED BY public.control_links.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.delayed_jobs OWNER TO root;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO root;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.events (
    id integer NOT NULL,
    user_id integer,
    agent_id integer,
    lat numeric(15,10),
    lng numeric(15,10),
    payload text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    expires_at timestamp without time zone
);


ALTER TABLE public.events OWNER TO root;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO root;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.links (
    id integer NOT NULL,
    source_id integer,
    receiver_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    event_id_at_creation integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.links OWNER TO root;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO root;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: scenario_memberships; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scenario_memberships (
    id integer NOT NULL,
    agent_id integer NOT NULL,
    scenario_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.scenario_memberships OWNER TO root;

--
-- Name: scenario_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.scenario_memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenario_memberships_id_seq OWNER TO root;

--
-- Name: scenario_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.scenario_memberships_id_seq OWNED BY public.scenario_memberships.id;


--
-- Name: scenarios; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scenarios (
    id integer NOT NULL,
    name character varying NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text,
    public boolean DEFAULT false NOT NULL,
    guid character varying NOT NULL,
    source_url character varying,
    tag_bg_color character varying,
    tag_fg_color character varying,
    icon character varying
);


ALTER TABLE public.scenarios OWNER TO root;

--
-- Name: scenarios_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.scenarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenarios_id_seq OWNER TO root;

--
-- Name: scenarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.scenarios_id_seq OWNED BY public.scenarios.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO root;

--
-- Name: services; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.services (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying NOT NULL,
    name character varying NOT NULL,
    token text NOT NULL,
    secret text,
    refresh_token text,
    expires_at timestamp without time zone,
    global boolean DEFAULT false,
    options text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uid character varying
);


ALTER TABLE public.services OWNER TO root;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO root;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_credentials (
    id integer NOT NULL,
    user_id integer NOT NULL,
    credential_name character varying NOT NULL,
    credential_value text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mode character varying DEFAULT 'text'::character varying NOT NULL
);


ALTER TABLE public.user_credentials OWNER TO root;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_credentials_id_seq OWNER TO root;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_credentials_id_seq OWNED BY public.user_credentials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL,
    failed_attempts integer DEFAULT 0,
    unlock_token character varying,
    locked_at timestamp without time zone,
    username character varying NOT NULL,
    invitation_code character varying,
    scenario_count integer DEFAULT 0 NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    deactivated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: agent_logs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.agent_logs ALTER COLUMN id SET DEFAULT nextval('public.agent_logs_id_seq'::regclass);


--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: control_links id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.control_links ALTER COLUMN id SET DEFAULT nextval('public.control_links_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: scenario_memberships id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scenario_memberships ALTER COLUMN id SET DEFAULT nextval('public.scenario_memberships_id_seq'::regclass);


--
-- Name: scenarios id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scenarios ALTER COLUMN id SET DEFAULT nextval('public.scenarios_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: user_credentials id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_credentials ALTER COLUMN id SET DEFAULT nextval('public.user_credentials_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: agent_logs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.agent_logs (id, agent_id, message, level, inbound_event_id, outbound_event_id, created_at, updated_at) FROM stdin;
1	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 20 event(s).	3	\N	\N	2023-03-23 04:04:41.612694	2023-03-23 04:04:41.612694
2	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:25:08.165688	2023-03-24 02:25:08.165688
3	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:30:08.694647	2023-03-24 02:30:08.694647
4	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:35:09.112241	2023-03-24 02:35:09.112241
5	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:40:09.506365	2023-03-24 02:40:09.506365
6	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:45:09.913887	2023-03-24 02:45:09.913887
7	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:50:00.365342	2023-03-24 02:50:00.365342
8	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 02:55:00.755158	2023-03-24 02:55:00.755158
9	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:00:01.174769	2023-03-24 03:00:01.174769
10	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:05:01.561513	2023-03-24 03:05:01.561513
11	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:10:01.962742	2023-03-24 03:10:01.962742
12	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:15:02.345977	2023-03-24 03:15:02.345977
13	9	Fetching https://www.cncf.io/reports/	3	\N	\N	2023-03-24 03:19:52.606946	2023-03-24 03:19:52.606946
14	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:19:54.233404	2023-03-24 03:19:54.233404
15	9	Values extracted: ["Edge Native Applications Principles Whitepaper", "CloudNativeSecurityCon North America 2023", "CTO Summit NA 2022", "Security Slam North America 2022", "KubeDay Japan 2022", "CNCF Annual Survey 2022", "CNCF Annual Report 2022", "CNCF Annual Report 2022 – Japanese translation", "KubeCon + CloudNativeCon North America 2022", "KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports", "ArgoCon 2022", "Argo Project Journey Report", "CTO Summit EU 2022", "OTel Community Day North America", "Cloud Native Telco Day Europe", "ServiceMeshCon Europe", "Cloud Native eBPF Day Europe", "FluentCon Europe", "GitOpsCon Europe", "KnativeCon Europe", "Kubernetes AI Day Europe", "Kubernetes BATCH + HPC Day Europe", "Kubernetes on EDGE DAY Europe", "PrometheusDay Europe", "Cloud Native WASM Day Europe", "Cloud Native SecurityCon Europe", "KubeCon + CloudNativeCon Europe 2022", "Cloud Native Security Whitepaper", "Kubernetes Annual Report 2021", "2021年中国 KubeCon + CloudNativeCon + Open Source Summit", "KubeCon + CloudNativeCon + Open Source Summit China 2021", "CNCF Annual Survey 2021", "CNCF Annual Report 2021", "KubeCon + CloudNativeCon North America 2021", "KubeCon + CloudNativeCon Europe 2021", "Spotify End User Journey Report", "PromCon North America 2021", "Cloud Native Wasm Day North America 2021", "ServiceMeshCon North America 2021", "FluentCon North America 2021", "Cloud Native Security Conference North America 2021", "Cloud Native DevX Day North America 2021", "Cloud Native eBPF Day North America 2021", "Kubernetes AI Day North America", "EnvoyCon North America 2021", "SupplyChainSecurityCon North America 2021", "Production Identity Day: SPIFFE + SPIRE North America 2021", "GitOpsCon North America 2021", "Crossplane Community Day Europe 2021", "Cloud Native Wasm Day Europe 2021", "Cloud Native Security Day Europe 2021", "ServiceMeshCon Europe 2021", "PromCon Online Europe 2021", "Magma Day Europe 2021", "Kubernetes on Edge Day Europe 2021", "Kubernetes AI Day Europe 2021", "FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021", "etcd Project Journey Report", "CNCF Annual Report 2020", "KubeCon + CloudNativeCon North America 2020", "KubeCon + CloudNativeCon Europe 2020", "Cloud Native Survey 2020", "Kubernetes Community Annual Report 2020", "Vitess Project Journey Report", "EnvoyCon 2020", "Helm Workshop 2020", "gRPC Conf 2020", "Jaeger Project Journey Report", "Helm Project Journey Report", "Fluentd Project Journey Report", "Kubernetes Forum Bengaluru 2020", "Kubernetes Forum Delhi 2020", "containerd Project Journey Report", "CNCF Annual Report 2019", "KubeCon + CloudNativeCon North America 2019", "KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019", "KubeCon + CloudNativeCon Europe 2019", "Kubernetes Forum Sydney 2019", "Kubernetes Forum Seoul 2019", "Cloud Native Survey 2019", "Prometheus Project Journey Report", "Envoy Project Journey Report", "Kubernetes Project Journey Report", "Kubernetes Day Bengaluru 2019", "CNCF Annual Report 2018", "KubeCon + CloudNativeCon North America 2018", "CNCF Annual Report 2017"]	3	\N	\N	2023-03-24 03:19:54.243463	2023-03-24 03:19:54.243463
16	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:19:54.24985	2023-03-24 03:19:54.24985
17	9	Values extracted: ["https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/", "https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/", "https://www.cncf.io/reports/cto-summit-na-2022/", "https://www.cncf.io/reports/security-slam-north-america-2022/", "https://www.cncf.io/reports/kubeday-japan-2022/", "https://www.cncf.io/reports/cncf-annual-survey-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022-jp/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/", "https://www.cncf.io/reports/argocon-2022/", "https://www.cncf.io/reports/argo-project-journey-report/", "https://www.cncf.io/reports/cto-summit-eu-2022/", "https://www.cncf.io/reports/otel-community-day-north-america/", "https://www.cncf.io/reports/cloud-native-telco-day-europe/", "https://www.cncf.io/reports/servicemeshcon-europe/", "https://www.cncf.io/reports/cloud-native-ebpf-day-europe/", "https://www.cncf.io/reports/fluentcon-europe/", "https://www.cncf.io/reports/gitopscon-europe/", "https://www.cncf.io/reports/knativecon-europe/", "https://www.cncf.io/reports/kubernetes-ai-day-europe/", "https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe/", "https://www.cncf.io/reports/prometheusday-europe/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe/", "https://www.cncf.io/reports/cloud-native-securitycon-europe/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/", "https://www.cncf.io/reports/cloud-native-security-whitepaper/", "https://www.cncf.io/reports/kubernetes-annual-report-2021/", "https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/", "https://www.cncf.io/reports/cncf-annual-survey-2021/", "https://www.cncf.io/reports/cncf-annual-report-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/", "https://www.cncf.io/reports/spotify-end-user-journey-report/", "https://www.cncf.io/reports/promcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/", "https://www.cncf.io/reports/servicemeshcon-north-america-2021/", "https://www.cncf.io/reports/fluentcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/", "https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/", "https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-north-america/", "https://www.cncf.io/reports/envoycon-north-america-2021/", "https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/", "https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/", "https://www.cncf.io/reports/gitopscon-north-america-2021/", "https://www.cncf.io/reports/crossplane-community-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-security-day-europe-2021/", "https://www.cncf.io/reports/servicemeshcon-europe-2021/", "https://www.cncf.io/reports/promcon-online-europe-2021/", "https://www.cncf.io/reports/magma-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/", "https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/", "https://www.cncf.io/reports/etcd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/", "https://www.cncf.io/reports/cloud-native-survey-2020/", "https://www.cncf.io/reports/kubernetes-community-annual-report-2020/", "https://www.cncf.io/reports/vitess-project-journey-report/", "https://www.cncf.io/reports/envoycon-2020/", "https://www.cncf.io/reports/helm-workshop-2020/", "https://www.cncf.io/reports/grpc-conf-2020/", "https://www.cncf.io/reports/jaeger-project-journey-report/", "https://www.cncf.io/reports/helm-project-journey-report/", "https://www.cncf.io/reports/fluentd-project-journey-report/", "https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/", "https://www.cncf.io/reports/kubernetes-forum-delhi-2020/", "https://www.cncf.io/reports/containerd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/", "https://www.cncf.io/reports/kubernetes-forum-sydney-2019/", "https://www.cncf.io/reports/kubernetes-forum-seoul-2019/", "https://www.cncf.io/reports/cloud-native-survey-2019/", "https://www.cncf.io/reports/prometheus-project-journey-report/", "https://www.cncf.io/reports/envoy-project-journey-report/", "https://www.cncf.io/reports/kubernetes-project-journey-report/", "https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/", "https://www.cncf.io/reports/cncf-annual-report-2018/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/", "https://www.cncf.io/reports/cncf-annual-report-2017/"]	3	\N	\N	2023-03-24 03:19:54.263767	2023-03-24 03:19:54.263767
18	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Edge Native Applications Principles Whitepaper", "report-url"=>"https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/"}	3	\N	\N	2023-03-24 03:19:54.328304	2023-03-24 03:19:54.328304
19	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CloudNativeSecurityCon North America 2023", "report-url"=>"https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/"}	3	\N	\N	2023-03-24 03:19:54.339833	2023-03-24 03:19:54.339833
20	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CTO Summit NA 2022", "report-url"=>"https://www.cncf.io/reports/cto-summit-na-2022/"}	3	\N	\N	2023-03-24 03:19:54.347586	2023-03-24 03:19:54.347586
21	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Security Slam North America 2022", "report-url"=>"https://www.cncf.io/reports/security-slam-north-america-2022/"}	3	\N	\N	2023-03-24 03:19:54.354199	2023-03-24 03:19:54.354199
22	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeDay Japan 2022", "report-url"=>"https://www.cncf.io/reports/kubeday-japan-2022/"}	3	\N	\N	2023-03-24 03:19:54.361708	2023-03-24 03:19:54.361708
23	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Survey 2022", "report-url"=>"https://www.cncf.io/reports/cncf-annual-survey-2022/"}	3	\N	\N	2023-03-24 03:19:54.36968	2023-03-24 03:19:54.36968
24	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2022", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2022/"}	3	\N	\N	2023-03-24 03:19:54.379482	2023-03-24 03:19:54.379482
25	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2022 – Japanese translation", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2022-jp/"}	3	\N	\N	2023-03-24 03:19:54.387493	2023-03-24 03:19:54.387493
26	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2022", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/"}	3	\N	\N	2023-03-24 03:19:54.395674	2023-03-24 03:19:54.395674
27	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/"}	3	\N	\N	2023-03-24 03:19:54.401962	2023-03-24 03:19:54.401962
28	9	Storing new parsed result for 'cncf reports': {"report-title"=>"ArgoCon 2022", "report-url"=>"https://www.cncf.io/reports/argocon-2022/"}	3	\N	\N	2023-03-24 03:19:54.409166	2023-03-24 03:19:54.409166
29	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Argo Project Journey Report", "report-url"=>"https://www.cncf.io/reports/argo-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.415677	2023-03-24 03:19:54.415677
30	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CTO Summit EU 2022", "report-url"=>"https://www.cncf.io/reports/cto-summit-eu-2022/"}	3	\N	\N	2023-03-24 03:19:54.424778	2023-03-24 03:19:54.424778
31	9	Storing new parsed result for 'cncf reports': {"report-title"=>"OTel Community Day North America", "report-url"=>"https://www.cncf.io/reports/otel-community-day-north-america/"}	3	\N	\N	2023-03-24 03:19:54.431725	2023-03-24 03:19:54.431725
32	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Telco Day Europe", "report-url"=>"https://www.cncf.io/reports/cloud-native-telco-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.440357	2023-03-24 03:19:54.440357
33	9	Storing new parsed result for 'cncf reports': {"report-title"=>"ServiceMeshCon Europe", "report-url"=>"https://www.cncf.io/reports/servicemeshcon-europe/"}	3	\N	\N	2023-03-24 03:19:54.449039	2023-03-24 03:19:54.449039
34	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native eBPF Day Europe", "report-url"=>"https://www.cncf.io/reports/cloud-native-ebpf-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.455684	2023-03-24 03:19:54.455684
35	9	Storing new parsed result for 'cncf reports': {"report-title"=>"FluentCon Europe", "report-url"=>"https://www.cncf.io/reports/fluentcon-europe/"}	3	\N	\N	2023-03-24 03:19:54.46258	2023-03-24 03:19:54.46258
36	9	Storing new parsed result for 'cncf reports': {"report-title"=>"GitOpsCon Europe", "report-url"=>"https://www.cncf.io/reports/gitopscon-europe/"}	3	\N	\N	2023-03-24 03:19:54.468988	2023-03-24 03:19:54.468988
37	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KnativeCon Europe", "report-url"=>"https://www.cncf.io/reports/knativecon-europe/"}	3	\N	\N	2023-03-24 03:19:54.478225	2023-03-24 03:19:54.478225
38	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes AI Day Europe", "report-url"=>"https://www.cncf.io/reports/kubernetes-ai-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.487106	2023-03-24 03:19:54.487106
39	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes BATCH + HPC Day Europe", "report-url"=>"https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.494121	2023-03-24 03:19:54.494121
40	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes on EDGE DAY Europe", "report-url"=>"https://www.cncf.io/reports/kubernetes-on-edge-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.501768	2023-03-24 03:19:54.501768
41	9	Storing new parsed result for 'cncf reports': {"report-title"=>"PrometheusDay Europe", "report-url"=>"https://www.cncf.io/reports/prometheusday-europe/"}	3	\N	\N	2023-03-24 03:19:54.507636	2023-03-24 03:19:54.507636
42	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native WASM Day Europe", "report-url"=>"https://www.cncf.io/reports/cloud-native-wasm-day-europe/"}	3	\N	\N	2023-03-24 03:19:54.514604	2023-03-24 03:19:54.514604
43	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native SecurityCon Europe", "report-url"=>"https://www.cncf.io/reports/cloud-native-securitycon-europe/"}	3	\N	\N	2023-03-24 03:19:54.520696	2023-03-24 03:19:54.520696
44	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon Europe 2022", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/"}	3	\N	\N	2023-03-24 03:19:54.529578	2023-03-24 03:19:54.529578
45	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Security Whitepaper", "report-url"=>"https://www.cncf.io/reports/cloud-native-security-whitepaper/"}	3	\N	\N	2023-03-24 03:19:54.535777	2023-03-24 03:19:54.535777
46	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Annual Report 2021", "report-url"=>"https://www.cncf.io/reports/kubernetes-annual-report-2021/"}	3	\N	\N	2023-03-24 03:19:54.542301	2023-03-24 03:19:54.542301
47	9	Storing new parsed result for 'cncf reports': {"report-title"=>"2021年中国 KubeCon + CloudNativeCon + Open Source Summit", "report-url"=>"https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/"}	3	\N	\N	2023-03-24 03:19:54.553226	2023-03-24 03:19:54.553226
48	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon + Open Source Summit China 2021", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/"}	3	\N	\N	2023-03-24 03:19:54.559864	2023-03-24 03:19:54.559864
49	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Survey 2021", "report-url"=>"https://www.cncf.io/reports/cncf-annual-survey-2021/"}	3	\N	\N	2023-03-24 03:19:54.566921	2023-03-24 03:19:54.566921
50	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2021", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2021/"}	3	\N	\N	2023-03-24 03:19:54.574204	2023-03-24 03:19:54.574204
51	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2021", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.584943	2023-03-24 03:19:54.584943
52	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon Europe 2021", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.595689	2023-03-24 03:19:54.595689
53	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Spotify End User Journey Report", "report-url"=>"https://www.cncf.io/reports/spotify-end-user-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.60486	2023-03-24 03:19:54.60486
54	9	Storing new parsed result for 'cncf reports': {"report-title"=>"PromCon North America 2021", "report-url"=>"https://www.cncf.io/reports/promcon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.612811	2023-03-24 03:19:54.612811
55	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Wasm Day North America 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.620539	2023-03-24 03:19:54.620539
56	9	Storing new parsed result for 'cncf reports': {"report-title"=>"ServiceMeshCon North America 2021", "report-url"=>"https://www.cncf.io/reports/servicemeshcon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.627327	2023-03-24 03:19:54.627327
57	9	Storing new parsed result for 'cncf reports': {"report-title"=>"FluentCon North America 2021", "report-url"=>"https://www.cncf.io/reports/fluentcon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.639945	2023-03-24 03:19:54.639945
58	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Security Conference North America 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.648511	2023-03-24 03:19:54.648511
59	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native DevX Day North America 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.660039	2023-03-24 03:19:54.660039
60	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native eBPF Day North America 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.669739	2023-03-24 03:19:54.669739
61	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes AI Day North America", "report-url"=>"https://www.cncf.io/reports/kubernetes-ai-day-north-america/"}	3	\N	\N	2023-03-24 03:19:54.676738	2023-03-24 03:19:54.676738
62	9	Storing new parsed result for 'cncf reports': {"report-title"=>"EnvoyCon North America 2021", "report-url"=>"https://www.cncf.io/reports/envoycon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.687025	2023-03-24 03:19:54.687025
63	9	Storing new parsed result for 'cncf reports': {"report-title"=>"SupplyChainSecurityCon North America 2021", "report-url"=>"https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.696183	2023-03-24 03:19:54.696183
64	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Production Identity Day: SPIFFE + SPIRE North America 2021", "report-url"=>"https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.709849	2023-03-24 03:19:54.709849
65	9	Storing new parsed result for 'cncf reports': {"report-title"=>"GitOpsCon North America 2021", "report-url"=>"https://www.cncf.io/reports/gitopscon-north-america-2021/"}	3	\N	\N	2023-03-24 03:19:54.719962	2023-03-24 03:19:54.719962
66	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Crossplane Community Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/crossplane-community-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.72855	2023-03-24 03:19:54.72855
67	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Wasm Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.738333	2023-03-24 03:19:54.738333
68	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Security Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/cloud-native-security-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.745883	2023-03-24 03:19:54.745883
69	9	Storing new parsed result for 'cncf reports': {"report-title"=>"ServiceMeshCon Europe 2021", "report-url"=>"https://www.cncf.io/reports/servicemeshcon-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.758049	2023-03-24 03:19:54.758049
70	9	Storing new parsed result for 'cncf reports': {"report-title"=>"PromCon Online Europe 2021", "report-url"=>"https://www.cncf.io/reports/promcon-online-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.768248	2023-03-24 03:19:54.768248
71	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Magma Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/magma-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.778975	2023-03-24 03:19:54.778975
72	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes on Edge Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.792626	2023-03-24 03:19:54.792626
73	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes AI Day Europe 2021", "report-url"=>"https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.801461	2023-03-24 03:19:54.801461
74	9	Storing new parsed result for 'cncf reports': {"report-title"=>"FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021", "report-url"=>"https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/"}	3	\N	\N	2023-03-24 03:19:54.808551	2023-03-24 03:19:54.808551
75	9	Storing new parsed result for 'cncf reports': {"report-title"=>"etcd Project Journey Report", "report-url"=>"https://www.cncf.io/reports/etcd-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.824879	2023-03-24 03:19:54.824879
76	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2020", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2020/"}	3	\N	\N	2023-03-24 03:19:54.834841	2023-03-24 03:19:54.834841
77	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2020", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/"}	3	\N	\N	2023-03-24 03:19:54.843399	2023-03-24 03:19:54.843399
78	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon Europe 2020", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/"}	3	\N	\N	2023-03-24 03:19:54.852999	2023-03-24 03:19:54.852999
79	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Survey 2020", "report-url"=>"https://www.cncf.io/reports/cloud-native-survey-2020/"}	3	\N	\N	2023-03-24 03:19:54.859897	2023-03-24 03:19:54.859897
80	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Community Annual Report 2020", "report-url"=>"https://www.cncf.io/reports/kubernetes-community-annual-report-2020/"}	3	\N	\N	2023-03-24 03:19:54.869023	2023-03-24 03:19:54.869023
81	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Vitess Project Journey Report", "report-url"=>"https://www.cncf.io/reports/vitess-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.878313	2023-03-24 03:19:54.878313
82	9	Storing new parsed result for 'cncf reports': {"report-title"=>"EnvoyCon 2020", "report-url"=>"https://www.cncf.io/reports/envoycon-2020/"}	3	\N	\N	2023-03-24 03:19:54.891403	2023-03-24 03:19:54.891403
83	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Helm Workshop 2020", "report-url"=>"https://www.cncf.io/reports/helm-workshop-2020/"}	3	\N	\N	2023-03-24 03:19:54.898873	2023-03-24 03:19:54.898873
84	9	Storing new parsed result for 'cncf reports': {"report-title"=>"gRPC Conf 2020", "report-url"=>"https://www.cncf.io/reports/grpc-conf-2020/"}	3	\N	\N	2023-03-24 03:19:54.906514	2023-03-24 03:19:54.906514
85	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Jaeger Project Journey Report", "report-url"=>"https://www.cncf.io/reports/jaeger-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.912904	2023-03-24 03:19:54.912904
86	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Helm Project Journey Report", "report-url"=>"https://www.cncf.io/reports/helm-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.919691	2023-03-24 03:19:54.919691
87	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Fluentd Project Journey Report", "report-url"=>"https://www.cncf.io/reports/fluentd-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.927837	2023-03-24 03:19:54.927837
88	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Forum Bengaluru 2020", "report-url"=>"https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/"}	3	\N	\N	2023-03-24 03:19:54.937972	2023-03-24 03:19:54.937972
89	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Forum Delhi 2020", "report-url"=>"https://www.cncf.io/reports/kubernetes-forum-delhi-2020/"}	3	\N	\N	2023-03-24 03:19:54.9441	2023-03-24 03:19:54.9441
90	9	Storing new parsed result for 'cncf reports': {"report-title"=>"containerd Project Journey Report", "report-url"=>"https://www.cncf.io/reports/containerd-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:54.950781	2023-03-24 03:19:54.950781
91	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2019", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2019/"}	3	\N	\N	2023-03-24 03:19:54.957672	2023-03-24 03:19:54.957672
92	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2019", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/"}	3	\N	\N	2023-03-24 03:19:54.964948	2023-03-24 03:19:54.964948
93	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/"}	3	\N	\N	2023-03-24 03:19:54.971165	2023-03-24 03:19:54.971165
94	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon Europe 2019", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/"}	3	\N	\N	2023-03-24 03:19:54.977203	2023-03-24 03:19:54.977203
95	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Forum Sydney 2019", "report-url"=>"https://www.cncf.io/reports/kubernetes-forum-sydney-2019/"}	3	\N	\N	2023-03-24 03:19:54.983632	2023-03-24 03:19:54.983632
96	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Forum Seoul 2019", "report-url"=>"https://www.cncf.io/reports/kubernetes-forum-seoul-2019/"}	3	\N	\N	2023-03-24 03:19:54.991279	2023-03-24 03:19:54.991279
97	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Cloud Native Survey 2019", "report-url"=>"https://www.cncf.io/reports/cloud-native-survey-2019/"}	3	\N	\N	2023-03-24 03:19:55.001028	2023-03-24 03:19:55.001028
98	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Prometheus Project Journey Report", "report-url"=>"https://www.cncf.io/reports/prometheus-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:55.008408	2023-03-24 03:19:55.008408
99	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Envoy Project Journey Report", "report-url"=>"https://www.cncf.io/reports/envoy-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:55.015069	2023-03-24 03:19:55.015069
100	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Project Journey Report", "report-url"=>"https://www.cncf.io/reports/kubernetes-project-journey-report/"}	3	\N	\N	2023-03-24 03:19:55.021241	2023-03-24 03:19:55.021241
101	9	Storing new parsed result for 'cncf reports': {"report-title"=>"Kubernetes Day Bengaluru 2019", "report-url"=>"https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/"}	3	\N	\N	2023-03-24 03:19:55.027403	2023-03-24 03:19:55.027403
102	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2018", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2018/"}	3	\N	\N	2023-03-24 03:19:55.033016	2023-03-24 03:19:55.033016
103	9	Storing new parsed result for 'cncf reports': {"report-title"=>"KubeCon + CloudNativeCon North America 2018", "report-url"=>"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/"}	3	\N	\N	2023-03-24 03:19:55.04406	2023-03-24 03:19:55.04406
104	9	Storing new parsed result for 'cncf reports': {"report-title"=>"CNCF Annual Report 2017", "report-url"=>"https://www.cncf.io/reports/cncf-annual-report-2017/"}	3	\N	\N	2023-03-24 03:19:55.050447	2023-03-24 03:19:55.050447
105	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:20:05.363047	2023-03-24 03:20:05.363047
106	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:25:05.790057	2023-03-24 03:25:05.790057
107	9	Fetching https://www.cncf.io/reports/	3	\N	\N	2023-03-24 03:25:55.824595	2023-03-24 03:25:55.824595
108	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:25:55.852645	2023-03-24 03:25:55.852645
109	9	Values extracted: ["Edge Native Applications Principles Whitepaper", "CloudNativeSecurityCon North America 2023", "CTO Summit NA 2022", "Security Slam North America 2022", "KubeDay Japan 2022", "CNCF Annual Survey 2022", "CNCF Annual Report 2022", "CNCF Annual Report 2022 – Japanese translation", "KubeCon + CloudNativeCon North America 2022", "KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports", "ArgoCon 2022", "Argo Project Journey Report", "CTO Summit EU 2022", "OTel Community Day North America", "Cloud Native Telco Day Europe", "ServiceMeshCon Europe", "Cloud Native eBPF Day Europe", "FluentCon Europe", "GitOpsCon Europe", "KnativeCon Europe", "Kubernetes AI Day Europe", "Kubernetes BATCH + HPC Day Europe", "Kubernetes on EDGE DAY Europe", "PrometheusDay Europe", "Cloud Native WASM Day Europe", "Cloud Native SecurityCon Europe", "KubeCon + CloudNativeCon Europe 2022", "Cloud Native Security Whitepaper", "Kubernetes Annual Report 2021", "2021年中国 KubeCon + CloudNativeCon + Open Source Summit", "KubeCon + CloudNativeCon + Open Source Summit China 2021", "CNCF Annual Survey 2021", "CNCF Annual Report 2021", "KubeCon + CloudNativeCon North America 2021", "KubeCon + CloudNativeCon Europe 2021", "Spotify End User Journey Report", "PromCon North America 2021", "Cloud Native Wasm Day North America 2021", "ServiceMeshCon North America 2021", "FluentCon North America 2021", "Cloud Native Security Conference North America 2021", "Cloud Native DevX Day North America 2021", "Cloud Native eBPF Day North America 2021", "Kubernetes AI Day North America", "EnvoyCon North America 2021", "SupplyChainSecurityCon North America 2021", "Production Identity Day: SPIFFE + SPIRE North America 2021", "GitOpsCon North America 2021", "Crossplane Community Day Europe 2021", "Cloud Native Wasm Day Europe 2021", "Cloud Native Security Day Europe 2021", "ServiceMeshCon Europe 2021", "PromCon Online Europe 2021", "Magma Day Europe 2021", "Kubernetes on Edge Day Europe 2021", "Kubernetes AI Day Europe 2021", "FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021", "etcd Project Journey Report", "CNCF Annual Report 2020", "KubeCon + CloudNativeCon North America 2020", "KubeCon + CloudNativeCon Europe 2020", "Cloud Native Survey 2020", "Kubernetes Community Annual Report 2020", "Vitess Project Journey Report", "EnvoyCon 2020", "Helm Workshop 2020", "gRPC Conf 2020", "Jaeger Project Journey Report", "Helm Project Journey Report", "Fluentd Project Journey Report", "Kubernetes Forum Bengaluru 2020", "Kubernetes Forum Delhi 2020", "containerd Project Journey Report", "CNCF Annual Report 2019", "KubeCon + CloudNativeCon North America 2019", "KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019", "KubeCon + CloudNativeCon Europe 2019", "Kubernetes Forum Sydney 2019", "Kubernetes Forum Seoul 2019", "Cloud Native Survey 2019", "Prometheus Project Journey Report", "Envoy Project Journey Report", "Kubernetes Project Journey Report", "Kubernetes Day Bengaluru 2019", "CNCF Annual Report 2018", "KubeCon + CloudNativeCon North America 2018", "CNCF Annual Report 2017"]	3	\N	\N	2023-03-24 03:25:55.856736	2023-03-24 03:25:55.856736
110	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:25:55.859381	2023-03-24 03:25:55.859381
111	9	Values extracted: ["https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/", "https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/", "https://www.cncf.io/reports/cto-summit-na-2022/", "https://www.cncf.io/reports/security-slam-north-america-2022/", "https://www.cncf.io/reports/kubeday-japan-2022/", "https://www.cncf.io/reports/cncf-annual-survey-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022-jp/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/", "https://www.cncf.io/reports/argocon-2022/", "https://www.cncf.io/reports/argo-project-journey-report/", "https://www.cncf.io/reports/cto-summit-eu-2022/", "https://www.cncf.io/reports/otel-community-day-north-america/", "https://www.cncf.io/reports/cloud-native-telco-day-europe/", "https://www.cncf.io/reports/servicemeshcon-europe/", "https://www.cncf.io/reports/cloud-native-ebpf-day-europe/", "https://www.cncf.io/reports/fluentcon-europe/", "https://www.cncf.io/reports/gitopscon-europe/", "https://www.cncf.io/reports/knativecon-europe/", "https://www.cncf.io/reports/kubernetes-ai-day-europe/", "https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe/", "https://www.cncf.io/reports/prometheusday-europe/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe/", "https://www.cncf.io/reports/cloud-native-securitycon-europe/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/", "https://www.cncf.io/reports/cloud-native-security-whitepaper/", "https://www.cncf.io/reports/kubernetes-annual-report-2021/", "https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/", "https://www.cncf.io/reports/cncf-annual-survey-2021/", "https://www.cncf.io/reports/cncf-annual-report-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/", "https://www.cncf.io/reports/spotify-end-user-journey-report/", "https://www.cncf.io/reports/promcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/", "https://www.cncf.io/reports/servicemeshcon-north-america-2021/", "https://www.cncf.io/reports/fluentcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/", "https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/", "https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-north-america/", "https://www.cncf.io/reports/envoycon-north-america-2021/", "https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/", "https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/", "https://www.cncf.io/reports/gitopscon-north-america-2021/", "https://www.cncf.io/reports/crossplane-community-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-security-day-europe-2021/", "https://www.cncf.io/reports/servicemeshcon-europe-2021/", "https://www.cncf.io/reports/promcon-online-europe-2021/", "https://www.cncf.io/reports/magma-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/", "https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/", "https://www.cncf.io/reports/etcd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/", "https://www.cncf.io/reports/cloud-native-survey-2020/", "https://www.cncf.io/reports/kubernetes-community-annual-report-2020/", "https://www.cncf.io/reports/vitess-project-journey-report/", "https://www.cncf.io/reports/envoycon-2020/", "https://www.cncf.io/reports/helm-workshop-2020/", "https://www.cncf.io/reports/grpc-conf-2020/", "https://www.cncf.io/reports/jaeger-project-journey-report/", "https://www.cncf.io/reports/helm-project-journey-report/", "https://www.cncf.io/reports/fluentd-project-journey-report/", "https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/", "https://www.cncf.io/reports/kubernetes-forum-delhi-2020/", "https://www.cncf.io/reports/containerd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/", "https://www.cncf.io/reports/kubernetes-forum-sydney-2019/", "https://www.cncf.io/reports/kubernetes-forum-seoul-2019/", "https://www.cncf.io/reports/cloud-native-survey-2019/", "https://www.cncf.io/reports/prometheus-project-journey-report/", "https://www.cncf.io/reports/envoy-project-journey-report/", "https://www.cncf.io/reports/kubernetes-project-journey-report/", "https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/", "https://www.cncf.io/reports/cncf-annual-report-2018/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/", "https://www.cncf.io/reports/cncf-annual-report-2017/"]	3	\N	\N	2023-03-24 03:25:55.863196	2023-03-24 03:25:55.863196
112	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:30:06.408893	2023-03-24 03:30:06.408893
113	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:35:06.796405	2023-03-24 03:35:06.796405
114	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:40:07.217478	2023-03-24 03:40:07.217478
115	9	Fetching https://www.cncf.io/reports/	3	\N	\N	2023-03-24 03:41:47.261325	2023-03-24 03:41:47.261325
116	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:41:48.84754	2023-03-24 03:41:48.84754
117	9	Values extracted: ["Edge Native Applications Principles Whitepaper", "CloudNativeSecurityCon North America 2023", "CTO Summit NA 2022", "Security Slam North America 2022", "KubeDay Japan 2022", "CNCF Annual Survey 2022", "CNCF Annual Report 2022", "CNCF Annual Report 2022 – Japanese translation", "KubeCon + CloudNativeCon North America 2022", "KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports", "ArgoCon 2022", "Argo Project Journey Report", "CTO Summit EU 2022", "OTel Community Day North America", "Cloud Native Telco Day Europe", "ServiceMeshCon Europe", "Cloud Native eBPF Day Europe", "FluentCon Europe", "GitOpsCon Europe", "KnativeCon Europe", "Kubernetes AI Day Europe", "Kubernetes BATCH + HPC Day Europe", "Kubernetes on EDGE DAY Europe", "PrometheusDay Europe", "Cloud Native WASM Day Europe", "Cloud Native SecurityCon Europe", "KubeCon + CloudNativeCon Europe 2022", "Cloud Native Security Whitepaper", "Kubernetes Annual Report 2021", "2021年中国 KubeCon + CloudNativeCon + Open Source Summit", "KubeCon + CloudNativeCon + Open Source Summit China 2021", "CNCF Annual Survey 2021", "CNCF Annual Report 2021", "KubeCon + CloudNativeCon North America 2021", "KubeCon + CloudNativeCon Europe 2021", "Spotify End User Journey Report", "PromCon North America 2021", "Cloud Native Wasm Day North America 2021", "ServiceMeshCon North America 2021", "FluentCon North America 2021", "Cloud Native Security Conference North America 2021", "Cloud Native DevX Day North America 2021", "Cloud Native eBPF Day North America 2021", "Kubernetes AI Day North America", "EnvoyCon North America 2021", "SupplyChainSecurityCon North America 2021", "Production Identity Day: SPIFFE + SPIRE North America 2021", "GitOpsCon North America 2021", "Crossplane Community Day Europe 2021", "Cloud Native Wasm Day Europe 2021", "Cloud Native Security Day Europe 2021", "ServiceMeshCon Europe 2021", "PromCon Online Europe 2021", "Magma Day Europe 2021", "Kubernetes on Edge Day Europe 2021", "Kubernetes AI Day Europe 2021", "FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021", "etcd Project Journey Report", "CNCF Annual Report 2020", "KubeCon + CloudNativeCon North America 2020", "KubeCon + CloudNativeCon Europe 2020", "Cloud Native Survey 2020", "Kubernetes Community Annual Report 2020", "Vitess Project Journey Report", "EnvoyCon 2020", "Helm Workshop 2020", "gRPC Conf 2020", "Jaeger Project Journey Report", "Helm Project Journey Report", "Fluentd Project Journey Report", "Kubernetes Forum Bengaluru 2020", "Kubernetes Forum Delhi 2020", "containerd Project Journey Report", "CNCF Annual Report 2019", "KubeCon + CloudNativeCon North America 2019", "KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019", "KubeCon + CloudNativeCon Europe 2019", "Kubernetes Forum Sydney 2019", "Kubernetes Forum Seoul 2019", "Cloud Native Survey 2019", "Prometheus Project Journey Report", "Envoy Project Journey Report", "Kubernetes Project Journey Report", "Kubernetes Day Bengaluru 2019", "CNCF Annual Report 2018", "KubeCon + CloudNativeCon North America 2018", "CNCF Annual Report 2017"]	3	\N	\N	2023-03-24 03:41:48.853385	2023-03-24 03:41:48.853385
118	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:41:48.859983	2023-03-24 03:41:48.859983
119	9	Values extracted: ["https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/", "https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/", "https://www.cncf.io/reports/cto-summit-na-2022/", "https://www.cncf.io/reports/security-slam-north-america-2022/", "https://www.cncf.io/reports/kubeday-japan-2022/", "https://www.cncf.io/reports/cncf-annual-survey-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022-jp/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/", "https://www.cncf.io/reports/argocon-2022/", "https://www.cncf.io/reports/argo-project-journey-report/", "https://www.cncf.io/reports/cto-summit-eu-2022/", "https://www.cncf.io/reports/otel-community-day-north-america/", "https://www.cncf.io/reports/cloud-native-telco-day-europe/", "https://www.cncf.io/reports/servicemeshcon-europe/", "https://www.cncf.io/reports/cloud-native-ebpf-day-europe/", "https://www.cncf.io/reports/fluentcon-europe/", "https://www.cncf.io/reports/gitopscon-europe/", "https://www.cncf.io/reports/knativecon-europe/", "https://www.cncf.io/reports/kubernetes-ai-day-europe/", "https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe/", "https://www.cncf.io/reports/prometheusday-europe/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe/", "https://www.cncf.io/reports/cloud-native-securitycon-europe/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/", "https://www.cncf.io/reports/cloud-native-security-whitepaper/", "https://www.cncf.io/reports/kubernetes-annual-report-2021/", "https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/", "https://www.cncf.io/reports/cncf-annual-survey-2021/", "https://www.cncf.io/reports/cncf-annual-report-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/", "https://www.cncf.io/reports/spotify-end-user-journey-report/", "https://www.cncf.io/reports/promcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/", "https://www.cncf.io/reports/servicemeshcon-north-america-2021/", "https://www.cncf.io/reports/fluentcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/", "https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/", "https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-north-america/", "https://www.cncf.io/reports/envoycon-north-america-2021/", "https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/", "https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/", "https://www.cncf.io/reports/gitopscon-north-america-2021/", "https://www.cncf.io/reports/crossplane-community-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-security-day-europe-2021/", "https://www.cncf.io/reports/servicemeshcon-europe-2021/", "https://www.cncf.io/reports/promcon-online-europe-2021/", "https://www.cncf.io/reports/magma-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/", "https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/", "https://www.cncf.io/reports/etcd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/", "https://www.cncf.io/reports/cloud-native-survey-2020/", "https://www.cncf.io/reports/kubernetes-community-annual-report-2020/", "https://www.cncf.io/reports/vitess-project-journey-report/", "https://www.cncf.io/reports/envoycon-2020/", "https://www.cncf.io/reports/helm-workshop-2020/", "https://www.cncf.io/reports/grpc-conf-2020/", "https://www.cncf.io/reports/jaeger-project-journey-report/", "https://www.cncf.io/reports/helm-project-journey-report/", "https://www.cncf.io/reports/fluentd-project-journey-report/", "https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/", "https://www.cncf.io/reports/kubernetes-forum-delhi-2020/", "https://www.cncf.io/reports/containerd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/", "https://www.cncf.io/reports/kubernetes-forum-sydney-2019/", "https://www.cncf.io/reports/kubernetes-forum-seoul-2019/", "https://www.cncf.io/reports/cloud-native-survey-2019/", "https://www.cncf.io/reports/prometheus-project-journey-report/", "https://www.cncf.io/reports/envoy-project-journey-report/", "https://www.cncf.io/reports/kubernetes-project-journey-report/", "https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/", "https://www.cncf.io/reports/cncf-annual-report-2018/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/", "https://www.cncf.io/reports/cncf-annual-report-2017/"]	3	\N	\N	2023-03-24 03:41:48.865932	2023-03-24 03:41:48.865932
120	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:45:09.361947	2023-03-24 03:45:09.361947
121	9	Fetching https://www.cncf.io/reports/	3	\N	\N	2023-03-24 03:45:19.38337	2023-03-24 03:45:19.38337
122	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:45:19.412445	2023-03-24 03:45:19.412445
123	9	Values extracted: ["Edge Native Applications Principles Whitepaper", "CloudNativeSecurityCon North America 2023", "CTO Summit NA 2022", "Security Slam North America 2022", "KubeDay Japan 2022", "CNCF Annual Survey 2022", "CNCF Annual Report 2022", "CNCF Annual Report 2022 – Japanese translation", "KubeCon + CloudNativeCon North America 2022", "KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports", "ArgoCon 2022", "Argo Project Journey Report", "CTO Summit EU 2022", "OTel Community Day North America", "Cloud Native Telco Day Europe", "ServiceMeshCon Europe", "Cloud Native eBPF Day Europe", "FluentCon Europe", "GitOpsCon Europe", "KnativeCon Europe", "Kubernetes AI Day Europe", "Kubernetes BATCH + HPC Day Europe", "Kubernetes on EDGE DAY Europe", "PrometheusDay Europe", "Cloud Native WASM Day Europe", "Cloud Native SecurityCon Europe", "KubeCon + CloudNativeCon Europe 2022", "Cloud Native Security Whitepaper", "Kubernetes Annual Report 2021", "2021年中国 KubeCon + CloudNativeCon + Open Source Summit", "KubeCon + CloudNativeCon + Open Source Summit China 2021", "CNCF Annual Survey 2021", "CNCF Annual Report 2021", "KubeCon + CloudNativeCon North America 2021", "KubeCon + CloudNativeCon Europe 2021", "Spotify End User Journey Report", "PromCon North America 2021", "Cloud Native Wasm Day North America 2021", "ServiceMeshCon North America 2021", "FluentCon North America 2021", "Cloud Native Security Conference North America 2021", "Cloud Native DevX Day North America 2021", "Cloud Native eBPF Day North America 2021", "Kubernetes AI Day North America", "EnvoyCon North America 2021", "SupplyChainSecurityCon North America 2021", "Production Identity Day: SPIFFE + SPIRE North America 2021", "GitOpsCon North America 2021", "Crossplane Community Day Europe 2021", "Cloud Native Wasm Day Europe 2021", "Cloud Native Security Day Europe 2021", "ServiceMeshCon Europe 2021", "PromCon Online Europe 2021", "Magma Day Europe 2021", "Kubernetes on Edge Day Europe 2021", "Kubernetes AI Day Europe 2021", "FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021", "etcd Project Journey Report", "CNCF Annual Report 2020", "KubeCon + CloudNativeCon North America 2020", "KubeCon + CloudNativeCon Europe 2020", "Cloud Native Survey 2020", "Kubernetes Community Annual Report 2020", "Vitess Project Journey Report", "EnvoyCon 2020", "Helm Workshop 2020", "gRPC Conf 2020", "Jaeger Project Journey Report", "Helm Project Journey Report", "Fluentd Project Journey Report", "Kubernetes Forum Bengaluru 2020", "Kubernetes Forum Delhi 2020", "containerd Project Journey Report", "CNCF Annual Report 2019", "KubeCon + CloudNativeCon North America 2019", "KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019", "KubeCon + CloudNativeCon Europe 2019", "Kubernetes Forum Sydney 2019", "Kubernetes Forum Seoul 2019", "Cloud Native Survey 2019", "Prometheus Project Journey Report", "Envoy Project Journey Report", "Kubernetes Project Journey Report", "Kubernetes Day Bengaluru 2019", "CNCF Annual Report 2018", "KubeCon + CloudNativeCon North America 2018", "CNCF Annual Report 2017"]	3	\N	\N	2023-03-24 03:45:19.416371	2023-03-24 03:45:19.416371
124	9	Extracting html at /html/body/main/article/div/div/div/a	3	\N	\N	2023-03-24 03:45:19.421308	2023-03-24 03:45:19.421308
125	9	Values extracted: ["https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/", "https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/", "https://www.cncf.io/reports/cto-summit-na-2022/", "https://www.cncf.io/reports/security-slam-north-america-2022/", "https://www.cncf.io/reports/kubeday-japan-2022/", "https://www.cncf.io/reports/cncf-annual-survey-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022/", "https://www.cncf.io/reports/cncf-annual-report-2022-jp/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/", "https://www.cncf.io/reports/argocon-2022/", "https://www.cncf.io/reports/argo-project-journey-report/", "https://www.cncf.io/reports/cto-summit-eu-2022/", "https://www.cncf.io/reports/otel-community-day-north-america/", "https://www.cncf.io/reports/cloud-native-telco-day-europe/", "https://www.cncf.io/reports/servicemeshcon-europe/", "https://www.cncf.io/reports/cloud-native-ebpf-day-europe/", "https://www.cncf.io/reports/fluentcon-europe/", "https://www.cncf.io/reports/gitopscon-europe/", "https://www.cncf.io/reports/knativecon-europe/", "https://www.cncf.io/reports/kubernetes-ai-day-europe/", "https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe/", "https://www.cncf.io/reports/prometheusday-europe/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe/", "https://www.cncf.io/reports/cloud-native-securitycon-europe/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/", "https://www.cncf.io/reports/cloud-native-security-whitepaper/", "https://www.cncf.io/reports/kubernetes-annual-report-2021/", "https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/", "https://www.cncf.io/reports/cncf-annual-survey-2021/", "https://www.cncf.io/reports/cncf-annual-report-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/", "https://www.cncf.io/reports/spotify-end-user-journey-report/", "https://www.cncf.io/reports/promcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/", "https://www.cncf.io/reports/servicemeshcon-north-america-2021/", "https://www.cncf.io/reports/fluentcon-north-america-2021/", "https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/", "https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/", "https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-north-america/", "https://www.cncf.io/reports/envoycon-north-america-2021/", "https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/", "https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/", "https://www.cncf.io/reports/gitopscon-north-america-2021/", "https://www.cncf.io/reports/crossplane-community-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/", "https://www.cncf.io/reports/cloud-native-security-day-europe-2021/", "https://www.cncf.io/reports/servicemeshcon-europe-2021/", "https://www.cncf.io/reports/promcon-online-europe-2021/", "https://www.cncf.io/reports/magma-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/", "https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/", "https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/", "https://www.cncf.io/reports/etcd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/", "https://www.cncf.io/reports/cloud-native-survey-2020/", "https://www.cncf.io/reports/kubernetes-community-annual-report-2020/", "https://www.cncf.io/reports/vitess-project-journey-report/", "https://www.cncf.io/reports/envoycon-2020/", "https://www.cncf.io/reports/helm-workshop-2020/", "https://www.cncf.io/reports/grpc-conf-2020/", "https://www.cncf.io/reports/jaeger-project-journey-report/", "https://www.cncf.io/reports/helm-project-journey-report/", "https://www.cncf.io/reports/fluentd-project-journey-report/", "https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/", "https://www.cncf.io/reports/kubernetes-forum-delhi-2020/", "https://www.cncf.io/reports/containerd-project-journey-report/", "https://www.cncf.io/reports/cncf-annual-report-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/", "https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/", "https://www.cncf.io/reports/kubernetes-forum-sydney-2019/", "https://www.cncf.io/reports/kubernetes-forum-seoul-2019/", "https://www.cncf.io/reports/cloud-native-survey-2019/", "https://www.cncf.io/reports/prometheus-project-journey-report/", "https://www.cncf.io/reports/envoy-project-journey-report/", "https://www.cncf.io/reports/kubernetes-project-journey-report/", "https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/", "https://www.cncf.io/reports/cncf-annual-report-2018/", "https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/", "https://www.cncf.io/reports/cncf-annual-report-2017/"]	3	\N	\N	2023-03-24 03:45:19.4259	2023-03-24 03:45:19.4259
126	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:50:04.513745	2023-03-24 03:50:04.513745
127	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 03:55:04.953882	2023-03-24 03:55:04.953882
128	8	Fetched https://github.com/huginn/huginn/commits/master.atom and created 0 event(s).	3	\N	\N	2023-03-24 04:00:05.551491	2023-03-24 04:00:05.551491
\.


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.agents (id, user_id, options, type, name, schedule, events_count, last_check_at, last_receive_at, last_checked_event_id, created_at, updated_at, memory, last_web_request_at, keep_events_for, last_event_at, last_error_log_at, propagate_immediately, disabled, service_id, guid, deactivated) FROM stdin;
1	1	{"expected_receive_period_in_days":"2","rules":[{"type":"regex","value":"rain|storm","path":"conditions"}],"message":"Just so you know, it looks like '{{conditions}}' tomorrow in {{location}}"}	Agents::TriggerAgent	Rain Notifier	\N	0	\N	\N	\N	2023-03-23 03:05:17.305392	2023-03-23 03:05:17.305392	\N	\N	0	\N	\N	f	f	\N	361ee2e955d4726b52c8b044d4f75e25	f
2	1	{"url":"https://xkcd.com","mode":"on_change","expected_update_period_in_days":5,"extract":{"url":{"css":"#comic img","value":"@src"},"title":{"css":"#comic img","value":"@alt"},"hovertext":{"css":"#comic img","value":"@title"}}}	Agents::WebsiteAgent	XKCD Source	every_1d	0	\N	\N	\N	2023-03-23 03:05:17.31893	2023-03-23 03:05:17.31893	\N	\N	0	\N	\N	f	f	\N	505c9bba65507c40e5786afff36f688c	f
4	1	{"subject":"Your Morning Digest","expected_receive_period_in_days":"30"}	Agents::EmailDigestAgent	Morning Digest	6am	0	\N	\N	\N	2023-03-23 03:05:17.334307	2023-03-23 03:05:17.334307	\N	\N	0	\N	\N	f	f	\N	b34eaee75d8dc67843c3bd257c213852	f
5	1	{"location":"42.3601,-71.0589","api_key":"put-your-key-here"}	Agents::WeatherAgent	SF Weather Agent	10pm	0	\N	\N	\N	2023-03-23 03:05:17.341896	2023-03-23 03:05:17.341896	\N	\N	0	\N	\N	f	f	\N	bdae6dfdf9d01a123ddd513e695fd466	f
6	1	{"url":"https://trailers.apple.com/trailers/home/rss/newtrailers.rss","mode":"on_change","type":"xml","expected_update_period_in_days":5,"extract":{"title":{"css":"item title","value":"string(.)"},"url":{"css":"item link","value":"string(.)"}}}	Agents::WebsiteAgent	iTunes Trailer Source	every_1d	0	\N	\N	\N	2023-03-23 03:05:17.349917	2023-03-23 03:05:17.349917	\N	\N	0	\N	\N	f	f	\N	e9afa65457d0a736b9ec20a8dd452fc8	f
7	1	{"instructions":{"message":"<h2>{{title}}</h2><img src=\\"https:{{url}}\\"/> <p>{{hovertext}}</p>"},"matchers":[],"mode":"clean"}	Agents::EventFormattingAgent	Comic Formatter	\N	0	\N	\N	\N	2023-03-23 03:05:17.358751	2023-03-23 03:05:17.358751	\N	\N	2592000	\N	\N	f	f	\N	d86b069650edadfc61db9df767c8b65c	f
3	1	{"subject":"Your Afternoon Digest","expected_receive_period_in_days":"7"}	Agents::EmailDigestAgent	Afternoon Digest	5pm	0	2023-03-23 04:06:31.702109	\N	\N	2023-03-23 03:05:17.326693	2023-03-23 04:06:31.728056	\N	\N	0	\N	\N	f	f	\N	65e8ae4533881537de3c346b5178b75d	f
9	1	{"expected_update_period_in_days":"2","url":"https://www.cncf.io/reports/","type":"html","mode":"on_change","extract":{"report-title":{"xpath":"/html/body/main/article/div/div/div/a","value":"@title"},"report-url":{"xpath":"/html/body/main/article/div/div/div/a","value":"@href"}},"events_order":[["{{_index_}}","number","false"]],"include_sort_info":"true"}	Agents::WebsiteAgent	cncf reports	every_1d	87	2023-03-24 03:45:19.514336	\N	20	2023-03-24 03:04:38.130263	2023-03-24 03:48:33.040855	\N	\N	0	2023-03-24 03:48:33.040855	\N	f	f	\N	9d9aec7ebb9b11314ccf044d2873f7f8	f
12	1	{"secret":"a-secret-key","expected_receive_period_in_days":"2","content":"When you use the \\"Last event in\\" or \\"Merge events\\" option, you can use variables from the last event received, like this:\\r\\n\\r\\nName: {{name}}\\r\\nUrl:  {{url}}\\r\\n\\r\\nIf you use the \\"Last X Events\\" mode, a set of events will be passed to your Liquid template.  You can use them like this:\\r\\n\\r\\n<table class=\\"table\\">\\r\\n  {% for event in events reversed %}\\r\\n    <tr>\\r\\n      <td>{{ event.report-title }}</td>\\r\\n      <td><a href=\\"{{ event.report-url }}\\">Click here to see</a></td>\\r\\n    </tr>\\r\\n  {% endfor %}\\r\\n</table>\\r\\n","mime_type":"text/html","mode":"Last X events","event_limit":""}	Agents::LiquidOutputAgent	Tech Reports	\N	0	\N	2023-03-24 03:48:34.195393	281	2023-03-24 03:44:31.873068	2023-03-24 03:54:25.176642	\N	2023-03-24 03:54:25.171233	0	\N	\N	t	f	\N	e5bacbb2f6cd409b417b0de6399e6e59	f
8	1	{"expected_update_period_in_days":"5","clean":"false","url":"https://github.com/huginn/huginn/commits/master.atom"}	Agents::RssAgent	test rss	every_5m	20	2023-03-24 04:00:05.558611	\N	\N	2023-03-23 04:03:54.413362	2023-03-24 04:00:05.5821	{"seen_ids":["tag:github.com,2008:Grit::Commit/ba852f1edc26bf0e87d6a7a13389124e22d0bde0","tag:github.com,2008:Grit::Commit/26ff66318ea48c60919880b8da4ccf6d013ee128","tag:github.com,2008:Grit::Commit/19bd61574a7813c2dc1de43fcf9f1a7d85a811e3","tag:github.com,2008:Grit::Commit/c5786cdc51553b108a30813e27cb932172f4531b","tag:github.com,2008:Grit::Commit/3dd0f0ba85e2d4e8259f42bbbdece6f0a62cc5a5","tag:github.com,2008:Grit::Commit/31f8a64a28eefdc00c71b05e2c3f896bcaa2c811","tag:github.com,2008:Grit::Commit/68cf7b165f1e3d7a2ff0f28b656546e9296e59f9","tag:github.com,2008:Grit::Commit/22b7ae0662e93a9e39c02d625bc16ed1f0f04839","tag:github.com,2008:Grit::Commit/56212ee0c4b3fb575216166ab99884802c26cf76","tag:github.com,2008:Grit::Commit/c556e543f3c69486410a82406202b20536111caa","tag:github.com,2008:Grit::Commit/56338790a7f396163296b1dd0e9e8f22254b452f","tag:github.com,2008:Grit::Commit/3ddd9aece5988a56191c877a5fd5e51ee492f82f","tag:github.com,2008:Grit::Commit/260095883c4d19f7965ad6b1d021de3b904e7ec0","tag:github.com,2008:Grit::Commit/35d5ecad5915f9d6d7e90e13a3f4b0edfeb3f0d6","tag:github.com,2008:Grit::Commit/b536b94da59c1466e47de83bb296ebdac29a4e87","tag:github.com,2008:Grit::Commit/93bc59fe7081bf0dd3d35101c8173846181662f2","tag:github.com,2008:Grit::Commit/52cee481014c0f4c51ecd756a9b2e5281d9e257b","tag:github.com,2008:Grit::Commit/90b1fa1f6e3875b9b70feba7499497775c9b6cf0","tag:github.com,2008:Grit::Commit/9f461d11d6caa4555746c16cb9053a170983ba4e","tag:github.com,2008:Grit::Commit/3772a0a1fc2d5f40dd2ba997c7177869343984f1"]}	\N	0	2023-03-23 04:04:41.598222	\N	f	f	\N	0ce011efd8b3f9b00d884c3c2db386ad	f
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2023-03-23 03:05:15.141677	2023-03-23 03:05:15.141677
\.


--
-- Data for Name: control_links; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.control_links (id, controller_id, control_target_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.events (id, user_id, agent_id, lat, lng, payload, created_at, updated_at, expires_at) FROM stdin;
1	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/3772a0a1fc2d5f40dd2ba997c7177869343984f1","url":"https://github.com/huginn/huginn/commit/3772a0a1fc2d5f40dd2ba997c7177869343984f1","urls":["https://github.com/huginn/huginn/commit/3772a0a1fc2d5f40dd2ba997c7177869343984f1"],"links":[{"href":"https://github.com/huginn/huginn/commit/3772a0a1fc2d5f40dd2ba997c7177869343984f1","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3217 from huginn/rails-6.1\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3217 from huginn/rails-6.1\\n\\nUpgrade Rails to 6.1</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-02-28T16:20:56+00:00"}	2023-03-23 04:04:41.497036	2023-03-23 04:04:41.497036	\N
2	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/9f461d11d6caa4555746c16cb9053a170983ba4e","url":"https://github.com/huginn/huginn/commit/9f461d11d6caa4555746c16cb9053a170983ba4e","urls":["https://github.com/huginn/huginn/commit/9f461d11d6caa4555746c16cb9053a170983ba4e"],"links":[{"href":"https://github.com/huginn/huginn/commit/9f461d11d6caa4555746c16cb9053a170983ba4e","rel":"alternate","type":"text/html"}],"title":"\\n        Mention the upgrade to Rails 6.1\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Mention the upgrade to Rails 6.1</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-02-28T16:22:09+00:00"}	2023-03-23 04:04:41.513407	2023-03-23 04:04:41.513407	\N
3	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/90b1fa1f6e3875b9b70feba7499497775c9b6cf0","url":"https://github.com/huginn/huginn/commit/90b1fa1f6e3875b9b70feba7499497775c9b6cf0","urls":["https://github.com/huginn/huginn/commit/90b1fa1f6e3875b9b70feba7499497775c9b6cf0"],"links":[{"href":"https://github.com/huginn/huginn/commit/90b1fa1f6e3875b9b70feba7499497775c9b6cf0","rel":"alternate","type":"text/html"}],"title":"\\n        Configure the concurrency to abort any preceding GHA runs in progress\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Configure the concurrency to abort any preceding GHA runs in progress</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-11T14:23:36+00:00"}	2023-03-23 04:04:41.518308	2023-03-23 04:04:41.518308	\N
4	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/52cee481014c0f4c51ecd756a9b2e5281d9e257b","url":"https://github.com/huginn/huginn/commit/52cee481014c0f4c51ecd756a9b2e5281d9e257b","urls":["https://github.com/huginn/huginn/commit/52cee481014c0f4c51ecd756a9b2e5281d9e257b"],"links":[{"href":"https://github.com/huginn/huginn/commit/52cee481014c0f4c51ecd756a9b2e5281d9e257b","rel":"alternate","type":"text/html"}],"title":"\\n        Improve Twitter agents\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Improve Twitter agents\\n\\n- TwitterFavorites, TwitterSearchAgent, and TwitterUserAgent can now dry run.\\n- Correct event descriptions; the key should be `full_text` instead of `text` except for TwitterStreamAgent.\\n- Events now include `expanded_text` in which shortened t.co URLs are expanded to their original URLs.\\n- Refactor and reformat code.</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-11T15:20:12+00:00"}	2023-03-23 04:04:41.523446	2023-03-23 04:04:41.523446	\N
5	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/93bc59fe7081bf0dd3d35101c8173846181662f2","url":"https://github.com/huginn/huginn/commit/93bc59fe7081bf0dd3d35101c8173846181662f2","urls":["https://github.com/huginn/huginn/commit/93bc59fe7081bf0dd3d35101c8173846181662f2"],"links":[{"href":"https://github.com/huginn/huginn/commit/93bc59fe7081bf0dd3d35101c8173846181662f2","rel":"alternate","type":"text/html"}],"title":"\\n        Upgrade actions/checkout to v3\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Upgrade actions/checkout to v3</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-11T15:25:06+00:00"}	2023-03-23 04:04:41.527838	2023-03-23 04:04:41.527838	\N
6	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/b536b94da59c1466e47de83bb296ebdac29a4e87","url":"https://github.com/huginn/huginn/commit/b536b94da59c1466e47de83bb296ebdac29a4e87","urls":["https://github.com/huginn/huginn/commit/b536b94da59c1466e47de83bb296ebdac29a4e87"],"links":[{"href":"https://github.com/huginn/huginn/commit/b536b94da59c1466e47de83bb296ebdac29a4e87","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3230 from huginn/improve_twitter_agents\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3230 from huginn/improve_twitter_agents\\n\\nImprove Twitter agents</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-12T10:50:28+00:00"}	2023-03-23 04:04:41.53148	2023-03-23 04:04:41.53148	\N
7	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/35d5ecad5915f9d6d7e90e13a3f4b0edfeb3f0d6","url":"https://github.com/huginn/huginn/commit/35d5ecad5915f9d6d7e90e13a3f4b0edfeb3f0d6","urls":["https://github.com/huginn/huginn/commit/35d5ecad5915f9d6d7e90e13a3f4b0edfeb3f0d6"],"links":[{"href":"https://github.com/huginn/huginn/commit/35d5ecad5915f9d6d7e90e13a3f4b0edfeb3f0d6","rel":"alternate","type":"text/html"}],"title":"\\n        Mention #3230\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Mention #3230</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-12T10:52:32+00:00"}	2023-03-23 04:04:41.535087	2023-03-23 04:04:41.535087	\N
8	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/260095883c4d19f7965ad6b1d021de3b904e7ec0","url":"https://github.com/huginn/huginn/commit/260095883c4d19f7965ad6b1d021de3b904e7ec0","urls":["https://github.com/huginn/huginn/commit/260095883c4d19f7965ad6b1d021de3b904e7ec0"],"links":[{"href":"https://github.com/huginn/huginn/commit/260095883c4d19f7965ad6b1d021de3b904e7ec0","rel":"alternate","type":"text/html"}],"title":"\\n        Improve the performance of diagram generation\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Improve the performance of diagram generation</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-13T16:30:21+00:00"}	2023-03-23 04:04:41.538225	2023-03-23 04:04:41.538225	\N
195	1	9	\N	\N	{"report-title":"Edge Native Applications Principles Whitepaper","report-url":"https://www.cncf.io/reports/edge-native-applications-principles-whitepaper/"}	2023-03-24 03:48:32.002704	2023-03-24 03:48:32.002704	\N
196	1	9	\N	\N	{"report-title":"CloudNativeSecurityCon North America 2023","report-url":"https://www.cncf.io/reports/cloudnativesecuritycon-north-america-2023-transparency-report/"}	2023-03-24 03:48:32.017545	2023-03-24 03:48:32.017545	\N
197	1	9	\N	\N	{"report-title":"CTO Summit NA 2022","report-url":"https://www.cncf.io/reports/cto-summit-na-2022/"}	2023-03-24 03:48:32.029143	2023-03-24 03:48:32.029143	\N
9	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/3ddd9aece5988a56191c877a5fd5e51ee492f82f","url":"https://github.com/huginn/huginn/commit/3ddd9aece5988a56191c877a5fd5e51ee492f82f","urls":["https://github.com/huginn/huginn/commit/3ddd9aece5988a56191c877a5fd5e51ee492f82f"],"links":[{"href":"https://github.com/huginn/huginn/commit/3ddd9aece5988a56191c877a5fd5e51ee492f82f","rel":"alternate","type":"text/html"}],"title":"\\n        Use pluralize to get a third person singular present form of control_…\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Use pluralize to get a third person singular present form of control_action</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-13T16:37:59+00:00"}	2023-03-23 04:04:41.541935	2023-03-23 04:04:41.541935	\N
10	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/56338790a7f396163296b1dd0e9e8f22254b452f","url":"https://github.com/huginn/huginn/commit/56338790a7f396163296b1dd0e9e8f22254b452f","urls":["https://github.com/huginn/huginn/commit/56338790a7f396163296b1dd0e9e8f22254b452f"],"links":[{"href":"https://github.com/huginn/huginn/commit/56338790a7f396163296b1dd0e9e8f22254b452f","rel":"alternate","type":"text/html"}],"title":"\\n        Update rack to 2.2.6.4\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Update rack to 2.2.6.4</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-14T08:57:21+00:00"}	2023-03-23 04:04:41.546694	2023-03-23 04:04:41.546694	\N
11	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/c556e543f3c69486410a82406202b20536111caa","url":"https://github.com/huginn/huginn/commit/c556e543f3c69486410a82406202b20536111caa","urls":["https://github.com/huginn/huginn/commit/c556e543f3c69486410a82406202b20536111caa"],"links":[{"href":"https://github.com/huginn/huginn/commit/c556e543f3c69486410a82406202b20536111caa","rel":"alternate","type":"text/html"}],"title":"\\n        Push docker images to docker hub and ghcr\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Push docker images to docker hub and ghcr\\n\\nAs discussed in #3234 we want to make the transition from hosting the\\ndocker images on docker hub to GitHub container registry. This change\\nwill push the images to both registries, after we have verified\\neverything works as expected we can embed a warning in images pushed to\\ndocker hub which tells the users to switch.\\n\\n[This is the github action run][1] on my fork that successfully created\\nthe [images][2].\\n\\nI didn&#39;t bother with integrating the two registries into a build matrix\\nbecause it is probably easier to just remove the docker hub jobs once we\\nare done with the transition.\\n\\n[1]: https://github.com/dsander/huginn/actions/runs/4451875730\\n[2]: https://github.com/dsander?tab=packages&amp;repo_name=huginn</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-17T22:15:34+00:00"}	2023-03-23 04:04:41.551571	2023-03-23 04:04:41.551571	\N
12	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/56212ee0c4b3fb575216166ab99884802c26cf76","url":"https://github.com/huginn/huginn/commit/56212ee0c4b3fb575216166ab99884802c26cf76","urls":["https://github.com/huginn/huginn/commit/56212ee0c4b3fb575216166ab99884802c26cf76"],"links":[{"href":"https://github.com/huginn/huginn/commit/56212ee0c4b3fb575216166ab99884802c26cf76","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3235 from dsander/push-docker-images-to-ghcr\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3235 from dsander/push-docker-images-to-ghcr\\n\\nPush docker images to docker hub and ghcr</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-18T01:55:16+00:00"}	2023-03-23 04:04:41.556196	2023-03-23 04:04:41.556196	\N
13	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/22b7ae0662e93a9e39c02d625bc16ed1f0f04839","url":"https://github.com/huginn/huginn/commit/22b7ae0662e93a9e39c02d625bc16ed1f0f04839","urls":["https://github.com/huginn/huginn/commit/22b7ae0662e93a9e39c02d625bc16ed1f0f04839"],"links":[{"href":"https://github.com/huginn/huginn/commit/22b7ae0662e93a9e39c02d625bc16ed1f0f04839","rel":"alternate","type":"text/html"}],"title":"\\n        Do not use a registry when logging into docker hub\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Do not use a registry when logging into docker hub\\n\\nThis hopefully fixes the login not working: https://github.com/huginn/huginn/actions/runs/4453064456/jobs/7825584077#step:3:6311</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-18T19:12:43+00:00"}	2023-03-23 04:04:41.560923	2023-03-23 04:04:41.560923	\N
14	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/68cf7b165f1e3d7a2ff0f28b656546e9296e59f9","url":"https://github.com/huginn/huginn/commit/68cf7b165f1e3d7a2ff0f28b656546e9296e59f9","urls":["https://github.com/huginn/huginn/commit/68cf7b165f1e3d7a2ff0f28b656546e9296e59f9"],"links":[{"href":"https://github.com/huginn/huginn/commit/68cf7b165f1e3d7a2ff0f28b656546e9296e59f9","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3236 from dsander/fix-docker-hub-pushes\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3236 from dsander/fix-docker-hub-pushes\\n\\nDo not use a registry when logging into docker hub</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-18T19:33:38+00:00"}	2023-03-23 04:04:41.565269	2023-03-23 04:04:41.565269	\N
15	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/31f8a64a28eefdc00c71b05e2c3f896bcaa2c811","url":"https://github.com/huginn/huginn/commit/31f8a64a28eefdc00c71b05e2c3f896bcaa2c811","urls":["https://github.com/huginn/huginn/commit/31f8a64a28eefdc00c71b05e2c3f896bcaa2c811"],"links":[{"href":"https://github.com/huginn/huginn/commit/31f8a64a28eefdc00c71b05e2c3f896bcaa2c811","rel":"alternate","type":"text/html"}],"title":"\\n        Show a warning when the docker image was pulled from docker hub\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Show a warning when the docker image was pulled from docker hub\\n\\nBecause Docker hub will soon kick us we have to tell our users to switch\\nto the ghcr.io registry.\\n\\n #3234</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-18T20:00:09+00:00"}	2023-03-23 04:04:41.569332	2023-03-23 04:04:41.569332	\N
198	1	9	\N	\N	{"report-title":"Security Slam North America 2022","report-url":"https://www.cncf.io/reports/security-slam-north-america-2022/"}	2023-03-24 03:48:32.040521	2023-03-24 03:48:32.040521	\N
199	1	9	\N	\N	{"report-title":"KubeDay Japan 2022","report-url":"https://www.cncf.io/reports/kubeday-japan-2022/"}	2023-03-24 03:48:32.053969	2023-03-24 03:48:32.053969	\N
200	1	9	\N	\N	{"report-title":"CNCF Annual Survey 2022","report-url":"https://www.cncf.io/reports/cncf-annual-survey-2022/"}	2023-03-24 03:48:32.068743	2023-03-24 03:48:32.068743	\N
16	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/3dd0f0ba85e2d4e8259f42bbbdece6f0a62cc5a5","url":"https://github.com/huginn/huginn/commit/3dd0f0ba85e2d4e8259f42bbbdece6f0a62cc5a5","urls":["https://github.com/huginn/huginn/commit/3dd0f0ba85e2d4e8259f42bbbdece6f0a62cc5a5"],"links":[{"href":"https://github.com/huginn/huginn/commit/3dd0f0ba85e2d4e8259f42bbbdece6f0a62cc5a5","rel":"alternate","type":"text/html"}],"title":"\\n        Use ghcr.io as the registry when referencing docker images\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Use ghcr.io as the registry when referencing docker images</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-18T20:01:07+00:00"}	2023-03-23 04:04:41.581932	2023-03-23 04:04:41.581932	\N
17	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/c5786cdc51553b108a30813e27cb932172f4531b","url":"https://github.com/huginn/huginn/commit/c5786cdc51553b108a30813e27cb932172f4531b","urls":["https://github.com/huginn/huginn/commit/c5786cdc51553b108a30813e27cb932172f4531b"],"links":[{"href":"https://github.com/huginn/huginn/commit/c5786cdc51553b108a30813e27cb932172f4531b","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3237 from dsander/add-outdated-docker-registry-wa…\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3237 from dsander/add-outdated-docker-registry-warning\\n\\nShow a warning when the docker image was pulled from docker hub</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/20943?s=30&v=4","enclosure":null,"authors":["dsander (https://github.com/dsander)"],"categories":[],"date_published":null,"last_updated":"2023-03-19T12:54:46+00:00"}	2023-03-23 04:04:41.58573	2023-03-23 04:04:41.58573	\N
18	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/19bd61574a7813c2dc1de43fcf9f1a7d85a811e3","url":"https://github.com/huginn/huginn/commit/19bd61574a7813c2dc1de43fcf9f1a7d85a811e3","urls":["https://github.com/huginn/huginn/commit/19bd61574a7813c2dc1de43fcf9f1a7d85a811e3"],"links":[{"href":"https://github.com/huginn/huginn/commit/19bd61574a7813c2dc1de43fcf9f1a7d85a811e3","rel":"alternate","type":"text/html"}],"title":"\\n        Fix DotHelper broken by the last commit\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Fix DotHelper broken by the last commit</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-20T03:33:17+00:00"}	2023-03-23 04:04:41.58932	2023-03-23 04:04:41.58932	\N
19	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/26ff66318ea48c60919880b8da4ccf6d013ee128","url":"https://github.com/huginn/huginn/commit/26ff66318ea48c60919880b8da4ccf6d013ee128","urls":["https://github.com/huginn/huginn/commit/26ff66318ea48c60919880b8da4ccf6d013ee128"],"links":[{"href":"https://github.com/huginn/huginn/commit/26ff66318ea48c60919880b8da4ccf6d013ee128","rel":"alternate","type":"text/html"}],"title":"\\n        Avoid use of method_missing in favor of dynamic methods\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Avoid use of method_missing in favor of dynamic methods</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-20T03:54:40+00:00"}	2023-03-23 04:04:41.593214	2023-03-23 04:04:41.593214	\N
20	1	8	\N	\N	{"id":"tag:github.com,2008:Grit::Commit/ba852f1edc26bf0e87d6a7a13389124e22d0bde0","url":"https://github.com/huginn/huginn/commit/ba852f1edc26bf0e87d6a7a13389124e22d0bde0","urls":["https://github.com/huginn/huginn/commit/ba852f1edc26bf0e87d6a7a13389124e22d0bde0"],"links":[{"href":"https://github.com/huginn/huginn/commit/ba852f1edc26bf0e87d6a7a13389124e22d0bde0","rel":"alternate","type":"text/html"}],"title":"\\n        Merge pull request #3240 from huginn/fix/dot_helper\\n    ","description":null,"content":"\\n      <pre style='white-space:pre-wrap;width:81ex'>Merge pull request #3240 from huginn/fix/dot_helper\\n\\nFix DotHelper that generates Agents Diagram</pre>\\n    ","image":"https://avatars.githubusercontent.com/u/10236?s=30&v=4","enclosure":null,"authors":["knu (https://github.com/knu)"],"categories":[],"date_published":null,"last_updated":"2023-03-20T04:25:09+00:00"}	2023-03-23 04:04:41.596866	2023-03-23 04:04:41.596866	\N
201	1	9	\N	\N	{"report-title":"CNCF Annual Report 2022","report-url":"https://www.cncf.io/reports/cncf-annual-report-2022/"}	2023-03-24 03:48:32.080235	2023-03-24 03:48:32.080235	\N
202	1	9	\N	\N	{"report-title":"CNCF Annual Report 2022 – Japanese translation","report-url":"https://www.cncf.io/reports/cncf-annual-report-2022-jp/"}	2023-03-24 03:48:32.091286	2023-03-24 03:48:32.091286	\N
203	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2022","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-transparency-report/"}	2023-03-24 03:48:32.105625	2023-03-24 03:48:32.105625	\N
204	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2022 CNCF-hosted Co-Located Events Transparency Reports","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2022-cncf-hosted-co-located-events-transparency-reports/"}	2023-03-24 03:48:32.117419	2023-03-24 03:48:32.117419	\N
205	1	9	\N	\N	{"report-title":"ArgoCon 2022","report-url":"https://www.cncf.io/reports/argocon-2022/"}	2023-03-24 03:48:32.132629	2023-03-24 03:48:32.132629	\N
206	1	9	\N	\N	{"report-title":"Argo Project Journey Report","report-url":"https://www.cncf.io/reports/argo-project-journey-report/"}	2023-03-24 03:48:32.142944	2023-03-24 03:48:32.142944	\N
207	1	9	\N	\N	{"report-title":"CTO Summit EU 2022","report-url":"https://www.cncf.io/reports/cto-summit-eu-2022/"}	2023-03-24 03:48:32.156854	2023-03-24 03:48:32.156854	\N
208	1	9	\N	\N	{"report-title":"OTel Community Day North America","report-url":"https://www.cncf.io/reports/otel-community-day-north-america/"}	2023-03-24 03:48:32.172149	2023-03-24 03:48:32.172149	\N
209	1	9	\N	\N	{"report-title":"Cloud Native Telco Day Europe","report-url":"https://www.cncf.io/reports/cloud-native-telco-day-europe/"}	2023-03-24 03:48:32.183513	2023-03-24 03:48:32.183513	\N
210	1	9	\N	\N	{"report-title":"ServiceMeshCon Europe","report-url":"https://www.cncf.io/reports/servicemeshcon-europe/"}	2023-03-24 03:48:32.193676	2023-03-24 03:48:32.193676	\N
211	1	9	\N	\N	{"report-title":"Cloud Native eBPF Day Europe","report-url":"https://www.cncf.io/reports/cloud-native-ebpf-day-europe/"}	2023-03-24 03:48:32.207216	2023-03-24 03:48:32.207216	\N
212	1	9	\N	\N	{"report-title":"FluentCon Europe","report-url":"https://www.cncf.io/reports/fluentcon-europe/"}	2023-03-24 03:48:32.221715	2023-03-24 03:48:32.221715	\N
213	1	9	\N	\N	{"report-title":"GitOpsCon Europe","report-url":"https://www.cncf.io/reports/gitopscon-europe/"}	2023-03-24 03:48:32.234009	2023-03-24 03:48:32.234009	\N
214	1	9	\N	\N	{"report-title":"KnativeCon Europe","report-url":"https://www.cncf.io/reports/knativecon-europe/"}	2023-03-24 03:48:32.244977	2023-03-24 03:48:32.244977	\N
215	1	9	\N	\N	{"report-title":"Kubernetes AI Day Europe","report-url":"https://www.cncf.io/reports/kubernetes-ai-day-europe/"}	2023-03-24 03:48:32.258292	2023-03-24 03:48:32.258292	\N
216	1	9	\N	\N	{"report-title":"Kubernetes BATCH + HPC Day Europe","report-url":"https://www.cncf.io/reports/kubernetes-batch-hpc-day-europe/"}	2023-03-24 03:48:32.269831	2023-03-24 03:48:32.269831	\N
217	1	9	\N	\N	{"report-title":"Kubernetes on EDGE DAY Europe","report-url":"https://www.cncf.io/reports/kubernetes-on-edge-day-europe/"}	2023-03-24 03:48:32.284919	2023-03-24 03:48:32.284919	\N
218	1	9	\N	\N	{"report-title":"PrometheusDay Europe","report-url":"https://www.cncf.io/reports/prometheusday-europe/"}	2023-03-24 03:48:32.296895	2023-03-24 03:48:32.296895	\N
219	1	9	\N	\N	{"report-title":"Cloud Native WASM Day Europe","report-url":"https://www.cncf.io/reports/cloud-native-wasm-day-europe/"}	2023-03-24 03:48:32.310808	2023-03-24 03:48:32.310808	\N
220	1	9	\N	\N	{"report-title":"Cloud Native SecurityCon Europe","report-url":"https://www.cncf.io/reports/cloud-native-securitycon-europe/"}	2023-03-24 03:48:32.330242	2023-03-24 03:48:32.330242	\N
221	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon Europe 2022","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2022/"}	2023-03-24 03:48:32.344298	2023-03-24 03:48:32.344298	\N
222	1	9	\N	\N	{"report-title":"Cloud Native Security Whitepaper","report-url":"https://www.cncf.io/reports/cloud-native-security-whitepaper/"}	2023-03-24 03:48:32.35847	2023-03-24 03:48:32.35847	\N
223	1	9	\N	\N	{"report-title":"Kubernetes Annual Report 2021","report-url":"https://www.cncf.io/reports/kubernetes-annual-report-2021/"}	2023-03-24 03:48:32.372121	2023-03-24 03:48:32.372121	\N
224	1	9	\N	\N	{"report-title":"2021年中国 KubeCon + CloudNativeCon + Open Source Summit","report-url":"https://www.cncf.io/reports/2021%e5%b9%b4%e4%b8%ad%e5%9b%bd-kubecon-cloudnativecon-open-source-summit/"}	2023-03-24 03:48:32.386997	2023-03-24 03:48:32.386997	\N
225	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon + Open Source Summit China 2021","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-china-2021/"}	2023-03-24 03:48:32.402025	2023-03-24 03:48:32.402025	\N
226	1	9	\N	\N	{"report-title":"CNCF Annual Survey 2021","report-url":"https://www.cncf.io/reports/cncf-annual-survey-2021/"}	2023-03-24 03:48:32.412452	2023-03-24 03:48:32.412452	\N
227	1	9	\N	\N	{"report-title":"CNCF Annual Report 2021","report-url":"https://www.cncf.io/reports/cncf-annual-report-2021/"}	2023-03-24 03:48:32.423247	2023-03-24 03:48:32.423247	\N
228	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2021","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2021/"}	2023-03-24 03:48:32.43621	2023-03-24 03:48:32.43621	\N
229	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon Europe 2021","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2021/"}	2023-03-24 03:48:32.448561	2023-03-24 03:48:32.448561	\N
230	1	9	\N	\N	{"report-title":"Spotify End User Journey Report","report-url":"https://www.cncf.io/reports/spotify-end-user-journey-report/"}	2023-03-24 03:48:32.464175	2023-03-24 03:48:32.464175	\N
231	1	9	\N	\N	{"report-title":"PromCon North America 2021","report-url":"https://www.cncf.io/reports/promcon-north-america-2021/"}	2023-03-24 03:48:32.476191	2023-03-24 03:48:32.476191	\N
232	1	9	\N	\N	{"report-title":"Cloud Native Wasm Day North America 2021","report-url":"https://www.cncf.io/reports/cloud-native-wasm-day-north-america-2021/"}	2023-03-24 03:48:32.490502	2023-03-24 03:48:32.490502	\N
233	1	9	\N	\N	{"report-title":"ServiceMeshCon North America 2021","report-url":"https://www.cncf.io/reports/servicemeshcon-north-america-2021/"}	2023-03-24 03:48:32.505271	2023-03-24 03:48:32.505271	\N
234	1	9	\N	\N	{"report-title":"FluentCon North America 2021","report-url":"https://www.cncf.io/reports/fluentcon-north-america-2021/"}	2023-03-24 03:48:32.516542	2023-03-24 03:48:32.516542	\N
235	1	9	\N	\N	{"report-title":"Cloud Native Security Conference North America 2021","report-url":"https://www.cncf.io/reports/cloud-native-security-conference-north-america-2021/"}	2023-03-24 03:48:32.527935	2023-03-24 03:48:32.527935	\N
236	1	9	\N	\N	{"report-title":"Cloud Native DevX Day North America 2021","report-url":"https://www.cncf.io/reports/cloud-native-devx-day-north-america-2021/"}	2023-03-24 03:48:32.539681	2023-03-24 03:48:32.539681	\N
237	1	9	\N	\N	{"report-title":"Cloud Native eBPF Day North America 2021","report-url":"https://www.cncf.io/reports/cloud-native-ebpf-day-north-america-2021/"}	2023-03-24 03:48:32.550358	2023-03-24 03:48:32.550358	\N
238	1	9	\N	\N	{"report-title":"Kubernetes AI Day North America","report-url":"https://www.cncf.io/reports/kubernetes-ai-day-north-america/"}	2023-03-24 03:48:32.561756	2023-03-24 03:48:32.561756	\N
239	1	9	\N	\N	{"report-title":"EnvoyCon North America 2021","report-url":"https://www.cncf.io/reports/envoycon-north-america-2021/"}	2023-03-24 03:48:32.573158	2023-03-24 03:48:32.573158	\N
240	1	9	\N	\N	{"report-title":"SupplyChainSecurityCon North America 2021","report-url":"https://www.cncf.io/reports/supplychainsecuritycon-north-america-2021/"}	2023-03-24 03:48:32.583417	2023-03-24 03:48:32.583417	\N
241	1	9	\N	\N	{"report-title":"Production Identity Day: SPIFFE + SPIRE North America 2021","report-url":"https://www.cncf.io/reports/production-identity-day-spiffe-spire-north-america-2021/"}	2023-03-24 03:48:32.596184	2023-03-24 03:48:32.596184	\N
242	1	9	\N	\N	{"report-title":"GitOpsCon North America 2021","report-url":"https://www.cncf.io/reports/gitopscon-north-america-2021/"}	2023-03-24 03:48:32.612272	2023-03-24 03:48:32.612272	\N
243	1	9	\N	\N	{"report-title":"Crossplane Community Day Europe 2021","report-url":"https://www.cncf.io/reports/crossplane-community-day-europe-2021/"}	2023-03-24 03:48:32.624096	2023-03-24 03:48:32.624096	\N
244	1	9	\N	\N	{"report-title":"Cloud Native Wasm Day Europe 2021","report-url":"https://www.cncf.io/reports/cloud-native-wasm-day-europe-2021/"}	2023-03-24 03:48:32.63418	2023-03-24 03:48:32.63418	\N
245	1	9	\N	\N	{"report-title":"Cloud Native Security Day Europe 2021","report-url":"https://www.cncf.io/reports/cloud-native-security-day-europe-2021/"}	2023-03-24 03:48:32.649114	2023-03-24 03:48:32.649114	\N
246	1	9	\N	\N	{"report-title":"ServiceMeshCon Europe 2021","report-url":"https://www.cncf.io/reports/servicemeshcon-europe-2021/"}	2023-03-24 03:48:32.661944	2023-03-24 03:48:32.661944	\N
247	1	9	\N	\N	{"report-title":"PromCon Online Europe 2021","report-url":"https://www.cncf.io/reports/promcon-online-europe-2021/"}	2023-03-24 03:48:32.675129	2023-03-24 03:48:32.675129	\N
248	1	9	\N	\N	{"report-title":"Magma Day Europe 2021","report-url":"https://www.cncf.io/reports/magma-day-europe-2021/"}	2023-03-24 03:48:32.685143	2023-03-24 03:48:32.685143	\N
249	1	9	\N	\N	{"report-title":"Kubernetes on Edge Day Europe 2021","report-url":"https://www.cncf.io/reports/kubernetes-on-edge-day-europe-2021/"}	2023-03-24 03:48:32.700521	2023-03-24 03:48:32.700521	\N
250	1	9	\N	\N	{"report-title":"Kubernetes AI Day Europe 2021","report-url":"https://www.cncf.io/reports/kubernetes-ai-day-europe-2021/"}	2023-03-24 03:48:32.711107	2023-03-24 03:48:32.711107	\N
251	1	9	\N	\N	{"report-title":"FluentCon: Cloud Native Logging Day with Fluent Bit and Fluentd Europe 2021","report-url":"https://www.cncf.io/reports/fluentcon-cloud-native-logging-day-with-fluent-bit-and-fluentd-europe-2021/"}	2023-03-24 03:48:32.721624	2023-03-24 03:48:32.721624	\N
252	1	9	\N	\N	{"report-title":"etcd Project Journey Report","report-url":"https://www.cncf.io/reports/etcd-project-journey-report/"}	2023-03-24 03:48:32.731937	2023-03-24 03:48:32.731937	\N
253	1	9	\N	\N	{"report-title":"CNCF Annual Report 2020","report-url":"https://www.cncf.io/reports/cncf-annual-report-2020/"}	2023-03-24 03:48:32.742384	2023-03-24 03:48:32.742384	\N
254	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2020","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2020/"}	2023-03-24 03:48:32.753583	2023-03-24 03:48:32.753583	\N
255	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon Europe 2020","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2020/"}	2023-03-24 03:48:32.767097	2023-03-24 03:48:32.767097	\N
256	1	9	\N	\N	{"report-title":"Cloud Native Survey 2020","report-url":"https://www.cncf.io/reports/cloud-native-survey-2020/"}	2023-03-24 03:48:32.779416	2023-03-24 03:48:32.779416	\N
257	1	9	\N	\N	{"report-title":"Kubernetes Community Annual Report 2020","report-url":"https://www.cncf.io/reports/kubernetes-community-annual-report-2020/"}	2023-03-24 03:48:32.790411	2023-03-24 03:48:32.790411	\N
258	1	9	\N	\N	{"report-title":"Vitess Project Journey Report","report-url":"https://www.cncf.io/reports/vitess-project-journey-report/"}	2023-03-24 03:48:32.800166	2023-03-24 03:48:32.800166	\N
259	1	9	\N	\N	{"report-title":"EnvoyCon 2020","report-url":"https://www.cncf.io/reports/envoycon-2020/"}	2023-03-24 03:48:32.811374	2023-03-24 03:48:32.811374	\N
260	1	9	\N	\N	{"report-title":"Helm Workshop 2020","report-url":"https://www.cncf.io/reports/helm-workshop-2020/"}	2023-03-24 03:48:32.822967	2023-03-24 03:48:32.822967	\N
261	1	9	\N	\N	{"report-title":"gRPC Conf 2020","report-url":"https://www.cncf.io/reports/grpc-conf-2020/"}	2023-03-24 03:48:32.83374	2023-03-24 03:48:32.83374	\N
262	1	9	\N	\N	{"report-title":"Jaeger Project Journey Report","report-url":"https://www.cncf.io/reports/jaeger-project-journey-report/"}	2023-03-24 03:48:32.843784	2023-03-24 03:48:32.843784	\N
263	1	9	\N	\N	{"report-title":"Helm Project Journey Report","report-url":"https://www.cncf.io/reports/helm-project-journey-report/"}	2023-03-24 03:48:32.854583	2023-03-24 03:48:32.854583	\N
264	1	9	\N	\N	{"report-title":"Fluentd Project Journey Report","report-url":"https://www.cncf.io/reports/fluentd-project-journey-report/"}	2023-03-24 03:48:32.864714	2023-03-24 03:48:32.864714	\N
265	1	9	\N	\N	{"report-title":"Kubernetes Forum Bengaluru 2020","report-url":"https://www.cncf.io/reports/kubernetes-forum-bengaluru-2020/"}	2023-03-24 03:48:32.874241	2023-03-24 03:48:32.874241	\N
266	1	9	\N	\N	{"report-title":"Kubernetes Forum Delhi 2020","report-url":"https://www.cncf.io/reports/kubernetes-forum-delhi-2020/"}	2023-03-24 03:48:32.885643	2023-03-24 03:48:32.885643	\N
267	1	9	\N	\N	{"report-title":"containerd Project Journey Report","report-url":"https://www.cncf.io/reports/containerd-project-journey-report/"}	2023-03-24 03:48:32.897532	2023-03-24 03:48:32.897532	\N
268	1	9	\N	\N	{"report-title":"CNCF Annual Report 2019","report-url":"https://www.cncf.io/reports/cncf-annual-report-2019/"}	2023-03-24 03:48:32.90889	2023-03-24 03:48:32.90889	\N
269	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2019","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2019/"}	2023-03-24 03:48:32.919205	2023-03-24 03:48:32.919205	\N
270	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon + Open Source Summit Shanghai 2019","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-open-source-summit-shanghai-2019/"}	2023-03-24 03:48:32.929587	2023-03-24 03:48:32.929587	\N
271	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon Europe 2019","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-europe-2019/"}	2023-03-24 03:48:32.941225	2023-03-24 03:48:32.941225	\N
272	1	9	\N	\N	{"report-title":"Kubernetes Forum Sydney 2019","report-url":"https://www.cncf.io/reports/kubernetes-forum-sydney-2019/"}	2023-03-24 03:48:32.954302	2023-03-24 03:48:32.954302	\N
273	1	9	\N	\N	{"report-title":"Kubernetes Forum Seoul 2019","report-url":"https://www.cncf.io/reports/kubernetes-forum-seoul-2019/"}	2023-03-24 03:48:32.964388	2023-03-24 03:48:32.964388	\N
274	1	9	\N	\N	{"report-title":"Cloud Native Survey 2019","report-url":"https://www.cncf.io/reports/cloud-native-survey-2019/"}	2023-03-24 03:48:32.974047	2023-03-24 03:48:32.974047	\N
275	1	9	\N	\N	{"report-title":"Prometheus Project Journey Report","report-url":"https://www.cncf.io/reports/prometheus-project-journey-report/"}	2023-03-24 03:48:32.983688	2023-03-24 03:48:32.983688	\N
276	1	9	\N	\N	{"report-title":"Envoy Project Journey Report","report-url":"https://www.cncf.io/reports/envoy-project-journey-report/"}	2023-03-24 03:48:32.99306	2023-03-24 03:48:32.99306	\N
277	1	9	\N	\N	{"report-title":"Kubernetes Project Journey Report","report-url":"https://www.cncf.io/reports/kubernetes-project-journey-report/"}	2023-03-24 03:48:33.002437	2023-03-24 03:48:33.002437	\N
278	1	9	\N	\N	{"report-title":"Kubernetes Day Bengaluru 2019","report-url":"https://www.cncf.io/reports/kubernetes-day-bengaluru-2019/"}	2023-03-24 03:48:33.011502	2023-03-24 03:48:33.011502	\N
279	1	9	\N	\N	{"report-title":"CNCF Annual Report 2018","report-url":"https://www.cncf.io/reports/cncf-annual-report-2018/"}	2023-03-24 03:48:33.02077	2023-03-24 03:48:33.02077	\N
280	1	9	\N	\N	{"report-title":"KubeCon + CloudNativeCon North America 2018","report-url":"https://www.cncf.io/reports/kubecon-cloudnativecon-north-america-2018/"}	2023-03-24 03:48:33.029822	2023-03-24 03:48:33.029822	\N
281	1	9	\N	\N	{"report-title":"CNCF Annual Report 2017","report-url":"https://www.cncf.io/reports/cncf-annual-report-2017/"}	2023-03-24 03:48:33.039634	2023-03-24 03:48:33.039634	\N
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.links (id, source_id, receiver_id, created_at, updated_at, event_id_at_creation) FROM stdin;
1	1	4	2023-03-23 03:05:17.37071	2023-03-23 03:05:17.37071	0
2	2	7	2023-03-23 03:05:17.373865	2023-03-23 03:05:17.373865	0
3	5	1	2023-03-23 03:05:17.376715	2023-03-23 03:05:17.376715	0
4	6	3	2023-03-23 03:05:17.379398	2023-03-23 03:05:17.379398	0
5	7	3	2023-03-23 03:05:17.381872	2023-03-23 03:05:17.381872	0
8	9	12	2023-03-24 03:44:31.874955	2023-03-24 03:44:31.874955	107
\.


--
-- Data for Name: scenario_memberships; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scenario_memberships (id, agent_id, scenario_id, created_at, updated_at) FROM stdin;
1	1	1	2023-03-23 03:05:17.312241	2023-03-23 03:05:17.312241
2	2	1	2023-03-23 03:05:17.320403	2023-03-23 03:05:17.320403
3	3	1	2023-03-23 03:05:17.328025	2023-03-23 03:05:17.328025
4	4	1	2023-03-23 03:05:17.335529	2023-03-23 03:05:17.335529
5	5	1	2023-03-23 03:05:17.342937	2023-03-23 03:05:17.342937
6	6	1	2023-03-23 03:05:17.351208	2023-03-23 03:05:17.351208
7	7	1	2023-03-23 03:05:17.360864	2023-03-23 03:05:17.360864
8	9	2	2023-03-24 03:21:17.541546	2023-03-24 03:21:17.541546
11	12	2	2023-03-24 03:44:31.876743	2023-03-24 03:44:31.876743
\.


--
-- Data for Name: scenarios; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scenarios (id, name, user_id, created_at, updated_at, description, public, guid, source_url, tag_bg_color, tag_fg_color, icon) FROM stdin;
1	default-scenario	1	2023-03-23 03:05:17.287345	2023-03-23 03:05:17.287345	This scenario has a few agents to get you started. Feel free to change them or delete them as you see fit!	f	ee4299225e6531c401a8bbbce0771ce4	\N	#5bc0de	#ffffff	\N
2	Tech	1	2023-03-24 03:21:17.537036	2023-03-24 03:21:17.537036		f	eee35fa9e2a14951e4c93adb2c9cc7e6	\N	#813d9c	#ffffff	gears
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_migrations (version) FROM stdin;
20120728210244
20120728215449
20120919061122
20120919063304
20121216025930
20121220053905
20121222074732
20121223203701
20121231170705
20130107050049
20130124050117
20130126080736
20130509053743
20130819160603
20131105063248
20131222211558
20131223032112
20131227000021
20140121075418
20140127164931
20140210062747
20140213053001
20140216201250
20140403043556
20140408150825
20140505201716
20140509170420
20140509170443
20140515211100
20140525150040
20140525150140
20140531232016
20140602014917
20140603104211
20140605032822
20140722131220
20140723110551
20140730005210
20140809211540
20140811200922
20140813110107
20140820003139
20140901143732
20140906030139
20150219213604
20150507153436
20150808115436
20160108221620
20160224120316
20160301113717
20160302095413
20160307084729
20160307085545
20160405072512
20160419150930
20160423163416
20160607055850
20160807000122
20160823151303
20161004120214
20161007030910
20161124061256
20161124065838
20170307190555
20170419073748
20170731191002
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.services (id, user_id, provider, name, token, secret, refresh_token, expires_at, global, options, created_at, updated_at, uid) FROM stdin;
\.


--
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_credentials (id, user_id, credential_name, credential_value, created_at, updated_at, mode) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin, failed_attempts, unlock_token, locked_at, username, invitation_code, scenario_count, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, deactivated_at) FROM stdin;
1	admin@example.com	$2a$10$vDYI9eH.C.gndbU6cVk7jO0R72ueNzGjcEiE3zZ0PS7Pgm7cKeDMG	\N	\N	2023-03-24 02:23:58.703882	3	2023-03-24 02:23:58.707591	2023-03-23 03:59:35.647606	127.0.0.1	127.0.0.1	2023-03-23 03:05:17.160356	2023-03-24 02:23:58.707698	t	0	\N	\N	admin	try-huginn	2	\N	\N	\N	\N	\N
\.


--
-- Name: agent_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agent_logs_id_seq', 128, true);


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agents_id_seq', 12, true);


--
-- Name: control_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.control_links_id_seq', 1, false);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.delayed_jobs_id_seq', 669, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.events_id_seq', 281, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.links_id_seq', 8, true);


--
-- Name: scenario_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.scenario_memberships_id_seq', 11, true);


--
-- Name: scenarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.scenarios_id_seq', 2, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_credentials_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: agent_logs agent_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.agent_logs
    ADD CONSTRAINT agent_logs_pkey PRIMARY KEY (id);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: control_links control_links_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.control_links
    ADD CONSTRAINT control_links_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: scenario_memberships scenario_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scenario_memberships
    ADD CONSTRAINT scenario_memberships_pkey PRIMARY KEY (id);


--
-- Name: scenarios scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scenarios
    ADD CONSTRAINT scenarios_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: user_credentials user_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_credentials
    ADD CONSTRAINT user_credentials_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- Name: index_agents_on_disabled_and_deactivated; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_agents_on_disabled_and_deactivated ON public.agents USING btree (disabled, deactivated);


--
-- Name: index_agents_on_guid; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_agents_on_guid ON public.agents USING btree (guid);


--
-- Name: index_agents_on_schedule; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_agents_on_schedule ON public.agents USING btree (schedule);


--
-- Name: index_agents_on_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_agents_on_type ON public.agents USING btree (type);


--
-- Name: index_agents_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_agents_on_user_id_and_created_at ON public.agents USING btree (user_id, created_at);


--
-- Name: index_control_links_on_control_target_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_control_links_on_control_target_id ON public.control_links USING btree (control_target_id);


--
-- Name: index_control_links_on_controller_id_and_control_target_id; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_control_links_on_controller_id_and_control_target_id ON public.control_links USING btree (controller_id, control_target_id);


--
-- Name: index_events_on_agent_id_and_created_at; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_events_on_agent_id_and_created_at ON public.events USING btree (agent_id, created_at);


--
-- Name: index_events_on_expires_at; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_events_on_expires_at ON public.events USING btree (expires_at);


--
-- Name: index_events_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_events_on_user_id_and_created_at ON public.events USING btree (user_id, created_at);


--
-- Name: index_links_on_receiver_id_and_source_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_links_on_receiver_id_and_source_id ON public.links USING btree (receiver_id, source_id);


--
-- Name: index_links_on_source_id_and_receiver_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_links_on_source_id_and_receiver_id ON public.links USING btree (source_id, receiver_id);


--
-- Name: index_scenario_memberships_on_agent_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_scenario_memberships_on_agent_id ON public.scenario_memberships USING btree (agent_id);


--
-- Name: index_scenario_memberships_on_scenario_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_scenario_memberships_on_scenario_id ON public.scenario_memberships USING btree (scenario_id);


--
-- Name: index_scenarios_on_user_id_and_guid; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_scenarios_on_user_id_and_guid ON public.scenarios USING btree (user_id, guid);


--
-- Name: index_services_on_provider; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_services_on_provider ON public.services USING btree (provider);


--
-- Name: index_services_on_uid; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_services_on_uid ON public.services USING btree (uid);


--
-- Name: index_services_on_user_id_and_global; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_services_on_user_id_and_global ON public.services USING btree (user_id, global);


--
-- Name: index_user_credentials_on_user_id_and_credential_name; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_user_credentials_on_user_id_and_credential_name ON public.user_credentials USING btree (user_id, credential_name);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_deactivated_at; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_users_on_deactivated_at ON public.users USING btree (deactivated_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- PostgreSQL database dump complete
--

