--[[ Dialog macros ]]--

----------------------------------------
--[[ description:
  -- Macros for dialog areas.
  -- Макросы для областей диалогов.
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

---------------------------------------- Dialog info
Macro {
  area = "Dialog",
  key = "ShiftF1",
  flags = "DisableOutput",
  description = "Dlg: Dialog Info",
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
             far.Message(table.concat(t, "\n"), Object.Title)
           end, ---
} ---
---------------------------------------- Actions
Macro {
  area = "Dialog",
  key = "AltDown",
  flags = "DisableOutput",
  description = "Dlg: Open history box",
  condition = function ()
                return Dlg.ItemType == F.DI_EDIT
              end, ---
  action = function ()
             Keys"CtrlDown"
           end, ---
} ---
---------------------------------------- FindFile
-- Проверка на диалог FindFile.
local function IsFindFileDialog ()
  return Dlg.Id == "00000000-0000-0000-0000-000000000000" and
         Dlg.ItemType == F.DI_BUTTON and
         Object.Title:cfind("Поиск файла: ", 1, true) == 1
end -- IsFindFileDialog

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

  Keys"Esc" -- Выход из редактора
end -- ReplaceInFindFile

Macro {
  area = "Dialog",
  key = "CtrlR",
  flags = "DisableOutput",
  description = "FindFile: Replace in file",
  condition = function ()
                return IsFindFileDialog()
              end, ---
  action = function ()
             return ReplaceInFindFile()
           end, ---
} ---
Macro {
  area = "Dialog",
  key = "CtrlShiftR",
  flags = "DisableOutput",
  description = "FindFile: Replace in file + Down",
  condition = function ()
                return IsFindFileDialog()
              end, ---
  action = function ()
             ReplaceInFindFile()
             Keys"Down" -- На следующий элемент
           end, ---
} ---
--------------------------------------------------------------------------------
