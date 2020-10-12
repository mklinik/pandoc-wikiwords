{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.Text as Text
import Data.Text (Text)
import Text.Pandoc.JSON
import Text.Regex.Posix

-- wiki words as defined in potwiki.vim
-- This code is literally taken from the vim script and translated to haskell

-- A PotWikiWord must start with an upper case character and contain at
-- least one lower case and another upper case character in that order.
pwupp = "A-Z"
pwlow = "a-z"
pwoth = "0-9_"
pwnup = pwlow ++ pwoth
pwnlo = pwupp ++ pwoth
pwany = pwupp ++ pwnup
wikiWord = "^[" ++ pwupp ++ "][" ++ pwnlo ++ "]*[" ++ pwlow ++ "][" ++ pwnup ++ "]*[" ++ pwupp ++ "][" ++ pwany ++ "]*$"

isWikiWord :: Text -> Bool
isWikiWord s = (Text.unpack s =~ wikiWord)

wikiWordToLink :: Inline -> Inline
wikiWordToLink (Str word) | isWikiWord word = Link nullAttr [Str word] (Text.concat [word, ".html"], word)
wikiWordToLink x = x

main :: IO ()
main = toJSONFilter wikiWordToLink
