--[[ Shell macros ]]--

----------------------------------------
--[[ description:
  -- Macros for shell area.
  -- Макросы для области оболочки.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros.
--]]
--------------------------------------------------------------------------------
local Macro = Macro or function () end

---------------------------------------- Panels

---------------------------------------- -- Find file
-- Find folder --> 
Macro { -- Find file with clipboard text..
  area = "Shell",
  key = "AltF8",
  flags = "DisableOutput",
  description = "Find: Find files with text…",
  action = function ()
             Keys"AltF7 Tab CtrlV ShiftTab"
             exit()
           end, ---
} ---
Macro { -- Find file with clipboard namepart…
  area = "Shell",
  key = "CtrlAltF8",
  flags = "DisableOutput",
  description = "Find: Find files with namepart…",
  action = function ()
             Keys"AltF7"
             print"**.*"
             Keys"Home Right CtrlV"
             exit()
           end, ---
} ---
---------------------------------------- Command line

---------------------------------------- -- Text
Macro {
  area = "Shell Info QView Tree",
  key = "Esc",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Clear CmdLine",
  action = function ()
             Keys"CtrlY"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "Add",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Insert '+'",
  action = function ()
             print"+"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "Subtract",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Insert '-'",
  action = function ()
             print"-"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "Multiply",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Insert '*'",
  action = function ()
             print"*"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "Divide",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Insert '/'",
  action = function ()
             print"/"
           end, ---
} ---
---------------------------------------- -- Move
Macro {
  area = "Shell",
  key = "Home",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Move to start",
  action = function ()
             Keys"CtrlHome"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "End",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Move to end",
  action = function ()
             Keys"CtrlEnd"
           end, ---
} ---
---------------------------------------- -- Select
Macro {
  area = "Shell",
  key = "ShiftHome",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Select to start",
  action = function ()
             Keys"AltShiftHome"
             --for k = 1, CmdLine.CurPos - 1 do Keys"ShiftLeft" end
           end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftEnd",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Select to end",
  action = function ()
             Keys"AltShiftEnd"
           end, ---
} ---

Macro {
  area = "Shell",
  key = "ShiftUp",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Select left",
  action = function ()
             Keys"ShiftLeft"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftDown",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Select right",
  action = function ()
             Keys"ShiftRight"
           end, ---
} ---
---------------------------------------- -- Commands
Macro {
  area = "Shell",
  key = "ShiftPgUp",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Prev command",
  action = function ()
             Keys"CtrlE"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftPgDn",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Next command",
  action = function ()
             Keys"CtrlX"
           end, ---
} ---
---------------------------------------- Clipboard
--[[
Macro {
  area = "Shell",
  key = "CtrlIns",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Copy to clipboard",
  action = function ()
             Keys"CtrlIns"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "ShiftIns",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Paste from clipboard",
  action = function ()
             Keys"ShiftIns"
           end, ---
} ---
--]]
Macro {
  area = "Shell",
  key = "ShiftDel",
  flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Cut to clipboard",
  action = function ()
             Keys"CtrlIns Del"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlC",
  flags = "DisableOutput",
  --flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Copy to clipboard",
  action = function ()
             Keys"CtrlIns"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlV",
  flags = "DisableOutput",
  --flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Paste from clipboard",
  action = function ()
             Keys"ShiftIns"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlX",
  flags = "DisableOutput",
  --flags = "DisableOutput|NotEmptyCommandLine",
  description = "CmdLn: Cut to clipboard",
  action = function ()
             Keys"CtrlIns Del"
           end, ---
} ---
--------------------------------------------------------------------------------
