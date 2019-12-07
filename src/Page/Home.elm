module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "NEWS "
    , "Evolution du site!"
    , "Vous devez désormais vous connecter"
    , "Avec vos identifiants"
    , "Pour accéder au Club!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
