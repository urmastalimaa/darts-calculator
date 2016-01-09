# darts-calc

## Finding a finish

*find-finish* calculates the shortest valid check out from a given darts remaining count.
E.g
```
> cabal run find-finish 81 
> [T15,D18]
> cabal run find-finish 99
> [2,T19,D20]
```

## Check-out table

*checkout-table* calculates the check-out table for counts 40 to 180
```
> cabal run checkout-table
```

### Checkout preferences

* Double-bull is considered as a last resort
* High-value finishers are preferred (usually D20).
