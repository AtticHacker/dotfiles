import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Config.Gnome
import XMonad.Actions.CycleWS

myManageHook = composeAll[
  className =? "Emesene"      --> doShift "2:com",
  className =? "Skype"        --> doShift "2:com",
  className =? "Choqok"       --> doShift "2:com",
  className =? "Chromium"     --> doShift "3:web",
  className =? "Opera"        --> doShift "3:web",
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
    borderWidth         = 1,
    terminal            = "urxvt",
    normalBorderColor   = "#000000",
    focusedBorderColor  = "#9d9d9d",
    focusFollowsMouse   = False
  }`additionalKeys`[
      ((mod1Mask,               xK_f),      spawn "thunar"),
      ((0,                      xK_Print),  spawn "scrot"),
      ((mod1Mask,               xK_n),      viewEmptyWorkspace),
      ((mod1Mask .|. shiftMask, xK_n),      tagToEmptyWorkspace),
      ((mod1Mask,               xK_w),      nextScreen)
    ]
