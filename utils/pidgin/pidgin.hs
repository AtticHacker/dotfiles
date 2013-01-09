module Pidgin where

import Data.List.Split

main :: IO ()
main = do
  content <- getContents
  putStr $ (head . splitOn "</span>" . last . splitOn "#800000;'>") content