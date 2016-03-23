{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib (Matrix, Error)
import Network.HTTP.Conduit
import System.Environment (getArgs)
import qualified Data.ByteString.Lazy as L
import Control.Monad.IO.Class (liftIO)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [urlString] -> runTests urlString
    _           -> error "Please enter only one URL"

runTests :: String -> IO ()
runTests urlString = case parseUrl urlString of
                       Nothing  -> error "Invalid URL"
                       Just req -> putStrLn "Yeeehaa!"
