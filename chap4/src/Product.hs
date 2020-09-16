module Product where

import qualified Data.Text as T

newtype ProductId = ProductId Integer 
newtype ProductDescription = ProductDescription T.Text

data Product= Product {
   id :: ProductId, 
description :: ProductDescription
                              }
