################################################################################
# Prior on the vector of source proportions, p, is defined by the given vector alpha
prior.on.p = function (priors.sources, priors.precision, n.sources)
{
  alpha.p.dirichlet = n.sources * priors.sources;
  dirichlet.moments(alpha.p.dirichlet, priors.precision, priors.sources);
  return(alpha.p.dirichlet);
} # prior.on.p()
