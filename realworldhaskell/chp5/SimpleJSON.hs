

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
