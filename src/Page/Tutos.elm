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
            [ h2 [ Html.Attributes.class "episode" ] [ text (String.concat [ "Episode #", String.fromInt desc.id ]) ]
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
    [ { id = 1
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
