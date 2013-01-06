--[[ Common macros ]]--

----------------------------------------
--[[ description:
  -- Macros for common areas.
  -- Макросы для общих областей.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros.
--]]
--------------------------------------------------------------------------------
local Macro = Macro or function () end

---------------------------------------- Escape
Macro {
  area = "Shell Info QView Tree",
  key = "Esc",
  flags = "DisableOutput",
  description = "All: Esc - Panels on/off",
  action = function ()
             Keys"CtrlO"
           end,
} ---
---------------------------------------- XLat
Macro {
  area = "Shell Info QView Tree Editor",
  key = "CtrlAltX",
  flags = "DisableOutput",
  description = "All: XLat",
  action = function ()
             Keys"XLat"
           end,
} ---
---------------------------------------- File name
-- "'" - Active Panel (changed from used "F").
-- ";" - Passive Panel (used by default configs).
Macro {
  area = "Shell Info QView Tree",
  key = "Ctrl'",
  flags = "DisableOutput",
  description = "All: Full name on AP",
  action = function ()
             Keys"CtrlF"
           end,
} ---
Macro {
  area = "Shell Info QView Tree",
  key = "CtrlAlt'",
  flags = "DisableOutput",
  description = "All: Network name on AP",
  action = function ()
             Keys"CtrlAltF"
           end,
} ---
--------------------------------------------------------------------------------
