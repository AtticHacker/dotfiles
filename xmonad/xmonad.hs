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
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders

myManageHook = composeAll [ className =? "Emesene"      --> doShift "2"
                          , className =? "Skype"        --> doShift "2"
                          , className =? "Pidgin"       --> doShift "2"
                          , className =? "Choqok"       --> doShift "2"
                          , className =? "Firefox"	--> doShift "3"
                          , className =? "Chromium"	--> doShift "3"
                          , className =? "Thunar"       --> doShift "4"
                          , className =? "Icedove"      --> doShift "5"
                          , className =? "Gitg"         --> doShift "8"
                          , className =? "Spotify"      --> doShift "4"                            
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
    , borderWidth        = 1
    , terminal           = "urxvt"
    , modMask            = mod4Mask
    , normalBorderColor  = "#000000"
    , focusFollowsMouse  = False
    , layoutHook         = toggleLayouts (noBorders Full) $
                           avoidStruts $ layoutHook defaultConfig
    }
    `additionalKeys`[ ((mod4Mask, xK_o               ), spawn "amixer --quiet set Master 1+")
                    , ((mod4Mask, xK_i               ), spawn "amixer --quiet set Master 1-")
                    , ((0, xF86XK_AudioMute          ), spawn "amixer --quiet set Master toggle")
                    , ((mod4Mask, xK_f               ), spawn "thunar")
                    , ((mod4Mask .|. shiftMask, xK_m ), spawn "terminal")
                    , ((0, xK_Print                  ), spawn "scrot")
                    , ((mod4Mask, xK_n               ), viewEmptyWorkspace)
                    , ((mod4Mask .|. shiftMask, xK_n ), tagToEmptyWorkspace)
                    -- , ((mod4Mask .|. shiftMask, xK_3 ), spawn "scrot")
                    -- , ((mod4Mask .|. shiftMask, xK_4 ), spawn "shutter -s")  
                    , ((mod4Mask, xK_b               ), spawn "toggleXmobar")
                    , ((mod4Mask, xK_w               ), nextScreen)
                    , ((mod1Mask, xK_Tab             ), windows W.focusDown)
                    , ((mod4Mask, xK_x               ), sendMessage ToggleLayout)
                    ]