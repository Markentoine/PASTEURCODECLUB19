module Page.SignIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (action, method, type_, value)
import Html.Events exposing (onInput)
import Message exposing (..)


type alias SignInForm =
    { username : String
    , pwd : String
    }


viewSignIn : SignInForm -> List (Html Msg)
viewSignIn form =
    [ h1 [] [ text "Connecte-toi à ton compte" ]
    , Html.form
        [ method "POST"
        , action "https://rare-lined-hagfish.gigalixirapp.com/api/users/sign_in"
        ]
        [ viewInput "text" "Nom d'Utilisateur" "username" form.username Username
        , viewInput "text" "Mot de passe" "pwd" form.pwd Pwd
        , input [ type_ "submit", value "Je me connecte" ] []
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
