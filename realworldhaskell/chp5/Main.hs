import SimpleJSON

-- To compile it: ghc -o simple Main.hs
main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
