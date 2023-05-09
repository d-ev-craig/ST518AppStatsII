options ls=76 nocenter nodate ps=1000;
/* these data are taken from p. 91 of Fisher's
(as in Sir Ronald A. Fisher) classical text 
"The Design of Experiments."
*/

data y;
   row=_n_;
   do col=1 to 6;
      input y @;
      output;
   end;
cards;
633 527 652 390 504 416
489 475 415 488 571 282
384 481 483 422 334 646
620 448 505 439 323 384
452 432 411 617 594 466
500 505 259 366 326 420
;
run;
data design;
   row=_n_;
   do col=1 to 6;
      input trt $ @;
      output;
   end;
cards;
E B F A C D
B C D E F A
A E C B D F
F D E C A B
D A B F E C
C F A D B E
;
run;

/* 
the treatments denoted by these labels:
A - nitrogen=0, phosphate=0
B - nitrogen=0, phosphate=single
C - nitrogen=0, phosphate=double
D - nitrogen=1, phosphate=0
E - nitrogen=1, phosphate=single
F - nitrogen=1, phosphate=double
*/
data both;
   merge y design;
   by row col;
   if trt<"D" then do;  nitrogen=0; end; else do;  nitrogen=1; end;
   if trt in ("A","D") then do; phosphate=0;end;
   else if trt in ("B","E") then do;phosphate=1;end;
   else do;phosphate=2;end;
run;

proc glm data=both;
   title "Factorial effects of phosphate and nitrogen";
   class row col phosphate nitrogen;
*   model y=row col nitrogen*phosphate;
   model y=row col nitrogen|phosphate;
   estimate "nitro effect w/out phosphate" nitrogen -1 1 nitrogen*phosphate -1 1;
   estimate "nitro effect w single phosphate" nitrogen -1 1 nitrogen*phosphate 0 0  -1 1;
   estimate "nitro effect w double phosphate" nitrogen -1 1 nitrogen*phosphate 0 0  0 0  -1 1;
   
   estimate "phosphate linear" phosphate -1 0 1;
   estimate "phosphate nonlinear" phosphate 1 -2 1;
   contrast "phosphate linear" phosphate -1 0 1;
   contrast "phosphate nonlinear" phosphate 1 -2 1;
   lsmeans nitrogen*phosphate/slice=(phosphate nitrogen);
   *means row col phosphate|nitrogen;
run;

proc means data=both nway noprint;
    class phosphate nitrogen;
    var y;
    output out=bothmeans mean=ymean; 
run;
symbol value=dot i=join;
proc gplot data=bothmeans;
    plot ymean*phosphate=nitrogen;
run;