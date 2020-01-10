import Test.Hspec
import Lib
import FlowerData

main :: IO ()
main = hspec $ do
  describe "Test the Lib module" $ do
    it "should able to print a Grid as a string" $ do
      unlines ["abc", "def"] `shouldBe` "abc\ndef\n"

    it "should able to find a word in a grid" $ do
      findWord flowerGrid "ANEMONE" `shouldBe` Just "ANEMONE"
      findWord flowerGrid "SOLEIL" `shouldBe` Nothing
