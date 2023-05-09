data one;
   input driver @;
   do cartype = 1 to 4;
     input mpg blend $ @;
blend1=(blend="(A)")-(blend="(D)");
blend2=(blend="(B)")-(blend="(D)");
blend3=(blend="(C)")-(blend="(D)");
     output;
   end;
cards;
1  15.5 (A)  33.8 (B)  13.7 (C)  29.2 (D) \\
2  16.3 (B)  26.4 (C)  19.1 (D)  22.5 (A) \\
3  10.5 (C)  31.5 (D)  17.5 (A)  30.1 (B) \\
4  14.0 (D)  34.5 (A)  19.7 (B)  21.6 (C) 
;
run;
proc print;run;
proc mixed method=type3;
   title "to get estimates of differences from blend4";
   class  driver cartype blend;
   model mpg=blend/s;
   random cartype driver;
run;
proc mixed method=type3;
   title "to get estimates of differences from mu";
   class  driver cartype ;
   model mpg=blend1-blend3/s;
   random cartype driver;
run;
