module Page.Tutos exposing (..)

import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)


type alias Description =
    { id : Int
    , title : String
    , content : List String
    , youtubeRef : String
    }


viewTutos : Html msg
viewTutos =
    div [ Html.Attributes.class "tutos" ]
        (List.map tuto tutosDescriptions)


tuto : Description -> Html msg
tuto desc =
    div [ Html.Attributes.class "wrapperTuto" ]
        [ div [ Html.Attributes.class "presentationTuto" ]
            [ h2 [ Html.Attributes.class "sousTitre" ] [ text (String.concat [ "Episode #", String.fromInt desc.id ]) ]
            , h2 [] [ text desc.title ]
            , ul [] (List.map (\l -> li [ Html.Attributes.class "detailsTuto" ] [ text (String.concat [ "🎯 ", l ]) ]) desc.content)
            ]
        , div [ Html.Attributes.class "tuto" ] [ youtube desc.youtubeRef ]
        ]


youtube : String -> Html msg
youtube link =
    Embed.Youtube.fromString link
        |> Embed.Youtube.attributes
            [ Embed.Youtube.Attributes.width 480
            , Embed.Youtube.Attributes.height 270
            ]
        |> Embed.Youtube.toHtml


tutosDescriptions : List Description
tutosDescriptions =
    [ { id = 6
      , title = "Solution du Challenge de Noël"
      , content =
            [ "Comment nommer les pièces du puzzle"
            , "Séparer les pièces en plusieurs groupes"
            , "Organiser son code pour le rendre lisible"
            , "Construction de la solution pas à pas"
            ]
      , youtubeRef = ""
      }
    , { id = 5
      , title = "Solution du Challenge Puzzle#3"
      , content =
            [ "Ecrire le programme"
            , "Comprendre en détails le programme"
            , "Arranger les images et retrouver des transformations"
            ]
      , youtubeRef = "q6lmNj7Y01E"
      }
    , { id = 4
      , title = "Définir des fonctions et faire des puzzles"
      , content =
            [ "Définir une fonction"
            , "Reconstituer une image"
            , "Exercices: retrouvez les images directement sur le site"
            ]
      , youtubeRef = "LjtoQfbhqeM"
      }
    , { id = 3
      , title = "Manipuler des images #2"
      , content =
            [ "Nouvelles fonctions"
            , "Manipuler plusieurs images"
            , "Composer des fonctions"
            , "Exercices"
            ]
      , youtubeRef = "WYcfGKhtx5w"
      }
    , { id = 2
      , title = "Quelques mots à connaître"
      , content =
            [ "Qu'est-ce qu'une fonction?"
            , "Qu'est-ce qu'un argument?"
            , "Qu'est-ce qu'une expression?"
            , "Qu'est-ce qu'une valeur?"
            ]
      , youtubeRef = "cfqbGWSS14U"
      }
    , { id = 1
      , title = "Manipuler des images #1"
      , content =
            [ "Installer un langage dans Dr.Racket"
            , "Méthode pour apprendre mieux"
            , "Insérer une image dans Dr.Racket"
            , "Apprendre quelques noms de commandes pour manipuler des images"
            ]
      , youtubeRef = "4eg0vk8gWb8"
      }
    , { id = 0
      , title = "Préparatifs"
      , content = [ "Installer Dr.Racket", "Découvrir l'interface", "Personnaliser" ]
      , youtubeRef = "vvSD5YydNc8"
      }
    ]
