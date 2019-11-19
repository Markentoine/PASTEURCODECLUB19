module Main exposing (..)

import Browser
import Footer exposing (..)
import Helpers.Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Message exposing (..)
import Page.Announce exposing (..)
import Page.Home exposing (..)
import Page.PageType exposing (..)
import Page.SignIn exposing (..)
import Page.SubscribeForm exposing (..)
import Page.Tutos exposing (..)


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
            { page = Home
            , footer = Nav
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
            [ Html.a [ href "", onClick BackHome ]
                [ p [ Html.Attributes.id "title" ] [ Html.text "PASTEURCODECLUB" ]
                ]
            ]
        , div []
            [ h2 [] [ text "Prochaine session du club Lundi 25 novembre à 12H30." ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain model =
    case model.page of
        Announcement blocks ->
            Html.main_ [] (viewBlocks blocks)

        Home ->
            Html.main_ [] viewNews

        Subscribe ->
            Html.main_ [] (viewForm model.form)

        SignIn ->
            Html.main_ [] []

        Tutos ->
            Html.main_ [] [ viewTutos ]


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
                [ div [ Html.Attributes.class "container" ]
                    []
                , gitHub
                ]

        Nav ->
            footer []
                [ div [ Html.Attributes.class "container" ]
                    [ button [ Html.Attributes.class "nav", onClick ToTutos ] [ Html.text "Tutos" ]
                    ]
                , gitHub
                ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BackHome ->
            ( { model | page = Home }, Cmd.none )

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

        ToTutos ->
            ( { model | page = Tutos, footer = Bare }, Cmd.none )

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