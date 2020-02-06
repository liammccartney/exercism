fun name (input: string option) =
  case input of
       NONE => "One for you, one for me."
     | SOME name => "One for " ^ name ^ ", one for me."
