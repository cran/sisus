################################################################################
# Strip out the samples associated with the current mixture
#
indy.mixture.isotope.mvn.sample = function (isotope.mvn.sample, i.mixture, n.mixtures, n.sources, n.isotopes)
{
  # indicies for the i.mixture mvn samples and the isotope mvn samples
  ind.mixture.begin = (i.mixture-1)*n.isotopes+1;
  ind.mixture.end   = (i.mixture)*n.isotopes;
  ind.sources.begin = n.mixtures*n.isotopes+1;
  ind.sources.end   = n.mixtures*n.isotopes+n.sources*n.isotopes;

  isotope.mvn.sample.indy.mixture = cbind(t(as.matrix(isotope.mvn.sample[,seq(ind.mixture.begin,ind.mixture.end)])), t(as.matrix(isotope.mvn.sample[,seq(ind.sources.begin,ind.sources.end)])));

  return(isotope.mvn.sample.indy.mixture);

} # indy.mixture.isotope.mvn.sample()
