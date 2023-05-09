/*                     THIRD ANNUAL RESOLUTION RUN
                       5 KILOMETER ROAD RACE
             TAC Certified.  Registration No. NC-01009-PH
      Raleigh, North Carolina     January 1, 2004  10:00 A.M.   
			Sunny, 40's  light breeze

				Overall Results*/

options ls=125 nodate nocenter;

libname st518 "~/classes/st518/slides";

data one;
   set st518.resrun2004;
   if age=81 then pace2=.;
run;

symbol value=dot;
ods graphics on;
ods trace on;
ods listing close;
proc reg data=one plots=cooksd;
   *model pace=age;
   id place pace age sexf;
   model pace=age age2 sexf/influence;
   *plot pace*age;
   ods output cooksdplot=cdp(rename=(id1=name id2=pace id3=age id4=sexf)) ;
   output out=preds1 p=p1;
run;
proc reg data=one;
   *where age<81;
   model pace2=age age2 sexf/influence;
   output out=preds2 p=p2;
run;
ods listing ;
proc sort data=cdp; by descending cooksd;
proc print data=cdp (obs=3); title "cdp from ODS output"; 
   var pace age sexf cooksd;
run;
proc sort data=preds1; by place; run; proc sort data=preds2; by place; run;
data both; merge preds1 preds2; by place;
   diff=p1-p2;
run;
proc print data=both; title "with(p1) and without(p2) the 81 year-old runner";
   where age=81;
run;
proc sort data=both; by descending age;run;
proc means data=both mean css uss; 
   var diff;
   output out=uss uss=uss;
run;
data uss; set uss; mycooksd=uss/(4*3.19068); run;
proc print data=uss; 
   title "mycooksD computed just for age=81 subject";
run;
