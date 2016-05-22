--[[ Dialog macros ]]--

----------------------------------------
--[[ description:
  -- Macros for dialog areas.
  -- Макросы для областей диалогов.
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
--local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

----------------------------------------

local IsDlgEdit = function ()
  return --not Area.Dialog or
         Area.Dialog and Dlg.ItemType == F.DI_EDIT
end -- IsDlgEdit

---------------------------------------- Info
-- [[
Macro {
  area = "Dialog",
  key = "ShiftF2",
  flags = "",
  description = "Dlg: Dialog Info",
  --condition = ,
  action = function ()
    local sfind = string.find
    local tp = Dlg.ItemType
    for k, v in pairs(F) do
      if sfind(k, "DI_", 1, true) == 1 and v == tp then
        tp = k
        break
      end
    end
    local t = {
      "GUID = "..Dlg.Id,
      "CurPos = "..tostring(Dlg.CurPos),
      "ItemType = "..tostring(tp),
    } ---
    return far.Message(table.concat(t, "\n"), Object.Title)
  end, ---
} ---
--]]
---------------------------------------- Actions
-- [[
Macro {
  area = "Dialog",
  key = "AltDown",
  flags = "",
  description = "Dlg: Open history box",
  condition = IsDlgEdit,
  action = function () return Keys"CtrlDown" end, ---
} ---
--]]
---------------------------------------- FindFile
-- [[
guids.FindFileResult = "536754EB-C2D1-4626-933F-A25D1E1D110A"

-- Проверка на диалог FindFile.
local function IsFindFileResult ()
  return Area.Dialog and Dlg.Id == guids.FindFileResult
end

local function ReplaceInFindFile ()
  --far.Message(Dlg.Id, Object.Title)
  Keys"F4" -- Редактирование текущего элемента
  if not Area.Editor then return end -- Редактировать нельзя

  -- Элемент -- не ReadOnly-файл !
  if band(Editor.State, 0x00000200) == 0 then
    -- Замена с начала файла
    Keys"CtrlHome CtrlF7 Enter"
    if Area.Dialog then
      Keys"Right Enter" -- Подтверждение замены
    end
    Keys"F2" -- Сохранение
    if Area.Dialog then
      Keys"Enter" -- Подтверждение сохранения
    end
  end

  return Keys"Esc" -- Выход из редактора
end -- ReplaceInFindFile

Macro {
  area = "Dialog",
  key = "LCtrlR",
  flags = "",
  description = "FindFile: Replace in file",
  condition = IsFindFileResult,
  action = function () 
    return ReplaceInFindFile()
  end, ---
} ---
Macro {
  area = "Dialog",
  key = "LCtrlShiftR",
  flags = "",
  description = "FindFile: Replace in file + Down",
  condition = IsFindFileResult,
  action = function ()
    ReplaceInFindFile()
    return Keys"Down" -- На следующий элемент
  end, ---
} ---
--]]
--------------------------------------------------------------------------------
