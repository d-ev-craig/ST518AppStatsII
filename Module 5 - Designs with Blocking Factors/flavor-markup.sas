options ls=85 nocenter;
data one;
length flavor $8;
input block    flavor   $    y;
datalines;
  1      Plain      13.8
  1      Vanilla    11.7
  1      RoastB     14.0
  1      Bread      12.6
  2      Plain      12.9
  2      Vanilla    16.7
  2      RoastB     15.5
  2      Bread      13.8
  3      Plain      25.9
  3      Vanilla    29.8
  3      RoastB     27.8
  3      Bread      25.0
  4      Plain      18.0
  4      Vanilla    23.1
  4      RoastB     23.0
  4      Bread      16.9
  5      Plain      15.2
  5      Vanilla    20.2
  5      RoastB     19.0
  5      Bread      13.7
  ;
  run;
  proc glm data=one;
     class block flavor;
	 model y=flavor/clparm;
	 *model y=flavor block;
	 lsmeans flavor/pdiff;
	 means flavor/scheffe tukey;
run;