#!/usr/bin/env -S wolframscript -print

Distances[list_, n_] := Map[Abs[n - #] &, list]

Fuel1[list_] = Total @ Distances[list, Median[list]]

Fuel2[list_, f_] := Total @ PolygonalNumber @ Distances[list, f @ Mean[list]]
Fuel2[list_] := Min[Fuel2[list, Floor], Fuel2[list, Ceiling]]

input = First[Import[DirectoryName[$InputFileName] <> "input.txt", "CSV"]]

{Fuel1[input], Fuel2[input]}
