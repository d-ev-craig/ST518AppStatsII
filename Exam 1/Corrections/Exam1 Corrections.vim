1a. betahat1 = 1.77
1b. 2beta1hat = 2(1.77)
1c. SD(2beta1hat) = 2*SD(beta1hat) = 2(.34)
	Standard errors are for statistics, and since this is the Std. Dev of a 	statistic, this can be called a standard error.


1d. muhat(x=15=xbar) = beta0hat+beta1hat*15
			23.5+1.77*15
			ybar
			50.05


1e. var(beta0hat+beta1hat*15) = sigma^2(1/n + 0/Sxx)
				sigma^2(1/9)
			SE    = sqrt(6.96/9) = .88


1f. SD(Y10|x = xbar) SD = sqrt(var(Y10|x=xbar) = sigma
			sigma estimated by sqrt(MSE) = sqrt(6.96) = 2.64


1g. 44.7 - 43 = -1.7
1h. xbar > 0, slope and intercept are negatively correlated, because if slope is overestimated, the regression equation compensates by dropping the intercept to still get a fitted value around the same value. This applies oppositely as well, if we underestimate slope, the intercept will increase to compensate.

1i. 8+1= 9
1j. 0, since e(5) = -.47 is the 5th residual corresponding to the 50th percentile of the normal distribution which is centered on 0

2a. r^2 = .5^2 = .25
2b. E(Y|x=xbar+2sx) - E(Y|x=xbar) = betahat0+betahat1*(xbar+2sx) - (betahat0+betahat1*xbar)
				  = betahat1(2sx)
				  = (r*sy/sx)*2sx = r*sy*2 = .5*4*2 = 4
3a. 32
3b. r^2 = 1003.19/1126.05 = .89
3c. xvalues*betahat1
	=(1,1,2,2^2,70,70^2)*50.3,-.3,-9.6,.9,0.00017753)
	=28.6
3di. F=(R(beta1|beta0,beta2,beta3,beta4,beta5)/1)/MSE 
	= (.19/1)4.73 df = 1,26
	.19 comes from Type II SS for transmission/beta1

3dii. F = (R(beta1|beta0)/1)    /MSE
	= (405/1)               /(1126-405)/30)      df = 1,30
	405 is used from Type 1 SS since we aren't controlling for other vari.
	MSE df = 30 since 1126 had 31df and 405 had 1df, 31-1
	I believe you can also think of this as what the df would be if you
	weren't taking into account all 5 variables, instead only 1 variable
	under a different ANOVA table's df for Error. Which would be n-t-1 = 32-        1-1= 30
3e. F = R(beta4,beta5|beta0,beta1,beta2,beta3)/2)/MSE
	= (47.61 + 21.24/2)/4.73   df = 2,26 (2 deg change, 26 df in full model)

4a. Yij = mu + Taui + Ei iid N(0,sigma^2 = 40^2) 290-210 = 80/2 = 40 = sigma
4bi. F(3,8) : 4 manufacturers - 1 = 3 : df Err is the sum of df Err for each trt					= #oftrt(dfErrpertrt)
					= (4)(3-1=2) = 8
4bii. Ha will involve the non-centrality parameter
	ncp is going to be how far off each treatment mean is from the grandmean	summed over j = 3 for each golf ball
	3*((250-220)^2 + (250-240)^2...
	3*2000/40^2        40^2 since that is sigma^2
	= 3.75    df 3,8

4ci. Power = Pr(reject H0 when Ha true) = P(F>4.07|HA true) = 1-.28 = .72
4cii. beta = Pr(dont reject H0 when Ha true) = P(type II error) = .28

4ciii. Increase, since it causes the amount of the F distr from the NCP to be
	pushed to the right. You can think about the NCP formula, if sigma^2 is 	a smaller value,it causes the NCP to increase since the smaller the deno	minator the greater the value.

4civ. Power goes down since less variability means a smaller critical value.
4cv. Power goes down, since n will equal 2 in the NCP formula and cause a small		numerator and a smaller critical value
4cvi. Power goes up, since the critical value will decrease and leave more of		the distribution is to the right of it.

5a. thetahat = ybar4-ybar3= 271-245 =
	SE(thetahat) = sqrt(MSE*2/3) = sqrt(236* ((0^2+0^2-1^2+1^2)/3))
	= sqrt(157.33)
	= 12.54
	This is a standard error since its a statistic
5b. FWE = P(at least one type I error) 
5c. Manufacturer is 1 and 4 are significantly different due to 271-222 > 40
5d. Honestly Significant Difference
5e. t*SE(diff) = 2.31*sqrt(236*2/3) = 2.31*12.54 = 29
	m1 and m4 differ sign. 271-222 > 29
	m2 and m2 differ sign. 271-242 > 29

6a. 10-14 = -4 ybar12 - ybar11
6b. 12-20 = -8 ybar22 - ybar21
6c 11-17 = -6 ybar.2-ybar.1
6d. 16-12=4 ybar2.-ybar1.
6e. Interaction effect is the difference between simple effects
	-8 - -4 = -4

