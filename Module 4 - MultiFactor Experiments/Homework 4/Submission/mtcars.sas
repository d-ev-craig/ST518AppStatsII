options ls=85 nocenter;
data one;
   length model $20;
   infile "/home/u49844961/sasuser.v94/ST518/Homework 4/mtcars.csv" firstobs=2 dsd;
  input model $ mpg  cyl  disp  hp  drat  wt  qsec  vs  am  gear  carb; 
  disp2=disp**2;  gear2=gear**2; hp2=hp**2;
run;
symbol value=dot;
*goptions dev=pdf;
proc reg;
   model  mpg=cyl disp hp drat wt qsec vs am gear carb /selection=cp aic mse;
   model  mpg=wt qsec am disp disp2;
   test disp=disp2=0;
   model  mpg=wt qsec disp disp2;
   *plot mpg*predicted.;
   *plot r.*nqq.;
   *plot r.*p.;
   output out=residz r=r p=p;
run;
proc gplot data=residz;
   title "residuals vs fitted";
   plot r*p;
run;

proc gplot data = residz;
	title "obs vs fitted";
	plot mpg*p / 
	 haxis = 10 to 35 by 1
	 vaxis = 10 to 35 by 1;
run;

/*
proc reg data=one plots=all;
   model  mpg=wt  qsec disp disp2;
   output out=two p=p r=r;
run;
proc gplot data=two;
   plot mpg*p;
   plot r*p;
run;
*/   
