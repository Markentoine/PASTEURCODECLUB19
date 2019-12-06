module Request exposing (..)

import Http
import Json.Decode exposing (Decoder, field, map2, string)
import Json.Encode as Encode
import Message exposing (..)
import Page.SignIn exposing (SignInForm)
import User exposing (UserInfos)


authenticateUser : SignInForm -> Cmd Msg
authenticateUser form =
    Http.post
        { url = "https://rare-lined-hagfish.gigalixirapp.com/api/users/sign_in"
        , body = Http.jsonBody (encodeUserCredentials form)
        , expect = Http.expectJson GotUserProfile decodeUserProfile
        }



-- ENCODER


encodeUserCredentials : SignInForm -> Encode.Value
encodeUserCredentials form =
    Encode.object
        [ ( "username", Encode.string form.username )
        , ( "password", Encode.string form.pwd )
        ]



-- DECODER


decodeUserProfile : Decoder UserInfos
decodeUserProfile =
    map2 UserInfos
        (field "data" (field "user" (field "id" string)))
        (field "data" (field "user" (field "username" string)))
