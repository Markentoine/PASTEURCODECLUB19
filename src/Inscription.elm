module Inscription exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



-- MAIN


main : Program () Model msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- VIEW


view : Model -> Html msg
view model =
    div [ class "inscriptions" ] [ h1 [] [ text "inscriptions" ] ]



-- UPDATE


update : msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( initialModel, Cmd.none )



-- MODEL


type alias Model =
    {}


initialModel : Model
initialModel =
    {}
