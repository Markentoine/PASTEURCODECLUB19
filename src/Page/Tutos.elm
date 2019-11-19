module Page.Tutos exposing (..)

import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)


type alias Description =
    { title : String
    , content : List String
    , youtubeRef : String
    }


viewTutos : Html msg
viewTutos =
    div [ Html.Attributes.class "tutos" ]
        (List.map (\desc -> tuto desc.title desc.content (youtube desc.youtubeRef)) tutosDescriptions)


tuto : String -> List String -> Html msg -> Html msg
tuto title details whichTuto =
    div [ Html.Attributes.class "wrapperTuto" ]
        [ div [ Html.Attributes.class "presentationTuto" ]
            [ h2 [] [ text (String.concat [ "📽 ", title ]) ]
            , ul [] (List.map (\l -> li [ Html.Attributes.class "detailsTuto" ] [ text (String.concat [ "🎯 ", l ]) ]) details)
            ]
        , div [ Html.Attributes.class "tuto" ] [ whichTuto ]
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
    [ { title = "Préparatifs"
      , content = [ "Installer Dr.Racket", "Découvrir l'interface", "Personnaliser" ]
      , youtubeRef = "vvSD5YydNc8"
      }
    , { title = "Manipuler des images #1"
      , content =
            [ "Installer un langage dans Dr.Racket"
            , "Méthode pour apprendre mieux"
            , "Insérer une image dans Dr.Racket"
            , "Apprendre quelques noms de commandes pour manipuler des images"
            ]
      , youtubeRef = "4eg0vk8gWb8"
      }
    ]
