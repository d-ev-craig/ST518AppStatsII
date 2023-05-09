
options ls=75;

/* 
In this experiment, subject prothrombin times are measured before
and after aspirin.  No placebo was given.  The null hypothesis to
be tested is that mean prothrombin time is the same before
aspirin as it is after aspirin.

Prothrombin time reflects time required for blood to clot in humans .

*/

data one;
   input before after;
   subject=_n_;
   diff=after-before;
   cards;
12.3 12
12 12.3
12 12.5
13 12
13 13
12.5 12.5
11.3 10.3
11.8 11.3
11.5 11.5
11 11.5
11 11
11.3 11.5
;

proc ttest;
   title  "Good ole paired ttest";
   paired before*after;
run;

/* reconfigured data, one observation per 1 msmt, total of 2x12=24 */
data ftest;  
   set one;
   keep subject time period;
   array times{2} before after;
   array timename{2} $ ("before","after");
   do i = 1 to 2;
      time=times{i};
      period=timename{i};
      output;
   end;
run;
proc glm;
   title "proc glm to fit model for rcbd";
   class period subject;
   model y=period subject;   /* effects of period and subject are additive */
run;
proc mixed;
   title "proc mixed to fit model for rcbd, subjects random";
   class subject period;
   model time=period;
   random subject;
   lsmeans period/diffs;
run;

/* What are "components of variance" ? */
