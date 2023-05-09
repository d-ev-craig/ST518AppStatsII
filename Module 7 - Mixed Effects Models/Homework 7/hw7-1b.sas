/*
"Derive expected value of marginal means"

E(Yijk) = mu + alphai + betaj 
Ybar1.. = 1/7 ((Y111 + Y112 + Y113 + ... + Y116) + Y121) 
E(Ybar1..) = 1/7 (7mu + 7alpha1 + 6beta1 + beta2) 
           = mu + alpha1 + 6/7 beta1 + 1/7 beta2 (an ESTIMABLE qty)


E(Ybar2..) = 
E(Ybar.1.) = 
E(Ybar.2.) = 
-------------------
*/
data chol;
   input age $ gender $ y;
   if age="sr" and gender="m" and y=267 then delete; 
cards;
jr       w       162
jr       m       271
jr       m       192
jr       m       189
jr       m       209
jr       m       227
jr       m       236
sr       w       262
sr       w       193
sr       w       224
sr       w       201
sr       w       161
sr       w       178
sr       w       265
sr       m       267
sr       m       289
;
run;
   
PROC GLM; 
   CLASS age gender;
   MODEL y=age gender/SOLUTION CLPARM INVERSE;
   MEANS age gender;
   LSMEANS age gender/STDERR;
   ESTIMATE "age effect" age 1 -1;  *alpha1-alpha2; *same as type III F-test for age effect;
   ESTIMATE "young men" intercept 1 age 1 0 gender 1 0;  *mu + alpha1 + beta1;
   ESTIMATE "older men" intercept 1 age 0 1 gender 1 0;  *model Yijk = mu + alphai + betaj + Eijk;
   ESTIMATE "young women" intercept 1 age 1 0 gender 0 1; *mu + alpha1 + beta2;
   ESTIMATE "older women" intercept 1 age 0 1 gender 0 1; *mu + alpha1 + beta2;
RUN;
/*
proc means;
   class age gender;
   var y;
run;
*/


