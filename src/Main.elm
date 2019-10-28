module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Svg exposing (..)
import Svg.Attributes exposing (..)


type alias Model =
    { page : Page
    , form : Form
    }


type alias Form =
    { firstName : String
    , lastName : String
    , class : String
    , mail : String
    }


type Msg
    = Announce
    | What
    | When
    | WhatToDo
    | SignUp
    | FirstName String
    | LastName String
    | Class String
    | Mail String


type Page
    = Announcement Blocks
    | Home
    | Subscribe


type Blocks
    = New
    | WhatIsIt
    | WhatDoWeDo
    | WhenDoWeStart


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : () -> ( Model, Cmd Msg )
init () =
    let
        initialModel =
            { page = Announcement New
            , form =
                { firstName = ""
                , lastName = ""
                , class = ""
                , mail = ""
                }
            }
    in
    ( initialModel, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ Html.Attributes.class "wrapper" ] (viewPage model)


viewPage : Model -> List (Html Msg)
viewPage model =
    [ viewHeader
    , viewMain model
    , viewFooter model
    ]


viewHeader : Html Msg
viewHeader =
    header []
        [ div [ Html.Attributes.class "bigTitle" ]
            [ Html.a [ href "", onClick Announce ]
                [ p [ Html.Attributes.id "title" ] [ Html.text "PASTEURCODECLUB" ]
                ]
            ]
        , div [ Html.Attributes.class "editorCode" ]
            [ Html.a [ href "https://ellie-app.com/6XsQCg75RCDa1", Html.Attributes.target "_blank" ]
                [ Html.text ">>> ELLIE <<<"
                ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain model =
    case model.page of
        Announcement blocks ->
            Html.main_ [] (viewBlocks blocks)

        Home ->
            Html.main_ [] []

        Subscribe ->
            Html.main_ [] (viewForm model.form)


viewBlocks : Blocks -> List (Html Msg)
viewBlocks blocks =
    case blocks of
        New ->
            createBlocks
                [ ( "1", "---- NOUVELLE SAISON ----", "2019-2020" )
                , ( "2", "---- NOUVEAU LANGAGE ----", "Elm" )
                , ( "3", "---- NOUVEL HORAIRE ----", "LUNDI 12h30-13h15" )
                , ( "4", "---- NOUVELLE SALLE ----", "203" )
                ]

        WhatIsIt ->
            createBlocks
                [ ( "1", "Un Club", "d'une dizaine de personnes" )
                , ( "2", "Qui se réunit tous les lundis", "Entre 12h30 et 13h15" )
                , ( "3", "Dans une salle", "peuplée d'ordinateurs" )
                , ( "4", "Pour apprendre joyeusement ", "A coder, programmer, créer" )
                ]

        WhatDoWeDo ->
            createBlocks
                [ ( "1", "On  apprendra", "un  langage  nommé  Elm" )
                , ( "2", "Qui nous permettra", "De programmer à partir de zéro" )
                , ( "3", "De dessiner", "De donner vie à des êtres, des choses" )
                , ( "4", "De créer des jeux", "Des petits d'abord et des plus grands ensuite..." )
                ]

        WhenDoWeStart ->
            createBlocks
                [ ( "1", "La première séance", "aura lieu le 18 novembre" )
                , ( "2", "Et ensuite chaque semaine", "A la même heure" )
                , ( "3", "Tu passeras en priorité", "au restaurant scolaire" )
                , ( "4", "Monte directement en salle 203", "Dès que possible après la fin du repas" )
                ]


createBlocks : List ( String, String, String ) -> List (Html Msg)
createBlocks announces =
    [ div [ Html.Attributes.class "submain" ]
        (List.map
            (\( nbBlock, first, second ) ->
                section [ Html.Attributes.id (String.concat [ "block", nbBlock ]) ]
                    [ h1 [ Html.Attributes.class "explications" ] [ Html.text first ]
                    , h1 [ Html.Attributes.class "explications" ] [ Html.text second ]
                    ]
            )
            announces
        )
    ]


viewFooter : Model -> Html Msg
viewFooter model =
    footer []
        [ div [ Html.Attributes.class "container" ]
            [ button [ Html.Attributes.class "nav", onClick What ] [ Html.text "C'est quoi?" ]
            , button [ Html.Attributes.class "nav", onClick WhatToDo ] [ Html.text "On fait quoi?" ]
            , button [ Html.Attributes.class "nav", onClick SignUp ] [ Html.text "Je m'inscris!" ]
            , button [ Html.Attributes.class "nav", onClick When ] [ Html.text "On commence quand?" ]
            ]
        , gitHub
        ]


viewForm : Form -> List (Html Msg)
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
viewInput t p n v toMsg =
    input
        [ Html.Attributes.type_ t
        , placeholder p
        , Html.Attributes.name n
        , value v
        , onInput toMsg
        ]
        []


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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Announce ->
            ( { model | page = Announcement New }, Cmd.none )

        What ->
            ( { model | page = Announcement WhatIsIt }, Cmd.none )

        When ->
            ( { model | page = Announcement WhenDoWeStart }, Cmd.none )

        WhatToDo ->
            ( { model | page = Announcement WhatDoWeDo }, Cmd.none )

        SignUp ->
            ( { model | page = Subscribe }, Cmd.none )

        FirstName fname ->
            let
                currentForm =
                    model.form

                newForm =
                    { currentForm | firstName = fname }
            in
            ( { model | form = newForm }, Cmd.none )

        LastName lname ->
            let
                currentForm =
                    model.form

                newForm =
                    { currentForm | lastName = lname }
            in
            ( { model | form = newForm }, Cmd.none )

        Class class ->
            let
                currentForm =
                    model.form

                newForm =
                    { currentForm | class = class }
            in
            ( { model | form = newForm }, Cmd.none )

        Mail mail ->
            let
                currentForm =
                    model.form

                newForm =
                    { currentForm | mail = mail }
            in
            ( { model | form = newForm }, Cmd.none )
