options ls=85;

data one;
   input subject system time;
   system1=(system=1);
   system2=(system=2);
   system3=(system=3);
   system4=(system=4);
   cards;
1 1 35.6
2 1 31.3
3 1 36.2
4 1 31.1
5 1 39.4
6 1 34.7
7 1 34.1
8 1 36.5
9 1 40.7
1 2 17.3
2 2 16.4
3 2 18.1
4 2 17.8
5 2 18.8
6 2 17  
7 2 14.5
8 2 17.9
9 2 16.4
1 3 24.4
2 3 22.4
3 3 22.8
4 3 21  
5 3 23.3
6 3 21.8
7 3 23  
8 3 24.1
9 3 31.3
1 4 25.0
2 4 26.0
3 4 25.3
4 4 24 
5 4 24.2
6 4 26.2
7 4 24 
8 4 20.9
9 4 36.9
;
run;

proc glm;
   class system;
   model time=system;
   means system;
run;

proc reg;
   model time=system1-system4/noint;
run;

/*endsas;*/


/*proc print;
run;*/

/*proc mixed cl method=type3;
   class system subject;
   model time=system/ddfm=satterth;
   random subject;
   lsmeans system/adj=tukey cl diffs;
run;*/
proc mixed ; 
   class system subject;
   model time=system/ddfm=satterth;
   random subject;
   lsmeans system/adj=tukey cl diffs;
run;