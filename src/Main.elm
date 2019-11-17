module Main exposing (..)

import Browser
import Footer exposing (..)
import Helpers.Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Message exposing (..)
import Page.Announce exposing (..)
import Page.PageType exposing (..)
import Page.SubscribeForm exposing (..)


type alias Model =
    { page : Page
    , footer : Footer
    , form : Form
    }


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
            , footer = Bare
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
            [ button [ Html.Attributes.class "nav", onClick Authentication ]
                [ Html.text "S'Identifier" ]
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

        SignIn ->
            Html.main_ [] []


viewFooter : Model -> Html Msg
viewFooter model =
    case model.footer of
        Presentation ->
            footer []
                [ div [ Html.Attributes.class "container" ]
                    [ button [ Html.Attributes.class "nav", onClick What ] [ Html.text "C'est quoi?" ]
                    , button [ Html.Attributes.class "nav", onClick WhatToDo ] [ Html.text "On fait quoi?" ]
                    , button [ Html.Attributes.class "nav", onClick SignUp ] [ Html.text "Je m'inscris!" ]
                    , button [ Html.Attributes.class "nav", onClick When ] [ Html.text "On commence quand?" ]
                    ]
                , gitHub
                ]

        Bare ->
            footer []
                [
                    gitHub
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

        Authentication ->
            ( { model | page = SignIn }, Cmd.none )

        FirstName fname ->
            ( { model | form = newFormFName fname model.form }, Cmd.none )

        LastName lname ->
            ( { model | form = newFormLName lname model.form }, Cmd.none )

        Class class ->
            ( { model | form = newFormClass class model.form }, Cmd.none )

        Mail mail ->
            ( { model | form = newFormMail mail model.form }, Cmd.none )
