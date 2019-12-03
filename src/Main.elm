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
import Page.Images exposing (..)
import Page.PageType exposing (..)
import Page.SignIn exposing (..)
import Page.SubscribeForm exposing (..)
import Page.Tutos exposing (..)
import Request exposing (authenticateUser)
import User exposing (..)


type alias Model =
    { page : Page
    , footer : Footer
    , signupForm : SubscriptionForm
    , signinForm : SignInForm
    , userProfile : UserProfile
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
            , signupForm =
                { firstName = ""
                , lastName = ""
                , class = ""
                , mail = ""
                }
            , signinForm =
                { username = ""
                , pwd = ""
                }
            , userProfile = NotSet
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
        , div [ Html.Attributes.class "headerNav" ]
            [ button [ onClick Authentication ] [ Html.text "Connexion" ]
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
            Html.main_ [] (viewForm model.signupForm)

        SignIn ->
            Html.main_ [] (viewSignIn model.signinForm)

        Tutos ->
            Html.main_ [] [ viewTutos ]

        Images ->
            Html.main_ [] [ viewImages ]


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
                    [ button [ Html.Attributes.class "nav", onClick ToTutos ] [ Html.text "Tutos" ] ]
                , gitHub
                ]

        ForTutos ->
            footer []
                [ div [ Html.Attributes.class "container" ]
                    [ text "<<Attention>> Les Tutos les plus anciens sont en fin page! Le plus récent apparaît en premier."
                    , button [ Html.Attributes.class "nav", onClick ToPictures ] [ Html.text "Images" ]
                    ]
                , gitHub
                ]

        ForImages ->
            footer []
                [ div [ Html.Attributes.class "container" ]
                    [ text "Ces images sont indispensables pour réussir certains exercices proposés dans les tutos."
                    , button [ Html.Attributes.class "nav", onClick ToTutos ] [ Html.text "Tutos" ]
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
            ( { model | page = Tutos, footer = ForTutos }, Cmd.none )

        ToPictures ->
            ( { model | page = Images, footer = ForImages }, Cmd.none )

        Authentication ->
            ( { model | page = SignIn }, Cmd.none )

        GotUserProfile result ->
            case result of
                Ok userInfos ->
                    ( { model | page = Home, userProfile = Set userInfos }, Cmd.none )

                Err _ ->
                    ( { model | page = Tutos, userProfile = Failure }, Cmd.none )

        Profile ->
            ( model, authenticateUser model.signinForm )

        Username username ->
            ( { model | signinForm = newUserName username model.signinForm }, Cmd.none )

        Pwd pwd ->
            ( { model | signinForm = newFormPwd pwd model.signinForm }, Cmd.none )

        FirstName fname ->
            ( { model | signupForm = newFormFName fname model.signupForm }, Cmd.none )

        LastName lname ->
            ( { model | signupForm = newFormLName lname model.signupForm }, Cmd.none )

        Class class ->
            ( { model | signupForm = newFormClass class model.signupForm }, Cmd.none )

        Mail mail ->
            ( { model | signupForm = newFormMail mail model.signupForm }, Cmd.none )
