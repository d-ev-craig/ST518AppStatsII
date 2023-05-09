options ls=140 nocenter;

data one;
  infile "trees.txt" firstobs=2;
  input girth height volume;
  girth2=girth**2;
  height2=height**2;
  gh=girth*height;
run;
proc reg data=one;
   *model volume=girth height/covb pcorr1 pcorr2 ss1 ss2;
   *model volume=girth height girth2 height2 gh/selection=cp aic aicc bic;
   model volume=girth height/ss1 ss2 pcorr1 pcorr2;
   *model volume=girth;
   *output out=two r=ryg; 
run;
/*
endsas;
proc reg data=two;
   model ryg=height;
run;
proc reg data=one;
   model height=girth;
   output out=three r=rgh;
run;
data both;
   merge two three;
run;
proc reg data=both;
   model ryg=rgh;
run;
endsas;
proc glm;
   model volume=girth height;
   estimate "15,80" intercept 1 girth 15 height 80;
run;

data fake;
   girth = 15;height=80; volume=.;
run;
data one; set one fake; run;
proc glm;
   model volume=girth height;
   output out=two p=p stdp=sepred;
run;
proc print data=two;run;
*/
