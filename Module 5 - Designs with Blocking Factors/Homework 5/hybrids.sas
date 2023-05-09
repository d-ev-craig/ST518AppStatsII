options ls=75 nodate nocenter formdlim="+" mstored sasmstore=research;

%let nocrp=nocolumn norow nopercent;
%let nsims=1000;
%let seed=123;
%let sigma2=1.5;

libname research "/home/jaosborn/research";

symbol value=dot;
/*
data one;
   input cartype $ @;
   do i=1 to 6;
      input cost @;
      output;
   end;
datalines;
D 20.3 19.8 21.1 18.7 20 20.1
E 24.5 20.8 22 23.1 23.5 24.1
F 21 17.8 18.1 19.4 17.5 20.2
;
run;
proc means mean stdev;
   class cartype;
   var cost;
run;
proc glm;
   class cartype;
   model cost=cartype;
   means cartype/lsd;
run;
*/
data synth;
   array cmeans{5} (23,20,20,20,20);        /* mean costs under alternative hypoth */
   array cnames{5} $ ("D","E","F","G","H");
   do dataset=1 to &nsims;
   do i=1 to 5; cartype=cnames{i};
   do j=1 to 6;
      cost=cmeans{i} + sqrt(&sigma2)*rannor(&seed); /* synthetic data */
      output;
   end;
   end;
   end;
run;
ods trace on;
ods listing close;
proc mixed data=synth;
   *where dataset in (18,24,31,33,34);
   by dataset;
   class cartype;
   model cost=cartype;
   lsmeans cartype/adj=tukey;
   ods output diffs=diffs tests3=tests3;
run;
data both;
   merge diffs(drop=effect) tests3(drop=effect);
   by dataset;
   fsig05=probf<.05;
   tsig05=probt<.05;
   tukeysig05=adjp<.05;
   bonsig05=probt < .05/10;
   if cartype="D" then diff="real";
   else diff="none";
run;
proc print data=both(obs=50);run;
proc means data=both nway;
   by dataset;
   class diff;
   var fsig05 bonsig05 tsig05 tukeysig05;   /* max=1 implies at least one type I error */
   output out=sums max=fsig05 atleastonebon atleastonet atleastonetukey;
run;
proc print data=sums (obs=10);
run;

ods listing ;
proc freq data=sums;
   title "first row of each table gives fwe";
   tables diff*atleastonetukey;
   tables diff*atleastonebon;
proc freq data=sums;
   title "divide sum in 1st row, 2nd col by nsims to get lsd fwe";
   title2 "lsd=least sign. difference, fwe=familywise error rate";
   tables fsig05*diff*atleastonet;
run;
/*
proc means;
   var fsig05;
run;
ods listing close;
proc glm data=synth;
   where dataset in (18,24,31,33,34);
   by dataset;
   class cartype;
   model cost=cartype;
   means cartype/lsd; 
   ods output modelanova=myanova mclines=mclines; 
run;
ods listing;
proc print data=myanova(obs=20);
run;
proc print data=mclines(obs=20);
run;
proc sort data=mclines;
   by dataset level;
run;
proc transpose data=mclines out=tmclines;
   by dataset;
   var line1;
   id level;
run;
proc print data=tmclines;
run;
   
*/
