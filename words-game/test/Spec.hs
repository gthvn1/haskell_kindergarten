import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Test the Lib module" $ do
    it "should be able to run tests" $ do
      someString `shouldBe` "someString"
