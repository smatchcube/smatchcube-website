{-# LANGUAGE OverloadedStrings #-}

import           Control.Applicative (empty)
import           Data.List           (isInfixOf)
import           Data.List.Split     (wordsBy)
import           Data.Maybe          (fromMaybe)
import           Hakyll
import           System.FilePath     (takeBaseName)
import           Text.Pandoc

--------------------------------------------------------------------------------

main :: IO ()
main = hakyll $ do

  match ("images/*" .||. "pubkey.asc") $ do
    route   idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  match "index.md" $ do
    route $ setExtension "html"
    compile $ myPandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" myCtx
      >>= relativizeUrls

  match ((fromList ["index.md", "SICP.md", "CPP.md", "programs.md", "not_found.md"])
         .||. "SICP/*.md"
         .||. "CPP/*.md"
         .||. "CLRS/*.md"
         .||. "posts/*"
         .||. "programs/*") $ do
    route $ setExtension "html"
    compile $ myPandocCompiler
      >>= loadAndApplyTemplate "templates/post.html" myCtx
      >>= loadAndApplyTemplate "templates/default.html" myCtx
      >>= relativizeUrls

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------

postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y"

mathCtx :: Context String
mathCtx =
  field "math" (\i -> if "class=\"math" `isInfixOf` (itemBody i)
                      then return $ unlines ["<script src=\"https://polyfill.io/v3/polyfill.min.js?features=es6\"></script>"
                                            ,"    <script id=\"MathJax-script\" async src=\"https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js\"></script>"]
                      else empty)

syntaxCtx :: Context String
syntaxCtx =
  field "syntax" (\i -> if "sourceCode" `isInfixOf` (itemBody i)
                        then return "<link rel=\"stylesheet\" href=\"/css/highlighting.css\">\n"
                        else empty)

-- | build the navigation bar on the top of the page
buildNav :: FilePath -> String
buildNav filePath
  | filePath == "index.md" = "<p>/home</p>"
  | (length pathList) == 1 = "<p>/<a href=\"/\">home</a>/" ++ takeBaseName filePath ++ "</p>"
  | (length pathList) == 2 = "<p>/<a href=\"/\">home</a>/<a href=\"../" ++
                             pathList !! 0 ++ ".html\">" ++
                             pathList !! 0 ++ "</a>/" ++
                             takeBaseName filePath ++ "</p>"
  | otherwise = "<p>/<a href=\"/\">home</a></p>"
  where pathList = wordsBy (=='/') filePath
        baseName = takeBaseName filePath

navCtx :: Context String
navCtx =
  field "nav" (\i -> return $ buildNav $ toFilePath $ itemIdentifier i)

myCtx :: Context String
myCtx = postCtx <> mathCtx <> syntaxCtx <> navCtx <> defaultContext

myPandocCompiler :: Compiler (Item String)
myPandocCompiler =
  pandocCompilerWith
  defaultHakyllReaderOptions { readerExtensions = disableExtension Ext_auto_identifiers (readerExtensions defaultHakyllReaderOptions)}
  defaultHakyllWriterOptions { writerHTMLMathMethod = MathJax "" }
