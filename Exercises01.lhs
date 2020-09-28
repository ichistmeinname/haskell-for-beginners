> {-# LANGUAGE GADTSyntax #-}

> module Exercises01 where
>
> import qualified Lecture01_DataAndFunctions as Data
> import qualified Lecture02_MoreData         as Data


In the lecture on Monday (25/11/19) we have seen the following type for `Direction`s

    data Direction where
      Up    :: Direction
      Down  :: Direction
      Left  :: Direction
      Right :: Direction
     deriving Show

as well as for XY-coordinates.

    data Coordinate where
      XYAxis :: Integer -> Integer -> Coordinate
     deriving Show

Due to the _qualified import_ above, we can only use these types, constructors and associated functions with the prefix `Data.`.

1) Define two values of type `XYAxis`.

> xyAxis1 :: Data.Coordinate
> xyAxis1 = error "xyAxis1: Implement me!"

> xyAxis2 :: Data.Coordinate
> xyAxis2 = error "xyAxis2: Implement me!"
    
2) Implement a function `eqDirection :: Direction -> Direction -> Bool` that yields `True` if the both arguments are the same and `False` otherwise.
   The data type `Bool` is predefined as follows in Haskell.

   ```
   data Bool where
     True  :: Bool
     False :: Bool
   ```

> eqDirection :: Data.Direction -> Data.Direction -> Bool
> eqDirection = error "eqDirection: Implement me!"

3) Implement a function `isVertical :: Direction -> Bool`. Such functions with result type `Bool` are often called predicates. The function shoud yield `True` for vertical direction and `False` otherwise.

4) Declare a data type for an imaginary token tile that might be moved on a coordination system. The data type `Token` should be defined analogue to `Direction` defined in the lecture: the data type `Token` should have at least four different nullary constructors and can represent a total of four values only.
   Also write a function `prettyToken :: Token -> String` that yields a pretty(!) string representation for a token.

> data Token -- Declare me!
>
> prettyToken :: Token -> String
> prettyToken = error "prettyToken: Implement me!"

5) Given the following data type.

> data Type1 where
>   C1 :: Bool -> Data.One -> Type1
>   C2 :: Data.Direction -> Bool -> Type1

How many values of type `Type1` can you construct? Define one constant function for each of these values.
