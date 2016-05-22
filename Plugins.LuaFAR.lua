--[[ Macros with LuaFAR for Editor ]]--

----------------------------------------
--[[ description:
  -- Macros with LuaFAR for Editor plugin.
  -- Макросы с плагином LuaFAR for Editor.
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

--[[
local dlgGuids = {
  ["19500a29-1a9b-4b1b-833c-693d58669963"] = true, -- Common.CharsMap
  ["1B26647B-44B0-4AC6-984D-45CBA59568D0"] = true, -- Common.Calendar

  ["3B84D47B-930C-47AB-A211-913C76280491"] = true, -- CharsMenu (RectMenu)

  ["19500a29-1a9b-4b1b-833c-693d58669963"] = true, -- Common.CharsMap
  ["19ae6fa2-7ceb-4893-b2a7-fd8b783cc365"] = true, -- Common.CharsMap Names
  ["19b4271d-09c2-4671-af59-b043d1698104"] = true, -- Common.CharsMap Blocks

  ["62023165-B8F6-41D6-B468-94CA21D7B34F"] = true, -- Editor.TextTemplate script
  ["64B26458-1E8B-4844-9585-BECFB1CE8DE3"] = true, -- Editor.WordComplete script

  ["D7F001FF-7860-4A24-B9CA-37BEF603F7BC"] = true, -- LuaSpell
} --- dlgGuids
--]]

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

--[[
local IsNotRectMenu = function ()
  return not Area.Dialog or Area.Dialog and Dlg.ItemType ~= 255
end -- IsNotRectMenu
--]]

local Plugin = Plugin or {}
local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'L' -- LuaFAR for Editor

guids.LF4Ed = "6F332978-08B8-4919-847A-EFBB6154C99A"

local Exist = function () return PluginExist(guids.LF4Ed) end

local IsDlgEdit = function ()
  return not Area.Dialog or Area.Dialog and Dlg.ItemType == F.DI_EDIT
end -- IsDlgEdit

local ExistSpec = function ()
  if Area.Menu then return end

  return IsDlgEdit() and PluginExist(guids.LF4Ed)
end -- ExistSpec

-- [[
Macro {
  area = "Shell Editor Viewer Dialog",
  key = "LCtrlL",
  flags = "",
  description = "LF4Ed: Menu",
  condition = ExistSpec,
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
  --far.Message(key or "M", guids.LUM)
  Keys(key or "M")
  --far.Message(Dlg and Dlg.Id or "No dlg", guids.LUM)
  return (Menu.Id or Dlg.Id) == (guid or guids.LUM)
end -- ShowLUM

-- [[
Macro {
  area = "Shell Editor Viewer Dialog",
  key = "LAltShiftF2",
  flags = "",
  description = "LUM: Lua User Menu",
  condition = ExistSpec,
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
  --area = "Shell Editor Viewer",
  area = "Shell Editor Viewer Dialog",
  key = "LCtrlK",
  flags = "",
  description = "LUM: Calendar",
  condition = ExistSpec,
  action = function ()
    if ShowLUM() then return Keys"A C" end
  end, ---
} ---
Macro {
  --area = "Common",
  area = "Shell Editor Dialog",
  --area = "Shell Editor Viewer Dialog",
  key = "LCtrlH",
  flags = "",
  description = "LUM: CharsMap",
  condition = ExistSpec,
  action = function ()
    if ShowLUM() then return Keys"A H" end
  end, ---
} ---
Macro {
  area = "Editor Dialog",
  key = "LCtrlShiftH",
  flags = "",
  description = "LUM: Characters",
  condition = ExistSpec,
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
        if not ShowLUM() then return end
        --if not PluginMenu(guids.LF4Ed) then return end
        --Keys"M"
        --far.Message(Menu.Id, tostring(Area.Menu))
        --if not Area.Menu or Menu.Id ~= guids.LUM then return end
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
    if not ShowLUM() then return end
    --if not PluginMenu(guids.LF4Ed) then return end
    --Keys"M"
    --far.Message(Menu.Id, tostring(Area.Menu))
    --if not Area.Menu or Menu.Id ~= guids.LUM then return end
    return Keys"Q D X"
  end, ---
} ---

end -- do
--]]
--------------------------------------------------------------------------------
