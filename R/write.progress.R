################################################################################
# write progress to the screen
write.progress = function (text.to.cat, time.start)
{
  time.sofar = progress.time(time.start);
  #cat("Progress:", time.sofar, text.to.cat);
  #capture.output(expr = cat("...", time.sofar, text.to.cat), append=TRUE, file="process_info.txt");
  #capture.output(expr = cat("...", sprintf("%8.2f",time.sofar), text.to.cat), append=TRUE, file="process_info.txt");
  capture.output(expr = cat(sprintf(">%8.2f",time.sofar), text.to.cat), append=TRUE, file="process_info.txt");
  flush.console();
} # write.progress()
