{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib where

import GHC.Generics
import Data.List
import Data.Text
import Data.Aeson (FromJSON, ToJSON)
import Data.ByteString.Lazy.Char8
import qualified Data.ByteString.Lazy as L

data Matrix = Matrix {
                matrix :: [[Int]]
              } deriving (Show, Generic)

instance FromJSON Matrix
instance ToJSON Matrix

lbsMtx :: L.ByteString
lbsMtx = "{\"matrix\": [[1,2,3],[4,5,6],[7,8,9]]}" 

mtx = Matrix [[1,2,3],[4,5,6],[7,8,9]]

data Result = Result { result :: Int }
              deriving (Show, Generic)

instance FromJSON Result
instance ToJSON Result

data Error = Error { error :: Text }
             deriving (Show, Generic)

instance FromJSON Error
instance ToJSON Error

err :: L.ByteString
err = "{\"error\": \"This is da biggest error eva!\"}"
