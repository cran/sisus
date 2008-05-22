################################################################################
# returns the time taken since the time started
progress.time = function (time.start)
{
  time.sofar = proc.time()[3] - time.start;   # calculate time elapsed
  return(time.sofar);
} # progress.time()
