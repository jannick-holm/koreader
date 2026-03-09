--[[--
Centralized design theme for KOReader's UI.

This module provides semantic color names and design tokens that map to the
underlying Blitbuffer color constants. The goal is to establish a consistent
visual language across all widgets and make future theming (e.g., dark mode)
easier to implement by changing colors in one place.

Usage:
    local Theme = require("ui/theme")
    local frame = FrameContainer:new{
        background = Theme.colors.background_primary,
        color      = Theme.colors.border_default,
    }

Color values are standard Blitbuffer constants, so they are fully compatible
with all existing widget APIs.
--]]

local Blitbuffer = require("ffi/blitbuffer")

-- ---------------------------------------------------------------------------
-- Color palette
-- ---------------------------------------------------------------------------
-- Rather than scattering raw Blitbuffer constants through every widget, all
-- color decisions should be expressed via these semantic names. Widgets that
-- still reference Blitbuffer constants directly are still correct; these
-- aliases simply make intent clearer and future re-theming easier.

local colors = {
    -- Backgrounds
    -- background_primary   : the main content/reading area and dialog backgrounds
    -- background_secondary : panel, sidebar, and alt-row tinting
    -- background_overlay   : used behind modal dialogs (currently identical to secondary)
    background_primary   = Blitbuffer.COLOR_WHITE,
    background_secondary = Blitbuffer.COLOR_LIGHT_GRAY,
    background_overlay   = Blitbuffer.COLOR_LIGHT_GRAY,

    -- Text
    -- text_primary   : default readable text
    -- text_secondary : captions, hints, disabled labels, subtitles
    -- text_inverse   : text drawn on a dark/inverted background
    text_primary   = Blitbuffer.COLOR_BLACK,
    text_secondary = Blitbuffer.COLOR_DARK_GRAY,
    text_inverse   = Blitbuffer.COLOR_WHITE,

    -- Borders & dividers
    -- border_default : window frames, input boxes, focused elements
    -- border_subtle  : separator lines inside menus/dialogs (lighter than default)
    -- border_none    : visually invisible border (same as background)
    border_default = Blitbuffer.COLOR_BLACK,
    border_subtle  = Blitbuffer.COLOR_DARK_GRAY,
    border_none    = Blitbuffer.COLOR_WHITE,

    -- Interactive elements (buttons)
    button_background = Blitbuffer.COLOR_WHITE,
    button_border     = Blitbuffer.COLOR_BLACK,
    button_text       = Blitbuffer.COLOR_BLACK,
    button_text_dim   = Blitbuffer.COLOR_DARK_GRAY,

    -- Notification / toast popups
    -- Toast notifications use an inverted (dark) style for high contrast.
    toast_background = Blitbuffer.COLOR_WHITE,
    toast_border     = Blitbuffer.COLOR_BLACK,
    toast_text       = Blitbuffer.COLOR_BLACK,

    -- Progress indicators
    progress_fill    = Blitbuffer.COLOR_BLACK,
    progress_empty   = Blitbuffer.COLOR_LIGHT_GRAY,

    -- Focus / selection highlight
    highlight_background = Blitbuffer.COLOR_BLACK,
    highlight_text       = Blitbuffer.COLOR_WHITE,
}

-- ---------------------------------------------------------------------------
-- Typography scale
-- ---------------------------------------------------------------------------
-- Reference font sizes (unscaled, passed to Font:getFace). Actual rendered
-- sizes are DPI-scaled automatically by the font system.

local typography = {
    size_title      = 26, -- dialog/panel titles (tfont bold)
    size_body       = 24, -- default body text (cfont)
    size_secondary  = 22, -- secondary labels, menu items (smallinfofont)
    size_caption    = 20, -- footer, captions, small labels
    size_tiny       = 16, -- annotations, keyboard shortcuts
}

-- ---------------------------------------------------------------------------
-- Spacing tokens
-- ---------------------------------------------------------------------------
-- Minimum recommended touch-target size in unscaled pixels, following the
-- 44 pt guideline used by iOS and Material Design.

local spacing = {
    touch_target_min    = 44, -- minimum tap area height/width (unscaled px)
    icon_tap_extension  = 20, -- extra invisible padding around icon buttons
}

-- ---------------------------------------------------------------------------
-- Public API
-- ---------------------------------------------------------------------------

local Theme = {
    colors     = colors,
    typography = typography,
    spacing    = spacing,
}

return Theme
