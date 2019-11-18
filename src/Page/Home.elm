module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews, createBlocks)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "🎬 La première séance a eu lieu! C'est parti! 🎬"
    , "Les Codeurs ont pu découvrir Dr.Racket et son environnement."
    , "📷 Ils ont pu aussi commencer à manipuler des images dans Dr.Racket. 📷"
    , "🎉 Ils viennent de faire leurs premiers pas en programmation! 🎉"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
