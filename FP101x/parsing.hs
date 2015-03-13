-- --------------------------------
-- Parsing - Lesson 7
--
module Parsing where

import Control.Monad (MonadPlus, mzero, mplus)

newtype Parser a = Parser (String -> [(a, String)])

-- A parser that extracts a single caracter.
-- Example: item "Hello" -> [('H', "ello"]
item :: Parser Char -- that is: String -> [(Char, String)]
item = Parser( \inp -> case inp of
                            [] -> []
                            (x:xs) -> [(x,xs)])

-- Parser that always fails.
failure :: Parser a
failure =  Parser( \inp -> [] )

-- The parser that always succeeds.
return' :: a -> Parser a
return' v = Parser( \inp -> [(v, inp)] )

-- We take two parsers and combine them  We try the first parser p, i it fails
-- we try the second parser q. We will use the infix notation
(+++) :: Parser a -> Parser a -> Parser a
p +++ q = Parser( \inp -> case parse p inp of
                            []  -> parse q inp
                            [(v, out)] -> [(v, out)] )

-- Let's define a parse function that takes a parser and a string and just
-- applies the parser to the input.
parse :: Parser a -> String -> [(a, String)]
parse (Parser p) inp = p inp

instance Monad Parser where

  p >>= f  = Parser (\inp -> case parse p inp of
                       [] -> []
                       [(v, out)] -> parse (f v) out)
  return = return'

instance MonadPlus Parser where
  mzero = failure
  p `mplus` q = p +++ q

-- Now the we have a monad we can use do

p :: Parser (Char, Char)

p = item >>= ( \x ->
    item >>= ( \y ->
    item >>= ( \z ->
    return (x,z)) ))
--p = do x <- item
--       item
--       y <- item
--       return (x, y)

