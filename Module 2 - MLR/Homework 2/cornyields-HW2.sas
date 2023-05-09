
options ls=115 nocenter ps=1000 nodate;
data one;
   input yield rain;
*   year=1902+_n_;
*   year=_n_;
   year=_n_ + 1889;
   *rain=round(rain,1);
*   rainclass=rain;
   rain2=rain*rain;
   rain_year=rain*year;
   rain2_year=rain2*year;
   cards;
24.5 9.6
33.7 12.9
27.9 9.9
27.5 8.7
21.7 6.8
31.9 12.5
36.8 13
29.9 10.1
30.2 10.1
32.0 10.1
34.0 10.8
19.4 7.8
36.0 16.2
30.2 14.1
32.4 10.6
36.4 10
36.9 11.5
31.5 13.6
30.5 12.1
32.3 12
34.9 9.3
30.1 7.7
36.9 11
26.8 6.9
30.5 9.5
33.3 16.5
29.7 9.3
35.0 9.4
29.9 8.7
35.2 9.5
38.3 11.6
35.2 12.1
35.5 8
36.7 10.7
26.8 13.9
38.0 11.3
31.7 11.6
32.6 10.4
;
run;
/*
proc print data=one noobs;
run;
endsas;
*goptions device=pdf;
*/
ods trace on;
proc reg;
   model yield=rain;              *slr;
   model yield=rain rain2/ss1 ss2;        *quad;
   model yield=rain year /ss1 ss2;*partial ss1 ss2; *additive;
   model yield=rain rain2 year rain_year rain2_year/ss1 ss2 ;*partial ss1 ss2 selection=cp;
   m4vsm3: test rain2=0,rain_year=0,rain2_year=0;
   m4vsm5: test rain2=0, year=0;
   m4vsm2: test year=0, rain_year=0, rain2_year=0; 
   *model yield=rain rain2 year rain_year rain2_year/ss1 ss2 selection=cp;*partial ss1 ss2 selection=cp;
   model yield=rain rain_year rain2_year;
   model yield=rain year rain_year/ss1 ss2;*partial ss1 ss2; 
   *plot predicted.*rain;
   ods output parameterestimates=parms;
   *model yield=rain;
   *plot yield*rain; 
run;

*proc glm; 
proc glm data=one; 
   title "model6"; title2 different slopes;
   model yield = rain|year;
   estimate "rain slope in 1900" rain 1 rain*year 1900;
run;
   

endsas;
proc print data=parms noobs;
   var model variable estimate;
run;
endsas;
proc glm;
   class rainclass;
   model yield=rain|rain|year /solution;
   *model year yield=rain;
   output out=out1 r=ryear_rain ryield_rain;
run;
proc glm;
   class rainclass;
   model yield=rain|year rain*rain/solution;
   output out=out1 r=ryear_rain ryield_rain;
endsas;
/*
proc gplot;
   title "leverage plot";
   plot ryield_rain*ryear_rain;
run;
proc gplot;
   title "residuals from SLR on yield against year";
   plot ryield_rain*year;
run;
*/
proc corr;
   var ryield_rain ryear_rain year rain yield;
run;
proc glm;
   class rainclass;
   *model yield=rain|rain year|year/solution;
   model year yield=rain rain2;
   output out=two r=ryear_qrain ryield_qrain;
run;
proc gplot;
   title "leverage plot for quadratic regression on rain, rain2";
   plot ryield_qrain*ryear_qrain;
run;
proc gplot;
   plot ryield_qrain*year;
run;
proc corr;
   var ryield_qrain ryear_qrain year rain rain2;
run;
endsas;
proc reg;
   model yield=rain year/partial;
run;
proc corr;
   var yield rain year;
run;
endsas;
/*
SAS has trouble inverting X'X for this problem.  Round-off error leads
to certain elements of X'X being non-zero when they're really 0.  There
is an option to change the minimum non-zero value, which is set by
default at .0000001, which the SAS documentation suggests may be too
small for some purposes.  I changed it in the code above and got the
right lack-of-fit test. 
 
http://v8doc.sas.com/sashtml/stat/chap30/sect19.htm#glmmodel
*/
