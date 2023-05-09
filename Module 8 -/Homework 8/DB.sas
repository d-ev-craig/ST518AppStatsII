options ls=75 nodate nocenter formdlim="+" mstored sasmstore=research;

%let nocrp=nocolumn norow nopercent;

libname research "/home/jaosborn/research";

symbol value=dot;
data DB;
   array tname{3} $8 ("Control","S.epid","E.coli");
   input Colony @;
   group=2-(colony in (1,2,4,6,7));
   do i=1 to 3; 
      input mortality @;
      bacteria=tname{i};
      output;
   end;
datalines;
1 0.16 0.12 0.86
2 0.14 0.00 0.60
3 0.00 0.00 0.36
4 0.02 0.02 0.54
5 0.10 0.08 0.38
6 0.06 0.20 0.56
7 0.00 0.04 0.62
8 0.06 0.00 0.16
9 0.00 0.00 0.30
10 0.06 0.02 0.14
11 0.02 0.02 0.18
12 0.14 0.06 0.32
13 0.04 0.04 0.08
14 0.08 0.00 0.24
15 0.04 0.04 0.26
;
run;
proc glm datta=DB;
   class colony group bacteria;
   model mortality=bacteria|group colony(group);
   lsmeans bacteria|group;
run;
