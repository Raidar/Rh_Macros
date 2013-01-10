--[[ Menu macros ]]--

----------------------------------------
--[[ description:
  -- Macros for menu areas.
  -- Макросы для областей меню.
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

----------------------------------------
local Macro = Macro or function () end

---------------------------------------- Menu info
Macro {
  area = "Menu MainMenu UserMenu",
  key = "ShiftF2",
  flags = "DisableOutput",
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
---------------------------------------- Main Menu
Macro {
  area = "MainMenu",
  key = "F9",
  flags = "DisableOutput",
  description = "MainMenu: Hide",
  action = function ()
             Keys"Esc"
           end, ---
} ---
---------------------------------------- User Menu
Macro {
  area = "UserMenu",
  key = "BS",
  flags = "DisableOutput",
  description = "UserMenu: Back",
  action = function ()
             Keys"Esc"
           end, ---
} ---
Macro {
  area = "UserMenu",
  key = "Esc",
  flags = "DisableOutput",
  description = "UserMenu: Hide",
  action = function ()
             Keys"ShiftF10"
           end, ---
} ---

Macro { -- Ins -> Enter
  area = "UserMenu",
  key = "Ins NumIns",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Enter",
  action = function ()
             Keys"Enter"
           end, ---
} ---
Macro { -- Del -> Escape
  area = "UserMenu",
  key = "Del NumDel",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Escape",
  action = function ()
             Keys"Esc"
           end, ---
} ---
Macro { -- CtrlIns -> Enter
  area = "UserMenu",
  key = "CtrlIns CtrlNumIns",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Enter",
  action = function ()
             Keys"Enter"
           end, ---
} ---
Macro { -- CtrlDel -> Escape
  area = "UserMenu",
  key = "CtrlDel CtrlNumDel",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Esc",
  action = function ()
             Keys"Esc"
           end, ---
} ---
Macro { -- F4 -> Enter
  area = "UserMenu",
  key = "F4",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Enter",
  action = function ()
             Keys"Enter"
           end, ---
} ---
Macro { -- CtrlF4 -> Enter
  area = "UserMenu",
  key = "CtrlF4",
  flags = "DisableOutput",
  priority = 100,
  description = "UserMenu: Enter",
  action = function ()
             Keys"Enter"
           end, ---
} ---
---------------------------------------- Any Menu

-- Change Ins/Del to protect from random press.

Macro { -- Ins -> Up
  area = "Menu MainMenu UserMenu",
  key = "Ins NumIns",
  flags = "DisableOutput",
  description = "Menu: Prev item",
  action = function ()
             Keys"Up"
           end, ---
} ---
Macro { -- Del -> Down
  area = "Menu MainMenu UserMenu",
  key = "Del NumDel",
  flags = "DisableOutput",
  description = "Menu: Next item",
  action = function ()
             Keys"Down"
           end, ---
} ---

Macro { -- CtrlIns -> Ins
  area = "Menu MainMenu UserMenu",
  key = "CtrlIns CtrlNumIns",
  flags = "DisableOutput",
  description = "Menu: Insert item",
  action = function ()
             Keys"Ins"
           end, ---
} ---
Macro { -- CtrlDel -> Del
  area = "Menu MainMenu UserMenu",
  key = "CtrlDel CtrlNumDel",
  flags = "DisableOutput",
  description = "Menu: Delete item",
  action = function ()
             Keys"Del"
           end, ---
} ---
--------------------------------------------------------------------------------
