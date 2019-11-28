module Page.Images exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


viewImages : Html msg
viewImages =
    div [ Html.Attributes.class "exercicesStuff" ]
        [ div [ Html.Attributes.class "imagesFolder" ]
            [ div [] [ h2 [ Html.Attributes.class "sousTitre" ] [ text "Tuto#4 - Puzzle#1" ] ]
            , div [ Html.Attributes.class "imagesContainer" ]
                [ img [ src "./../../assets/pictures/puzzle_1/rocket_part_1.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_1/rocket_part_2.jpg", Html.Attributes.class "images" ] []
                ]
            ]
        , div [ Html.Attributes.class "imagesFolder" ]
            [ div [] [ h2 [ Html.Attributes.class "sousTitre" ] [ text "Tuto#4 - Puzzle#2" ] ]
            , div [ Html.Attributes.class "imagesContainer" ]
                [ img [ src "./../../assets/pictures/puzzle_2/rocket_p1.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_2/rocket_p2.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_2/rocket_p3.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_2/rocket_p4.jpg", Html.Attributes.class "images" ] []
                ]
            ]
        , div [ Html.Attributes.class "imagesFolder" ]
            [ div [] [ h2 [ Html.Attributes.class "sousTitre" ] [ text "Tuto#4 - Puzzle#3" ] ]
            , div [ Html.Attributes.class "imagesContainer" ]
            [
                img [ src "./../../assets/pictures/puzzle_3/image_part_002.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_004.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_003.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_001.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_009.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_005.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_008.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_007.jpg", Html.Attributes.class "images" ] []
                , img [ src "./../../assets/pictures/puzzle_3/image_part_006.jpg", Html.Attributes.class "images" ] []
                ]
            ]
        ]
