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

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Panels

---------------------------------------- -- Find file
guids.FindFile = "8C9EAD29-910F-4B24-A669-EDAFBA6ED964"

Macro {
  area = "Shell",
  key = "CtrlF",
  flags = "DisableOutput",
  description = "Find: Find…",
  action = function ()
             Keys"AltF7"
             if Area.Dialog and Dlg.Id == guids.FindFile then
               exit()
             end
           end, ---
} ---
-- Find folder --> 
Macro { -- Find file with clipboard text..
  area = "Shell",
  key = "AltF8",
  flags = "DisableOutput",
  description = "Find: Find files with text…",
  action = function ()
             Keys"AltF7"
             if Area.Dialog and Dlg.Id == guids.FindFile then
               Keys"Tab CtrlV ShiftTab"
               exit()
             end
           end, ---
} ---
Macro { -- Find file with clipboard namepart…
  area = "Shell",
  key = "CtrlAltF8",
  flags = "DisableOutput",
  description = "Find: Find files with namepart…",
  action = function ()
             Keys"AltF7"
             if Area.Dialog and Dlg.Id == guids.FindFile then
               print"**.*"
               Keys"Home Right CtrlV"
               exit()
             end
           end, ---
} ---
---------------------------------------- -- File info
Macro { -- File name
  area = "Shell",
  key = "CtrlF3",
  flags = "DisableOutput",
  description = "Panel: File name",
  action = function ()
             local s = APanel.Path.."\\"
             if APanel.Root or not APanel.Bof then
               s = s..APanel.Current
             end
             return far.CopyToClipboard(s)
           end, ---
} ---
Macro { -- File extension
  area = "Shell",
  key = "CtrlF4",
  flags = "DisableOutput",
  description = "Panel: File extension",
  action = function ()
             local s = ""
             if APanel.Root or not APanel.Bof then
               s = APanel.Current
               local p = s:cfind("\.[^\.]-$")
               if p then s = s:sub(p, -1) end
             end
             return far.CopyToClipboard(s)
           end, ---
} ---
Macro { -- File modification time
  area = "Shell",
  key = "CtrlF5",
  flags = "DisableOutput",
  description = "Panel: File modification time",
  action = function ()
             return far.CopyToClipboard(Panel.Item(0, 0, 5))
           end, ---
} ---
Macro { -- File size
  area = "Shell",
  key = "CtrlF6",
  flags = "DisableOutput",
  description = "Panel: File size",
  action = function ()
             if APanel.Folder then Keys"F3" end
             return far.CopyToClipboard(Panel.Item(0, 0, 6))
           end, ---
} ---
Macro { -- File path
  area = "Shell",
  key = "CtrlF7",
  flags = "DisableOutput",
  description = "Panel: File path",
  action = function ()
             return far.CopyToClipboard(APanel.Path)
           end, ---
} ---
Macro { -- File creation time
  area = "Shell",
  key = "CtrlF8",
  flags = "DisableOutput",
  description = "Panel: File creation time",
  action = function ()
             return far.CopyToClipboard(Panel.Item(0, 0, 3))
           end, ---
} ---
Macro { -- File access time
  area = "Shell",
  key = "CtrlF9",
  flags = "DisableOutput",
  description = "Panel: File access time",
  action = function ()
             return far.CopyToClipboard(Panel.Item(0, 0, 4))
           end, ---
} ---
Macro { -- File packed size
  area = "Shell",
  key = "CtrlF10",
  flags = "DisableOutput",
  description = "Panel: File packed size",
  action = function ()
             return far.CopyToClipboard(Panel.Item(0, 0, 7))
           end, ---
} ---
Macro { -- File CRC32
  area = "Shell",
  key = "CtrlF11",
  flags = "DisableOutput",
  description = "Panel: File CRC32",
  action = function ()
             return far.CopyToClipboard(Panel.Item(0, 0, 13))
           end, ---
} ---
---------------------------------------- -- Attributes
--[[
guids.Attributes = "80695D20-1085-44D6-8061-F3C41AB5569C"

Macro {
  area = "Shell",
  key = "CtrlShiftA",
  flags = "DisableOutput",
  description = "Panel: File - RA",
  condition = function ()
                return APanel.Selected or APanel.Root or not APanel.Bof
              end, ---
  action = function ()
             Keys"CtrlA"
             if Area.Dialog and Dlg.Id == guids.Attributes then
             end
           end, ---
} ---
-- [ [
%c=0;
$Rep(2)
  %s=Dlg.GetValue(Dlg.CurPos,0);
  $If(%s!=1)
    Add
    %c=%c+1;
  $End
  Down
$End

$If(%c>0)
  Enter
$Else
  Esc
  ShiftSubtract
$End
--]]
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
