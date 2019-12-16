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


viewSignIn : SignInForm -> UserProfile -> List (Html Msg)
viewSignIn form user =
    let
        warningMessage =
            if user == Failure then
                ">>> Nom d'utilisateur et/ou mot de passe incorrect <<<"

            else
                ""
    in
    [ h1 [] [ text "Connecte-toi à ton compte" ]
    , div
        [ Html.Attributes.class "signinForm" ]
        [ viewInputText "Nom d'Utilisateur" "username" form.username Username
        , viewInputText "Mot de passe" "pwd" form.pwd Pwd
        , button [ onClick Profile ] [ text "Je me connecte" ]
        ]
    , div [ Html.Attributes.class "warning" ]
        [ text warningMessage ]
    ]


viewInput : String -> String -> String -> String -> (String -> msg) -> Html msg
viewInput typ p name val toMsg =
    input
        [ Html.Attributes.type_ typ
        , Html.Attributes.placeholder p
        , Html.Attributes.name name
        , Html.Attributes.value val
        , Html.Attributes.class name
        , onInput toMsg
        ]
        []


viewInputText : String -> String -> String -> (String -> msg) -> Html msg
viewInputText =
    viewInput "text"


newUserName : String -> SignInForm -> SignInForm
newUserName username form =
    { form | username = username }


newFormPwd : String -> SignInForm -> SignInForm
newFormPwd pwd form =
    { form | pwd = pwd }
