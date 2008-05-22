################################################################################
# Numerical summaries
numerical.summaries = function (p.results, p.results.name, n.sources, names.sources, names.mixtures.indy, M.actual, n.vertices, analysis.name, sample.name, output.stats.filename, mixtures.group.name, output.stats.timeseries.filename, output.stats.timeseries.filename.csv, i.mixture, SW)
{
  library("moments");

  if (n.vertices == 0) {  # M.actual == 1 removed due to unix/windows mismatch 4/23/2008 10:32AM
    p.results.novertices = p.results; # results without vertices for most numerical summaries
  } else {
    p.results.novertices = p.results[(1+n.vertices):(M.actual+n.vertices),]; # results without vertices for most numerical summaries
  }

  numsum.mean     = NULL;
  numsum.sd       = NULL;
  numsum.var      = NULL;
  numsum.skewness = NULL;
  numsum.kurtosis = NULL;
  numsum.min      = NULL;
  numsum.Q1       = NULL;
  numsum.median   = NULL;
  numsum.Q3       = NULL;
  numsum.max      = NULL;
  numsum.range    = NULL;
  numsum.IQR      = NULL;
  numsum.ciL80    = NULL;
  numsum.ciU80    = NULL;
  numsum.ciL90    = NULL;
  numsum.ciU90    = NULL;
  numsum.ciL95    = NULL;
  numsum.ciU95    = NULL;
  numsum.ciL98    = NULL;
  numsum.ciU98    = NULL;
  numsum.ciL99    = NULL;
  numsum.ciU99    = NULL;

  for (i in 1:n.sources) {
    if (M.actual == 1) {
      p.results.novertices.current = p.results.novertices[i]; # unique solution
      p.results.current = p.results.novertices.current;
    } else {
      p.results.current = sort(p.results[,i]);
      p.results.novertices.current = sort(p.results.novertices[,i]); # sort multiple solutions
    }

    # indices of sorted samples
    ind.min   = 1;
    ind.Q1    = max(floor(0.25*M.actual),1);
    ind.M     = max(floor(0.5*M.actual),1);
    ind.Q3    = floor(0.75*M.actual)+1;
    ind.max   = M.actual+n.vertices;
    ind.ciL80 = floor((1-.80)/2*M.actual)+1;
    ind.ciU80 = floor((1+.80)/2*M.actual)+1;
    ind.ciL90 = floor((1-.90)/2*M.actual)+1;
    ind.ciU90 = floor((1+.90)/2*M.actual)+1;
    ind.ciL95 = floor((1-.95)/2*M.actual)+1;
    ind.ciU95 = floor((1+.95)/2*M.actual)+1;
    ind.ciL98 = floor((1-.98)/2*M.actual)+1;
    ind.ciU98 = floor((1+.98)/2*M.actual)+1;
    ind.ciL99 = floor((1-.99)/2*M.actual)+1;
    ind.ciU99 = floor((1+.99)/2*M.actual)+1;

    # min, max, range uses vertices; all others do not use vertices
    numsum.mean     = c(numsum.mean    , mean(p.results.novertices.current));
    numsum.sd       = c(numsum.sd      , sd(p.results.novertices.current));
    numsum.var      = c(numsum.var     , var(p.results.novertices.current));
    numsum.skewness = c(numsum.skewness, skewness(p.results.novertices.current));
    numsum.kurtosis = c(numsum.kurtosis, kurtosis(p.results.novertices.current));
    numsum.min      = c(numsum.min     , p.results.current[ind.min]);
    numsum.Q1       = c(numsum.Q1      , p.results.novertices.current[ind.Q1]);
    numsum.median   = c(numsum.median  , p.results.novertices.current[ind.M]);
    numsum.Q3       = c(numsum.Q3      , p.results.novertices.current[ind.Q3]);
    numsum.max      = c(numsum.max     , p.results.current[ind.max]);
    numsum.range    = c(numsum.range   , p.results.current[ind.max] - p.results.current[ind.min]);
    numsum.IQR      = c(numsum.IQR     , p.results.novertices.current[ind.Q3] - p.results.novertices.current[ind.Q1] );
    numsum.ciL80    = c(numsum.ciL80   , p.results.novertices.current[ind.ciL80]);
    numsum.ciU80    = c(numsum.ciU80   , p.results.novertices.current[ind.ciU80]);
    numsum.ciL90    = c(numsum.ciL90   , p.results.novertices.current[ind.ciL90]);
    numsum.ciU90    = c(numsum.ciU90   , p.results.novertices.current[ind.ciU90]);
    numsum.ciL95    = c(numsum.ciL95   , p.results.novertices.current[ind.ciL95]);
    numsum.ciU95    = c(numsum.ciU95   , p.results.novertices.current[ind.ciU95]);
    numsum.ciL98    = c(numsum.ciL98   , p.results.novertices.current[ind.ciL98]);
    numsum.ciU98    = c(numsum.ciU98   , p.results.novertices.current[ind.ciU98]);
    numsum.ciL99    = c(numsum.ciL99   , p.results.novertices.current[ind.ciL99]);
    numsum.ciU99    = c(numsum.ciU99   , p.results.novertices.current[ind.ciU99]);
  } # i

  # make source names a common length, either by shortening or by padding with spaces
  var.len = 8; # column length for output
  nchar.names.sources = nchar(names.sources);
  names.sources.padded = names.sources;
  for (i in seq(1,n.sources)) {
    if (nchar.names.sources[i] < var.len) {
      names.sources.padded[i] = paste(paste(rep(" ", var.len-nchar.names.sources[i]-1),collapse=""), names.sources[i]);
    }
  }

  # if timeseries, create a sequence of means file
  if (SW$time.series.sw == 1) {
    ts.var.len = 9;
    current.names.mixtures = names.mixtures.indy;
    nchar.current.names.mixtures = nchar(current.names.mixtures);
    if (nchar.current.names.mixtures < ts.var.len) {
      current.names.mixtures = paste(current.names.mixtures, paste(rep(" ", ts.var.len-nchar.current.names.mixtures-1),collapse=""));
    }
  } # if SW$time.series.sw

  # output consists of a header, the stats, and a footer
  # header
  output.header =
    rbind(
      paste("SISUS: Feasible Source Contributions of ", paste(sprintf("%s to %s", p.results.name, names.mixtures.indy))),
      paste("       ", paste(sprintf("%s", analysis.name)), sep=""),
      paste("       ", paste(sprintf("%s", sample.name)), sep=""),
      paste(""),
      paste("STATS      ", paste(sprintf("%s", substr(names.sources.padded, 1, var.len)), collapse="   "))
    );
  if (SW$time.series.sw == 1) {
    output.header.ts =
      rbind(
        paste("SISUS: Feasible Source Contributions of ", paste(sprintf("%s to %s", p.results.name, mixtures.group.name)), " as time series"),
        paste("       ", paste(sprintf("%s", analysis.name)), sep=""),
        paste("       ", paste(sprintf("%s", sample.name)), sep=""),
        paste(""),
        paste("STATS      ", paste(sprintf("%s", substr(names.sources.padded, 1, var.len)), collapse="   "))
      );
    output.header.csv = t(as.data.frame(c(p.results.name,substr(names.sources.padded, 1, var.len))));
  } # if SW$time.series.sw

  # stats
  if (M.actual==1) { # Unique solution
    output.STATS =
      rbind(
        paste("Unique     ", paste(sprintf("% 1.5f",numsum.mean    )     , collapse="   "))
      );
    if (SW$time.series.sw == 1) {
      output.MeanOnly.txt = paste("U", current.names.mixtures, paste(sprintf("% 1.5f",numsum.mean    )     , collapse="   "));
      output.MeanOnly.csv = t(as.data.frame(c(paste("U", current.names.mixtures), numsum.mean)));
    } # if SW$time.series.sw
  } else {  # Polytope solution
    output.STATS =
      rbind(
        paste("Mean       ", paste(sprintf("% 1.5f",numsum.mean    )     , collapse="   ")),
        paste("Sd         ", paste(sprintf("% 1.5f",numsum.sd      )     , collapse="   ")),
        paste("Var        ", paste(sprintf("% 1.5f",numsum.var     )     , collapse="   ")),
        paste("Skewness   ", paste(sprintf("% 1.5f",numsum.skewness)     , collapse="   ")),
        paste("Kurtosis   ", paste(sprintf("% 1.5f",numsum.kurtosis)     , collapse="   ")), paste(""),
        paste("Min        ", paste(sprintf("% 1.5f",numsum.min     )     , collapse="   ")),
        paste("Q1         ", paste(sprintf("% 1.5f",numsum.Q1      )     , collapse="   ")),
        paste("Median     ", paste(sprintf("% 1.5f",numsum.median  )     , collapse="   ")),
        paste("Q3         ", paste(sprintf("% 1.5f",numsum.Q3      )     , collapse="   ")),
        paste("Max        ", paste(sprintf("% 1.5f",numsum.max     )     , collapse="   ")),
        paste("Range      ", paste(sprintf("% 1.5f",numsum.range   )     , collapse="   ")),
        paste("IQR        ", paste(sprintf("% 1.5f",numsum.IQR     )     , collapse="   ")), paste(""),
        paste("CIL80      ", paste(sprintf("% 1.5f",numsum.ciL80   )     , collapse="   ")),
        paste("CIU80      ", paste(sprintf("% 1.5f",numsum.ciU80   )     , collapse="   ")),
        paste("CIL90      ", paste(sprintf("% 1.5f",numsum.ciL90   )     , collapse="   ")),
        paste("CIU90      ", paste(sprintf("% 1.5f",numsum.ciU90   )     , collapse="   ")),
        paste("CIL95      ", paste(sprintf("% 1.5f",numsum.ciL95   )     , collapse="   ")),
        paste("CIU95      ", paste(sprintf("% 1.5f",numsum.ciU95   )     , collapse="   ")),
        paste("CIL98      ", paste(sprintf("% 1.5f",numsum.ciL98   )     , collapse="   ")),
        paste("CIU98      ", paste(sprintf("% 1.5f",numsum.ciU98   )     , collapse="   ")),
        paste("CIL99      ", paste(sprintf("% 1.5f",numsum.ciL99   )     , collapse="   ")),
        paste("CIU99      ", paste(sprintf("% 1.5f",numsum.ciU99   )     , collapse="   "))
      );
    if (SW$time.series.sw == 1) {
      output.MeanOnly.txt = paste("M", current.names.mixtures, paste(sprintf("% 1.5f",numsum.mean    )     , collapse="   "));
      output.MeanOnly.csv = t(as.data.frame(c(paste("U", current.names.mixtures), numsum.mean)));
    } # if SW$time.series.sw
  }

  # M.actual, number of samples
  if (M.actual==1) { # Unique solution
    output.M = NULL;
  } else {
    output.M =
      rbind(
        paste(""),
        paste("Samples     ", paste(sprintf("%d",M.actual)                      , collapse="   "))
      );
  }

  if ((SW$solution.polytope.vertices.sw == 1) && (n.vertices > 0)) {
    # polytope vertices
    if (M.actual==1) { # Unique solution
      output.VERTICIES = NULL;
    } else {  # Polytope solution
      # create a table of the vertices, one row at a time, then attache it to the end of the output.VERTICIES
      temp.VERTICIES = NULL;
      for (i.v in seq(1:n.vertices)) {
        temp.VERTICIES =
        rbind(
          temp.VERTICIES,
          paste("           ", paste(sprintf("% 1.5f",p.results[i.v,])     , collapse="   "))
        );
      }
      output.VERTICIES =
        rbind(
          paste(""),
          paste("Solution Polytope Vertices ", paste(sprintf("%d",n.vertices) , collapse="   ")),
          temp.VERTICIES
        );
    }
  } else {
      output.VERTICIES = NULL;
  }; # end if SW$solution.polytope.vertices.sw

  # footer
  output.footer =
    rbind(
      paste(""), paste("")
    );

  # combine output sections
  output.PRINT = rbind(output.header, output.STATS, output.M, output.VERTICIES, output.footer);

  # if timeseries, create a sequence of means file
  if (SW$time.series.sw == 1) {
    if (i.mixture == 1) {
      # write header on first mixture
      write(output.header.ts, file = output.stats.timeseries.filename, append = TRUE);
      write.table(output.header.csv, file = output.stats.timeseries.filename.csv, append=TRUE, quote=TRUE, sep=",", eol="\n", na="NA", dec=".", row.names=FALSE, col.names=FALSE, qmethod="escape");
    }
    write(output.MeanOnly.txt, file = output.stats.timeseries.filename, append = TRUE);  # output mean only (either Unique or Mean)
    write.table(output.MeanOnly.csv, file = output.stats.timeseries.filename.csv, append=TRUE, quote=TRUE, sep=",", eol="\n", na="NA", dec=".", row.names=FALSE, col.names=FALSE, qmethod="escape");
  } # if SW$time.series.sw


  # write stats for individual mixture
  #print(output.PRINT);  # print to screen
  write(output.PRINT, file = output.stats.filename, append = TRUE);

} # numerical.summaries()

