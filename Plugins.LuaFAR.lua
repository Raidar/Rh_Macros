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

local Async = function () return mmode(3, 1) end

local Plugin = Plugin or {}
local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'L' -- LuaFAR for Editor

guids.LF4Ed = "6F332978-08B8-4919-847A-EFBB6154C99A"

local Exist = function () return PluginExist(guids.LF4Ed) end

-- [[
Macro {
  area = "Shell Editor Viewer",
  key = "LCtrlL",
  flags = "",
  description = "LF4Ed: Menu",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LF4Ed)
    return PluginMenu(guids.LF4Ed)
  end, ---
} ---
--]]
---------------------------------------- 'M' -- -- Lua User Menu
guids.LUM = "00B06FBA-0BB7-4333-8025-BA48B6077435"
--guids.CustomMenu = "3700ABE9-C460-42B2-9F2E-1FE705B2942A"

local function ShowLUM (key, guid) --> (bool)
  if not PluginMenu(guids.LF4Ed) then return end
  Keys(key or "M")
  --far.Message(Menu.Id, guids.LUM)
  return Menu.Id == (guid or guids.LUM)
end -- ShowLUM

-- [[
Macro {
  area = "Shell Editor Viewer",
  key = "LAltShiftF2",
  flags = "",
  description = "LUM: Lua User Menu",
  condition = Exist,
  action = ShowLUM,
} ---

Macro {
  area = "Shell Editor Viewer",
  key = "LCtrlLAltShiftF2",
  flags = "",
  description = "LUM: Tortoise SVN",
  condition = Exist,
  action = function ()
    return ShowLUM("S")
    --if ShowLUM("S") then return Keys"T" end
  end, ---
} ---

--[=[
Macro {
  area = "Editor",
  key = "LCtrlJ",
  flags = "",
  description = "LUM: Template Insert",
  condition = Exist,
  action = function ()
    if ShowLUM"M" then return Keys"J" end
  end, ---
} ---
--]=]
--]]
----------------------------------------     -- -- LUM Items
-- [[
Macro {
  --area = "Common",
  area = "Shell Editor Viewer",
  --area = "Shell Editor Viewer Dialog",
  key = "LCtrlK",
  flags = "",
  description = "LUM: Calendar",
  condition = Exist,
  action = function ()
    if ShowLUM() then return Keys"A C" end
  end, ---
} ---
Macro {
  --area = "Common",
  area = "Shell Editor",
  --area = "Shell Editor Viewer Dialog",
  key = "LCtrlH",
  flags = "",
  description = "LUM: CharsMap",
  condition = Exist,
  action = function ()
    if ShowLUM() then return Keys"A H" end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShiftH",
  flags = "",
  description = "LUM: Characters",
  condition = Exist,
  action = function ()
    if ShowLUM() then return Keys"H" end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShiftQ",
  flags = "",
  description = "LUM: Quote text",
  condition = Exist,
  action = function ()
    if ShowLUM() then return Keys"Q Q" end
  end, ---
} ---

-- [=[
Macro {
  area = "Editor",
  key = "RCtrlShiftQ",
  flags = "",
  description = "LUM: Quoting",
  condition = Exist,
  action = function ()
    --if ShowLUM() then return Keys"Q Q" end
    --Plugin.Call("6F332978-08B8-4919-847A-EFBB6154C99A", --"file",
    --            [[@C:\Programs\Far3\Profile\plugins\LF4Ed\scripts\Rh_Scripts\LuaEUM\LuaEUM.lua]],
    --              {"Quoting"})
    --Plugin.Call("6F332978-08B8-4919-847A-EFBB6154C99A",
    --            [[@C:\Programs\Far3\Profile\plugins\LF4Ed\scripts\Rh_Scripts\LuaEUM\LuaEUM.lua]],
    --              "Insert")
    --Plugin.Call("6F332978-08B8-4919-847A-EFBB6154C99A", "*luaeum_q")
    Plugin.Call("6F332978-08B8-4919-847A-EFBB6154C99A", "command", "luaeum", "Quoting")
  end, ---
} ---]=]

Macro {
  area = "Editor",
  key = "LCtrlShiftT",
  flags = "",
  description = "LUM: Clear text",
  condition = Exist,
  action = function ()
    if ShowLUM() then return Keys"S C" end
  end, ---
} ---
--]]
----------------------------------------     -- -- QuoteMarks
-- [[
do

local QuoteMarks = {
  -- Quotes:
  ["'"] = { key = "LCtrl'",             note = "'|'", },
  ['"'] = { key = "LCtrlShift'",        note = '"|"', },
  [";"] = { key = "LCtrl;",             note = "‹|›", },
  [":"] = { key = "LCtrlShift;",        note = "«|»", },
  ["1"] = { key = "RCtrl'",             note = "‘|’", },
  ['2'] = { key = "RCtrlShift'",        note = '“|”', },
  ["3"] = { key = "RCtrl;",             note = "‚|‘", },
  ["4"] = { key = "RCtrlShift;",        note = "„|“", },

  -- Brackets:
  ["["] = { key = "LCtrl[",             note = "[|]", },
  ["{"] = { key = "LCtrlShift[",        note = "{|}", },
  ["("] = { key = "LCtrl]",             note = "(|)", },
  -- --
  ["<"] = { key = "LCtrl,",             note = "<|>", },
  [">"] = { key = "LCtrl.",             note = "⟨|⟩", },
  ["/"] = { key = "LCtrl/",             note = "/|/" },
 ["\\"] = { key = "LCtrlShift/",        note = "\\|\\", },

  -- Comments:
  ["p"] = { key = "LCtrlShift]",        note = "(*|*)", },
  ["d"] = { key = "LCtrlLAltShift[",    note = "{ | }", },
  ["c"] = { key = "LCtrlLAltShift]",    note = "/* | */", },
  -- --
  -- <!-- | -->
  -- --[[ | ]]--
  -- --
  -- --

  ["x"] = { key = "LCtrlLAltM",         note = "<!--|-->", },
  --["h"] = { key = "LCtrlShift.",        note = "<!--|-->", },
  --["l"] = { key = "LCtrlShift,",        note = "--[[ | ]]--", },

  -- Markers:
  ["|"] = { key = "LCtrlLAltShift1",    note = "|||", },
  --["@"] = { key = "LCtrlLAltShift2",    note = "@|@", },
  ["#"] = { key = "LCtrlLAltShift3",    note = "#|#", },
  ["$"] = { key = "LCtrlLAltShift4",    note = "$|$", },
  ["%"] = { key = "LCtrlLAltShift5",    note = "%|%", },
  ["^"] = { key = "LCtrlLAltShift6",    note = "^|^", },
  ["&"] = { key = "LCtrlLAltShift7",    note = "&|&", },
  ["*"] = { key = "LCtrlLAltShift8",    note = "*|*", },

  ["`"] = { key = "LCtrlLAlt`",         note = "`|`", },
  ["~"] = { key = "LCtrlLAltShift`",    note = "~|~", },
  -- -|-
  -- _|_
  -- +|+
  -- ‾|‾
  -- --
  -- --

  -- Specials:
  -- ⌊|⌋
  -- ⌈|⌉
  -- ⟦|⟧
  -- --
  ["q"] = { key = "LCtrlLAlt'",         note = 'cleared "|"', },
  ["w"] = { key = "LCtrlLAlt;",         note = 'cleared «|»', },
} --- QuoteMarks

  local DescFmt = "Quote: %s"

for k, v in pairs(QuoteMarks) do
  if k ~= "" then
    Macro {
      area = "Editor",
      key = v.key,
      flags = "",
      description = DescFmt:format(v.note),
      condition = Exist,
      action = function ()
        if not PluginMenu(guids.LF4Ed) then return end
        Keys"M"
        --far.Message(Menu.Id, tostring(Area.Menu))
        if not Area.Menu or Menu.Id ~= guids.LUM then return end
        Keys"Q Q"
        return Keys(k)
      end, ---
    } ---
  end
end

Macro {
  area = "Editor",
  key = "LCtrlLAltShiftM",
  flags = "",
  description = "Dequote: <!--|-->",
  condition = Exist,
  action = function ()
    if not PluginMenu(guids.LF4Ed) then return end
    Keys"M"
    --far.Message(Menu.Id, tostring(Area.Menu))
    if not Area.Menu or Menu.Id ~= guids.LUM then return end
    return Keys"Q D X"
  end, ---
} ---

end -- do
--]]
--------------------------------------------------------------------------------
