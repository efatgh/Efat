function [baseMVA,bus,branch,Ploaddata,Qloaddata]=case33radial
%% Formate for data definition is adopted from MATPOWER
baseMVA=27;
%% Bus Data
%	Bus_I	Pd	Qd	Bs	Type	Vm	Va	basekV	Vmax	Vmin
bus=[...
   1	1	0	0	3	1	0	11	1.05	0.95
2	1	0	0	3	1	0	11	1.05	0.95
3	100	60	0	3	1	0	11	1.05	0.95
4	90	40	0	3	1	0	11	1.05	0.95
5	120	80	0	3	1	0	11	1.05	0.95
6	60	30	0	3	1	0	11	1.05	0.95
7	60	20	0	3	1	0	11	1.05	0.95
8	200	100	0	3	1	0	11	1.05	0.95
9	200	100	0	3	1	0	11	1.05	0.95
10	60	20	0	3	1	0	11	1.05	0.95
11	60	20	0	3	1	0	11	1.05	0.95
12	45	30	0	3	1	0	11	1.05	0.95
13	60	35	0	3	1	0	11	1.05	0.95
14	60	35	0	3	1	0	11	1.05	0.95
15	120	80	0	3	1	0	11	1.05	0.95
16	60	10	0	3	1	0	11	1.05	0.95
17	60	20	0	3	1	0	11	1.05	0.95
18	60	20	0	3	1	0	11	1.05	0.95
19	90	40	0	3	1	0	11	1.05	0.95
20	90	40	0	3	1	0	11	1.05	0.95
21	90	40	0	3	1	0	11	1.05	0.95
22	90	40	0	3	1	0	11	1.05	0.95
23	90	40	0	3	1	0	11	1.05	0.95
24	90	50	0	3	1	0	11	1.05	0.95
25	420	200	0	3	1	0	11	1.05	0.95
26	420	200	0	3	1	0	11	1.05	0.95
27	60	25	0	3	1	0	11	1.05	0.95
28	60	25	0	3	1	0	11	1.05	0.95
29	60	20	0	3	1	0	11	1.05	0.95
30	120	70	0	3	1	0	11	1.05	0.95
31	200	600	0	3	1	0	11	1.05	0.95
32	150	70	0	3	1	0	11	1.05	0.95
33	210	100	0	3	1	0	11	1.05	0.95
34	60	40	0	3	1	0	11	1.05	0.95
35	100	60	0	3	1	0	11	1.05	0.95
36	90	40	0	3	1	0	11	1.05	0.95
37	120	80	0	3	1	0	11	1.05	0.95
38	60	30	0	3	1	0	11	1.05	0.95
39	60	20	0	3	1	0	11	1.05	0.95
40	200	100	0	3	1	0	11	1.05	0.95
41	200	100	0	3	1	0	11	1.05	0.95
42	60	20	0	3	1	0	11	1.05	0.95
43	60	20	0	3	1	0	11	1.05	0.95
44	45	30	0	3	1	0	11	1.05	0.95
45	60	35	0	3	1	0	11	1.05	0.95
46	60	35	0	3	1	0	11	1.05	0.95
47	120	80	0	3	1	0	11	1.05	0.95
48	60	10	0	3	1	0	11	1.05	0.95
49	60	20	0	3	1	0	11	1.05	0.95
50	60	20	0	3	1	0	11	1.05	0.95
51	90	40	0	3	1	0	11	1.05	0.95
52	90	40	0	3	1	0	11	1.05	0.95
53	90	40	0	3	1	0	11	1.05	0.95
54	90	40	0	3	1	0	11	1.05	0.95
55	90	40	0	3	1	0	11	1.05	0.95
56	90	50	0	3	1	0	11	1.05	0.95
57	420	200	0	3	1	0	11	1.05	0.95
58	420	200	0	3	1	0	11	1.05	0.95
59	60	25	0	3	1	0	11	1.05	0.95
60	60	25	0	3	1	0	11	1.05	0.95
61	60	20	0	3	1	0	11	1.05	0.95
62	120	70	0	3	1	0	11	1.05	0.95
63	200	600	0	3	1	0	11	1.05	0.95
64	150	70	0	3	1	0	11	1.05	0.95
65	210	100	0	3	1	0	11	1.05	0.95
66	60	40	0	3	1	0	11	1.05	0.95
67	90	40	0	3	1	0	11	1.05	0.95
68	90	40	0	3	1	0	11	1.05	0.95
69	90	40	0	3	1	0	11	1.05	0.95
70	90	50	0	3	1	0	11	1.05	0.95
71	420	200	0	3	1	0	11	1.05	0.95
72	420	200	0	3	1	0	11	1.05	0.95
73	60	25	0	3	1	0	11	1.05	0.95
74	60	25	0	3	1	0	11	1.05	0.95
75	60	20	0	3	1	0	11	1.05	0.95
76	120	70	0	3	1	0	11	1.05	0.95 ];

