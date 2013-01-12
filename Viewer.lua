--[[ Viewer macros ]]--

----------------------------------------
--[[ description:
  -- Macros for viewer area.
  -- Макросы для области просмотра.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros.
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

---------------------------------------- File
--[[
Macro {
  area = "Viewer",
  key = "CtrlO",
  flags = "DisableOutput",
  description = "View: Switch to panels",
  action = function ()
             Keys"F12 0"
           end, ---
} ---
--]]

---------------------------------------- Search
-- [[
Macro {
  area = "Viewer",
  key = "CtrlF",
  flags = "DisableOutput",
  description = "View: Find…",
  action = function ()
             Keys"F7"
           end, ---
} ---
Macro {
  area = "Viewer",
  key = "F3",
  flags = "DisableOutput",
  description = "View: Find next",
  action = function ()
             Keys"ShiftF7"
           end, ---
} ---
--]]
--------------------------------------------------------------------------------
