module Page.Announce exposing (..)

import Helpers.Helpers exposing (createBlocks)
import Html exposing (..)
import Message exposing (..)


type Blocks
    = New
    | WhatIsIt
    | WhatDoWeDo
    | WhenDoWeStart


viewBlocks : Blocks -> List (Html Msg)
viewBlocks blocks =
    case blocks of
        New ->
            createBlocks
                [ ( "1", "---- NOUVELLE SAISON ----", "2019-2020" )
                , ( "2", "---- NOUVEAU LANGAGE ----", "RACKET" )
                , ( "3", "---- NOUVEL HORAIRE ----", "LUNDI 12h30-13h15" )
                , ( "4", "---- NOUVELLE SALLE ----", "203" )
                ]

        WhatIsIt ->
            createBlocks
                [ ( "1", "Un Club", "d'une dizaine de personnes" )
                , ( "2", "Qui se réunit tous les lundis", "Entre 12h30 et 13h15" )
                , ( "3", "Dans une salle", "peuplée d'ordinateurs" )
                , ( "4", "Pour apprendre joyeusement ", "A coder, programmer, créer" )
                ]

        WhatDoWeDo ->
            createBlocks
                [ ( "1", "On  apprendra", "grâce à Dr.Racket!" )
                , ( "2", "Il nous permettra", "De programmer à partir de zéro" )
                , ( "3", "De dessiner", "De donner vie à des êtres, des choses" )
                , ( "4", "De créer des jeux", "Des petits d'abord et des plus grands ensuite..." )
                ]

        WhenDoWeStart ->
            createBlocks
                [ ( "1", "La première séance", "aura lieu le 18 novembre" )
                , ( "2", "Et ensuite chaque semaine", "A la même heure" )
                , ( "3", "Tu passeras en priorité", "au restaurant scolaire" )
                , ( "4", "Monte directement en salle 203", "Dès que possible après la fin du repas" )
                ]
