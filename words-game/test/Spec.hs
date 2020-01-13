import Test.Hspec
import Lib
import FlowerData

main :: IO ()
main = hspec $ do
  describe "Test unlines" $ do
    it "should be able to print a Grid as a string" $ do
      unlines ["abc", "def"] `shouldBe` "abc\ndef\n"

  describe "Test findWord" $ do
    it "should be able to find a word that is in a grid" $ do
      findWord flowerGrid "ANEMONE" `shouldBe` Just "ANEMONE"
    it "should not be able to find a word that is not in a grid" $ do
      findWord flowerGrid "SOLEIL" `shouldBe` Nothing

  describe "Test findWords" $ do
    it "should be able to find all words in flowerNames" $ do
      findWords flowerGrid flowerNames `shouldBe` flowerNames
    it "should not be able to find wrong words " $ do
      findWords flowerGrid ["GUI", "WRONG"] `shouldBe` ["GUI"]
