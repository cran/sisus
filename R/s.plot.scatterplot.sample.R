################################################################################
# Scatterplot matrix
#s.plot.scatterplot.sample = function (sam, n.sources, n.isotopes, names.isotopes, names.mixtures.indy, names.sources, tit, analysis.name, filename.prefix, plot.filename, plot.format.list)
s.plot.scatterplot.sample = function (p.results, p.results.name, n.sources, n.isotopes, names.isotopes, names.mixtures.indy, names.sources, analysis.name, filename.prefix, plot.filename, plot.format.list)
{
  # Scatterplots with smoothed densities color representation (http://addictedtor.free.fr/graphiques/RGraphGallery.php?graph=139)
  library("geneplotter"); # will load "annotate", "Biobase", "tools"
  library("RColorBrewer");

  for (i.plot in plot.format.list)
  {
    s.plot.settings.begin.end(filename.prefix, plot.filename, plot.mode = "begin", plot.format = i.plot);

    axis.limits = c(min(p.results), max(p.results));
    #par(new = TRUE);
    #par(bg="white")
    #par(oma=c(5,4,4,4)*2, bg="white")
    #par(mar=c(2,4,0,0)*2);
    #par(ask = TRUE)
    pairs(p.results,
          labels = names.sources,
          oma = c(5,4,4,5)*2, mar = c(4,4,2,2)*2,
          #upper.panel = function(...) { par(new=TRUE); smoothScatter(..., nrpoints=Inf, xaxt = "n", yaxt = "n"); },
          upper.panel = function(...) { par(new=TRUE); plot(..., type="p", pch=19, cex=.001, xaxt = "n", yaxt = "n"); },
          lower.panel = function(...) { par(new=TRUE); smoothScatter(..., nrpoints=0  , bandwidth=c(0.01,0.01), xaxt = "n", yaxt = "n"); },
          #upper.panel = function(...) { par(new=TRUE); smoothScatter(..., nrpoints=0); },
          #lower.panel = function(...) { par(new=TRUE); colors = densCols(...); plot(..., col=colors, pch=200); }
          #lower.panel = function(...) { par(new=TRUE); plot(..., type="p", pch=19, cex=.001); },
          #lower.panel = function(...) { par(new=TRUE); hist2d(..., nbins=20, col=c("white", heat.colors(16)) ); }
          diag.panel = diag.panel.hist,
          xlim = axis.limits,
          ylim = axis.limits,
          gap = 0
          );
    #par(xpd=TRUE);

    # box("outer", col="black")  # draw a box around the entire figure
    mtext(paste("Scatterplot Matrix"), side=1, line=1, outer=TRUE);                         # bottom
    mtext(paste("SISUS: Stable Isotope Sourcing using Sampling"), side=1, line=3, outer=TRUE);  # bottom (line specifies)
    mtext(paste(n.sources, " Sources"), side=2, line=1, outer=TRUE);                             # left
    mtext(paste(p.results.name,": ", paste(names.mixtures.indy)), cex = 1.2, side=3, line=1, outer=TRUE);          # top
    #mtext(paste(paste(names.mixtures.indy, ": ", tit)), cex = 1.2, side=3, line=1, outer=TRUE);          # top
    mtext(paste(analysis.name), cex = 0.8, side=3, line=0, outer=TRUE);                         # top   # line=-.5 in other plots
    mtext(paste(n.isotopes, "Isotopes: ", paste(sprintf("%s",names.isotopes),collapse=", ")), side=4, line=0, outer=TRUE);  # right
    #par(ask = FALSE)

    #s.plot.settings.begin.end(filename.prefix, plot.filename, plot.mode = "print");
    s.plot.settings.begin.end(filename.prefix, plot.filename, plot.mode = "end");
  } # plotting loop

} # s.plot.scatterplot.sample()
diag.panel.hist = function (x, ...)
{
  usr = par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h = hist(x, plot = FALSE)
  breaks = h$breaks; nB = length(breaks)
  y = h$counts; y = y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="steelblue3", ...)
} # diag.panel.hist()
