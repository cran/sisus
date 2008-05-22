################################################################################
# write directly to the screen
write.out = function (text.to.cat)
{
  #cat(text.to.cat);
  capture.output(expr = cat(text.to.cat), append=TRUE, file="process_info.txt");
  flush.console();
} # write.out()
