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
--------------------------------------------------------------------------------
