module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "NEWS "
    , "Aujourd'hui, Challenge de Noel!"
    , "Allez dans tutos > images > Challenge Noel"
    , "Essayez de coder pour retrouver l'image originale"
    , "Bon courage et Joyeuses Fêtes!"
    , "Un sticker Dr.Racket pour ceux qui finiront le Challenge"
    , "En montrant leur programme!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
