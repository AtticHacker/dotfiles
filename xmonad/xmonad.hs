import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll[
  className =? "URxvt"        --> doShift "1:dev",
  className =? "Emesene"      --> doShift "2:com",
  className =? "Skype"        --> doShift "2:com",
  className =? "Chromium"     --> doShift "3:web",
  className =? "Thunar"       --> doShift "4:file",
  className =? "Thunderbird"  --> doShift "9:mail",
  className =? "Gitg"         --> doShift "8"
  ]
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.xmobarrc"
  xmonad $ defaultConfig{
    workspaces = ["1:dev", "2:com", "3:web", "4:file",
    "5:mail", "6", "7", "8", "9:mail", "0", "-", "="],
    manageHook = myManageHook <+> manageHook defaultConfig,
    layoutHook = avoidStruts $ layoutHook defaultConfig,
    borderWidth         = 2,
    terminal            = "urxvt",
    modMask             = mod4Mask,
    normalBorderColor   = "#cccccc",
    focusedBorderColor  = "#ff0000",
    focusFollowsMouse   = False
  } `additionalKeys`
    [ ((mod4Mask, xK_w),  spawn "chromium")
    , ((mod4Mask, xK_f),  spawn "thunar")
    , ((mod4Mask, xK_t),  spawn "urxvt")
    , ((0, xK_Print),     spawn "scrot")
    ]
