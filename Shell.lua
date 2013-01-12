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
local far = far
local F = far.Flags

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Panels

---------------------------------------- -- Selection
-- [[
Macro {
  area = "Shell",
  key = "CtrlDivide",
  flags = "DisableOutput",
  description = "Panel: Restore selection",
  action = function ()
             return Keys"CtrlM"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShiftDivide",
  flags = "DisableOutput",
  description = "Panel: Select files with same name+ext",
  action = function ()
             return Keys"AltAdd CtrlAdd"
           end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShiftMultiply",
  flags = "DisableOutput",
  description = "Panel: Select folders only",
  action = function ()
             return Keys"ShiftAdd CtrlMultiply"
           end, ---
} ---
--]]
---------------------------------------- -- Information
-- [[
Macro { -- File name
  area = "Shell",
  key = "CtrlF3",
  flags = "DisableOutput",
  description = "Panel: Full file name",
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
--]]
---------------------------------------- -- Naming
local AreaContentValueFmt = "%s (%s) = '%s'"

-- Get content of macro area table.
-- Получение содержимого таблицы макро-области.
local function GetAreaContent (Area) --> (table)
  local t = {}
  for k, v in pairs(Area.properties) do
    local w = Area[k]
    t[#t+1] = AreaContentValueFmt:format(k, type(w), tostring(w))
  end

  return t
end -- GetAreaContent

-- Show content of macro area table.
-- Показ содержимого таблицы макро-области.
function ShowAreaContent (Area, Title) --> (dialog)
  local Content = table.concat(GetAreaContent(Area), "\n")
  return far.Message(Content, Title or Object.Title, ";Ok", "l")
end ----

-- Get name of current item on active panel.
-- Получение имени текущего элемента активной панели.
--[[
  -- @params:
  Panel (table) - is APanel or PPanel.
  noext  (bool) - flag to exclude extension from file name.
  -- @return:
  s    (string) - panel item name.
--]]
function unit.GetPanelItemName (Panel, noext) --> (string)
  local Panel = Panel or APanel
  local Name = ""
  if Panel.FilePanel then
    if not Panel.Bof or
       (Panel.Root and not APanel.Plugin) then
      Name = Panel.Current -- File name
      if noext and not Panel.Folder and Name:find(".", 1, true) then
        Name = Name:match("^(.+)%.[^%.]-$") -- Exclude ext
      end
    else
      -- Folder name for "..".
      -- File/folder name for plugin.
      Name = Panel.UNCPath:match("([^\\]-)$")
    end
  end
  --elseif APanel.Plugin then end
  return Name
end ---- GetPanelItemName

-- [[
Macro { -- File name only
  area = "Shell",
  key = "CtrlP",
  flags = "DisableOutput",
  description = "Panel: File name only to clipboard",
  action = function ()
             --ShowAreaContent(APanel)
             local s = unit.GetPanelItemName(APanel, true)
             --far.Message(s, APanel.Current)
             return far.CopyToClipboard(s)
           end, ---
} ---
Macro { -- Full file name
  area = "Shell",
  key = "CtrlShiftP",
  flags = "DisableOutput",
  description = "Panel: Full file name to clipboard",
  action = function ()
             --ShowAreaContent(APanel)
             local s = unit.GetPanelItemName(APanel, false)
             --far.Message(s, APanel.Current)
             return far.CopyToClipboard(s)
           end, ---
} ---
--]]
---------------------------------------- -- Copy / Move
-- [[
guids.CopyFile = "FCEF11C4-5490-451D-8B4A-62FA03F52759"
guids.MoveFile = "431A2F37-AC01-4ECD-BB6F-8CDE584E5A03"

Macro { -- Rename
  area = "Shell",
  key = "CtrlT",
  flags = "DisableOutput",
  description = "Panel: Rename preserving extension",
  condition = function ()
                return not APanel.Plugin --and (APanel.Root or not APanel.Bof)
              end, ---
  action = function ()
             if APanel.Bof and not APanel.Root then Keys"CtrlPgUp" end
             Keys"ShiftF6"
             if Area.Dialog and Dlg.Id == guids.MoveFile then
               Keys"CtrlLeft Left ShiftHome"
               exit()
             end
           end, ---
} ---
Macro { -- Recopy
  area = "Shell",
  key = "CtrlShiftT",
  flags = "DisableOutput",
  description = "Panel: Recopy preserving extension",
  condition = function ()
                return not APanel.Plugin --and (APanel.Root or not APanel.Bof)
              end, ---
  action = function ()
             if APanel.Bof and not APanel.Root then Keys"CtrlPgUp" end
             Keys"ShiftF5"
             if Area.Dialog and Dlg.Id == guids.CopyFile then
               Keys"CtrlLeft Left ShiftHome"
               exit()
             end
           end, ---
} ---
Macro { -- Copy
  area = "Shell",
  key = "AltShiftF5",
  flags = "DisableOutput",
  description = "Panel: Copy to… preserving extension",
  condition = function ()
                return not APanel.Plugin --and (APanel.Root or not APanel.Bof)
              end, ---
  action = function ()
             if APanel.Bof and not APanel.Root then Keys"CtrlPgUp" end
             local Name = APanel.Current

             Keys"F5"
             if not Area.Dialog or Dlg.Id ~= guids.CopyFile then
               return
             end

             local Ext = Name:match("%.([^%.]-)$") -- Extension
             Keys"End"
             if Ext then
               print("."..Ext)
               Keys"CtrlLeft Left"
             end
             exit()
           end, ---
} ---
Macro { -- Move
  area = "Shell",
  key = "AltShiftF6",
  flags = "DisableOutput",
  description = "Panel: Move to… preserving extension",
  condition = function ()
                return not APanel.Plugin --and (APanel.Root or not APanel.Bof)
              end, ---
  action = function ()
             if APanel.Bof and not APanel.Root then Keys"CtrlPgUp" end
             local Name = APanel.Current

             Keys"F6"
             if not Area.Dialog or Dlg.Id ~= guids.MoveFile then
               return
             end

             local Ext = Name:match("%.([^%.]-)$") -- Extension
             Keys"End"
             if Ext then
               print("."..Ext)
               Keys"CtrlLeft Left"
             end
             exit()
           end, ---
} ---
--]]
---------------------------------------- -- Find
-- [[
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
--]]
---------------------------------------- -- Attributes
-- [[
guids.Attributes = "80695D20-1085-44D6-8061-F3C41AB5569C"

-- Установка ReadOnly и Archive:
Macro { -- для файла, каталога или выделенных элементов
  area = "Shell",
  key = "CtrlShiftA",
  flags = "DisableOutput",
  description = "Panel: File - RA",
  condition = function ()
                return APanel.Selected or APanel.Root or not APanel.Bof
              end, ---
  action = function ()
             local Dlg = Dlg

             Keys"CtrlA"
             if not Area.Dialog or Dlg.Id ~= guids.Attributes then
               return
             end

             -- Установка ReadOnly и Archive
             local k = 0
             for i = 1, 2 do
               local v = Dlg.GetValue(Dlg.CurPos, 0)
               if v ~= 1 then
                 Keys"Add"
                 k = k + 1
               end
               Keys"Down"
             end

             if k > 0 then
               Keys"Enter"
             else
               Keys"Esc"
               if Area.Shell then Keys"ShiftSubtract" end
             end
           end, ---
} ---
Macro { -- для файла, каталога и его элементов
  area = "Shell",
  key = "CtrlAltShiftA",
  flags = "DisableOutput",
  description = "Panel: Folder - RA",
  condition = function ()
                return APanel.Selected or APanel.Root or not APanel.Bof
              end, ---
  action = function ()
             local Dlg = Dlg

             Keys"CtrlA"
             if not Area.Dialog or Dlg.Id ~= guids.Attributes then
               return
             end

             -- Установка ReadOnly и Archive
             Keys"Subtract Add Down Subtract Add"

             -- Установка обработки вложенного
             Keys"Up Up" -- Переход на последнюю кнопку
             while Dlg.ItemType ~= F.DI_CHECKBOX and Dlg.CurPos > 1 do
               Keys"Up"
             end
             Keys"Add"

             Keys"Enter"
           end, ---
} ---
--]]
---------------------------------------- Command line

---------------------------------------- -- Text
-- [[
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
--]]
---------------------------------------- -- Move
-- [[
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
--]]
---------------------------------------- -- Select
-- [[
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
--]]
---------------------------------------- -- Commands
-- [[
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
--]]
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
-- [[
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
--]]
--------------------------------------------------------------------------------
