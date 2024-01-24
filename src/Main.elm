module Main exposing (main)

import Browser
import Html as H
import Html.Attributes as HA


main : Program String Model msg
main =
    Browser.element
        { init = init
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = always Sub.none
        , view = view
        }



-- MODEL


type alias Model =
    { name : String
    }


init : String -> ( Model, Cmd msg )
init name =
    ( { name = name
      }
    , Cmd.none
    )



-- VIEW


view : Model -> H.Html msg
view { name } =
    viewLayout <|
        viewHello name


viewLayout : H.Html msg -> H.Html msg
viewLayout content =
    H.div
        [ HA.class "layout" ]
        [ H.div
            [ HA.class "layout__content" ]
            [ content ]
        ]


viewHello : String -> H.Html msg
viewHello name =
    H.p [ HA.class "hello" ] [ H.text <| "Hello, " ++ name ++ "!" ]
