> {-# LANGUAGE GADTSyntax #-}
>
> module Exercises04 where

1) Given the following definitions and the predefined function `take`, `map` and `zip`.

> loop :: a
> loop = loop
>
> nats :: [] Int
> nats = nats' 0
>  where nats' n = n : nats' (n+1)

Which of the following expressions terminate?

      a) take 10 nats
      b) map (\x -> x + 1) nats
      c) zip loop [1,2,3,4,5]
      d) take 13 (map (\x -> x + 1) nats)
      e) zip [True, False, True, True] nats


2) We define a polymorphic data type for binary trees with (polymorphic) elements in their leaves as follows.

> data Tree a where
>   Leaf  :: a -> Tree a
>   Node  :: Tree a -> Tree a -> Tree a

 That is, we can represent a tree with one value using `Leaf` and a tree with two subtrees using `Node`.

We can define a mapping and a folding function for `Tree a` with the following types.

> mapTree :: (a -> b) -> Tree a -> Tree b
> mapTree f (Leaf val) = Leaf (f val)
> mapTree f (Node t1 t2) = Node (mapTree f t1) (mapTree f t2)
>
> foldTree :: (a -> b) -> (b -> b -> b) -> Tree a -> b
> foldTree leafF nodeF (Leaf val) = leafF val
> foldTree leafF nodeF (Node t1 t2) = nodeF (foldTree leafF nodeF t1) (foldTree leafF nodeF t2)

Observe that these definitions following the same scheme as for lists: a mapping function applies its functional argumt to each element of the structure (in case of trees, the elements occur in the `Leaf`-constructor); a folding function describes how to transform a structure to an arbitrary type by specifying the function to replace the constructors with.

Now define the following functions using `mapTree` and `foldTree`, respectively.

> negateTree :: Tree Bool -> Tree Bool
> negateTree t = mapTree elemF t
>  where
>   elemF = error "negateTree-elemF: Implement me!"
>
> sumTree :: Tree Int -> Int
> sumTree t = foldTree leafF nodeF t
>  where
>   leafF = error "sumTree-leafF: Implement me!"
>   nodeF = error "sumTree-nodeF: Implement me!"
>
> values :: Tree Int -> [Int]
> values t = foldTree leafF nodeF t
>  where
>   leafF = error "values-leafF: Implement me!"
>   nodeF = error "values-nodeF: Implement me!"


3) The `foldList` function we defined in the lecture is predefined as `foldr :: (a -> b -> b) -> b -> [a] -> b` in Haskell. Reimplement the function `countElem` given in the lecture using `foldr`.

    > countElem :: [] Int -> Int -> Int
    > countElem [] elemToFind = 0
    > countElem (val:list) elemToFind = if val == elemToFind
    >                                     then 1 + countElem list elemToFind
    >                                     else countElem list elemToFind

> countElem :: [] Int -> Int -> Int
> countElem list elemToFind = foldr consF emptyF list
>  where
>   consF = error "consF: Implement me!"
>   emptyF = error "emptyF: Implement me!"

4) Given the following data type to represent arithmetic expression consisting of numeric values, an addition or multiplication.

> data Expr where
>   Num  :: Int -> Expr
>   Add  :: Expr -> Expr -> Expr
>   Mult :: Expr -> Expr -> Expr

Give three exemplary values for arithmetic expressions that represent the expression given in the comment above.

> -- 1 + (2 * 3)
> expr1 :: Expr
> expr1 = error "expr1: Implement me!"
>
> -- (1 + 2) * 3
> expr2 :: Expr
> expr2 = error "expr2: Implement me!"
>
> -- (1 + 2) * (3 + 4)
> expr3 :: Expr
> expr3 = error "expr3: Implement me!"

Define a function `value` that interpretes the `Expr`-data type by replacing the constructors `Add` and `Mult` with the concrete addition and multiplication operator.

> value :: Expr -> Int
> value = error "value: Implement me!"

For example, the function should yield the following result for the above expressions.

   $> value expr1
   7
   $> value expr2
   9
   $> value expr3
   21

Complete the signature for the mapping and folding function corresponding to the given type and implement these functions. The mapping function enables us to apply a function on the `Int` occurs in the `Num`-constructor. The folding function is a higher-order function that enables us to exchange the constructors of a given `Expr`-values with functions in order to compute a new value.

> mapExpr = error "mapExpr: Implement me!"
>
> foldExpr = error "foldExpr: Implement me!"

Now define `value` by means of `foldExpr`.

> valueFold :: Expr -> Int
> valueFold = error "valueFold: Implement me using `foldExpr`!"

5) Define a function `repeatValue` that computes an infinite list containing the value given as argument.

> repeatValue :: a -> [] a
> repeatValue = error "repeatValue: Implement me!"

Define a function `replicateValue` that takes an `n :: Int` as first argument and yields a list of length `n` containing the value given as second argument. Use `repeatValue` and `take` to define the function.

> replicateValue :: Int -> a -> [] a
> replicateValue = error "replicateValue: Implement me using `repeatValue` and `take`!"
