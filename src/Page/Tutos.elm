module Page.Tutos exposing (..)

import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)


viewTutos : Html msg
viewTutos =
    div [ Html.Attributes.class "tutos" ]
        [ tuto "Préparatifs" preparatifTuto
        , tuto "Manipuler des images #1" manipImages_1
        ]


tuto : String -> Html msg -> Html msg
tuto title whichTuto =
    div [ Html.Attributes.class "wrapperTuto" ]
        [ div [ Html.Attributes.class "presentationTuto" ] [ text title ]
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


preparatifTuto : Html msg
preparatifTuto =
    youtube "vvSD5YydNc8"


manipImages_1 : Html msg
manipImages_1 =
    youtube "4eg0vk8gWb8"
