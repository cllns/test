module Main where

-- import boilerpate
import IO.Runner (Request, Response)
import IO.Runner as Run


import ElmTest.Runner.Console (runDisplay)
import open ElmTest.Test
import ElmTest.Run as R
import ElmTest.Assertion as A

tests : [Test]
tests = [ (R.run (0 `equals` 0)) `equals` Nothing
        , test "pass" <| A.assert (Run.pass Nothing)
        , test "fail" <| A.assertNotEqual (Run.fail Nothing) True
        ] ++ (map defaultTest <| A.assertionList [1..10] [1..10])

console = runDisplay tests
-- IO boilerplate
port requests : Signal [{ mPut  : Maybe String
                        , mExit : Maybe Int
                        , mGet  : Bool
                        }]
port requests = Run.run responses console

port responses : Signal (Maybe String)