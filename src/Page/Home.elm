module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "NEWS "
    , "Saison 2021-2022"
    , "Pour apprendre les bases commencez par"
    , "les tutoriels videos !"
    , "Happy Coding !"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
