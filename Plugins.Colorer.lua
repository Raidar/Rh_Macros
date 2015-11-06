--[[ Style macros with plugins ]]--

----------------------------------------
--[[ description:
  -- Macros for text styling with plugins.
  -- Макросы для стилизации текста с плагинами.
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

---------------------------------------- 'C' -- Colorer
-- [[
guids.Colorer = "D2F36B62-A470-418D-83A3-ED7A3710E5B5"

local Exist = function () return PluginExist(guids.Colorer) end

Macro {
  area = "Editor",
  key = "LCtrlLAltShiftC",
  flags = "",
  description = "Colorer: Reload HRC",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.Colorer, 12)
    if PluginMenu(guids.Colorer) then return Keys"R" end
  end, ---
} ---

Macro {
  area = "Editor",
  key = "LCtrlShiftL",
  flags = "",
  description = "Colorer: Section List",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.Colorer, 5)
    if PluginMenu(guids.Colorer) then return Keys"5" end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShiftNum9",
  flags = "",
  description = "Colorer: Prev Section",
  condition = Exist,
  action = function ()
    --Keys"F11 C 5 Up Enter"
    if PluginMenu(guids.Colorer) then return Keys"5 Up Enter" end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShiftNum3",
  flags = "",
  description = "Colorer: Next Section",
  condition = Exist,
  action = function ()
    --Keys"F11 C 5 Down Enter"
    if PluginMenu(guids.Colorer) then return Keys"5 Down Enter" end
  end, ---
} ---

Macro {
  area = "Editor",
  key = "LCtrlLAltL",
  flags = "",
  description = "Colorer: Attention List",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.Colorer.Colorer, 6)
    if PluginMenu(guids.Colorer) then return Keys"6" end
  end, ---
} ---
--]]
---------------------------------------- --- -- Colorer Outliner
-- [[
-- Workaround for Numpad keys in Colorer Outliner.
guids.ColorerOutliner = "A8A298BA-AD5A-4094-8E24-F65BF38E6C1F"

local IsOutliner = function ()
  return PluginExist(guids.Colorer) and Menu.Id == guids.ColorerOutliner
end

local OutlinerNumpadKeys = {
  Num0 = "Ins",
  Num1 = "End",
  Num2 = "Down",
  Num3 = "PgDn",
  Num4 = "Left",
  Num5 = "Clear",
  Num6 = "Right",
  Num7 = "Home",
  Num8 = "Up",
  Num9 = "PgUp",
} --- OutlinerNumpadKeys

for k, v in pairs(OutlinerNumpadKeys) do
  Macro {
    area = "Menu",
    key = k,
    flags = "",
    description = "Colorer: Outliner "..v,
    condition = IsOutliner,
    action = function () return Keys(v) end, ---
  } ---
  Macro {
    area = "Menu",
    key = "Ctrl"..k,
    flags = "",
    description = "Colorer: Outliner Ctrl"..v,
    condition = IsOutliner,
    action = function () return Keys("Ctrl"..v) end, ---
  } ---
end -- for
--]]
--------------------------------------------------------------------------------
