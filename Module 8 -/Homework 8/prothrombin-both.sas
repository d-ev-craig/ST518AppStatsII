
options ls=105;

data wide;
   input before after;
   subject=_n_;
datalines;
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
run;
proc ttest data=wide;
   paired before*after;
run;

data tall;
   array tname{2} $6 _temporary_ ("before","after");
   subject=_n_;
   do i=1 to 2;
      input y @;
      trt=tname{i};
      output;
   end;
datalines;
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
proc print;run;
proc mixed data=tall method=type3;
   class subject trt;
   model y=trt;
   random subject;
   lsmeans trt;
run;
