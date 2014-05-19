--[[ Common macros ]]--

----------------------------------------
--[[ description:
  -- Macros for common areas.
  -- Макросы для разных областей.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Manager.
--]]
--------------------------------------------------------------------------------

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local Macro = Macro or function () end

---------------------------------------- Common
Macro {
  area = "Common",
  key = "RCtrlRAltShiftF9",
  flags = "",
  description = "All: Video mode",
  action = function ()
             return Keys"AltF9"
           end, ---
} ---
---------------------------------------- Escape
Macro {
  area = "Shell Info QView Tree",
  key = "Esc",
  flags = "EmptyCommandLine",
  description = "All: Esc - Panels on/off",
  action = function () return Keys"CtrlO" end, ---
} ---
---------------------------------------- XLat
Macro {
  area = "Shell Info QView Tree Editor Dialog",
  key = "LCtrlLAltX",
  flags = "",
  description = "All: XLat",
  condition = function ()
    --return true
    return not Area.Dialog or Area.Dialog and Dlg.ItemType == 4
  end, ---
  action = function () return Keys"XLat" end, ---
} ---
---------------------------------------- File name
-- "'" - Active Panel (changed from used "F").
-- ";" - Passive Panel (used by default configs).
Macro {
  area = "Shell Info QView Tree",
  key = "LCtrl'",
  flags = "",
  description = "All: Full name on AP",
  action = function () return Keys"CtrlF" end, ---
} ---
Macro {
  area = "Shell Info QView Tree",
  key = "LCtrlLAlt'",
  flags = "",
  description = "All: Network name on AP",
  action = function () return Keys"CtrlAltF" end, ---
} ---
--------------------------------------------------------------------------------
