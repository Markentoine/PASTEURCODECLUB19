module Page.PageType exposing (..)

import Page.Announce exposing (Blocks)


type Page
    = Announcement Blocks
    | Home
    | Subscribe
    | SignIn