################################################################################
# write.Ab writes out the linear constraints to the process_info.txt file
write.Ab = function (Ab)
{
  # matrix sizes
  n.row.A1 = dim(Ab$A1)[1];  n.col.A1 = dim(Ab$A1)[2];
  n.row.A2 = dim(Ab$A2)[1];  n.col.A2 = dim(Ab$A2)[2];
  n.row.A3 = dim(Ab$A3)[1];  n.col.A3 = dim(Ab$A3)[2];

  p.o = "\n"; write.out(p.o);
  p.o = "\nLinear System values, solving for p\n"; write.out(p.o);
  # 1:  Ax=b;
  p.o = "\n  These linear equalities are the primary linear system\n"; write.out(p.o);
  p.o = "\n    Ap = b\n\n"; write.out(p.o);
  for (j.A1 in seq(1,n.row.A1)) {
    row.text = "    ";
    for (i.A1 in seq(1,n.col.A1)) {
      #row.text <- paste(row.text, Ab$A1[j.A1, i.A1], " p", i.A1);
      row.text <- paste(row.text, sprintf("%+8.7g",Ab$A1[j.A1,i.A1]), " p", i.A1, sep="");
      if (i.A1 < n.col.A1) {
        row.text <- paste(row.text, " + ", sep="");
      } else {
        row.text <- paste(row.text, " = ", sep="");
      }
    }
    row.text <- paste(row.text, sprintf("%+8.7g",Ab$b1[j.A1]), "\n", sep="");
    p.o = row.text; write.out(p.o);
  }

  p.o = "\n  These inequalities say the proportions are between 0 and 1,\n    or come from additional specified linear constraints\n"; write.out(p.o);
  # 3:  Ax>=b;
  p.o = "\n    Ap >= b\n\n"; write.out(p.o);
  for (j.A3 in seq(1,n.row.A3)) {
    row.text = "    ";
    for (i.A3 in seq(1,n.col.A3)) {
      #row.text <- paste(row.text, Ab$A3[j.A3, i.A3], " p", i.A3);
      row.text <- paste(row.text, sprintf("%+8.7g",Ab$A3[j.A3,i.A3]), " p", i.A3, sep="");
      if (i.A3 < n.col.A3) {
        row.text <- paste(row.text, " + ", sep="");
      } else {
        row.text <- paste(row.text, " >= ", sep="");
      }
    }
    row.text <- paste(row.text, sprintf("%+8.7g",Ab$b3[j.A3]), "\n", sep="");
    p.o = row.text; write.out(p.o);
  }
  # 2:  Ax<=b;
  p.o = "\n    Ap <= b\n\n"; write.out(p.o);
  for (j.A2 in seq(1,n.row.A2)) {
    row.text = "    ";
    for (i.A2 in seq(1,n.col.A2)) {
      #row.text <- paste(row.text, Ab$A2[j.A2, i.A2], " p", i.A2);
      row.text <- paste(row.text, sprintf("%+8.7g",Ab$A2[j.A2,i.A2]), " p", i.A2, sep="");
      if (i.A2 < n.col.A2) {
        row.text <- paste(row.text, " + ", sep="");
      } else {
        row.text <- paste(row.text, " <= ", sep="");
      }
    }
    row.text <- paste(row.text, sprintf("%+8.7g",Ab$b2[j.A2]), "\n", sep="");
    p.o = row.text; write.out(p.o);
  }

} # write.Ab()

