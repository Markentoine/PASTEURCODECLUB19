module User exposing (..)


type UserProfile
    = NotSet
    | Failure
    | Set UserInfos


type alias UserInfos =
    { id : String
    , username : String
    }
