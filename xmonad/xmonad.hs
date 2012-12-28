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
    `additionalKeys`[ ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer --quiet set Master 1+")
                    , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer --quiet set Master 1-")
                    , ((0, xF86XK_AudioMute          ), spawn "amixer --quiet set Master toggle")
                    , ((0, xF86XK_KbdBrightnessUp    ), spawn "asus-kbd-backlit up")
                    , ((0, xF86XK_KbdBrightnessUp    ), spawn "asus-kbd-backlit up")
                    , ((mod4Mask, xK_F3              ), spawn "asus-kbd-backlit down")
                    , ((mod4Mask, xK_F4              ), spawn "asus-kbd-backlit down")
                    , ((mod4Mask, xK_F9              ), spawn "synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')")
                    , ((mod4Mask, xK_F5              ), spawn "xbacklight -10")
                    , ((mod4Mask, xK_F6              ), spawn "xbacklight +10")
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

-- > <Backspace>
-- > <Tab>
-- > <Return>
-- > <Pause>
-- > <Scroll_lock>
-- > <Sys_Req>
-- > <Print>
-- > <Escape>, <Esc>
-- > <Delete>
-- > <Home>
-- > <Left>, <L>
-- > <Up>, <U>
-- > <Right>, <R>
-- > <Down>, <D>
-- > <Page_Up>
-- > <Page_Down>
-- > <End>
-- > <Insert>
-- > <Break>
-- > <Space>
-- > <F1>-<F24>
-- > <KP_Space>
-- > <KP_Tab>
-- > <KP_Enter>
-- > <KP_F1>
-- > <KP_F2>
-- > <KP_F3>
-- > <KP_F4>
-- > <KP_Home>
-- > <KP_Left>
-- > <KP_Up>
-- > <KP_Right>
-- > <KP_Down>
-- > <KP_Prior>
-- > <KP_Page_Up>
-- > <KP_Next>
-- > <KP_Page_Down>
-- > <KP_End>
-- > <KP_Begin>
-- > <KP_Insert>
-- > <KP_Delete>
-- > <KP_Equal>
-- > <KP_Multiply>
-- > <KP_Add>
-- > <KP_Separator>
-- > <KP_Subtract>
-- > <KP_Decimal>
-- > <KP_Divide>
-- > <KP_0>-<KP_9>
--
-- Long list of multimedia keys. Please note that not all keys may be
-- present in your particular setup although most likely they will do.
--
-- > <XF86ModeLock>
-- > <XF86MonBrightnessUp>
-- > <XF86MonBrightnessDown>
-- > <XF86KbdLightOnOff>
-- > <XF86KbdBrightnessUp>
-- > <XF86KbdBrightnessDown>
-- > <XF86Standby>
-- > <XF86AudioLowerVolume>
-- > <XF86AudioMute>
-- > <XF86AudioRaiseVolume>
-- > <XF86AudioPlay>
-- > <XF86AudioStop>
-- > <XF86AudioPrev>
-- > <XF86AudioNext>
-- > <XF86HomePage>
-- > <XF86Mail>
-- > <XF86Start>
-- > <XF86Search>
-- > <XF86AudioRecord>
-- > <XF86Calculator>
-- > <XF86Memo>
-- > <XF86ToDoList>
-- > <XF86Calendar>
-- > <XF86PowerDown>
-- > <XF86ContrastAdjust>
-- > <XF86RockerUp>
-- > <XF86RockerDown>
-- > <XF86RockerEnter>
-- > <XF86Back>
-- > <XF86Forward>
-- > <XF86Stop>
-- > <XF86Refresh>
-- > <XF86PowerOff>
-- > <XF86WakeUp>
-- > <XF86Eject>
-- > <XF86ScreenSaver>
-- > <XF86WWW>
-- > <XF86Sleep>
-- > <XF86Favorites>
-- > <XF86AudioPause>
-- > <XF86AudioMedia>
-- > <XF86MyComputer>
-- > <XF86VendorHome>
-- > <XF86LightBulb>
-- > <XF86Shop>
-- > <XF86History>
-- > <XF86OpenURL>
-- > <XF86AddFavorite>
-- > <XF86HotLinks>
-- > <XF86BrightnessAdjust>
-- > <XF86Finance>
-- > <XF86Community>
-- > <XF86AudioRewind>
-- > <XF86XF86BackForward>
-- > <XF86Launch0>-<XF86Launch9>, <XF86LaunchA>-<XF86LaunchF>
-- > <XF86ApplicationLeft>
-- > <XF86ApplicationRight>
-- > <XF86Book>
-- > <XF86CD>
-- > <XF86Calculater>
-- > <XF86Clear>
-- > <XF86Close>
-- > <XF86Copy>
-- > <XF86Cut>
-- > <XF86Display>
-- > <XF86DOS>
-- > <XF86Documents>
-- > <XF86Excel>
-- > <XF86Explorer>
-- > <XF86Game>
-- > <XF86Go>
-- > <XF86iTouch>
-- > <XF86LogOff>
-- > <XF86Market>
-- > <XF86Meeting>
-- > <XF86MenuKB>
-- > <XF86MenuPB>
-- > <XF86MySites>
-- > <XF86New>
-- > <XF86News>
-- > <XF86OfficeHome>
-- > <XF86Open>
-- > <XF86Option>
-- > <XF86Paste>
-- > <XF86Phone>
-- > <XF86Q>
-- > <XF86Reply>
-- > <XF86Reload>
-- > <XF86RotateWindows>
-- > <XF86RotationPB>
-- > <XF86RotationKB>
-- > <XF86Save>
-- > <XF86ScrollUp>
-- > <XF86ScrollDown>
-- > <XF86ScrollClick>
-- > <XF86Send>
-- > <XF86Spell>
-- > <XF86SplitScreen>
-- > <XF86Support>
-- > <XF86TaskPane>
-- > <XF86Terminal>
-- > <XF86Tools>
-- > <XF86Travel>
-- > <XF86UserPB>
-- > <XF86User1KB>
-- > <XF86User2KB>
-- > <XF86Video>
-- > <XF86WheelButton>
-- > <XF86Word>
-- > <XF86Xfer>
-- > <XF86ZoomIn>
-- > <XF86ZoomOut>
-- > <XF86Away>
-- > <XF86Messenger>
-- > <XF86WebCam>
-- > <XF86MailForward>
-- > <XF86Pictures>
-- > <XF86Music>
-- > <XF86TouchpadToggle>
-- > <XF86_Switch_VT_1>-<XF86_Switch_VT_12>
-- > <XF86_Ungrab>
-- > <XF86_ClearGrab>
-- > <XF86_Next_VMode>
-- > <XF86_Prev_VMode>

