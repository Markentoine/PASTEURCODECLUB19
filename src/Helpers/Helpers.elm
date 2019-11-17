module Helpers.Helpers exposing (..)

import Array
import Html exposing (..)
import Html.Attributes exposing (class, href, id)
import Message exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


createBlocks : List ( String, String, String ) -> List (Html Msg)
createBlocks announces =
    [ div [ Html.Attributes.class "submain" ]
        (List.map
            (\( nbBlock, first, second ) ->
                section
                    [ Html.Attributes.id (String.concat [ "block", nbBlock ])
                    , Html.Attributes.class "block"
                    ]
                    [ h1 [ Html.Attributes.class "explications" ] [ Html.text first ]
                    , h1 [ Html.Attributes.class "explications" ] [ Html.text second ]
                    ]
            )
            announces
        )
    ]


blockNews : List String -> List (Html Msg)
blockNews announces =
    [ div [ Html.Attributes.class "submain" ]
        (List.map
            (\n ->
                let
                    lines =
                        Debug.log "lines" (breakNewsLines n)
                in
                section
                    [ Html.Attributes.class "block" ]
                    (List.map
                        (\line ->
                            h1 [ Html.Attributes.class "explications" ] [ Html.text line ]
                        )
                        lines
                    )
            )
            announces
        )
    ]



-- fragmente l'info qui sous forme d'une seule string en plusieurs strings affichables dans le block
-- si len < 40 retourner la string
-- sépare la string en mots


breakNewsLines : String -> List String
breakNewsLines n =
    if String.length n <= 40 then
        [ n ]

    else
        String.split " " n
            |> List.foldl cutLines (Array.fromList [ "" ])
            |> Array.toList


cutLines : String -> Array.Array String -> Array.Array String
cutLines w result =
    let
        lenResult =
            Array.length result
    in
    case Array.get (lenResult - 1) result of
        Just s ->
            let
                lenS =
                    String.length s

                lenW =
                    String.length w
            in
            if lenS + lenW > 50 then
                Array.append result (Array.fromList [ w ])

            else
                Array.set (lenResult - 1) (String.append " " w |> String.append s) result

        Nothing ->
            result


gitHub : Html Msg
gitHub =
    Html.a [ href "https://github.com/Markentoine/PASTEURCODECLUB19", Html.Attributes.target "_blank" ]
        [ div [ Html.Attributes.class "github" ]
            [ svg [ viewBox "0 0 24 24", xmlSpace "http://www.w3.org/2000/svg" ]
                [ Svg.title [] [ Svg.text "GitHub icon" ]
                , Svg.path [ d "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12" ] []
                ]
            ]
        ]
