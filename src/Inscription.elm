module Inscription exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Form =
    { firstName : String
    , lastName : String
    , class : String
    , mail : String
    }


view : Form -> List (Html Msg)
view form =
    [ h1 [] [ text "Inscris toi en remplissant les cases" ]
    , p [] [ text "Le mail est nécessaire pour te répondre afin que tu saches si tu fais partie du club" ]
    , p [] [ text "Le nombre de places est limité à 10 en tout." ]
    , viewInput "text" "Prénom" form.firstName FirstName
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []



-- UPDATE


type Msg
    = FirstName String
    | LastName String
    | Class String
    | Mail String


update : Msg -> Form -> ( Form, Cmd Msg )
update msg form =
    case msg of
        FirstName fname ->
            ( { form | firstName = fname }, Cmd.none )

        LastName lname ->
            ( { form | lastName = lname }, Cmd.none )

        Class class ->
            ( { form | class = class }, Cmd.none )

        Mail mail ->
            ( { form | mail = mail }, Cmd.none )
