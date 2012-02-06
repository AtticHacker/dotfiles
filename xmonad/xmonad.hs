import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.Spacing

main = xmonad =<< xmobar myConfig
myConfig =  defaultConfig
  { borderWidth         = 2
  , terminal            = "terminal"
  , modMask             = controlMask
  , normalBorderColor   = "#cccccc"
  , layoutHook = spacing 2 $ Tall 1 (3/100) (1/2)
  , focusedBorderColor  = "#ff0000" }

-- Put 2 pixel space bewtween windows
