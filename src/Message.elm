module Message exposing (..)

import Http exposing (Error)
import User exposing (UserInfos)


type Msg
    = Announce
    | What
    | When
    | WhatToDo
    | SignUp
    | Username String
    | Pwd String
    | ToTutos
    | ToPictures
    | BackHome
    | Authentication
    | Profile
    | GotUserProfile (Result Error UserInfos)
    | FirstName String
    | LastName String
    | Class String
    | Mail String
