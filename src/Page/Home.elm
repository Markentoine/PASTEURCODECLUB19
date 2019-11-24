module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews, createBlocks)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "🎬 2e séance en ce lundi 27 🎬"
    , "Deux nouveeaux tutos à regarder!"
    , "📷 On continue à manipuler des images. 📷"
    , "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
