--[[ Viewer macros ]]--

----------------------------------------
--[[ description:
  -- Macros for viewer area.
  -- Макросы для области просмотра.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Manager.
--]]
--------------------------------------------------------------------------------

----------------------------------------
--local far = far
--local F = far.Flags

local viewer = viewer

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
--local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Actions
-- [[
Macro {
  area = "Viewer",
  key = "LAltF9",
  flags = "",
  description = "View: Next codepage",
  action = function ()
    Keys"ShiftF8"
    if not Area.Menu then return end

    --far.Message(("%#08x"):format(Menu.ItemStatus()))
    repeat
      Keys"Down"
    until band(Menu.ItemStatus(), 0x0000003C) == 0

    return Keys"Enter"
  end, ---
} ---
--]]
---------------------------------------- File
--[[
Macro {
  area = "Viewer",
  key = "LCtrlO",
  flags = "",
  description = "View: Switch to panels",
  action = function () return Keys"F12 0" end, ---
} ---
--]]

---------------------------------------- Search
-- [[
Macro {
  area = "Viewer",
  key = "LCtrlF",
  flags = "",
  description = "View: Find…",
  action = function () return Keys"F7" end, ---
} ---
Macro {
  area = "Viewer",
  key = "F3",
  flags = "",
  description = "View: Find next",
  action = function () return Keys"ShiftF7" end, ---
} ---
--]]
--------------------------------------------------------------------------------
