module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews, createBlocks)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "Bulletin du 25 novembre: "
    , "Deux nouveaux inscrits au PCC!"
    , "La découverte de Dr.Racket continue."
    , "📷 On poursuivra la manipulation d'images la prochaine fois. 📷"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
