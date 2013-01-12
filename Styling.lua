--[[ Styling macros ]]--

----------------------------------------
--[[ description:
  -- Macros for text styling with plugins.
  -- Макросы для стилизации текста с плагинами.
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

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'C' -- Colorer
-- [[
guids.Colorer = "D2F36B62-A470-418D-83A3-ED7A3710E5B5"

local Exist = function () return PluginExist(guids.Colorer) end

Macro {
  area = "Editor",
  key = "CtrlAltShiftC",
  flags = "DisableOutput",
  description = "Colorer: Reload HRC",
  condition = Exist,
  action = function ()
             --return CallPlugin(guids.Colorer, 12)
             if PluginMenu(guids.Colorer) then return Keys"R" end
           end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlShiftL",
  flags = "DisableOutput",
  description = "Colorer: Section List",
  condition = Exist,
  action = function ()
             --return CallPlugin(guids.Colorer, 5)
             if PluginMenu(guids.Colorer) then return Keys"5" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftNum9",
  flags = "DisableOutput",
  description = "Colorer: Prev Section",
  condition = Exist,
  action = function ()
             --Keys"F11 C 5 Up Enter"
             if PluginMenu(guids.Colorer) then return Keys"5 Up Enter" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftNum3",
  flags = "DisableOutput",
  description = "Colorer: Next Section",
  condition = Exist,
  action = function ()
             --Keys"F11 C 5 Down Enter"
             if PluginMenu(guids.Colorer) then return Keys"5 Down Enter" end
           end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltL",
  flags = "DisableOutput",
  description = "Colorer: Attention List",
  condition = Exist,
  action = function ()
             --return CallPlugin(guids.Colorer.Colorer, 6)
             if PluginMenu(guids.Colorer) then return Keys"6" end
           end, ---
} ---
--]]
--------------------------------------------------------------------------------
