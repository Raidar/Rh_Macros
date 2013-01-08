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

---------------------------------------- Any Menu

-- Change Ins/Del to protect from random press.

Macro { -- Ins -> Up
  area = "Menu",
  key = "Ins",
  flags = "DisableOutput",
  description = "Menu: Prev item",
  action = function ()
             Keys"Up"
           end, ---
} ---
Macro { -- Del -> Down
  area = "Menu",
  key = "Del",
  flags = "DisableOutput",
  description = "Menu: Next item",
  action = function ()
             Keys"Down"
           end, ---
} ---

Macro { -- CtrlIns -> Ins
  area = "Menu",
  key = "CtrlIns",
  flags = "DisableOutput",
  description = "Menu: Insert item",
  action = function ()
             Keys"Ins"
           end, ---
} ---
Macro { -- CtrlDel -> Del
  area = "Menu",
  key = "CtrlDel",
  flags = "DisableOutput",
  description = "Menu: Delete item",
  action = function ()
             Keys"Del"
           end, ---
} ---
--------------------------------------------------------------------------------
