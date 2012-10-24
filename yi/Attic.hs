module Attic where

import Yi.Style
import Data.Prototype
import Data.Monoid

type Theme = Proto UIStyle

defaultTheme :: Theme
defaultTheme = Proto $ const $ UIStyle
  { modelineAttributes = error "modeline attributes must be redefined!"
  , baseAttributes     = error "base attributes must be redefined!"
  , tabBarAttributes   = error "tabbar attributes must be redefined!"
  , commentStyle       = withFg grey
  , blockCommentStyle  = withFg grey
  , errorStyle         = withBg red
  , selectedStyle      = withFg black `mappend` withBg cyan
  , numberStyle        = withFg darkred
  , importStyle        = withFg cyan
  , variableStyle      = withFg white

  , hintStyle          = withFg green
  , strongHintStyle    = withFg green
  , keywordStyle       = withFg yellow
  , preprocessorStyle  = withFg red
  , typeStyle          = withFg red
  , dataConstructorStyle = withFg darkred
  , regexStyle         = withFg green
  , operatorStyle      = withFg brown
  , makeFileRuleHead   = withFg blue
  , makeFileAction     = withFg yellow
  , quoteStyle         = withFg red

  , modelineFocusStyle = withFg white
  , tabInFocusStyle    = withFg white
  , tabNotFocusedStyle = withFg white
  , eofStyle           = withFg white
  , stringStyle        = withFg green
  , longStringStyle    = withFg green
  , builtinStyle       = withFg white
  }

atticScheme :: Theme
atticScheme = defaultTheme `override` \super _ -> super
  { modelineAttributes = emptyAttributes { foreground = black,    background = darkcyan }
  , tabBarAttributes   = emptyAttributes { foreground = white,    background = black }
  , baseAttributes     = emptyAttributes
  }


-- defaultTheme :: Theme
-- defaultTheme = Proto $ const $ UIStyle
--   { modelineAttributes = error "modeline attributes must be redefined!"
--   , modelineFocusStyle = withFg brightwhite

--   , tabBarAttributes   = error "tabbar attributes must be redefined!"
--   , tabInFocusStyle    = withFg black `mappend` withBg brightwhite
--   , tabNotFocusedStyle = withFg grey `mappend` withBg white

--   , baseAttributes     = error "base attributes must be redefined!"

--   , eofStyle           = withFg blue
--   , errorStyle         = withBg red
--   , hintStyle          = withFg black `mappend` withBg cyan
--   , strongHintStyle    = withFg black `mappend` withBg magenta

--   , commentStyle       = withFg blue
--   , blockCommentStyle  = withFg purple
--   , keywordStyle       = withFg darkblue
--   , numberStyle        = withFg darkred
--   , preprocessorStyle  = withFg red
--   , stringStyle        = withFg darkcyan
--   , longStringStyle    = mempty
--   , typeStyle          = withFg darkgreen
--   , dataConstructorStyle
--                        = withBd True `mappend` withFg darkgreen
--   , importStyle        = withFg blue
--   , builtinStyle       = withFg white
--   , regexStyle         = withFg red
--   , variableStyle      = mempty
--   , operatorStyle      = withFg brown
--   , makeFileRuleHead   = withFg blue
--   , makeFileAction     = withFg grey
--   , quoteStyle         = withFg grey
--   }

-- atticScheme :: Theme
-- atticScheme = defaultTheme `override` \super _ -> super
--   { modelineAttributes = emptyAttributes { foreground = black,    background = darkcyan }
--   , tabBarAttributes   = emptyAttributes { foreground = white,    background = black }
--   , baseAttributes     = emptyAttributes
--   }
