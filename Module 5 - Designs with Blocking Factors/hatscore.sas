options ls=75 nodate nocenter;

data one;
   comma=",";
   array tname{3} $ ("CD","DP","LM");
   input block @;
      do trt=1 to 3;
         therapy=tname{trt};
         input D_hatscore @;
         output;
      end;
cards; 
1 8 2 -2
2 11 1 0
3 9 12 6
4 16 11 2
5 24 19 11
;
run;
proc  print data=one noobs;
   var block comma therapy comma d_hatscore;
run;

/*proc print;run;

data one; 
   set one; 
   if therapy <=2; 
run;*/

proc glm;
   class therapy block;
   model D_hatscore=therapy block;
   means therapy/tukey cldiff;
run;

data two;
   input block hat1 hat2 hat3;
cards; 
1 8 2 -2
2 11 1 0
3 9 12 6
4 16 11 2
5 24 19 11
;
run;

proc ttest;
   paired hat1*hat2;
run;