module Page.Home exposing (..)

import Helpers.Helpers exposing (blockNews)
import Html exposing (..)
import Message exposing (..)


news : List String
news =
    [ "Bulletin du 2 décembre: "
    , "Deux nouveaux tutos en vidéos!"
    , "Des puzzles, des challenges!"
    , "Nouvel outil: le stepper!"
    , "Prochaine session >>> 9 décembre à 12h30!"
    ]


viewNews : List (Html Msg)
viewNews =
    blockNews news
