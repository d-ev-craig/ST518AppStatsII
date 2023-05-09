options ls=95 nodate ps=1000 nocenter;
%let d=divisor;
data one;
   /* a=temp, b=density, c=salinity */
   drop i;
   input a b c @;
   do i=1 to 3;
   input y @;
   y0=sqrt(y);
   output;
   end;
   cards;
   25 80 10 86 52 73
   25 80 25 544 371 482
   25 80 40 390 290 397 
   25 160 10 53 73 86
   25 160 25 393 398 208
   25 160 40 249 265 243
   35 80 10 439 436 349
   35 80 25 249 245 330
   35 80 40 247 277 205
   35 160 10 324 305 364
   35 160 25 352 267 316
   35 160 40 188 223 281
;
run;
proc print data=one noobs;
   var a b c y;
run;
*ods graphics on;
proc glm data=one;
   class a b c;
   model y=a|b|c;
   *lsmeans a*b*c/slicediff=a*c ; * plot=mean(sliceby=a);
   lsmeans a*c; */plot=mean;
   estimate "temp effect at c=1" a -1 1 a*c  -1 0 0   1 0 0;
   estimate "temp effect at c=2" a -1 1 a*c  0 -1 0   0 1 0;
   estimate "temp effect at c=3" a -1 1 a*c  0 0 -1   0 0 1;
   estimate "avg of temp effects at c=2,3" a -2 2  a*c 0 -1 -1  0 1 1/&d=2;
   estimate "mu[AC1]-.5(mu[AC2]+mu[AC3]) " a*c -2 1 1  2 -1 -1/&d=2;
   estimate "density effect at c=1,a=1" 
             b -1 1 a*b -1 1 b*c  -1 0 0   1 0 0 a*b*c  -1 0 0  1 0 0 ;
   estimate "density effect at c=2,a=1" b -1 1 b*c  0 -1 0   0 1 0
             b -1 1 a*b -1 1 b*c  0 -1 0   0 1 0 a*b*c  0 -1 0  0 1 0 ;
   estimate "density effect at c=3,a=1" b -1 1 b*c  0 0 -1   0 0 1
             b -1 1 a*b -1 1 b*c  0 0 -1   0 0 1 a*b*c  0 0 -1  0 0 1 ;
   estimate "mu[A1BC1]-.5(mu[A1BC2]+mu[A1BC3])" b*c  -2 1 1  2 -1 -1
            a*b*c -2 1 1  2 -1 -1/divisor=2;
   estimate "mu[A2BC1]-.5(mu[A2BC2]+mu[A2BC3])" b*c  -2 1 1  2 -1 -1
            a*b*c 0 0 0  0 0 0  -2 1 1  2 -1 -1/divisor=2;
   estimate "mu[A1BC1.....] - mu[A2BC1.....]" 
            a*b*c -2 1 1  2 -1 -1  2 -1 -1 -2 1 1/divisor=2;

   contrast "temp effect at c=1" a -1 1 a*c  -1 0 0   1 0 0;
   contrast "temp effect at c=2" a -1 1 a*c  0 -1 0   0 1 0;
   contrast "temp effect at c=3" a -1 1 a*c  0 0 -1   0 0 1;
   contrast "avg of temp effects at c=2,3" a -2 2  a*c 0 -1 -1  0 1 1;
   contrast "mu[AC1]-.5(mu[AC2]+mu[AC3]) " a*c -2 1 1  2 -1 -1;
   contrast "density effect at c=1,a=1" 
             b -1 1 a*b -1 1 b*c  -1 0 0   1 0 0 a*b*c  -1 0 0  1 0 0 ;
   contrast "density effect at c=2,a=1" b -1 1 b*c  0 -1 0   0 1 0
             b -1 1 a*b -1 1 b*c  0 -1 0   0 1 0 a*b*c  0 -1 0  0 1 0 ;
   contrast "density effect at c=3,a=1" b -1 1 b*c  0 0 -1   0 0 1
             b -1 1 a*b -1 1 b*c  0 0 -1   0 0 1 a*b*c  0 0 -1  0 0 1 ;
   contrast "mu[A1BC1]-.5(mu[A1BC2]+mu[A1BC3])" b*c  -2 1 1  2 -1 -1
            a*b*c -2 1 1  2 -1 -1;
   contrast "mu[A2BC1]-.5(mu[A2BC2]+mu[A2BC3])" b*c  -2 1 1  2 -1 -1
            a*b*c 0 0 0  0 0 0  -2 1 1  2 -1 -1;
   contrast "diff between last two"
            a*b*c -2 1 1  2 -1 -1  2 -1 -1 -2 1 1;
   lsmeans a*b*c/slice=a*c;
run;
/*
endsas;
symbol1 i=join value=dot color=black;
symbol2 i=join value=plus color=black;


proc means data=one noprint nway;  class a c;  var y; output out=two mean=ymean;run;
goptions device=pdf;
proc gplot data=two;
   plot ymean*c=a;
run;
proc means data=one noprint nway;  
   by a;
   class b c;  var y; output out=three mean=ymean;run;
run;
proc gplot data=three;
   by a;
   plot ymean*c=b;
run;
*/
