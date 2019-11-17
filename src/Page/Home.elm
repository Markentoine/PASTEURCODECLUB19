module Page.Home exposing (..)

import Helpers.Helpers exposing (createBlocks)
import Html exposing (..)
import Message exposing (..)


news : List ( String, String, String )
news =
    [ ( "", "Fin des inscriptions!", "" )
    , ( "", "Bienvenue", "aux nouveaux membres du PasteurCodeClub! 😎" )
    , ( "", "Prochaine session", "Découvrir Dr.Racket" )
    ]


viewNews : List (Html Msg)
viewNews =
    createBlocks news
