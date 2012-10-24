import Yi
import Attic
import Yi.Prelude
import Prelude ()

import Yi.Keymap.Emacs (keymap)
-- import Yi.Keymap.Cua (keymap)
import Yi.Keymap.Vim (keymapSet)
import Yi.Mode.Haskell
import Yi.Style.Library
import Roar

myConfig = defaultVimConfig
--myConfig = defaultEmacsConfig

defaultUIConfig = configUI myConfig


helloWorld2 :: BufferM ()
helloWorld2 = do 
  insertN "Hello, world!"

haskellModeHooks mode = mode
                 { modeName = "Attic"
                 }


main = yi $ myConfig
       { defaultKm = defaultKm myConfig
       , startFrontEnd = startFrontEnd myConfig
       , modeTable = AnyMode (haskellModeHooks preciseMode) : modeTable defaultConfig
       , configUI = defaultUIConfig
         { configFontSize = Nothing
         , configTheme = atticScheme --configTheme defaultUIConfig
         , configWindowFill = ' '
         }
       }
