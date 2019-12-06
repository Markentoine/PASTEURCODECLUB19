module Page.PageType exposing (..)

import Page.Announce exposing (Blocks)


type Page
    = Announcement Blocks
    | Landing
    | Home
    | Subscribe
    | SignIn
    | Tutos
    | Images
