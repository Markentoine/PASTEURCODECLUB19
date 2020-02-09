module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "NEWS "
    , "Résolution du challenge de Noël:"    
    , "Nouvelle vidéo vous montrant"
    , "Comment résoudre ce challenge assez difficile!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
