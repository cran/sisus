###
###
###require(hdrcde)
###pairs(sam, panel=function(...) { par(new=TRUE); hdr.boxplot.2d(..., prob=seq(0,1,0.1)); } );
###hdr.boxplot.2d(sam[,1], sam[,2], prob=seq(0,1,0.1))
###
###  # Bivariate Highest density regions (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=104)
###  # still working on
###  #pairs(sam, panel=function(...) { par(new=TRUE); hdr.boxplot.2d(..., prob=seq(0,1,0.2)) } );
###  #pairs(sam, panel=function(...) { par(new=TRUE); xy = ...[,1]; print(dim(xy)); hdr.boxplot.2d(x=xy[,1], y=xy[,2]) } );
###
###
###
####### THIS IS VERY NICE!!!
###
##### put histograms on the diagonal
###panel.hist <- function(x, ...)
###{
###    usr <- par("usr"); on.exit(par(usr))
###    par(usr = c(usr[1:2], 0, 1.5) )
###    h <- hist(x, plot = FALSE)
###    breaks <- h$breaks; nB <- length(breaks)
###    y <- h$counts; y <- y/max(y)
###    rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
###}
###pairs(USJudgeRatings[1:5], panel=panel.smooth,
###      cex = 1.5, pch = 24, bg="light blue",
###      diag.panel=panel.hist, cex.labels = 2, font.labels=2)
###
###
###
###
###require(KernSmooth)
###require(ellipse)
###require(chplot)
###
###data(hdr)
###chplot(age~income|gender,data=hdr,log="x")
###
###
###
###
###panel.hist <- function(x, ...)
###{
###    #p.results.density = density.pr(x, plot = TRUE, ncells = nbins, main=NULL, xlab = NULL, ylab=paste(names.sources[i]), xlim = c(0,1), ylim = c(0,max_y), axes = TRUE, col = "black", labels = FALSE);
###    p.results.density = density.pr(x, ncells = 100, main=NULL, xlab = NULL, ylab=NULL, xlim = c(0,1), axes = TRUE, col = "black", labels = FALSE);
###}
###
###
###diag.panel.hist <- function(x, ...)
###{
###    usr <- par("usr"); on.exit(par(usr))
###    par(usr = c(usr[1:2], 0, 1.5) )
###    h <- hist(x, plot = FALSE)
###    breaks <- h$breaks; nB <- length(breaks)
###    y <- h$counts; y <- y/max(y)
###    rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
###}
###
###s.plot.scatterplot.sample = function (sam) {
###  # Scatterplots with smoothed densities color representation (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=139)
###  library("geneplotter");  ## from BioConductor
###  require("RColorBrewer"); ## from CRAN
###  par(ask = TRUE)
###  min.sam = min(sam);
###  max.sam = max(sam);
###  pairs(sam,
###        upper.panel = function(...) { par(new=TRUE); smoothScatter(..., nrpoints=0); },
###        #lower.panel = function(...) { par(new=TRUE); colors = densCols(...); plot(..., col=colors, pch=200); }
###        lower.panel = function(...) { par(new=TRUE); plot(..., type="p", pch=19, cex=.001); },
###        #lower.panel = function(...) { par(new=TRUE); hist2d(..., nbins=20, col=c("white", heat.colors(16)) ); }
###        diag.panel = diag.panel.hist,
###        xlim = c(min.sam, max.sam),
###        ylim = c(min.sam, max.sam)
###        );
###  par(ask = FALSE)
###}
###  s.plot.scatterplot.sample(sam);  #### USE THIS FOR BIOMASS, CONCENTRATIONS, ETC...
###
###
###pairs(y, panel=function(...) {par(new=TRUE);smoothScatter(..., nrpoints=0, xaxt="n", yaxt="n")}, xlim = c(-10,5))
###
###
###
###################################################################################
###library(mvtnorm)
###m=c(0,0,0)
###s=diag(c(0,1,1))
###rmvnorm(5,m,s)
###
###
###
###################################################################################
#### yes, the variation in the isotopes (mvn) worked!  More variation below...
###
###  input.filename = "sisus_input_priors.xls";
###  input.M         = 1e3;
###  input.n.samples.isotope.mvn = 1e1;
###  input.skip      = 1e2;
###  input.burnin    = 1e3;
###  input.hist.bins = 1e2;
###  input.seed      = round(1e5*(runif(1)));
###  sisus(filename = input.filename, M = input.M, n.samples.isotope.mvn = input.n.samples.isotope.mvn, skip = input.skip, burnin = input.burnin, hist.bins = input.hist.bins, seed = input.seed);
###
###
###WITHOUT VARIATION ON ISOTOPES
###
### [1,] "Biomass Source 1   Source 2   Source 3   Source 4   Source 5   Source 6   Source 7"
### [2,] "Mean         0.06172    0.06461    0.05621    0.04438    0.19287    0.49403    0.08617"
### [3,] "Sd           0.02838    0.02834    0.02617    0.02233    0.03784    0.03606    0.01837"
### [4,] "Var          0.00081    0.00080    0.00068    0.00050    0.00143    0.00130    0.00034"
### [5,] "Skewness     0.65717    0.38378    0.74934    0.53113   -0.48109    0.04527   -0.14768"
### [6,] "Kurtosis     3.28160    2.48771    3.35808    2.70849    3.12363    2.59402    2.58993"
### [7,] ""
### [8,] "Min          0.00514    0.00395    0.00409    0.00275    0.05031    0.39053    0.03091"
### [9,] "Q1           0.04022    0.04255    0.03639    0.02705    0.17199    0.46861    0.07296"
###[10,] "Median       0.05823    0.06169    0.05250    0.04234    0.19492    0.49480    0.08754"
###[11,] "Q3           0.07775    0.08602    0.07102    0.05909    0.22013    0.51752    0.10022"
###[12,] "Max          0.17857    0.15747    0.15083    0.12194    0.28008    0.59258    0.13313"
###[13,] "Range        0.17344    0.15352    0.14674    0.11919    0.22977    0.20205    0.10222"
###[14,] "IQR          0.03753    0.04347    0.03463    0.03204    0.04814    0.04891    0.02725"
###[15,] ""
###[16,] "CIL80        0.02886    0.02989    0.02679    0.01638    0.13679    0.44674    0.06182"
###[17,] "CIU80        0.10135    0.10371    0.09177    0.07722    0.23752    0.54327    0.10898"
###[18,] "CIL90        0.02107    0.02348    0.02086    0.01359    0.12190    0.43486    0.05391"
###[19,] "CIU90        0.11562    0.11330    0.10808    0.08663    0.24811    0.55479    0.11404"
###[20,] "CIL95        0.01479    0.01911    0.01589    0.01019    0.10809    0.42465    0.04866"
###[21,] "CIU95        0.13027    0.12428    0.11903    0.09163    0.26049    0.56419    0.11985"
###[22,] "CIL98        0.01003    0.01449    0.01144    0.00870    0.09381    0.41746    0.04583"
###[23,] "CIU98        0.13662    0.13299    0.13413    0.10106    0.26842    0.57532    0.12456"
###[24,] "CIL99        0.00856    0.01315    0.00988    0.00769    0.08696    0.41170    0.04336"
###[25,] "CIU99        0.14876    0.13791    0.13769    0.10326    0.27040    0.58131    0.13024"
###
###WITH VARIATION ON ISOTOPES from 0 to 1.4 by .2
###
###first table:
### [1,] "Biomass Source 1   Source 2   Source 3   Source 4   Source 5   Source 6   Source 7"
### [2,] "Mean         0.06582    0.07450    0.06580    0.05074    0.18227    0.45392    0.10696"
### [3,] "Sd           0.03091    0.03417    0.03141    0.02508    0.04625    0.04337    0.03871"
### [4,] "Var          0.00096    0.00117    0.00099    0.00063    0.00214    0.00188    0.00150"
### [5,] "Skewness     0.54382    0.54391    0.57793    0.68055   -0.16366    0.11553    0.39879"
### [6,] "Kurtosis     2.97656    3.06452    3.07178    3.32892    2.81942    2.86495    2.62079"
### [7,] ""
### [8,] "Min          0.00268    0.00123    0.00309    0.00064    0.02527    0.31562    0.01065"
### [9,] "Q1           0.04364    0.04873    0.04289    0.03163    0.15112    0.42320    0.07873"
###[10,] "Median       0.06190    0.07120    0.06200    0.04732    0.18384    0.45337    0.10116"
###[11,] "Q3           0.08545    0.09535    0.08558    0.06646    0.21493    0.48208    0.13269"
###[12,] "Max          0.18756    0.21677    0.20506    0.15953    0.31755    0.60422    0.23143"
###[13,] "Range        0.18488    0.21554    0.20197    0.15889    0.29228    0.28860    0.22078"
###[14,] "IQR          0.04182    0.04661    0.04269    0.03483    0.06381    0.05889    0.05396"
###[15,] ""
###[16,] "CIL80        0.02805    0.03279    0.02723    0.02135    0.12100    0.39745    0.06002"
###[17,] "CIU80        0.10901    0.12048    0.10893    0.08377    0.24177    0.51107    0.16441"
###[18,] "CIL90        0.02065    0.02457    0.02071    0.01589    0.10330    0.38372    0.05059"
###[19,] "CIU90        0.12335    0.13658    0.12392    0.09605    0.25653    0.52835    0.17482"
###[20,] "CIL95        0.01523    0.01843    0.01545    0.01178    0.08671    0.37261    0.04204"
###[21,] "CIU95        0.13478    0.14982    0.13659    0.10768    0.26882    0.54159    0.18621"
###[22,] "CIL98        0.01133    0.01307    0.01088    0.00839    0.06944    0.35704    0.03235"
###[23,] "CIU98        0.14730    0.16697    0.14814    0.12156    0.28008    0.55707    0.19964"
###[24,] "CIL99        0.00895    0.01064    0.00892    0.00613    0.05813    0.34855    0.02702"
###[25,] "CIU99        0.15227    0.17663    0.15951    0.13022    0.28966    0.56810    0.20850"
###
###
###
###
##### Trying to get bmp, jpeg, png plotting to work on Linux.
###
###plot(seq(1:10))
###dev2bitmap("test.bmp", type="bit")
###dev2bitmap("test.pgm", type="pgm")
###dev2bitmap("test.jpeg", type="jpeg")
###
###
###dev2bitmap("test.png", type = "png256", height = 6, width = 6, res = 72)
###bitmap("test.png", type = "png256", height = 6, width = 6, res = 72)
###
###win.metafile("myfile.wmf")
###plot(1:10)
###dev.off()
###
###
###
###reldist(y=recent$chpermwage, yo=original$chpermwage,
###        yowgt=original$wgt, ywgt=recent$wgt,
###        bar=TRUE,
###        smooth=.8,
###        yolabs=seq(-1, 3, by=0.5),
###        ylim=c(0, 3.0),cex=0.8,
###        ylab="Relative Density",
###        xlab="Proportion of the Original Cohort")
