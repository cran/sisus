# sisus_run is used for website running using RWUI

###################################################################################
#### Running SISUS
###
#### to run:  source("F:\\USERS\\Erik\\StatAcumen\\sisus\\SISUS\\sisus_run.R")
###
###devel.sw = 0; # 1 = run from R, 0 = run using rwui
####devel.sw = 1; # 1 = run from R, 0 = run using rwui
###
###if (devel.sw == 1){ # Development using R directly
###  rm(list=ls());                                          # remove all variables
###  setwd("F:\\USERS\\Erik\\StatAcumen\\sisus\\SISUS\\work");  # set working directory
###  #setwd("F:\\USERS\\Erik\\StatAcumen\\sisus\\SISUS\\data_workbooks");  # set working directory
###  #filename = "SISUS_v01-07_template_development.xls";
###  #filename = "SISUS_v01-07_Schuur2002_BorealForestFire.xls";
###  #filename = "data_workbooks\\SISUS_v01-07_template_simplex.xls";
###  #filename = "SISUS_v01-07_Schuur2002_BorealForestFire.xls";
###  #filename = "data_workbooks\\SISUS_v01-07_PhillipsGregg2001_CaneSoil_2-1.xls";
###  #filename = "..\\data_workbooks\\SISUS_v0-08_template_development.xls";
###  filename = "SISUS_v0-08_Schuur2002_BorealForestFire.xls";
###  #filename = "..\\data_workbooks\\SISUS_v0-08_Schuur2002_BorealForestFire.xls";
###  filename = "SISUS_v0-08-010_unique_sol.xls";
###  filename = "SISUS_v0-08_template.xls";
###  filename = "SISUS_v0_08-010_template_development.xls";
###  filename = "..\\data_workbooks\\SISUS_v0_08-010_Getting_Started.xls";
###  filename = "SISUS_v0_08_Hobson2003_Geese_3-2ExampleAE.xls";
###  filename = "SISUS_v0_08_Hobson2003_Geese_3-2ExampleAE_Albumen.xls";
###  filename = "SISUSrunnotwithpriors.xls";
###  filename = "SISUS_v0_08_Hobson2003_Geese_3-2ExampleAE_Albumen_CNsimplexPlot_AECDMM.xls";
###  filename = "SISUS_v0_09_test_I2S6_20090322.xls";
###
###  dir.path = "../";
###} else { # run using web rwui
###  dir.path = "../../../";
###}
###
###########################################
#### Read subroutine functions
###########################################
###
###### dir.path = "F:\\USERS\\Erik\\StatAcumen\\sisus\\SISUS\\R-package\\sisus\\R\\"
###fun = paste(dir.path,"additional.linear.constraints.R",        sep="");  source(fun);
###fun = paste(dir.path,"assign.variables.R",                     sep="");  source(fun);
###fun = paste(dir.path,"dirichlet.moments.R",                    sep="");  source(fun);
###fun = paste(dir.path,"filename.clean.R",                       sep="");  source(fun);
###fun = paste(dir.path,"get.data.R",                             sep="");  source(fun);
###fun = paste(dir.path,"indy.mixture.isotope.mvn.sample.R",      sep="");  source(fun);
###fun = paste(dir.path,"isotope.mvn.sampling.R",                 sep="");  source(fun);
###fun = paste(dir.path,"mcmc.diagnostics.R",                     sep="");  source(fun);
###fun = paste(dir.path,"model.mass.balance.equation.R",          sep="");  source(fun);
###fun = paste(dir.path,"model.mass.balance.equation.inverse.R",  sep="");  source(fun);
###fun = paste(dir.path,"numerical.summaries.R",                  sep="");  source(fun);
###fun = paste(dir.path,"s.plot.convex.hull.R",                     sep="");  source(fun);
###fun = paste(dir.path,"s.plot.marginal.histogram.R",              sep="");  source(fun);
###fun = paste(dir.path,"s.plot.scatterplot.sample.R",              sep="");  source(fun);
###fun = paste(dir.path,"s.plot.settings.begin.end.R",              sep="");  source(fun);
###fun = paste(dir.path,"polytope.constraints.R",                 sep="");  source(fun);
###fun = paste(dir.path,"polytope.multiple.samples.R",            sep="");  source(fun);
###fun = paste(dir.path,"prior.on.p.R",                           sep="");  source(fun);
###fun = paste(dir.path,"resample.dirichlet.p.R",                 sep="");  source(fun);
###fun = paste(dir.path,"sample.from.polytope.R",                 sep="");  source(fun);
###fun = paste(dir.path,"sisus.R",                                sep="");  source(fun);
###fun = paste(dir.path,"progress.time.R",                        sep="");  source(fun);
###fun = paste(dir.path,"write.input.R",                          sep="");  source(fun);
###fun = paste(dir.path,"write.model.settings.R",                 sep="");  source(fun);
###fun = paste(dir.path,"write.out.R",                            sep="");  source(fun);
###fun = paste(dir.path,"write.progress.R",                       sep="");  source(fun);
###
#### helper functions, do not source otherwise, they run!
####fun = paste(dir.path,"sisus_install_packages.R",               sep="");  source(fun);
####fun = paste(dir.path,"sisus_newdevel.R",                       sep="");  source(fun);
####fun = paste(dir.path,"sisus_run.R     ",                       sep="");  source(fun);
###
##### if package is installed, then
### library(sisus)
### setwd("F:\\USERS\\Erik\\StatAcumen\\sisus\\SISUS\\work");  # set working directory
### filename = "SISUS_v0_09_test_I2S6_20090322.xls";
### sisus(filename)
###########################################
#### Start program
###########################################
###sisus(filename); # run SISUS
###
#### End #
