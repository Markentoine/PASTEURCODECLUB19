module Page.Landing exposing (..)

import Helpers.Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Message exposing (..)


viewLogo : List (Html Msg)
viewLogo =
    [ logo ]
