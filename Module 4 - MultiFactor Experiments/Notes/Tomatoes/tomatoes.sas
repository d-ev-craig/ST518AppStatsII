options ls=75 nodate;

data one;
   drop i;
   input a b @;
   b=10*b;
   bs=b*b;
   do i=1 to 3;
      input y @@;
      output;
   end;
   cards;
1 1 7.9 9.2 10.5
2 1 8.1 8.6 10.1
3 1 15.3 16.1 17.5
1 2 11.2 12.8 13.3
2 2 11.5 12.7 13.7
3 2 16.6 18.5 19.2
1 3 12.1 12.6 14.0
2 3 13.7 14.4 15.4
3 3 18.0 20.8 21.0
1 4 9.1 10.8 12.5
2 4 11.3 12.5 14.5
3 4 17.2 18.4 18.9
;
run;
ods graphics on;
proc glm;
   class b a ;
   model y=a|b;
   *contrast 'linear effect' b -3 -1 1 3;
   *contrast 'quadratic effect' b 1 -1 -1 1;
   *contrast 'cubic effect' b -12 81 -81 12;
   *means a|b/tukey duncan ;
   means a|b;
   estimate "20k - 10k" b -1 1 0 0/e;
   estimate "v3 - v1" a -1 0 1/e;
run;
/*
   estimate "simple effect of variety 1" a 1;
   estimate "simple effect of variety 1" a 2 -1 -1/divisor=3;
   estimate "newsimple effect of variety 1" a 1 0 0; 
   estimate "simple effect of variety 2" a -1 2 -1/divisor=3;
   estimate "simple effect of variety 3" a -1 -1 2/divisor=3;
   estimate "simple effect of density 1" b 3 -1 -1 -1/divisor=4;
   estimate "simple effect of density 2" b -1 3 -1 -1/divisor=4;
   estimate "simple effect of density 3" b -1 -1 3 -1/divisor=4;
   estimate "simple effect of density 4" b -1 -1 -1 3/divisor=4;
   *estimate "v2 - v1" a -1 1 0;
   *means b/scheffe tukey;
   *lsmeans a/stderr;
   output out=two p=p;
   means b/tukey;
run;
symbol1 i=join value=dot; symbol2 i=join value=plus;
symbol3 i=join value=diamond; symbol2 i=join value=star;

proc gplot;
   plot p*b=a;
run;

endsas;
proc glm;
   class a;
   model y=a b /solution;
   model y=a b bs/solution;
run;
*/
