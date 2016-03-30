{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib (Matrix, Error, mtx)
import Network.Wreq
import Network.Wreq.Types (Postable)
import Control.Lens
import System.Environment (getArgs)
import qualified Data.ByteString.Lazy as L

main :: IO ()
main = do
  args <- getArgs
  case args of
    [urlString] -> runTests urlString
    _           -> error "Please enter only one URL"

url :: String
url = "http://matrixcalc.demecko.com/api/add/1-1/2-2"

getWithPayload :: Postable a => String -> a -> IO (Response L.ByteString)
getWithPayload = customPayloadMethod "GET"

runTests :: String -> IO ()
runTests urlString = putStrLn urlString
