

data one;
    input  density $ loc $ y;
datalines;  
28	      lewis         	66.227
28	      lewis         	61.499
28	      lewis         	58.784
28	      plymouth      	168.414
28	      plymouth      	140.175
28	      plymouth      	138.251
33	      lewis         	59.603
33	      lewis         	54.851
33	      lewis         	61.487
33	      plymouth      	140.414
33	      plymouth      	147.098
33	      plymouth      	162.199
38	      lewis         	48.253
38	      lewis         	43.667
38	      lewis         	52.87
38	      plymouth      	135.214
38	      plymouth      	193.406
38	      plymouth      	173.252
43	      lewis         	44.958
43	      lewis         	48.914
43	      lewis         	46.908
43	      plymouth      	179.245
43	      plymouth      	166.719
43	      plymouth      	171.507
;
run;

/*
3a:
yijk = mu + alpha_i + beta_j + alphabeta_ij + e_ijk 
i=1,2,3,4
j=1,2
k=1,2,3

possible conclusions:
Reject H0
Do not reject H0

conclusion we never get to make without a power analysis:
there is no main effect of density 
*/

/*
3b: see output
3c: loc*density: .046
    
3d: contrasts 
     H0: no main effect of density 
          ie H0: alphai=== 0
          If we check the Type I SS of our ANOVA table, it states density is insignificant at .89
          but if we look at the density effects at each location, a different story emerges.
          
          linear density: SS 1558.05 and pval .0083, we 
          conclusion we never get to make without a power analysis:
          there is no main effect of density since our assumptions about the locations are incorrect
          
3e: flip order of factors in model statement and re-run for interaction plot

3f: The effects of density at plymouth are significant and positivetly correlated with yeild
    The effects of density at lewiston are insignificant and negatively correlated with yield
    both are linear relationships
    
estimates
   density linear at plymouth: SS= 1162.075 & Pval= .0193
    denisty linear at lewiston: SS= 472.311 & Pval = .1167
    linear density by location: SS= 1558.045300	Pval =0.0083


*/
ods graphics on;

proc glm data=one ;
   class loc density ;
   model y=density|loc;
   lsmeans density*loc;
   estimate "density linear at plymouth" density -3 -1 1 3 density*loc 0 0 0 0   -3 -1 1 3 ;
   estimate "density linear at lewiston" density -3 -1 1 3 density*loc -3 -1 1 3 ;
   estimate "linear density by location" density*loc 3 1 -1 -3   -3 -1 1 3 ;
   contrast "density linear at plymouth" density -3 -1 1 3 density*loc 0 0 0 0   -3 -1 1 3 ;
   contrast "density linear at lewiston" density -3 -1 1 3 density*loc -3 -1 1 3 ;
   contrast "linear density by location" density*loc 3 1 -1 -3   -3 -1 1 3 ;
   output out=rez r=r p=p;
run;
proc gplot data=rez;
   plot r*p=loc;
run;
*ods pdf close;
endsas;   

 
   28        ,      lewis         ,       66.227
   28        ,      lewis         ,       61.499
   28        ,      lewis         ,       58.784
   28        ,      plymouth      ,      168.414
   28        ,      plymouth      ,      140.175
   28        ,      plymouth      ,      138.251
   33        ,      lewis         ,       59.603
   33        ,      lewis         ,       54.851
   33        ,      lewis         ,       61.487
   33        ,      plymouth      ,      140.414
   33        ,      plymouth      ,      147.098
   33        ,      plymouth      ,      162.199
   38        ,      lewis         ,       48.253
   38        ,      lewis         ,       43.667
   38        ,      lewis         ,       52.870
   38        ,      plymouth      ,      135.214
   38        ,      plymouth      ,      193.406
   38        ,      plymouth      ,      173.252
   43        ,      lewis         ,       44.958
   43        ,      lewis         ,       48.914
   43        ,      lewis         ,       46.908
   43        ,      plymouth      ,      179.245
   43        ,      plymouth      ,      166.719
   43        ,      plymouth      ,      171.507
