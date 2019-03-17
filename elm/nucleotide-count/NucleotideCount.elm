module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    { a = String.length (String.filter (\x -> x == 'A') sequence)
    , t = String.length (String.filter (\x -> x == 'T') sequence)
    , c = String.length (String.filter (\x -> x == 'C') sequence)
    , g = String.length (String.filter (\x -> x == 'G') sequence)
    }
