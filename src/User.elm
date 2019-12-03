module User exposing (..)


type UserProfile
    = NotSet
    | Failure
    | Set UserInfos


type alias UserInfos =
    { id : String
    , payload : String
    }
