--[[ Shell macros ]]--

----------------------------------------
--[[ description:
  -- Macros for shell area.
  -- Макросы для области оболочки.
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
local guids, guid = {}
--unit.guids = guids

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- '7' -- ArcLite
guid = "65642111-AA69-4B84-B4B8-9249579EC4FA"
guids.ArcLite = guid

local Exist = function () return PluginExist(guid) end

-- [[
Macro {
  area = "Shell",
  key = "AltShiftF1",
  flags = "DisableOutput",
  description = "Arch: Choose profile…",
  condition = Exist,
  action = function ()
             if not PluginMenu(guid) then return end

             -- Окно "Создание архива"
             Keys"Down Down Enter"
             if not Area.Dialog or
                Dlg.Id ~= "CD57D7FA-552C-4E31-8FA8-73D9704F0666" then
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
  flags = "DisableOutput",
  description = "Arch: Make archive…",
  condition = function ()
                return Exist() and APanel.FilePanel
              end, ---
  action = function ()
             local Panel = APanel
             local IsFile = not Panel.Folder
             local Selected = Panel.Selected
             local Name = Panel.Current
             local ExtPos = Name:cfind("\.[^\.]-$")

             if not PluginMenu(guid) then return end

             -- Окно "Создание архива"
             Keys"Down Down Enter"
             if not Area.Dialog or
                Dlg.Id ~= "CD57D7FA-552C-4E31-8FA8-73D9704F0666" then
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
  flags = "DisableOutput",
  description = "Arch: Test archive",
  condition = Exist,
  action = function ()
             Keys"ShiftF3"
             if Area.Menu then Keys"Enter" end

             --if not PluginMenu(guid) then return end
             --Keys"Up Up Enter"
             -- Окно "Результат тестирования архива"

             exit()
           end, ---
} ---
--]]
--------------------------------------------------------------------------------
