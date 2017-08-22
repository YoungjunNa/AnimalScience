#SAS code for 4x4 Latin square design (LSD)									

DATA nayoung;						
INPUT						
treat	Animal	Period	DMI	BW	Water_intake	urine
;CARDS;						
1	1	1	869.40 	48.30 	1032.50 	252.00 
1	2	2	855.90 	47.55 	1717.50 	331.00 
1	3	3	750.10 	43.95 	1425.00 	286.25 
1	4	4	766.00 	45.00 	1267.50 	280.00 
2	1	2	873.90 	48.55 	925.00 	285.00 
2	2	3	770.40 	42.80 	1070.00 	377.50 
2	3	4	801.90 	44.55 	932.50 	295.00 
2	4	1	819.90 	45.55 	880.00 	205.00 
3	1	3	846.00 	47.00 	1145.00 	259.50 
3	2	4	813.60 	45.20 	1210.00 	249.00 
3	3	1	775.20 	43.40 	800.00 	220.25 
3	4	2	879.90 	49.30 	905.00 	207.75 
4	1	4	778.50 	43.25 	910.00 	356.00 
4	2	1	825.30 	45.85 	970.00 	301.33 
4	3	2	877.77 	48.95 	1100.00 	348.00 
4	4	3	841.40 	46.80 	920.00 	415.33 
;						
PROC MIXED DATA = nayoung NOCLPRINT COVTEST NOITPRINT;
CLASS treat Animal Period;					
MODEL	DMI = Treat/ddfm=kenrog;				
RANDOM Animal period;				
LSMEANS Treat/pdiff;					
run;

#SAS code for quadraplicated 2x2 LSD

DATA nayoung;
INPUT
treat	animal	period	rep	CH4Ld	CH4gd
;CARDS;					
1	1	1	1	175.1	125.1
1	2	2	1	71.9	51.4
1	3	1	2	74.0	52.9
1	4	2	2	60.7	43.3
1	5	1	3	77.2	55.2
1	6	2	3	87.1	62.2
1	7	1	4	78.7	56.2
1	8	2	4	110.0	78.6
2	1	2	1	82.8	59.1
2	2	1	1	108.2	77.3
2	3	2	2	85.2	60.8
2	4	1	2	76.6	54.7
2	5	2	3	94.2	67.3
2	6	1	3	64.8	46.3
2	7	2	4	177.0	126.4
2	8	1	4	67.9	48.5
;					
PROC MIXED DATA = nayoung NOCLPRINT COVTEST NOITPRINT;
CLASS treat Animal Period rep;				
MODEL	CH4Ld = Treat/DDFM=KENROG;
RANDOM Animal(rep) rep period(rep);				
LSMEANS Treat/PDIFF;				
RUN;
