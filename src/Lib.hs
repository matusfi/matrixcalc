{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib where

import GHC.Generics
import Data.List
import Data.Aeson
import Data.ByteString.Lazy.Char8
import qualified Data.ByteString.Lazy as B

data Matrix = Matrix {
                matrix :: [[Int]]
              } deriving (Show, Generic)

instance FromJSON Matrix
instance ToJSON Matrix

mtx :: B.ByteString
mtx = "{\"matrix\": [[1,2,3],[4,5,6],[7,8,9]]}" 

