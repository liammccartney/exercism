fun rebase (inBase: int, outBase: int, digits: int list): int list option =
  if null digits 
  then NONE
  else SOME [1]
