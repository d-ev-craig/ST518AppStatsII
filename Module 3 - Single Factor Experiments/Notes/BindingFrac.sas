options ls=105 ps=1000 nocenter nodate;

data one;
   do drug=1 to 5;  
      do rep=1 to 4;
         input y @;
         x1=(drug=1);
         x2=(drug=2);
         x3=(drug=3);
         x4=(drug=4);
         x5=(drug=5);
         output;
      end;
   end;
datalines;
29.6   24.3   28.5   32  
27.3   32.6   30.8   34.8 
5.8   6.2   11   8.3 
21.6   17.4   18.3   19 
29.2   32.8   25   24.2 
;
run;
proc glm data=one;
   class drug;
   model y=drug;
   means drug/tukey;
   output out=two p=p r=r;
run;
symbol value=dot;
proc gplot;
   plot r*p;
run;