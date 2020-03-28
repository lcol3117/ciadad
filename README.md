# CIADAD
Close In All Dimensions Anomaly Detection

*Made with **Elixir***

## CIAD distance

This is a measure of distance that only counts points as close if they are "Close In All Dimensions"

It is defined as follows:

Given data d in n dimensions as a set of length n s.t. each element is a dimension value

d = {1d,2d,...,Nd}

CIAD-distance(d1,d2) = max(\|d2\[0\]-d1\[0\]|,|d2\[1\]-d1\[1\]\|)

## CIADAD Anomaly Detection

First, perform a CIAD Distance Transform on the data

This is defined as, for each point, the CIAD-distance to the point with the lowest CIAD-distance to it

`copy the dataset`

`for i in data:`

  `reset minimum`
  
  `for i2 in data:`
  
    update minimum CIAD-dist(i,i2)
    
  `replace i with minimum in the new set`

Then sort the set

Then, calculate the median of the sorted set

**This is the threshold**

Create a lambda to take x and tell if it is less than or equal to the threshold

*In Elixir*

`fn(x) -> x<=thresh end`

**THIS IS PASSED AS DATA, SO IT IS A LAMBDA NOT AN ANONYMOUS FUNCTION**

And, use that lambda to map the data

*In Elixir*

`Enum.map(vals,fn(x) -> x<=thresh end)`

`#vals was the original, non-sorted, CIAD-distance transform`

# Use

The `CIADAD` Module contains the code.

It uses `CIA3d`, `Listops`, and `MiscMath`, which are in the elixir file.

***The data should be a list of lists***

***[[1d1,1d2,1d3],[2d1,2d2,2d3],...]***

For a list of which are anomalies:

`CIADAD.dist(data)`
