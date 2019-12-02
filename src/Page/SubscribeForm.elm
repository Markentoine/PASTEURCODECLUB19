module Page.SubscribeForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Message exposing (..)


type alias SubscriptionForm =
    { firstName : String
    , lastName : String
    , class : String
    , mail : String
    }



-- VIEWS


viewForm : SubscriptionForm -> List (Html Msg)
viewForm form =
    [ h1 [] [ Html.text "Inscris-toi" ]
    , p [] [ Html.text "Une adresse mail est nécessaire pour te répondre afin que tu saches si tu fais partie du club" ]
    , p [] [ Html.text "Confidentialité: " ]
    , p [] [ Html.text "Cette adresse ne sera utilisée que pour te répondre et ne sera pas stockée ensuite." ]
    , p [] [ Html.text "Toutes les données entrées ici ne seront ni stockées ni utilisées ailleurs." ]
    , p [] [ Html.text "ATTENTION : Le nombre de places est limité à 10 en tout." ]
    , Html.form
        [ Html.Attributes.method "POST"
        , action ""
        , Html.Attributes.name "inscription"
        , attribute "netlify-honeypot" "bot-field"
        , attribute "data-netlify" "true"
        ]
        [ viewInput "text" "Prénom" "firstname" form.firstName FirstName
        , viewInput "text" "Nom" "lastname" form.lastName LastName
        , viewInput "text" "Classe" "class" form.class Class
        , viewInput "mail" "Mail" "mail" form.mail Mail
        , input [ Html.Attributes.type_ "hidden", Html.Attributes.name "form-name", value "inscription" ] []
        , input [ Html.Attributes.type_ "submit", value "Je veux m'inscrire" ] []
        ]
    ]


viewInput : String -> String -> String -> String -> (String -> msg) -> Html msg
viewInput typ p name val toMsg =
    input
        [ Html.Attributes.type_ typ
        , placeholder p
        , Html.Attributes.name name
        , value val
        , onInput toMsg
        ]
        []



-- HELPERS


newFormFName : String -> SubscriptionForm -> SubscriptionForm
newFormFName input currentForm =
    { currentForm | firstName = input }


newFormLName : String -> SubscriptionForm -> SubscriptionForm
newFormLName input currentForm =
    { currentForm | lastName = input }


newFormClass : String -> SubscriptionForm -> SubscriptionForm
newFormClass input currentForm =
    { currentForm | class = input }


newFormMail : String -> SubscriptionForm -> SubscriptionForm
newFormMail input currentForm =
    { currentForm | mail = input }
