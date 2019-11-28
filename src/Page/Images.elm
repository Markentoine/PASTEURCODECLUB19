module Page.Images exposing (..)

import Html exposing (..)


viewImages : Html msg
viewImages =
    div [ Html.Attributes.class "images" ]
        [ div [ Html.Attributes.class "imagesFolder" ]
            [ h2 [] [ text "Tuto#4 - Puzzle#1" ]
            , img [ src "../../assets/pictures/puzzle1/rocket_part_1.jpg" ] []
            ]
        ]
