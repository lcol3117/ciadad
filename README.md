# CIADAD
Close In All Dimensions Anomaly Detection

*Made with **Elixir***

# CIAD distance

This is a measure of distance that only counts points as close if they are "Close In All Dimensions"

It is defined as follows:

Given data d in n dimensions as a set of length n s.t. each element is a dimension value

d = {1d,2d,...,Nd}

CIAD-distance(d1,d2) = max(\|d2\[0\]-d1\[0\]|,|d2\[1\]-d1\[1\]\|)

# CIADAD Anomaly Detection

First, perform a CIAD Distance Transform on the data

This is defined as, for each point, the CIAD-distance to the point with the lowest CIAD-distance to it

