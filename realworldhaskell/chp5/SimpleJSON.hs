module SimpleJSON ( JValue (..)
                  , getString
                  , getDouble
                  , getBool
                  , getObject
                  , getArray
                  , isNull
                  ) where

-- JSON have four basic types: Strings, number, booleans and special null
-- It provides two compound types: Array, Object

-- describe our JSON Value
data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
            deriving (Eq, Ord, Show)

-- Function to convert JSON String to a string
getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber n) = Just n
getDouble _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _ = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject o) = Just o
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray a) = Just a
getArray _ = Nothing

isNull :: JValue -> Bool
isNull JNull = True
isNull _ = False
