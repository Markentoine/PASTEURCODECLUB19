module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews, createBlocks)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "Et voilà, c'est la fin des inscriptions pour cette année!"
    , "Je souhaite la Bienvenue aux nouveaux membres du PasteurCodeClub! 😎"
    , "News : la prochaine session vous fera découvrir Dr.Racket!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
