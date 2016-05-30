--[[ CmdLine macros ]]--

----------------------------------------
--[[ description:
  -- Macros for command line in shell area.
  -- Макросы для командной строки в области оболочки.
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
local debugs = require "context.utils.useDebugs"
local logShow = debugs.Show
--]]

--------------------------------------------------------------------------------
local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Command line

---------------------------------------- -- Text
-- [[
Macro {
  area = "Shell Info QView Tree",
  key = "Esc",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Clear CmdLine",
  action = function () return Keys"CtrlY" end, ---
} ---
Macro {
  area = "Shell",
  key = "Add",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Insert '+'",
  action = function () return print"+" end, ---
} ---
Macro {
  area = "Shell",
  key = "Subtract",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Insert '-'",
  action = function () return print"-" end, ---
} ---
Macro {
  area = "Shell",
  key = "Multiply",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Insert '*'",
  action = function () return print"*" end, ---
} ---
Macro {
  area = "Shell",
  key = "Divide",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Insert '/'",
  action = function () return print"/" end, ---
} ---
--]]
---------------------------------------- -- Move
-- [[
Macro {
  area = "Shell",
  key = "Home",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Move to start",
  action = function () return Keys"CtrlHome" end, ---
} ---
Macro {
  area = "Shell",
  key = "End",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Move to end",
  action = function () return Keys"CtrlEnd" end, ---
} ---
--]]
---------------------------------------- -- Select
-- [[
Macro {
  area = "Shell",
  key = "ShiftHome",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Select to start",
  action = function () return Keys"AltShiftHome" end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftEnd",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Select to end",
  action = function () return Keys"AltShiftEnd" end, ---
} ---

Macro {
  area = "Shell",
  key = "ShiftUp",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Select left",
  action = function () return Keys"ShiftLeft" end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftDown",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Select right",
  action = function () return Keys"ShiftRight" end, ---
} ---
--]]
---------------------------------------- -- Commands
-- [[
Macro {
  area = "Shell",
  key = "ShiftPgUp",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Prev command",
  action = function () return Keys"CtrlE" end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftPgDn",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Next command",
  action = function () return Keys"CtrlX" end, ---
} ---
--]]
---------------------------------------- Clipboard
--[[
Macro {
  area = "Shell",
  key = "CtrlIns",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Copy to clipboard",
  action = function () return Keys"CtrlIns" end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftIns",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Paste from clipboard",
  action = function () return Keys"ShiftIns" end, ---
} ---
--]]
-- [[
Macro {
  area = "Shell",
  key = "ShiftDel",
  flags = "NotEmptyCommandLine",
  description = "CmdLn: Cut to clipboard",
  action = function () return Keys"CtrlIns Del" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlC",
  flags = "",
  --flags = "NotEmptyCommandLine",
  description = "CmdLn: Copy to clipboard",
  action = function () return Keys"CtrlIns" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlV",
  flags = "",
  --flags = "NotEmptyCommandLine",
  description = "CmdLn: Paste from clipboard",
  action = function () return Keys"ShiftIns" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlX",
  flags = "",
  --flags = "NotEmptyCommandLine",
  description = "CmdLn: Cut to clipboard",
  action = function () return Keys"CtrlIns Del" end, ---
} ---
--]]
--------------------------------------------------------------------------------
