#SAS code for repeated measures (Littell et al., 1998)
#https://dl.sciencesocieties.org/publications/jas/abstracts/76/4/1216

Data nayoung;			
Input			
Treat	Animal	hour	DMD
;Cards;			
1	1	1	22.96 
1	1	1	23.34 
1	1	1	22.62 
1	1	1	.
1	2	1	22.77 
1	2	1	.
1	2	1	.
1	2	1	.
2	1	1	32.86 
2	1	1	35.61 
2	1	1	31.96 
2	1	1	.
2	2	1	31.95 
2	2	1	33.81 
2	2	1	32.12 
2	2	1	.
3	1	1	32.32 
3	1	1	30.69 
3	1	1	34.57 
3	1	1	.
3	2	1	28.92 
3	2	1	31.19 
3	2	1	33.51 
3	2	1	.
4	1	1	28.93 
4	1	1	28.47 
4	1	1	27.93 
4	1	1	.
4	2	1	26.13 
4	2	1	26.41 
4	2	1	25.93 
4	2	1	.
5	1	1	26.05 
5	1	1	25.82 
5	1	1	26.43 
5	1	1	.
5	2	1	26.64 
5	2	1	26.31 
5	2	1	26.06 
5	2	1	.
1	1	2	.
1	1	2	.
1	1	2	28.72 
1	1	2	29.42 
1	2	2	25.15 
1	2	2	25.28 
1	2	2	28.73 
1	2	2	28.32 
2	1	2	39.10 
2	1	2	40.37 
2	1	2	39.10 
2	1	2	38.44 
2	2	2	32.44 
2	2	2	47.52 
2	2	2	32.74 
2	2	2	35.39 
3	1	2	43.20 
3	1	2	43.13 
3	1	2	43.33 
3	1	2	40.13 
3	2	2	33.75 
3	2	2	34.45 
3	2	2	32.88 
3	2	2	36.48 
4	1	2	38.20 
4	1	2	37.31 
4	1	2	38.14 
4	1	2	37.52 
4	2	2	35.43 
4	2	2	32.14 
4	2	2	35.52 
4	2	2	33.49 
5	1	2	30.08 
5	1	2	29.32 
5	1	2	30.96 
5	1	2	30.99 
5	2	2	26.37 
5	2	2	27.75 
5	2	2	27.56 
5	2	2	29.91 
1	1	3	.
1	1	3	34.72 
1	1	3	34.33 
1	1	3	35.36 
1	2	3	36.15 
1	2	3	34.02 
1	2	3	41.24 
1	2	3	39.88 
2	1	3	46.61 
2	1	3	48.96 
2	1	3	52.58 
2	1	3	49.01 
2	2	3	47.55 
2	2	3	51.65 
2	2	3	54.17 
2	2	3	.
3	1	3	50.34 
3	1	3	48.85 
3	1	3	54.60 
3	1	3	54.22 
3	2	3	49.99 
3	2	3	51.20 
3	2	3	45.36 
3	2	3	57.10 
4	1	3	43.64 
4	1	3	50.71 
4	1	3	46.54 
4	1	3	44.30 
4	2	3	40.43 
4	2	3	43.13 
4	2	3	53.00 
4	2	3	42.07 
5	1	3	41.78 
5	1	3	42.21 
5	1	3	40.97 
5	1	3	37.30 
5	2	3	43.76 
5	2	3	42.95 
5	2	3	35.99 
5	2	3	44.45 
1	1	4	44.73 
1	1	4	46.60 
1	1	4	46.00 
1	1	4	46.12 
1	2	4	45.78 
1	2	4	49.16 
1	2	4	45.73 
1	2	4	48.11 
2	1	4	59.51 
2	1	4	60.67 
2	1	4	56.53 
2	1	4	61.20 
2	2	4	58.05 
2	2	4	57.92 
2	2	4	57.84 
2	2	4	60.52 
3	1	4	67.02 
3	1	4	65.51 
3	1	4	63.82 
3	1	4	64.63 
3	2	4	64.46 
3	2	4	62.29 
3	2	4	61.14 
3	2	4	61.00 
4	1	4	67.08 
4	1	4	70.04 
4	1	4	69.20 
4	1	4	71.09 
4	2	4	62.72 
4	2	4	65.07 
4	2	4	66.85 
4	2	4	68.15 
5	1	4	53.05 
5	1	4	53.18 
5	1	4	53.05 
5	1	4	52.27 
5	2	4	48.96 
5	2	4	50.69 
5	2	4	51.82 
5	2	4	49.60 
;			
proc mixed data = nayoung method = reml; 			
class treat animal hour;			
model DMD = treat hour treat*hour;			
random animal;			
repeated hour / sub=animal(treat) type = cs r rcorr;			
estimate 'treat 1-2 at 6h' treat 1 -1 0 0 0 treat*hour 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-3 at 6h' treat 1 0 -1 0 0 treat*hour 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-4 at 6h' treat 1 0 0 -1 0 treat*hour 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0; 			
estimate 'treat 1-5 at 6h' treat 1 0 0 0 -1treat*hour 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0;			
estimate 'treat 2-3 at 6h' treat 0 1 -1 0 0 treat*hour 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 2-4 at 6h' treat 0 1 0 -1 0 treat*hour 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0;			
estimate 'treat 2-5 at 6h' treat 0 1 0 0 -1 treat*hour 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0;			
estimate 'treat 3-4 at 6h' treat 0 0 1 -1 0 treat*hour 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0;			
estimate 'treat 3-5 at 6h' treat 0 0 1 0 -1 treat*hour 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0;			
estimate 'treat 4-5 at 6h' treat 0 0 0 1 -1treat*hour 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0;			
estimate 'treat 1-2 at 12h' treat 1 -1 0 0 0 treat*hour 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-3 at 12h' treat 1 0 -1 0 0 treat*hour 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-4 at 12h' treat 1 0 0 -1 0 treat*hour 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0; 			
estimate 'treat 1-5 at 12h' treat 1 0 0 0 -1treat*hour 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0;			
estimate 'treat 2-3 at 12h' treat 0 1 -1 0 0 treat*hour 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 2-4 at 12h' treat 0 1 0 -1 0 treat*hour 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0;			
estimate 'treat 2-5 at 12h' treat 0 1 0 0 -1 treat*hour 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0;			
estimate 'treat 3-4 at 12h' treat 0 0 1 -1 0 treat*hour 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0;			
estimate 'treat 3-5 at 12h' treat 0 0 1 0 -1 treat*hour 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0;			
estimate 'treat 4-5 at 12h' treat 0 0 0 1 -1treat*hour 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0;			
estimate 'treat 1-2 at 24h' treat 1 -1 0 0 0 treat*hour 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-3 at 24h' treat 1 0 -1 0 0 treat*hour 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-4 at 24h' treat 1 0 0 -1 0 treat*hour 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;			
estimate 'treat 1-5 at 24h' treat 1 0 0 0 -1treat*hour 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0;			
estimate 'treat 2-3 at 24h' treat 0 1 -1 0 0 treat*hour 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 2-4 at 24h' treat 0 1 0 -1 0 treat*hour 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0;			
estimate 'treat 2-5 at 24h' treat 0 1 0 0 -1 treat*hour 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0;			
estimate 'treat 3-4 at 24h' treat 0 0 1 -1 0 treat*hour 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;			
estimate 'treat 3-5 at 24h' treat 0 0 1 0 -1 treat*hour 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;			
estimate 'treat 4-5 at 24h' treat 0 0 0 1 -1treat*hour 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0;			
estimate 'treat 1-2 at 48h' treat 1 -1 0 0 0 treat*hour 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-3 at 48h' treat 1 0 -1 0 0 treat*hour 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0; 			
estimate 'treat 1-4 at 48h' treat 1 0 0 -1 0 treat*hour 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0;			
estimate 'treat 1-5 at 48h' treat 1 0 0 0 -1treat*hour 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1;			
estimate 'treat 2-3 at 48h' treat 0 1 -1 0 0 treat*hour 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0 0; 			
estimate 'treat 2-4 at 48h' treat 0 1 0 -1 0 treat*hour 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0 0;			
estimate 'treat 2-5 at 48h' treat 0 1 0 0 -1 treat*hour 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 -1;			
estimate 'treat 3-4 at 48h' treat 0 0 1 -1 0 treat*hour 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;			
estimate 'treat 3-5 at 48h' treat 0 0 1 0 -1 treat*hour 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;			
estimate 'treat 4-5 at 48h' treat 0 0 0 1 -1treat*hour 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 -1;			
run;			
