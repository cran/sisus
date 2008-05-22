################################################################################
# Mass balance equations for converting isotope values to biomass values
model.mass.balance.equation = function (isotopes.mixtures, isotopes.sources, concentration.sources, efficiency.sources, biomass.per.individual.sources, number.of.individuals.sources)
{
  biomass.values = t(t(isotopes.sources) - isotopes.mixtures) * (biomass.per.individual.sources * number.of.individuals.sources) * concentration.sources * efficiency.sources;
  return(biomass.values);
} # model.mass.balance.equation()
