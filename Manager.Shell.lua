--[[ Shell macros ]]--

----------------------------------------
--[[ description:
  -- Macros for shell area.
  -- Макросы для области оболочки.
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
local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Panels

---------------------------------------- -- Info
do
  local AreaContentValueFmt = "%s (%s) = '%s'"

-- Get content of macro area table.
-- Получение содержимого таблицы макро-области.
function unit.GetAreaContent (Area) --> (table)
  local t = {}
  for k, v in pairs(Area.properties) do
    local w = Area[k]
    t[#t+1] = AreaContentValueFmt:format(k, type(w), tostring(w))
  end

  return t
end -- GetAreaContent

end -- do

-- Show content of macro area table.
-- Показ содержимого таблицы макро-области.
function ShowAreaContent (Area, Title) --> (dialog)
  local Content = table.concat(unit.GetAreaContent(Area), "\n")
  return far.Message(Content, Title or Object.Title, ";Ok", "l")
end ----

-- [[
Macro {
  area = "Shell",
  key = "ShiftF2",
  flags = "",
  description = "Panel: Panel Info",
  action = function ()
    return ShowAreaContent(APanel)
  end, ---
} ---
--]]
---------------------------------------- -- Actions
-- [[
Macro {
  area = "Shell",
  key = "RCtrlShiftL",
  flags = "",
  description = "Panel: Information panel",
  action = function () return Keys"CtrlL" end, ---
} ---
Macro {
  area = "Shell",
  key = "RCtrlShiftH",
  flags = "",
  description = "Panel: Hidden/system files",
  action = function () return Keys"CtrlH" end, ---
} ---
Macro {
  area = "Shell",
  key = "LAltBS",
  flags = "",
  description = "Panel: Same folder/file",
  condition = function () 
    return PPanel.FilePanel
  end, ---
  action = function ()
    if not PPanel.Plugin then
      return Panel.SetPath(0, PPanel.Path0, PPanel.Current)
    end

    if PPanel.HostFile ~= "" then
      far.Message(PPanel.HostFile:match("^(.+)\\([^\\]+)$"))
      return Panel.SetPath(0, PPanel.HostFile:match("^(.+)\\([^\\]+)$"))
    end
  end, ---
} ---
--]]
---------------------------------------- -- Current
-- [[
---------------------------------------- -- -- Drive
Macro {
  area = "Shell",
  key = "CtrlLeft CtrlNum4",
  flags = "EmptyCommandLine",
  description = "Panel: Prev drive",
  action = function ()
    return Keys"F9 Enter Up Enter Up Enter"
  end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlRight CtrlNum6",
  flags = "EmptyCommandLine",
  description = "Panel: Next drive",
  action = function ()
    return Keys"F9 Enter Up Enter Down Enter"
  end, ---
} ---

---------------------------------------- -- -- Folder
Macro {
  area = "Shell",
  key = "CtrlShiftPgUp",
  flags = "",
  description = "Panel: Prev folder on same level",
  action = function ()
    if not APanel.Root then Keys"CtrlPgUp" end
    if not APanel.Bof then
      Keys"Up"
      if APanel.Folder then Keys"CtrlPgDn" end
    end
  end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShiftPgDn",
  flags = "",
  description = "Panel: Next folder on same level",
  action = function ()
    if not APanel.Root then Keys"CtrlPgUp" end
    if not APanel.Eof then
      Keys"Down"
      if APanel.Folder then Keys"CtrlPgDn" end
    end
  end, ---
} ---

Macro {
  area = "Shell",
  key = "CtrlShiftBS",
  flags = "",
  description = "Panel: Early visited folder",
  action = function ()
    return Keys"AltF12 Up ShiftEnter"
  end, ---
} ---
---------------------------------------- -- -- File
Macro {
  area = "Shell",
  key = "CtrlUp CtrlNum8",
  flags = "EmptyCommandLine",
  description = "Panel: Name sorted Prev file",
  action = function ()
    return Keys"CtrlF3 Up CtrlF4"
  end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlDown CtrlNum2",
  flags = "EmptyCommandLine",
  description = "Panel: Name sorted Next file",
  action = function ()
    return Keys"CtrlF3 Down CtrlF4"
  end, ---
} ---
--]]
---------------------------------------- -- Selection
-- [[
Macro {
  area = "Shell",
  key = "LCtrlDivide",
  flags = "",
  description = "Panel: Restore selection",
  action = function () return Keys"CtrlM" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShiftDivide",
  flags = "",
  description = "Panel: Select files with same name+ext",
  action = function () return Keys"AltAdd CtrlAdd" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShiftMultiply",
  flags = "",
  description = "Panel: Select folders only",
  action = function () return Keys"ShiftAdd CtrlMultiply" end, ---
} ---
--]]
---------------------------------------- -- Information
-- [[
Macro { -- File name
  area = "Shell",
  key = "LCtrlF3",
  flags = "",
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
  key = "LCtrlF4",
  flags = "",
  description = "Panel: File extension",
  action = function ()
    local s = ""
    if APanel.Root or not APanel.Bof then
      s = APanel.Current
      local p = s:cfind("%.[^%.]-$")
      if p then s = s:sub(p, -1) end
    end
    return far.CopyToClipboard(s)
  end, ---
} ---
Macro { -- File modification time
  area = "Shell",
  key = "LCtrlF5",
  flags = "",
  description = "Panel: File modification time",
  action = function ()
    return far.CopyToClipboard(Panel.Item(0, 0, 5))
  end, ---
} ---
Macro { -- File size
  area = "Shell",
  key = "LCtrlF6",
  flags = "",
  description = "Panel: File size",
  action = function ()
    if APanel.Folder then Keys"F3" end
    return far.CopyToClipboard(Panel.Item(0, 0, 6))
  end, ---
} ---
Macro { -- File path
  area = "Shell",
  key = "LCtrlF7",
  flags = "",
  description = "Panel: File path",
  action = function ()
    return far.CopyToClipboard(APanel.Path)
  end, ---
} ---
Macro { -- File creation time
  area = "Shell",
  key = "LCtrlF8",
  flags = "",
  description = "Panel: File creation time",
  action = function ()
    return far.CopyToClipboard(Panel.Item(0, 0, 3))
  end, ---
} ---
Macro { -- File access time
  area = "Shell",
  key = "LCtrlF9",
  flags = "",
  description = "Panel: File access time",
  action = function ()
    return far.CopyToClipboard(Panel.Item(0, 0, 4))
  end, ---
} ---
Macro { -- File packed size
  area = "Shell",
  key = "LCtrlF10",
  flags = "",
  description = "Panel: File packed size",
  action = function ()
    return far.CopyToClipboard(Panel.Item(0, 0, 7))
  end, ---
} ---
Macro { -- File CRC32
  area = "Shell",
  key = "LCtrlF11",
  flags = "",
  description = "Panel: File CRC32",
  action = function ()
    return far.CopyToClipboard(Panel.Item(0, 0, 13))
  end, ---
} ---
--]]
---------------------------------------- -- Naming
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
  key = "LCtrlP",
  flags = "",
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
  key = "LCtrlShiftP",
  flags = "",
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
  key = "LCtrlT",
  flags = "",
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
  key = "LCtrlShiftT",
  flags = "",
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
  key = "LAltShiftF5",
  flags = "",
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
  key = "LAltShiftF6",
  flags = "",
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
  key = "LCtrlF",
  flags = "",
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
  key = "LAltF8",
  flags = "",
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
  key = "LCtrlAltF8",
  flags = "",
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
  key = "LCtrlShiftA",
  flags = "",
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
      if Area.Shell then return Keys"ShiftSubtract" end
    end
  end, ---
} ---
Macro { -- для файла, каталога и его элементов
  area = "Shell",
  key = "LCtrlLAltShiftA",
  flags = "",
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

    return Keys"Enter"
  end, ---
} ---
--]]
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
