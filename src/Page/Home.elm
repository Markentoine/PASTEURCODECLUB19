module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "NEWS "
    , "Bonne Année 2020!"
    , "Tentez de résoudre le puzzle#3"
    , "Et le challenge de Noël!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
