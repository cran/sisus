################################################################################
# Set up all necessary packages

# Add Bioconductor to list of package repositories

## commented for sisus-package
#setRepositories(ind=seq(1,7))
#pkg.names = NULL;
#pkg.names = c(pkg.names, "gdata","gtools","polyapost","sm","gclus","moments");
###pkg.names = c(pkg.names, "fdrtool","locfdr","splines"); # for density.pr(), histogram smooth curve -- density.pr() no longer works so don't use
## http://addictedtor.free.fr/graphiques/thumbs.php  #graphics
#pkg.names = c(pkg.names, "RColorBrewer","geneplotter","annotate","Biobase");  # bioconductor # for 139 Scatterplots with smoothed densities color representation (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=139)
#pkg.names = c(pkg.names, "hdrcde","ash");  # for 104 Bivariate Highest density regions (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=104)
#pkg.names = c(pkg.names, "ellipse","chplot"); # for 61 Augmented Convex Hull (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=61)
#pkg.names = c(pkg.names, "gplots"); # for 2D histogram
#pkg.names = c(pkg.names, "mvtnorm"); # drawing from a MV Normal for uncertainty in isotope measurements
#pkg.names = c(pkg.names, "rcdd"); # V and H representation of solution polytope (does not install in Windows)
#pkg.names = c(pkg.names, "Cairo"); # raster format plots
#pkg.names = c(pkg.names, "coda"); # MCMC
#
#destdir.name = "C:\\Program Files\\R\\R-2.7.0\\library";
#download.packages(pkgs = pkg.names, destdir = destdir.name);
#install.packages(pkgs = pkg.names);

# http://cran.r-project.org/src/contrib/chplot_1.2.tar.gz
# R CMD INSTALL  chplot_1.2.tar.gz
