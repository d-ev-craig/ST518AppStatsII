/* Some SAS/GRAPH code to overlay four fitted regression lines
on scatter plot of y vs z.  The four lines correspond to four
treatment groups in an analysis of covariance with y as the
response and z as the covariate */


options ls=75 nodate nocenter;

data one;
   input diet y z;
   z=10*z;
   cards;
1 48 35
1 67 44
1 78 44
1 69 51
1 53 47
2 65 40
2 49 45
2 37 37
2 75 53
2 63 42
3 79 51
3 52 41
3 63 47
3 65 47
3 67 48
4 59 53
4 50 52
4 59 52
4 42 51
4 34 43
;
run;

symbol1 i=join value=dot;
symbol2 i=join value=dot;
symbol3 i=join value=dot;
symbol4 i=join value=dot;

proc glm ;
   class diet;
   model y=diet; 
run;

proc glm ;
   class diet;
   *model y=diet z diet*z/solution;
   *model y=diet; 
   model y=diet z /solution i;
   output out=two p=p r=r; 
run;

proc means;
   var y z;
run;

data one;
   set one;
   zt=z-461.5;
run;
proc glm ;  title "intercepts as adjusted means";
   class diet;
   model y=diet zt /solution i;
run;


proc gplot;
   plot p*z=diet;
run;

goptions colors=(black); 
*goptions colors=(black) dev=pslepsf;
symbol1 value=1; symbol2 value=1;
symbol3 value=3; symbol4 value=4;

symbol5 l=1 i=join value=none; symbol6 l=2 i=join value=none;
symbol7 l=3 i=join value=none; symbol8 l=4 i=join value=none;

/*symbol5 l=1 i=rl value=none; symbol6 l=2 i=rl value=none;
symbol7 l=3 i=rl value=none; symbol8 l=4 i=rl value=none;*/


proc gplot;
   title "ANCOVA plot";
   plot y*z=diet; plot2 p*z=diet;
run;
