module PutJSON (renderJValue) where

import Data.List (intercalate)
import SimpleJSON (JValue (..))


renderJValue :: JValue -> String

renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue JNull = "null"

-- Example: 
-- JArray [JNumber 1, JString "foo"]
-- => [1, "foo"]

renderJValue (JArray a) = "[" ++ renderArray a ++ "]"
    where renderArray [] = ""
          renderArray a = intercalate "," $ map renderJValue a

-- Example:
-- JObject [("foo", JNumber 1), ("bar", JString "cool")]
-- => {"foo": 1, "bar": "cool"}
renderJValue (JObject o) = "{" ++ renderObject o ++ "}"
    where renderObject [] = ""
          renderObject o = intercalate "," $ map displayO o
          displayO (s, v) = show s ++ ": " ++ renderJValue v
