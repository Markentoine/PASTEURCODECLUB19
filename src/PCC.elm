module PCC exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)


type alias Model =
    { main : List (Html Msg) }


type Msg
    = Landing
    | WhatisIt
    | When
    | WhatToDo
    | SignIn



-- MODEL


initialModel : Model
initialModel =
    { main =
        [ div [ Html.Attributes.class "submain" ]
            [ section [ Html.Attributes.id "saison" ]
                [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVELLE SAISON ----" ]
                , h1 [ Html.Attributes.class "annonce" ] [ Html.text "2019-2020" ]
                ]
            , section
                [ Html.Attributes.id "langage" ]
                [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVEAU LANGAGE ----" ]
                , h1 [ Html.Attributes.class "annonce" ] [ Html.text "ELM" ]
                ]
            , section [ Html.Attributes.id "horaire" ]
                [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVEL HORAIRE ----" ]
                , h1 [ Html.Attributes.class "annonce" ] [ Html.text "LUNDI 12h30-13h15" ]
                ]
            , section [ Html.Attributes.id "salle" ]
                [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVELLE SALLE ----" ]
                , h1 [ Html.Attributes.class "annonce" ] [ Html.text "203" ]
                ]
            ]
        ]
    }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Landing ->
            let
                newMain =
                    [ div [ Html.Attributes.class "submain" ]
                        [ section [ Html.Attributes.id "saison" ]
                            [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVELLE SAISON ----" ]
                            , h1 [ Html.Attributes.class "annonce" ] [ Html.text "2019-2020" ]
                            ]
                        , section
                            [ Html.Attributes.id "langage" ]
                            [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVEAU LANGAGE ----" ]
                            , h1 [ Html.Attributes.class "annonce" ] [ Html.text "ELM" ]
                            ]
                        , section [ Html.Attributes.id "horaire" ]
                            [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVEL HORAIRE ----" ]
                            , h1 [ Html.Attributes.class "annonce" ] [ Html.text "LUNDI 12h30-13h15" ]
                            ]
                        , section [ Html.Attributes.id "salle" ]
                            [ h1 [ Html.Attributes.class "annonce" ] [ Html.text "---- NOUVELLE SALLE ----" ]
                            , h1 [ Html.Attributes.class "annonce" ] [ Html.text "203" ]
                            ]
                        ]
                    ]
            in
            ( { model | main = newMain }, Cmd.none )

        WhatisIt ->
            let
                newMain =
                    [ div [ Html.Attributes.class "submain" ]
                        [ section [ Html.Attributes.id "saison" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Un Club" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "d'une dizaine d'élèves" ]
                            ]
                        , section
                            [ Html.Attributes.id "langage" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Qui se réunit tous les lundis" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "Entre 12h30 et 13h15" ]
                            ]
                        , section [ Html.Attributes.id "horaire" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Dans une salle" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "peuplée d'ordinateurs" ]
                            ]
                        , section [ Html.Attributes.id "salle" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Pour apprendre joyeusement " ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "A coder, programmer, créer" ]
                            ]
                        ]
                    ]
            in
            ( { model | main = newMain }, Cmd.none )

        When ->
            let
                newMain =
                    [ div [ Html.Attributes.class "submain" ]
                        [ section [ Html.Attributes.id "saison" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "La première séance" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "aura lieu le 4 novembre" ]
                            ]
                        , section
                            [ Html.Attributes.id "langage" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Si vous vous êtes inscrits plus tard" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "Vous pouvez venir à la 2eme séance" ]
                            ]
                        , section [ Html.Attributes.id "horaire" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Elle aura lieu" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "Le lundi 18 novembre" ]
                            ]
                        , section [ Html.Attributes.id "salle" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Montez directement en salle 203" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "Dès que possible après la fin du repas" ]
                            ]
                        ]
                    ]
            in
            ( { model | main = newMain }, Cmd.none )

        WhatToDo ->
            let
                newMain =
                    [ div [ Html.Attributes.class "submain" ]
                        [ section [ Html.Attributes.id "saison" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "On  apprendra" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "un  langage  appelé  Elm" ]
                            ]
                        , section
                            [ Html.Attributes.id "langage" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "Qui nous permettra" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "De programmer à partir de zéro" ]
                            ]
                        , section [ Html.Attributes.id "horaire" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "De dessiner" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "De donner vie à des êtres, des choses" ]
                            ]
                        , section [ Html.Attributes.id "salle" ]
                            [ h1 [ Html.Attributes.class "explications" ] [ Html.text "De créer des jeux" ]
                            , h1 [ Html.Attributes.class "explications" ] [ Html.text "Des petits d'abord et des plus grands ensuite..." ]
                            ]
                        ]
                    ]
            in
            ( { model | main = newMain }, Cmd.none )

        SignIn ->
            ( model, Cmd.none )



-- VIEWS


viewHeader : Html Msg
viewHeader =
    header []
        [ div [ Html.Attributes.class "bigTitle" ]
            [ Html.a [ href "", onClick Landing ]
                [ p [ Html.Attributes.id "title" ] [ Html.text "PASTEURCODECLUB" ]
                ]
            ]
        , div [ Html.Attributes.class "editorCode" ]
            [ Html.a [ href "https://ellie-app.com/new", Html.Attributes.target "_blank" ]
                [ Html.text ">>> ELLIE <<<"
                ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain model =
    Html.main_ [] model.main


viewFooter : Html Msg
viewFooter =
    footer []
        [ div [ Html.Attributes.class "container" ]
            [ button [ Html.Attributes.class "nav", onClick WhatisIt ] [ Html.text "C'est quoi?" ]
            , button [ Html.Attributes.class "nav", onClick WhatToDo ] [ Html.text "On fait quoi?" ]
            , button [ Html.Attributes.class "nav" ] [ Html.text "Je m'inscris!" ]
            , button [ Html.Attributes.class "nav", onClick When ] [ Html.text "On commence quand?" ]
            ]
        , Html.a [ href "https://github.com/Markentoine/PASTEURCODECLUB19", Html.Attributes.target "_blank" ]
            [ div [ Html.Attributes.class "github" ]
                [ svg [ viewBox "0 0 24 24", xmlSpace "http://www.w3.org/2000/svg" ]
                    [ Svg.title [] [ Svg.text "GitHub icon" ]
                    , Svg.path [ d "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12" ] []
                    ]
                ]
            ]
        ]


view : Model -> Html Msg
view model =
    div [ Html.Attributes.class "wrapper" ]
        [ viewHeader
        , viewMain model
        , viewFooter
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
