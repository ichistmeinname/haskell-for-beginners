> {-# LANGUAGE GADTSyntax #-}
>
> module Exercises05 where
>
> import Lecture09_IO (getNumber)

1. In Haskell `String`s are list of `Char`s. The following definitions should transform the given string "HelloWorld" such that it yields the string specified by the comment above. You are only allowed to use generic list functions like `map`, `foldr`, `filter`, but no manual pattern matching, for the implementation.

> -- str1 "HelloWorld" = "HelloWorld!"
> str1 :: String -> String
> str1 = error "str1: Implement me!"
>
> -- str2 "HelloWorld" = "IfmmpXpsme"
> str2 :: String -> String
> str2 = error "str2: Implement me!"
>
> -- str3 "HelloWorld" = "HllWrld"
> str3 :: String -> String
> str3 = error "str3 : Implement me!"
  
2. Implement a function `getInBounds :: Int -> Int -> IO Int` that reads a number from the user. If the value is not within the given bounds, the user needs to try again to type in a number that meets the bounds. The implementation should additionally behave as illustrated below.

   $> getInBounds 12 16
   Please type in a number between 12 and 16.
   131
   The number does not meet the given bounds, please try again.
   13s
   This input is not a number, please try again.
   13

Hint: You should reuse `getNumber` defined in the lectures as well as the helper function `inBounds` (based on an implmentation given in `Lecture.MoreData`).

> getInBounds :: Int -> Int -> IO Int
> getInBounds = error "getInBounds: Implement me!"
>
> inBounds :: Int -> ((,) Int Int) -> Bool
> inBounds x (xMax, xMin) = (x <= xMax) && (x >= xMin)


3. Implement a more general function `getStringWithCondition :: (String -> Bool) -> IO String` that reads a string from the user and only yield this value if the string obeys to the corresponding prediate. If the predicate does not hold, the user should be informed to try it again.

> getStringWithCondition :: (String -> Bool) -> IO String
> getStringWithCondition pStr = error "getWithCondition: Implement me!"

4. Implement an interactive number guessing game. The game `guessNumber` expects the "secret number" as argument and gives feedback for each guess and the game is completed, if the guessed number matches the secret. Otherwise the user gets feedback if the guess was "too small" or "too large".
Hint: Reuse the function `getNumber` from the lecture.

> guessNumber :: Int -> IO ()
> guessNumber = error "guessNumber: Implement me!"

A round might look like this! Note, that this is a two-player game: the user starting the game shouldn't be the one guessing the numbers ; )
  
     $> guessNumber 421
     Let's try to guess the number!
     12
     Your guess is too small. Try again.
     100
     Your guess is too small. Try again.
     200
     Your guess is too small. Try again.
     300
     Your guess is too small. Try again.
     400
     Your guess is too small. Try again.
     500
     Your guess is too large. Try again.
     450
     Your guess is too large. Try again.
     425
     Your guess is too large. Try again.
     413
     Your guess is too small. Try again.
     420
     Your guess is too small. Try again.
     422
     Your guess is too large. Try again.
     421
     Congrats, you guessed the number!

5. Give the types for the following expressions.

   a) `map ((+) 1)`
   b) `[(+) 1, (*) 2, div 3]`
   c) `foldr (+)`
   d) `filter ((>) 4)`
   e) `map (*)`

6. Which of these type signatures are valid for the function `map`.

   a) `map :: (Int -> Bool) -> [] Int  -> [] Bool`
   b) `map :: (Int -> Bool) -> [] Bool -> [] Int`
   c) `map :: (Bool -> String) -> ([] Bool -> [] String)`
   d) `map :: Bool -> (Bool -> [] Bool -> [] Bool)`
   e) `map :: String -> (Bool -> [] String) -> [] Bool`

7. We want to represent a set of `Int` values as function `Int -> Bool`, that is, the resulting `Bool` indicates if the argument passed is part of the set (for `True`) or not (for `False`).

> type Set = Int -> Bool

We can, for example, define the empty set as follows.

> empty :: Set
> empty = \_ -> False

Since our representation of `Set` is a function, the empty set is the function that yields `False` for every argument: because no value is part of the empty set! That is, the representation of our function is based on the "lookup"-function (we used the first idea in the lecture (see `Misc.hs` for reference)).
The idea becomes more clear when we "inline" the type synonym `Set` (here we use an additional comment) and rename the `set`-variable to `isInSet` to indicate that this argument is a function that yields a boolean value (i.e., a predicate).

   > isElem :: Int -> Set -> Bool
   > -- isElem val set = set val
   > -- isElem :: Int -> (Int -> Bool) -> Bool
   > isElem val isInSet = isInSet val
      
> -- Yields `True` if the given `Int`-value is part of the `Set`, `False` otherwise.
> isElem :: Int -> Set -> Bool
> isElem val isInSet = isInSet val

Based on this representation, define the following functions.

> -- Inserts the first argument to the `Set`.
> insert :: Int -> Set -> Set
> insert = error "insert: Implement me!"
>
> -- The new set should yield `True` if a value is in the first set or if it is part of the second set.
> union :: Set -> Set -> Set
> union = error "union: Implement me!"
>
> -- The new set should yield `True` if a value is in the first set and of the second set.
> intersection :: Set -> Set -> Set
> intersection = error "intersection: Implement me!"

For testing purposes, you want the following properties to hold.

    $> isElem 5 empty
    False
    $> isElem 12435 empty
    False
    $> isElem 5 (insert 5 empty)
    True
    $> isElem 5 (union (insert 4 empty) (insert 3 empty))
    False
    $> isElem 4 (union (insert 4 empty) (insert 3 empty))
    True
    $> isElem 3 (union (insert 4 empty) (insert 3 empty))
    True
    $> isElem 4 (intersection (insert 4 empty) (insert 3 empty))
    False
    $> isElem 4 (intersection (insert 4 empty) (insert 4 empty))
        
You can also use the following function `fromList` to convert a list into a `Set` representation in order to test your implementation with "larger" sets. Note, that you need to implement `insert` first ; )

> toList :: [] Int -> Set
> toList list = foldr insert empty list
        
