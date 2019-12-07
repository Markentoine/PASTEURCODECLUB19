module Header exposing (..)

import Html exposing (Html, a, button, div, img, p, text)
import Html.Attributes exposing (class, href, id, src)
import Html.Events exposing (onClick)
import Message exposing (..)
import User exposing (..)


type Header
    = Connexion
    | Identified


viewElemntsHeader : Header -> UserProfile -> List (Html Msg)
viewElemntsHeader header profile =
    case header of
        Connexion ->
            [ div [ class "bigTitle", onClick BackHome ] [ p [ id "title" ] [ text "PASTEURCODECLUB" ] ]
            , div [ class "headerNav" ] [ button [ onClick Authentication ] [ text "Connexion" ] ]
            ]

        Identified ->
            case profile of
                NotSet ->
                    [ div [ class "bigTitle" ] [ a [ href "", onClick BackHome ] [ p [ id "title" ] [ text "PASTEURCODECLUB" ] ] ]
                    , div [ class "headerNav" ]
                        [ text "inconnu" ]
                    ]

                Failure ->
                    [ div [ class "bigTitle" ] [ a [ href "", onClick BackHome ] [ p [ id "title" ] [ text "PASTEURCODECLUB" ] ] ]
                    , div [ class "headerNav" ]
                        [ text "inconnu" ]
                    ]

                Set userinfos ->
                    [ div [ class "bigTitle", onClick BackHome ] [ p [ id "title" ] [ text "PASTEURCODECLUB" ] ]
                    , div [ class "headerNav" ]
                        [ div [ Html.Attributes.id "usernameHeader" ] [ text (String.toUpper userinfos.username) ]
                        , img [ src ("https://api.adorable.io/avatars/50/" ++ userinfos.id ++ ".png"), class "avatar" ] []
                        ]
                    ]
