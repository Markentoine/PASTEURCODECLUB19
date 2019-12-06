module Helpers.Helpers exposing (..)

import Array
import Html exposing (..)
import Html.Attributes exposing (class, href, id, target)
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


logo : Html Msg
logo =
    div [ Html.Attributes.class "logo" ]
        [ svg
            [ viewBox "0 0 115 118"
            , xmlSpace "http://www.w3.org/2000/svg"
            , fillRule "evenodd"
            , clipRule "evenodd"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            , strokeMiterlimit "evenodd"
            ]
            [ Svg.title [] [ Svg.text "logo for coders" ]
            , Svg.path [ fill "#7fff00", stroke "#7fff00", strokeWidth ".5", d "M48.595 39.059l-1.523.287-.987.598-.593.736-.115.833.396.959.25.863.673.628.979.47.688.109h1.077l.664.053.625.194.704.438.853.502.671.786.668.682.673.845 2.863 5.979-14.944 26.632-.297.911-.245.879.038.743.197.537.351.411.286.399.375.314.501.206.503.125.501.032.666-.029.525-.129.53-.191.539-.42.376-.671.568-.846.505-1.085 12.002-20.924 8.591 18.921.927 1.591.943.87 1.066 1.068.662.547.774.389.966.449 1.095.213.844.239.772.05.695.029 1.175.033 1.186-.028.847-.065.864-.304.603-.441.488-.594.524-.937.018-.931-.428-.964-.632-.583-.535-.423-1.28-.072-1.729-.148-1.409.055-.747-.015-.783-.473-.532-.494-.904-1.074-1.084-1.812-13.956-30.499-.691-1.204-.926-1.134-.918-.989-.881-.868-1.139-.669-.776-.453-.783-.345-.931-.454-1.039-.334-.845-.03-.679-.038-.956.065" ] []
            , Svg.path [ fill "none", stroke "#7fff00", strokeWidth ".5", d "M58.18.32l-1.192.17-.748.626-.818 1.321-1.479 2.356-50.92 88.138-.566.964-.073.938.129.852.231.544.474.459.465.334.649.233.937.252.74.146 105.568-.182.669-.361.56-.289.402-.352.414-.543.158-.598.079-.721.048-.584-.452-1.081-.611-.984-51.496-89.04-.436-.615-.505-.848-.417-.633-.411-.429L58.91.25l-.73.07" ] []
            , Svg.path [ fill "none", stroke "#7fff00", strokeWidth ".5", d "M58.064 7.766l-1.009.15-.633.553-.694 1.165-1.252 2.08-43.125 77.793-.48.851-.061.828.109.752.195.48.402.405.394.295.549.206.794.222.627.129 89.408-.161.566-.318.474-.255.341-.311.35-.479.134-.528.067-.637.041-.515-.383-.955-.518-.868-43.613-78.589-.369-.543-.428-.748-.352-.559-.349-.378-.566-.127-.619.062" ] []
            ]
        ]
