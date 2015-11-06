--[[ Menu macros ]]--

----------------------------------------
--[[ description:
  -- Macros for menu areas.
  -- Макросы для областей меню.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Manager.
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
--local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Menu info
-- [[
Macro {
  area = "Menu MainMenu UserMenu",
  key = "ShiftF2",
  flags = "",
  description = "Menu: Menu Info",
  action = function ()
    local sfind = string.find
    local t = {
      "GUID = "..Menu.Id,
      "Value = "..Menu.Value,
    } ---
    far.Message(table.concat(t, "\n"), Object.Title)
  end, ---
} ---
--]]
---------------------------------------- Main Menu
-- [[
Macro {
  area = "MainMenu",
  key = "F9",
  flags = "",
  description = "MainMenu: Hide",
  action = function () return Keys"Esc" end, ---
} ---
--]]
---------------------------------------- User Menu
-- [[
Macro {
  area = "UserMenu",
  key = "BS",
  flags = "",
  description = "UserMenu: Back",
  action = function () return Keys"Esc" end, ---
} ---
Macro {
  area = "UserMenu",
  key = "Esc",
  flags = "",
  description = "UserMenu: Hide",
  action = function () return Keys"ShiftF10" end, ---
} ---

Macro { -- Ins -> Enter
  area = "UserMenu",
  --key = "Ins NumIns",
  key = "Ins NumIns CtrlIns CtrlNumIns",
  flags = "",
  priority = 100,
  description = "UserMenu: Enter",
  action = function () return Keys"Enter" end, ---
} ---
Macro { -- Del -> Escape
  area = "UserMenu",
  --key = "Del NumDel",
  key = "Del NumDel CtrlDel CtrlNumDel",
  flags = "",
  priority = 100,
  description = "UserMenu: Escape",
  action = function () return Keys"Esc" end, ---
} ---
Macro { -- F4 -> Enter
  area = "UserMenu",
  key = "F4 CtrlF4",
  flags = "",
  priority = 100,
  description = "UserMenu: Enter",
  action = function () return Keys"Enter" end, ---
} ---
--]]
---------------------------------------- Any Menu
-- [[
-- Change Ins/Del to protect from data loss.
Macro { -- Ins -> Up
  area = "Menu MainMenu UserMenu",
  key = "Ins NumIns",
  flags = "",
  description = "Menu: Prev item",
  action = function () return Keys"Up" end, ---
} ---
Macro { -- Del -> Down
  area = "Menu MainMenu UserMenu",
  key = "Del NumDel",
  flags = "",
  description = "Menu: Next item",
  action = function () return Keys"Down" end, ---
} ---

Macro { -- CtrlIns -> Ins
  area = "Menu MainMenu UserMenu",
  key = "CtrlIns CtrlNumIns",
  flags = "",
  description = "Menu: Insert item",
  action = function () return Keys"Ins" end, ---
} ---
Macro { -- CtrlDel -> Del
  area = "Menu MainMenu UserMenu",
  key = "CtrlDel CtrlNumDel",
  flags = "",
  description = "Menu: Delete item",
  action = function () return Keys"Del" end, ---
} ---
--]]
--------------------------------------------------------------------------------
