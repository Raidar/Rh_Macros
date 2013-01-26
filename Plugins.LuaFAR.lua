--[[ Macros with LuaFAR for Editor ]]--

----------------------------------------
--[[ description:
  -- Macros with LuaFAR for Editor plugin.
  -- Макросы с плагином LuaFAR for Editor.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Plugins.
--]]
--------------------------------------------------------------------------------

----------------------------------------
local far = far
local F = far.Flags

local BlockNoneType = F.BTYPE_NONE

local editor = editor

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end
local Plugin = Plugin or {}

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'L' -- LuaFAR for Editor

----------------------------------------     -- -- Lua User Menu
-- [[
guids.LF4Ed = "6F332978-08B8-4919-847A-EFBB6154C99A"

local Exist = function () return PluginExist(guids.LF4Ed) end

Macro {
  area = "Shell Editor Viewer",
  key = "CtrlL",
  flags = "DisableOutput",
  description = "LF4Ed: Menu",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LF4Ed)
    return PluginMenu(guids.LF4Ed)
  end, ---
} ---

Macro {
  area = "Shell Editor Viewer",
  key = "AltShiftF2",
  flags = "DisableOutput",
  description = "LUM: Lua User Menu",
  condition = Exist,
  action = function ()
    if not PluginMenu(guids.LF4Ed) then return end
    return Keys"M"
  end, ---
} ---

Macro {
  area = "Shell Editor Viewer",
  key = "CtrlAltShiftF2",
  flags = "DisableOutput",
  description = "LUM: Tortoise SVN",
  condition = Exist,
  action = function ()
    if not PluginMenu(guids.LF4Ed) then return end
    return Keys"S"
    --return Keys"S T"
  end, ---
} ---

--[=[
Macro {
  area = "Editor",
  key = "CtrlJ",
  flags = "DisableOutput",
  description = "LUM: Binding Insert",
  condition = Exist,
  action = function ()
    if not PluginMenu(guids.LF4Ed) then return end
    -- TODO: Добавить проверку наличия окна LUM.
    return Keys"M J"
  end, ---
} ---
--]=]
--]]
----------------------------------------     -- -- Editor
-- [[
do

local Quotes = {
  -- Quotes:
  ["'"] = { key = "Ctrl'",      note = "'|'", },
  ['"'] = { key = "CtrlShift'", note = '"|"', },
  [";"] = { key = "Ctrl;",      note = "‹|›", },
  [":"] = { key = "CtrlShift;", note = "«|»", },
  -- --
  -- ‘|’
  -- “|”
  -- „|“

  -- Brackets:
  ["["] = { key = "Ctrl[",          note = "[|]", },
  ["{"] = { key = "CtrlShift[",     note = "{|}", },
  ["("] = { key = "Ctrl]",          note = "(|)", },
  -- --
  ["<"] = { key = "Ctrl,",          note = "<|>", },
  [">"] = { key = "CtrlShift,",     note = "⟨|⟩", },
  ["/"] = { key = "Ctrl/",          note = "/|/" },
 ["\\"] = { key = "CtrlShift/",     note = "\\|\\", },

  -- Comments:
  ["d"] = { key = "CtrlAltShift[",  note = "{ | }", },
  ["p"] = { key = "CtrlShift]",     note = "(*|*)", },
  ["c"] = { key = "CtrlAltShift]",  note = "/* | */", },
  -- --
  -- <!-- | -->
  -- --[[ | ]]--
  -- --
  -- --

  -- Markers:
  ["|"] = { key = "CtrlAltShift1",  note = "|||", },
  -- --
  ["#"] = { key = "CtrlAltShift3",  note = "#|#", },
  ["$"] = { key = "CtrlAltShift4",  note = "$|$", },
  ["%"] = { key = "CtrlAltShift5",  note = "%|%", },
  ["^"] = { key = "CtrlAltShift6",  note = "^|^", },
  -- --
  ["*"] = { key = "CtrlAltShift8",  note = "*|*", },

  ["`"] = { key = "CtrlAlt`",       note = "`|`", },
  ["~"] = { key = "CtrlAltShift`",  note = "~|~", },
  -- -|-
  -- _|_
  -- +|+
  -- ‾|‾
  -- --
  ["o"] = { key = "CtrlAltShift0",  note = "¤|¤", },

  -- Specials:
  ["q"] = { key = "CtrlAlt'",       note = 'cleared "|"', },
  ["w"] = { key = "CtrlAlt;",       note = 'cleared «|»', },
} ---

  local DescFmt = "Quote: %s"

for k, v in pairs(Quotes) do
  if k ~= "" then
    Macro {
      area = "Editor",
      key = v.key,
      flags = "DisableOutput",
      description = DescFmt:format(v.note),
      condition = Exist,
      action = function ()
        if not PluginMenu(guids.LF4Ed) then return end
        -- TODO: Добавить проверку наличия окна LUM.
        Keys"M S Q"
        return Keys(k)
      end, ---
    } ---
  end
end

end -- do
--]]
--------------------------------------------------------------------------------
