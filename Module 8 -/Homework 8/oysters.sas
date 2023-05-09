/* These data taken from Freund, Littell and Spector */
options  ls=75 nodate;
    data oysters;
       input  trt junk initial final;  z=initial-27;
       if trt=5 then delete;
       cards;
    1        1        27.2        32.6
    1        2        32.0        36.6
    1        3        33.0        37.7
    1        4        26.8        31.0
    2        1        28.6        33.8
    2        2        26.8        31.7
    2        3        26.5        30.7
    2        4        26.8        30.4
    3        1        28.6        35.2
    3        2        22.4        29.1
    3        3        23.2        28.9
    3        4        24.4        30.2
    4        1        29.3        35.0
    4        2        21.8        27.0
    4        3        30.3        36.4
    4        4        24.3        30.5
    5        1        20.4        24.6
    5        2        19.6        23.4
    5        3        25.1        30.3
    5        4        18.1        21.8
    ;
proc print data=oysters noobs;
   var trt initial z final;
run ;
/*
proc means;
   var initial  z final;
run;
*/
proc glm; class trt; model final=trt;run;
        proc glm;
         class trt;
         model final=trt z  /solution ;
         lsmeans trt / stderr tdiff;
         means trt;
*         estimate 'trt 1 adj mean' intercept 1 trt 1 0 0 0 0 initial 25.76;
*         estimate 'trt 2 adj mean' intercept 1 trt 0 1 0 0 0 initial 25.76;
*         estimate 'trt 1 unadj mean' intercept 1 trt 1 0 0 0 0 initial 29.75;
*         estimate 'trt 2 unadj mean' intercept 1 trt 0 1 0 0 0 initial 27.175;
*         estimate 'unadj diff' trt 1 -1 0 0 0 initial 2.575;
*         lsmeans trt / bylevel stderr tdiff;
*         contrast 'CONTROL VS. TREATMENT' -1 -1 -1 -1 4;
*         contrast 'BOTTOM VS. TOP' -1 1 -1 1 0;
*         contrast 'INTAKE VS. DISCHARGE' -1 -1 1 1 0;
*         contrast 'BOT/TOP*INT/DIS' 1 -1 -1 1 0;
*         contrast 'CTL V UNADJUSTED' TRT -1 -1 -1 -1 4 INITIAL -24.85;
        run;
endsas;
        proc glm;
         class trt;
         model final=trt initial; 
        run;

data plot;
trt=1;
do initial=18,25.76,29.75,34;
 f_hat=3.077+1.0554*initial;
 output;
end;
trt=2;
do initial=18,25.76,27.175,34;
 f_hat=2.967+1.0554*initial;
 output;
end;
trt=3;
do initial=18,24.65,25.76,34;
 f_hat=4.834+1.0554*initial;
 output;
end;
trt=4;
do initial=18,25.76,26.425,34;
 f_hat=4.336+1.0554*initial;
 output;
end;
trt=5;
do initial=18,20.80,25.76,34;
 f_hat=3.073+1.0554*initial;
 output;
end;
axis1 value=(font=swiss2 h=2) label=(f=swiss h=2 'Final');
axis2 value=(font=swiss h=2 )label=(f=swiss h=2 'Initial');
legend1 value=(font=swiss h=2  ) label=(f=swiss h=2 'Treatment');
symbol1 color=black interpol=join
         line=1  value='1' font=swiss h=2;
symbol2 color=black interpol=join
       line=2 value='2' font=swiss h=2;
symbol3 color=black interpol=join
        line=20 value='3' font=swiss h=2;
symbol4 color=black interpol=join
       line=6 value='4' font=swiss h=2;
symbol5 color=black interpol=join
        line=9 value='5' font=swiss h=2;

proc gplot;
 plot f_hat*initial=trt/caxis=black ctext=black vaxis=axis1 haxis=axis2 legend=legend1 
     href=(20.8,24.65,25.76,26.425,27.175,29.75) vref=(25.025,30.85,31.65,32.225,34.475) ch=gray cv=gray
         vaxis=16 to 34 by 2;
run;



