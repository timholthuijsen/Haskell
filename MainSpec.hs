module MainSpec where

import Test.Hspec
import Main

spec :: Spec
spec = do
  describe "sumlist" $ do
    it "three" $ do
    (sumlist [1,0,2]) `shouldBe` 3
    it "zero" $ do
    (sumlist []) `shouldBe` 0

  describe "alltrue" $ do
    it "alltrue" $ do
      (alltrue [True,True]) `shouldBe` True
    it "sometrue" $ do
      (alltrue [True,True,False]) `shouldBe` False
    it "false" $ do
      (alltrue [False,False]) `shouldBe` False

  describe "onetrue" $ do
    it "alltrue" $ do
      (onetrue [True,True]) `shouldBe` True
    it "onetrue" $ do
      (onetrue [True,False,False]) `shouldBe` True
    it "false" $ do
      (onetrue [False,False]) `shouldBe` False

  describe "cat" $ do
    it "hello tim" $ do
      (cat ["hello","tim"]) `shouldBe` "hellotim"
    it "Hello World" $ do
      (cat ["Hello"," ","World"]) `shouldBe` "Hello World"
    it "nothing" $ do
      (cat []) `shouldBe` ""

  describe "sup" $ do
    it "high" $ do
     (sup [3,7,1,66]) `shouldBe` 66
    it "negative" $ do
     (sup [-20,-5,-10]) `shouldBe` -5

  describe "inf" $ do
    it "zero" $ do
     (inf [0,1,1,2,1]) `shouldBe` 0
    it "negative" $ do
     (inf [3,2,-4,1,-1]) `shouldBe` -4

  describe "occurs" $ do
    it "should" $ do
      (occurs "b" ["a","b","c","d"]) `shouldBe` Left ["c","d"]
    it "nothing" $ do
      (occurs "c" ["a","b","c"]) `shouldBe` Left []

  describe "findname" $ do
    it "should" $ do
      (findname "hello" ["hello","world"]) `shouldBe` True
    it "capital" $ do
      (findname "Hello" ["hello","tim"]) `shouldBe` False
    it "prefix" $ do
      (findname "hell" ["hello"]) `shouldBe` True

  describe "buildlist" $ do
    it "add" $ do
      (buildlist 4 (+1)) `shouldBe` [1,2,3,4,5]

  describe "filter" $ do
    it "<5" $ do
      (filter' (<5) [1,2,3,4,5,6]) `shouldBe` [1,2,3,4]

  describe "sort" $ do
    it "ascending" $ do
      (sort' [8,20,-5,3] (<)) `shouldBe` [-5,3,8,20]
    it "descending" $ do
      (sort' [8,20,-5,3] (>)) `shouldBe` [20,8,3,-5]

  describe "map'" $ do
    it "<5" $ do
      (map' (<5) [3,6,1,2]) `shouldBe` [True,False,True,True]
    it "+3" $ do
      (map' (+3) [1]) `shouldBe` [4]

  describe "andmap" $ do
    it ">5" $ do
      (andmap' (>5) [8,1]) `shouldBe` False
    it "empty" $ do
      (andmap' (even) []) `shouldBe` True


  describe "ormap" $ do
    it ">5" $ do
      (ormap' (>5) [8,1]) `shouldBe` True
    it "empty" $ do
      (ormap' (even) []) `shouldBe` False