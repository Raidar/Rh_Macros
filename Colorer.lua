--[[ Colorer macros ]]--

----------------------------------------
--[[ description:
  -- Macros for FarColorer.
  -- Макросы для FarColorer.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros.
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

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'C' -- Colorer
local guid = "D2F36B62-A470-418D-83A3-ED7A3710E5B5"

local IsExist = function () return PluginExist(guid) end

-- [[
Macro {
  area = "Editor",
  key = "CtrlAltShiftC",
  flags = "DisableOutput",
  description = "Colorer: Reload HRC",
  condition = IsExist,
  action = function ()
             --return CallPlugin(guid, 12)
             if PluginMenu(guid) then Keys"R" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftL",
  flags = "DisableOutput",
  description = "Colorer: Section List",
  condition = IsExist,
  action = function ()
             --return CallPlugin(guid, 5)
             if PluginMenu(guid) then Keys"5" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftNum9",
  flags = "DisableOutput",
  description = "Colorer: Prev Section",
  condition = IsExist,
  action = function ()
             --Keys"F11 C 5 Up Enter"
             if PluginMenu(guid) then Keys"5 Up Enter" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftNum3",
  flags = "DisableOutput",
  description = "Colorer: Next Section",
  condition = IsExist,
  action = function ()
             --Keys"F11 C 5 Down Enter"
             if PluginMenu(guid) then Keys"5 Down Enter" end
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltL",
  flags = "DisableOutput",
  description = "Colorer: Attention List",
  condition = IsExist,
  action = function ()
             --return CallPlugin(guid, 6)
             if PluginMenu(guid) then Keys"6" end
           end, ---
} ---
--]]

--------------------------------------------------------------------------------
