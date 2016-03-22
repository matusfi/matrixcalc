{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib where

import Data.List
import Data.Aeson
import Data.ByteString.Lazy.Char8
import qualified Data.ByteString.Lazy as B

data Matrix = Matrix {
                matrix :: [[Int]]
              } deriving Show

mtx :: B.ByteString
mtx = "{\"matrix\": [[1,2,3],[4,5,6],[7,8,9]]}" 

instance FromJSON Matrix where
  parseJSON (Object v) = Matrix <$>
                         v .: "matrix"

instance ToJSON Matrix where
  toJSON (Matrix matrix) = 
    object [ "matrix" .= matrix ]  
