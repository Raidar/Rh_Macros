--[[ Shell macros with plugins ]]--

----------------------------------------
--[[ description:
  -- Macros for shell area with plugins.
  -- Макросы для области оболочки с плагинами.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Plugins.
--]]
--------------------------------------------------------------------------------

----------------------------------------
local far = far
local F = far.Flags

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end
local Plugin = Plugin or {}

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- '`' -- FarCmds
-- [[
--guids.FarCmds = ""
--]]
---------------------------------------- 'E' -- EMenu
-- [[
guids.EMenu = "742910F1-02ED-4542-851F-DEE37C2E13B2"

local Exist = function () return PluginExist(guids.EMenu) end

Macro {
  area = "Shell",
  key = "AltApps",
  flags = "",
  description = "EMenu: My Computer",
  condition = Exist,
  action = function ()
    PluginMenu(guids.EMenu)
    Keys"Down Enter"
    exit()
  end, ---
} ---
--]]
---------------------------------------- '[' -- TmpPanel
-- [[
guids.TmpPanel = "B77C964B-E31E-4D4C-8FE5-D6B0C6853E7C"

local Exist = function () return PluginExist(guids.TmpPanel) end

Macro {
  area = "Shell",
  key = "CtrlApps",
  flags = "",
  description = "TmpPanel: Shortcuts",
  condition = Exist,
  action = function ()
    print("tmp:+menu %FarLocalProfile%\\Shortcuts.temp")
    Keys"Enter"
    exit()
  end, ---
} ---
--]]
---------------------------------------- '7' -- ArcLite
-- [[
guids.ArcLite = "65642111-AA69-4B84-B4B8-9249579EC4FA"
guids.ArcLiteArchive = "CD57D7FA-552C-4E31-8FA8-73D9704F0666"

local Exist = function () return PluginExist(guids.ArcLite) end

Macro {
  area = "Shell",
  key = "AltShiftF1",
  flags = "",
  description = "Arch: Choose profile…",
  condition = Exist,
  action = function ()
    if not PluginMenu(guids.ArcLite) then return end

    -- Окно "Создание архива"
    Keys"Down Down Enter"
    if not Area.Dialog or Dlg.Id ~= guids.ArcLiteArchive then
      return
    end

    -- Поиск поля "Профиль"
    local k, Count = 0, Dlg.ItemCount
    repeat
      k = k + 1
      Dlg.SetFocus(k)
    until k > Count or Dlg.ItemType == F.DI_COMBOBOX
    if k > Count then return end

    Keys"CtrlDown"
    exit()
  end, ---
} ---

Macro { -- Editor.WordDiv must be consist "."
  area = "Shell",
  key = "CtrlShiftF1",
  flags = "",
  description = "Arch: Make archive…",
  condition = function ()
    return PluginExist(guids.ArcLite) and APanel.FilePanel
  end, ---
  action = function ()
    local Panel = APanel
    local IsFile = not Panel.Folder
    local Selected = Panel.Selected
    local Name = Panel.Current
    local ExtPos = Name:cfind("%.[^%.]-$")

    if not PluginMenu(guids.ArcLite) then return end

    -- Окно "Создание архива"
    Keys"Down Down Enter"
    if not Area.Dialog or Dlg.Id ~= guids.ArcLiteArchive then
      return
    end

    if not Selected and IsFile and
       ExtPos and ExtPos > Name:len() - 7 then
      Keys"CtrlLeft CtrlBS"
    end

    Keys"Home ShiftEnd CtrlShiftLeft ShiftLeft"

    exit()
  end, ---
} ---

Macro {
  area = "Shell",
  key = "CtrlAltShiftF1",
  flags = "",
  description = "Arch: Test archive",
  condition = Exist,
  action = function ()
    Keys"ShiftF3"
    if Area.Menu then Keys"Enter" end

    --if not PluginMenu(guids.ArcLite) then return end
    --Keys"Up Up Enter"
    -- Окно "Результат тестирования архива"

    exit()
  end, ---
} ---
--]]
--------------------------------------------------------------------------------
