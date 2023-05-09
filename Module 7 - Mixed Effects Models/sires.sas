options ls=85 nodate nocenter;

data one;
   input sire @;
   do i=1 to 8;
   input bw @@;
   *nbw=-1*bw;
   output;
   end;
   cards;
177 61 100 56 113 99 103 75 62
200 75 102 95 103 98 115 98 94
201 58 60 60 57 57 59 54 100
202 57 56 67 59 58 121 101 101
203 59 46 120 115 115 93 105 75
;
run;

proc glm;
   class sire;
   model bw=sire;
   means sire;
   random sire;
run;
*endsas;
proc mixed cl ;  
   class sire;
   model bw=/ddfm=satterth outp=two;
   *random sire;
   repeated sire/rcorr; 
   estimate "mean" intercept 1/cl;
run;
/*
proc print data=two;
run;
proc gplot;
   plot bw*sire;
run;

proc mixed cl method=reml;
   class sire;
   model bw=;
   random sire;
   estimate "mean" intercept 1/cl;
run;

proc mixed cl method=mom;
   class sire;
   model bw=;
   random sire;
   estimate "mean" intercept 1/cl;
run;

proc varcomp;
   class sire;
   model bw=sire;
run;
*/