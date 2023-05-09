FILENAME REFFILE '/home/u49844961/sasuser.v94/ST518/Homework 6/barley.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=barley;
	GETNAMES=YES;
RUN;
proc glm data=barley;
	class seedage h20;
	model y = seedage | h20;
	lsmeans seedage | h20;
run;

data barleyslr;
INFILE datalines dlm = "09"x;
input seedage y;
datalines;
1	9.5
2	4
3	7
4	7
5	15.5
1	6
2	11.5
3	14
4	22.5
5	26
1	4.5
2	10
3	22
4	18.5
5	35
;
run;

proc reg data = barleyslr;
model y =seedage;
run;