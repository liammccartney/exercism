using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;

public static class Pangram
{
  public static bool IsPangram(string input)
  {
    var pattern = new Regex(@"[a-zA-Z]+");
    MatchCollection matches = pattern.Matches(input.ToLower());

    var letters = "";

    foreach (Match match in matches) {
      letters = String.Concat(letters, match);
    }

    var uniqueLetters = new HashSet<char>(letters);

    return uniqueLetters.Count == 26;
  }
}
