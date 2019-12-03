module Page.SignIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (action, method, type_, value)
import Html.Events exposing (onClick, onInput)
import Message exposing (..)
import User exposing (..)


type alias SignInForm =
    { username : String
    , pwd : String
    }


viewSignIn : SignInForm -> List (Html Msg)
viewSignIn form =
    [ h1 [] [ text "Connecte-toi à ton compte" ]
    , div
        []
        [ viewInput "text" "Nom d'Utilisateur" "username" form.username Username
        , viewInput "text" "Mot de passe" "pwd" form.pwd Pwd
        , button [ onClick Profile ] [ text "Je me connecte" ]
        ]
    ]


viewInput : String -> String -> String -> String -> (String -> msg) -> Html msg
viewInput typ p name val toMsg =
    input
        [ Html.Attributes.type_ typ
        , Html.Attributes.placeholder p
        , Html.Attributes.name name
        , Html.Attributes.value val
        , onInput toMsg
        ]
        []


newUserName : String -> SignInForm -> SignInForm
newUserName username form =
    { form | username = username }


newFormPwd : String -> SignInForm -> SignInForm
newFormPwd pwd form =
    { form | pwd = pwd }
