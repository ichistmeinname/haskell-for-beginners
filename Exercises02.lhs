> {-# LANGUAGE GADTSyntax #-}

> module Exercises02 where
>
> import qualified Lecture01_DataAndFunctions    as Data
> import qualified Lecture02_MoreData            as Data
> import           Lecture03_FunctionDefinitions

We implemented the following type synonym for a `Integer`-bound.

    type Bounds = (Integer,Integer)
          
1) Implement a function `moveWithinBounds` that yields a coordinate based on a given bound, direction and coordinate. The new coordinate changes by one unit (that is, plus 1 or minus 1) from the given coordinate in the y-component (or x-component) with respect to the given direction. If the resulting change in that component does not adhere with the given bounds, the new coordinate is identical to the given one.

> moveWithinBounds :: Data.Bounds -> Data.Bounds -> Data.Direction -> Data.Coordinate -> Data.Coordinate
> moveWithinBounds xBounds yBounds dir coords = error "moveWithingBounds: Implement me"

2) Evaluate the following expression step-by-step, specifying the demanded argument as well as the applied rule as done in the lecture, for the constant function `boolEx4`.

    ```
    boolEx4 = False && (True || True)
    ```

    boolEx4
    ^^^^^^^
  = <FILL IN STEPS HERE>

3) Consider the following `Bool`ean expressions in Haskell. Note that the operator `(==>)` is defined in the lecture notes.

   
   a) True || False && True ==> not False
   b) False ==> True ==> True
   c) False && True ==> True || False ==> True || not False

   A) Give the fully parenthesised versions of the following `Bool`ean expressions in Haskell with respect to their precedences.
   B) Give the prefix version for each expression: that is, execlusively use the prefix notation for function applications.
   
4) Given the following definition of an implication on Boolean values as well as a non-terminating constant `boolLoop`

   ```
   impl :: Bool -> Bool -> Bool
   impl True  True  = True
   impl True  False = False
   impl False _     = True

   boolLoop :: Bool
   boolLoop = boolLoop
   ```

   which of the following expression will terminate, which of them won't? Try to explain why this is the case.

   a) impl (impl (False && True) False) boolLoop
   b) boolLoop ==> True
   c) False ==> boolLoop

   Can you give an alternative implementation (or choose one from the lecture) that will terminate for one of the example that won't terminate for `impl`?

<<<------------- Exercises corresponding to lecture on 9/12/19 ------------->>>

First we define a data type for `Token`s as follows.

> data Token where
>   Blank :: Token
>   Block :: Token
                                        
Consider now the following data type that is a list-like structure like we have seen for `CoordMap` but for `Token`.

> data Row where
>   EmptyR :: Row
>   ARow   :: Token -> Row -> Row

5) Implement a function `prettyRow` that prints each `Token` of the row seperated by one whitespace.

> prettyRow :: Row -> String
> prettyRow = error "prettyField: Implement me!"

On top of these rows, we define a data type `Field` that consists of none or several `Row`s.

> data Field where
>   EmptyF :: Field
>   AField :: Row -> Field -> Field

6) Next we want to implement a function that replaces all `Token` that match the first argument with a `Blank`.
     Define this functionality for `Row` first and then for `Field`; reuse the function for `Row` for the latter!

> replaceTokenInRow :: Token -> Row -> Row
> replaceTokenInRow = error "replaceTokenInRow: Implement me!"

> replaceTokenInField :: Token -> Field -> Field
> replaceTokenInField = error "replaceTokenInField: Implement me!"

7) Last but not least, we want to implement a function to check if a field has a given token.

> hasToken :: Token -> Field -> Bool
> hasToken = error "hasToken: Implement me!"
