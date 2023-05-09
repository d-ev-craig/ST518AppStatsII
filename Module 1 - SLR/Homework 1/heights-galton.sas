OPTIONS LS=75 NODATE;
/* -------------------------------------------------------------------
|  Stigler , History of Statistics pg. 285 gives Galton's famous data |
| on heights of sons and average parents' height scaled to to         |
| represent a male height (essentially sons' heights versus fathers'  |
| heights).  The data are counts and we illustrate some fancy SAS     |
| programming (arrays, loops, printing options)                       |
| End categories are just bounds.  Galton's reasoning for the         |
| categories can be found in Stigler's book.                          |
\ -------------------------------------------------------------------*/

DATA Galton;
  ARRAY cdata(14);
  IF _n_ = 1 THEN INPUT cdata1-cdata14 @ ;
  RETAIN cdata1-cdata14;  
  DROP cdata1-cdata14 i;
  INPUT parent @;
     DO i = 1 TO 14; 
        INPUT count @ ; 
        son=cdata(i);
        OUTPUT;  
     END;
CARDS;
    61.7 62.2 63.2 64.2 65.2 66.2 67.2 68.2 69.2 70.2 71.2 72.2 73.2 73.7
73.0  0    0    0    0    0    0    0    0    0    0    0    1    3    0
72.5  0    0    0    0    0    0    0    1    2    1    2    7    2    4
71.5  0    0    0    0    1    3    4    3    5   10    4    9    2    2
70.5  1    0    1    0    1    1    3   12   18   14    7    4    3    3
69.5  0    0    1   16    4   17   27   20   33   25   20   11    4    5
68.5  1    0    7   11   16   25   31   34   48   21   18    4    3    0
67.5  0    3    5   14   15   36   38   28   38   19   11    4    0    0
66.5  0    3    3    5    2   17   17   14   13    4    0    0    0    0
65.5  1    0    9    5    7   11   11    7    7    5    2    1    0    0
64.5  1    1    4    4    1    5    5    0    2    0    0    0    0    0
64.0  1    0    2    4    1    2    2    1    1    0    0    0    0    0
 ;

*PROC CORR DATA=galton FISHER (BIASADJ=NO);
PROC CORR DATA=galton cov csscp;
   VAR son parent;
   FREQ count;
RUN;
DATA questions;
   /* these values used for prediction or estimation at x=68,x=72 */
   INPUT parent son;
   count=1;
   CARDS;
   68 .
   72 .
;
RUN;

DATA galton;
   SET galton questions;
RUN;

PROC REG DATA=galton; 
   MODEL son=parent/CLB ;*P;
   OUTPUT OUT=out1 RESIDUAL=r P=yhat UCL=pihigh LCL=pilow UCLM=cihigh LCLM=cilow
   STDP=stdmean;
   FREQ count;
RUN;


DATA questions;
   SET out1;
   IF son=.;
RUN;

PROC print;
   TITLE "questions regarding prediction, estimation when x=68, x=72";
RUN;


DATA fisherz;
   n=928;
   r=SQRT(0.2105);
   rratio=(1+r)/(1-r);
   z=PROBIT(0.975);
   expon=PROBIT(0.975)/SQRT(n-3);
   rlow=(rratio*exp(-2*expon)-1)/(rratio*exp(-2*expon)+1);
   rhigh=(rratio*exp(2*expon)-1)/(rratio*exp(2*expon)+1);
RUN;
PROC PRINT;
   TITLE "computations of 95% confidence interval for rho";
RUN;
/*
OPTIONS ps=50;
PROC UNIVARIATE DATA=out1 NORMAL PLOT; 
   TITLE "residual analysis";
   VAR r;
RUN;

*GOPTIONS DEV=pslepsf COLORS=(BLACK);

SYMBOL1 I=RL
   VALUE=DOT;

PROC GPLOT DATA=out1;
   PLOT son*parent;
RUN;

PROC GPLOT DATA=out1;
   PLOT r*yhat;
RUN;
QUIT;
*/