%% Any Changes in Bus Data Such as Load Type, P, and Q can be edited here seperately
% E.g., In base case all load are of PQ Type (3). But if we wish that from
% all load are of Z-type (1) then simply write
% bus(2:33,5)=2;
% For all loads of I-type (2) write
% bus(2:3,5)=3;
% For all loads of ZIP-type (4) write
% bus(2:33,5)=4;
% Apart from this we can also define different type of loads at each bus
% using similar steps

%% Line Data
%   f	t	r(ohm)%1.35	x(ohm)%0.254	Status	Ratio	RateA distance(m)
branch=[...
    1	2	0.13905	0.026162	1	0	9990	103
2	3	0.1323	0.024892	1	0	9990	98
2	4	0.1377	0.025908	1	0	9990	102
4	5	0.13095	0.024638	1	0	9990	97
5	6	0.08775	0.01651	1	0	9990	65
6	7	0.10935	0.020574	1	0	9990	81
6	8	0.2187	0.041148	1	0	9990	162
8	9	0.2457	0.046228	1	0	9990	182
9	10	0.0972	0.018288	1	0	9990	72
10	11	0.13365	0.025146	1	0	9990	99
11	12	0.02025	0.00381	1	0	9990	15
12	13	0.10665	0.020066	1	0	9990	79
13	14	0.0378	0.007112	1	0	9990	28
14	15	0.0864	0.016256	1	0	9990	64
14	16	0.2835	0.05334	1	0	9990	210
16	17	0.14715	0.027686	1	0	9990	109
16	18	0.46845	0.088138	1	0	9990	347
16	19	0.4752	0.089408	1	0	9990	352
19	20	0.081	0.01524	1	0	9990	60
20	21	0.09585	0.018034	1	0	9990	71
21	22	0.08775	0.01651	1	0	9990	65
22	23	0.22545	0.042418	1	0	9990	167
23	24	0.1458	0.027432	1	0	9990	108
24	25	0.18225	0.03429	1	0	9990	135
22	26	0.18765	0.035306	1	0	9990	139
26	27	0.11745	0.022098	1	0	9990	87
27	28	0.07695	0.014478	1	0	9990	57
28	29	0.1917	0.036068	1	0	9990	142
28	30	0.15525	0.02921	1	0	9990	115
30	31	0.1404	0.026416	1	0	9990	104
31	32	0.3996	0.075184	1	0	9990	296
31	33	0.33885	0.063754	1	0	9990	251
12	34	0.1404	0.026416	1	0	9990	104
34	35	0.07965	0.014986	1	0	9990	59
34	36	0.2943	0.055372	1	0	9990	218
34	37	0.1188	0.022352	1	0	9990	88
37	38	0.25785	0.048514	1	0	9990	191
38	39	0.1377	0.025908	1	0	9990	102
39	40	0.16875	0.03175	1	0	9990	125
37	41	0.15255	0.028702	1	0	9990	113
41	42	0.1296	0.024384	1	0	9990	96
42	43	0.24165	0.045466	1	0	9990	179
43	44	0.0675	0.0127	1	0	9990	50
44	45	0.14175	0.02667	1	0	9990	105
45	46	0.135	0.0254	1	0	9990	100
46	47	0.14985	0.028194	1	0	9990	111
47	48	0.38745	0.072898	1	0	9990	287
48	49	0.0675	0.0127	1	0	9990	50
49	50	0.15255	0.028702	1	0	9990	113
46	51	0.19845	0.037338	1	0	9990	147
51	52	0.11745	0.022098	1	0	9990	87
52	53	0.04455	0.008382	1	0	9990	33
53	54	0.21465	0.040386	1	0	9990	159
54	55	0.2943	0.055372	1	0	9990	218
54	56	0.40635	0.076454	1	0	9990	301
42	57	0.13365	0.025146	1	0	9990	99
57	58	0.14715	0.027686	1	0	9990	109
58	59	0.27	0.0508	1	0	9990	200
59	60	0.29295	0.055118	1	0	9990	217
59	61	0.45765	0.086106	1	0	9990	339
61	62	0.13365	0.025146	1	0	9990	99
62	63	0.12015	0.022606	1	0	9990	89
63	64	0.2079	0.039116	1	0	9990	154
64	65	0.2025	0.0381	1	0	9990	150
65	66	0.40905	0.076962	1	0	9990	303
65	67	0.34965	0.065786	1	0	9990	259
65	68	0.4941	0.092964	1	0	9990	366
68	69	0.33615	0.063246	1	0	9990	249
64	70	0.1377	0.025908	1	0	9990	102
61	71	0.297	0.05588	1	0	9990	220
71	72	0.28755	0.054102	1	0	9990	213
71	73	0.108	0.02032	1	0	9990	80
73	74	0.16605	0.031242	1	0	9990	123
74	75	0.297	0.05588	1	0	9990	220
74	76	0.4806	0.090424	1	0	9990	356 ];


				
%%
Ploaddata=[0 100	55	85	127	90	117	170	73	119	150	100	103	35	219	57	157	158	175	124	47	110	54	58	109	39	113	107	74	89	77	98	121	116	51	107	39	127	155	197	177	100	145	66	117	88	117	109	73	73	95	113	155	185	97	51	64	97	76	108	197	89	39	75	103	68	122	85	58	51	172	99	117	220	135	59
0 98	54	84	124	88	115	166	72	116	147	98	100	35	215	56	154	154	172	122	46	107	53	57	107	38	112	106	73	88	76	97	119	114	50	106	39	125	154	194	175	99	144	65	115	87	115	108	72	72	94	111	153	182	95	50	63	95	75	106	194	87	38	74	101	67	120	83	57	50	169	97	115	216	133	58
0 96	53	83	121	87	112	163	71	113	144	96	98	34	210	55	151	151	168	120	45	105	52	55	105	37	111	105	72	87	75	96	117	113	49	106	38	123	152	191	173	98	142	64	114	86	114	107	71	72	92	109	151	179	93	49	62	93	74	104	191	85	37	73	99	66	118	82	56	42	166	95	113	213	131	57
0 94	52	81	118	85	109	159	69	110	140	94	95	33	205	54	147	147	164	117	44	102	51	54	102	36	108	102	70	85	73	93	114	110	48	103	37	120	148	186	168	95	138	62	111	84	111	104	69	70	90	106	147	174	90	47	60	90	72	101	186	82	36	71	96	64	115	79	54	41	161	92	110	207	127	55
0 94	52	81	118	85	109	159	69	110	140	94	95	33	205	54	147	147	164	117	44	102	51	54	102	36	108	102	70	85	73	93	114	110	48	103	37	120	148	186	168	95	138	62	111	84	111	104	69	70	90	106	147	174	90	47	60	90	72	101	186	82	36	71	96	64	115	79	54	41	161	92	110	207	127	55
0 91	50	77	113	82	105	153	66	105	134	91	91	32	197	52	141	142	157	112	42	98	49	52	98	34	103	98	67	81	70	89	109	105	46	99	35	115	142	179	161	91	132	60	106	80	106	100	66	67	86	101	141	167	86	45	57	86	69	97	178	78	34	68	92	61	110	75	51	39	154	88	105	198	122	53
0 90	49	76	111	81	103	151	65	103	132	89	90	31	194	51	139	140	155	110	41	97	48	51	96	33	101	96	66	80	69	87	107	103	45	97	34	113	140	176	158	89	130	59	104	78	104	98	65	66	84	99	139	164	84	44	56	84	68	95	175	77	33	67	90	60	108	74	50	34	151	86	103	195	120	52
0 92	51	78	114	83	106	155	67	106	135	91	92	32	200	52	143	144	159	113	42	100	49	52	98	34	103	99	68	82	71	89	110	106	46	100	35	116	144	181	163	91	134	61	107	80	107	100	67	68	86	101	143	168	86	45	57	86	70	97	180	79	34	68	92	61	111	86	51	35	155	88	105	200	123	53
0 94	52	81	118	85	109	159	69	110	140	94	95	33	205	54	147	147	164	117	44	102	51	54	102	36	108	102	70	85	73	93	114	110	48	103	37	120	148	186	168	95	138	62	111	84	111	104	69	70	90	106	147	174	90	47	60	90	72	101	186	82	36	71	96	64	115	79	54	41	161	92	110	207	127	55
0 96	53	83	121	87	112	163	71	113	144	96	98	34	210	55	151	151	168	120	45	105	52	55	105	37	111	105	72	87	75	96	117	113	49	106	38	123	152	191	173	98	142	64	114	86	114	107	71	72	92	109	151	179	93	49	62	93	74	104	191	85	37	73	99	66	118	82	56	42	166	95	113	213	131	57
0 98	54	84	124	88	115	166	72	116	147	98	100	35	215	56	154	154	172	122	46	107	53	57	107	38	112	106	73	88	76	97	119	114	50	106	39	125	154	194	175	99	144	65	115	87	115	108	72	72	94	111	153	182	95	50	63	95	75	106	194	87	38	74	101	67	120	83	57	50	169	97	115	216	133	58
0 103	57	88	130	92	121	174	76	122	155	103	105	37	226	59	162	162	181	128	48	112	55	60	113	40	117	111	76	92	79	102	125	120	52	111	41	131	161	204	183	104	151	68	121	91	121	113	75	76	98	116	160	191	99	52	66	99	78	111	203	91	40	77	106	70	126	87	60	52	177	102	120	227	139	61
0 105	58	90	133	94	124	178	79	125	158	106	107	38	231	61	166	162	185	131	49	115	56	61	116	41	119	113	77	94	81	104	128	123	53	113	42	134	165	209	187	106	154	69	124	93	124	115	76	77	100	118	163	195	101	53	67	101	79	113	208	93	41	78	108	71	129	89	61	53	181	104	123	232	142	62
0 107	59	92	136	96	127	182	81	128	162	108	110	39	236	62	170	165	189	134	50	117	57	62	119	42	121	115	78	96	82	106	131	125	54	115	43	137	168	213	191	108	157	70	126	95	126	117	77	78	102	120	166	199	103	54	68	103	80	115	213	95	42	79	110	72	132	91	62	54	185	106	126	237	145	63
0 110	60	94	139	98	130	186	83	131	165	110	112	40	241	63	174	169	193	137	51	120	58	63	121	43	123	117	79	98	83	108	134	127	55	117	44	140	171	217	195	110	160	71	129	97	128	119	78	79	104	122	169	203	105	55	69	105	81	117	218	97	43	80	112	73	135	93	63	55	189	108	129	242	148	64
0 110	60	94	139	98	130	186	83	131	165	110	112	40	241	63	174	169	193	137	51	120	58	63	121	43	123	117	79	98	83	108	134	127	55	117	44	140	171	217	195	110	160	71	129	97	128	119	78	79	104	122	169	203	105	55	69	105	81	117	218	97	43	80	112	73	135	93	63	55	189	108	129	242	148	64
0 110	60	94	139	98	130	186	83	131	165	110	112	40	241	63	174	169	193	137	51	120	58	63	121	43	123	117	79	98	83	108	134	127	55	117	44	140	171	217	195	110	160	71	129	97	128	119	78	79	104	122	169	203	105	55	69	105	81	117	218	97	43	80	112	73	135	93	63	55	189	108	129	242	148	64
0 110	60	94	139	98	130	186	83	131	165	110	112	40	241	63	174	169	193	137	51	120	58	63	121	43	123	117	79	98	83	108	134	127	55	117	44	140	171	217	195	110	160	71	129	97	128	119	78	79	104	122	169	203	105	55	69	105	81	117	218	97	43	80	112	73	135	93	63	55	189	108	129	242	148	64
0 100	54	85	126	89	118	169	76	119	150	100	102	36	219	57	158	154	176	125	46	109	52	57	110	39	110	105	71	88	74	97	120	114	49	105	39	126	154	195	175	99	144	64	116	87	115	107	70	71	93	110	153	184	95	50	63	95	73	106	198	88	39	72	101	66	122	84	57	50	181	98	117	220	134	58
0 100	54	85	126	89	118	169	76	119	150	100	102	36	219	57	158	154	176	125	46	109	52	57	110	39	110	105	71	88	74	97	120	114	49	105	39	126	154	195	175	99	144	64	116	87	115	107	70	71	93	110	153	184	95	50	63	95	73	106	198	88	39	72	101	66	122	84	57	50	181	98	117	220	134	58
0 107	58	91	135	96	127	182	82	128	161	107	110	39	235	61	170	166	189	134	49	117	56	61	118	42	115	109	73	91	76	100	124	118	50	109	40	130	159	202	181	102	149	66	120	90	119	111	72	73	96	114	158	191	98	51	65	98	75	110	205	91	40	74	104	68	126	87	59	51	187	101	121	228	139	60
0 108	59	92	137	97	129	184	83	129	163	108	111	39	238	62	172	168	191	135	49	118	57	61	120	43	119	113	77	94	81	104	128	123	53	113	42	134	165	209	187	106	154	69	124	93	124	115	76	77	100	118	163	195	101	53	67	101	79	113	208	93	41	78	108	71	129	89	61	53	181	104	123	232	142	62
0 108	59	92	137	97	129	184	83	129	163	108	111	39	238	62	172	168	191	135	49	118	57	61	120	43	119	113	77	94	81	104	128	123	53	113	42	134	165	209	187	106	154	69	124	93	124	115	76	77	100	118	163	195	101	53	67	101	79	113	208	93	41	78	108	71	129	89	61	53	181	104	123	232	142	62
0 108	59	92	137	97	129	184	83	129	163	108	111	39	238	62	172	168	191	135	49	118	57	61	120	43	119	113	77	94	81	104	128	123	53	113	42	134	165	209	187	106	154	69	124	93	124	115	76	77	100	118	163	195	101	53	67	101	79	113	208	93	41	78	108	71	129	89	61	53	181	104	123	232	142	62
];

alpha = bus(:,3)./bus(:,2);
Qloaddata=(Ploaddata'.*(alpha*ones(1,24)))';
