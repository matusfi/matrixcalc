{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE FlexibleContexts #-}
module Main where

import Lib (Matrix, Error, mtx)
import qualified Lib as Lib (Result)
import Network.Wreq hiding (get)
import Network.Wreq.Types (Postable)
import Network.HTTP.Client (HttpException(StatusCodeException))
import Network.Http.Internal
import Control.Lens
import Control.Exception as E
import Data.List
import Data.Maybe
import Data.Either
import Data.CaseInsensitive (CI)
import System.Environment (getArgs)
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC

main :: IO ()
main = do
  args <- getArgs
  case args of
    [urlString] -> runTests urlString
    _           -> error "Please enter only one URL"

url :: String
url = "http://matrixcalc.demecko.com/api/add/1-1/2-2"

get :: Postable a => String -> a -> IO L.ByteString
get url payload = response `E.catch` handler
  where
    response = do
      r <- customPayloadMethod "GET" url payload
      let res = r ^. responseBody
      return res

    handler e@(StatusCodeException s h _)
      | s ^. statusCode >= 400 = return $ resBody h
      | otherwise = throwIO e

    xResBodyStartHeader = "X-Response-Body-Start"
    
    resBody h = LC.pack . show $ lookupHeader h xResBodyStartHeader

runTests :: String -> IO ()
runTests urlString = putStrLn urlString
