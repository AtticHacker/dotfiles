import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Config.Gnome
import XMonad.Actions.CycleWS
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

myManageHook = composeAll [ className =? "Emesene"      --> doShift "2"
                          , className =? "Skype"        --> doShift "2"
                          , className =? "Pidgin"       --> doShift "2"
                          , className =? "Choqok"       --> doShift "2"
                          , className =? "Firefox"	--> doShift "3"
                          , className =? "Chromium"	--> doShift "3"
                          , className =? "Thunar"       --> doShift "4"
                          , className =? "Icedove"      --> doShift "5"
                          , className =? "Gitg"         --> doShift "8"
                          ]

main = do
  xmonad $ defaultConfig{
    workspaces = [ "1"
                 , "2"
                 , "3"
                 , "4"
                 , "5"
                 , "6"
                 , "7"
                 , "8"
                 , "9"
                 , "0"
                 , "-"
                 , "="
                 ]

    , manageHook = myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , borderWidth        = 1
    , terminal           = "urxvt"
    , modMask            = mod4Mask
    , normalBorderColor  = "#000000"
    , focusFollowsMouse  = False
    }
    `additionalKeys`[ ((mod4Mask, xK_o               ), spawn "amixer --quiet set Master 1+")
                    , ((mod4Mask, xK_i               ), spawn "amixer --quiet set Master 1-")
                    , ((0, xF86XK_AudioMute          ), spawn "amixer --quiet set Master toggle")
                    , ((mod4Mask, xK_f               ), spawn "thunar")
                    , ((mod4Mask .|. shiftMask, xK_m ), spawn "terminal")
                    , ((0, xK_Print                  ), spawn "scrot")
                    , ((mod4Mask, xK_n               ), viewEmptyWorkspace)
                    , ((mod4Mask .|. shiftMask, xK_n ), tagToEmptyWorkspace)
                    , ((mod4Mask, xK_b               ), spawn "toggleXmobar")
                    , ((mod4Mask, xK_w               ), nextScreen)
                    , ((mod1Mask, xK_Tab             ), windows W.focusDown)
                    ]

prettyPrinter :: D.Client -> PP
prettyPrinter dbus = defaultPP
    { ppOutput   = dbusOutput dbus
    , ppTitle    = pangoSanitize
    , ppCurrent  = pangoColor "green" . wrap "[" "]" . pangoSanitize
    , ppVisible  = pangoColor "yellow" . wrap "(" ")" . pangoSanitize
    , ppHidden   = const ""
    , ppUrgent   = pangoColor "red"
    , ppLayout   = const ""
    , ppSep      = " "
    }

getWellKnownName :: D.Client -> IO ()
getWellKnownName dbus = do
  D.requestName dbus (D.busName_ "org.xmonad.Log")
                [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
  return ()
  
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal "/org/xmonad/Log" "org.xmonad.Log" "Update") {
            D.signalBody = [D.toVariant ("<b>" ++ (UTF8.decodeString str) ++ "</b>")]
        }
    D.emit dbus signal

pangoColor :: String -> String -> String
pangoColor fg = wrap left right
  where
    left  = "<span foreground=\"" ++ fg ++ "\">"
    right = "</span>"

pangoSanitize :: String -> String
pangoSanitize = foldr sanitize ""
  where
    sanitize '>'  xs = "&gt;" ++ xs
    sanitize '<'  xs = "&lt;" ++ xs
    sanitize '\"' xs = "&quot;" ++ xs
    sanitize '&'  xs = "&amp;" ++ xs
    sanitize x    xs = x:xs
