--[[ Editor macros ]]--

----------------------------------------
--[[ description:
  -- Macros for editor area.
  -- Макросы для области редактора.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Manager.
--]]
--------------------------------------------------------------------------------

local tonumber, tostring = tonumber, tostring

----------------------------------------
local far = far
local F = far.Flags

local BlockNoneType = F.BTYPE_NONE

local editor = editor

----------------------------------------
--local context = context

local numbers = require 'context.utils.useNumbers'
local strings = require 'context.utils.useStrings'

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
local unit = {}

----------------------------------------
--local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Testing
--[[
Macro {
  area = "Editor",
  key = "CtrlQ",
  flags = "",
  description = "Edit: Test",
  action = function ()
    prints("test")
    return prints("abc", 10, "def")
  end, ---
} ---
--]]
---------------------------------------- Actions
-- [[
Macro {
  area = "Editor",
  key = "AltF9",
  flags = "",
  description = "Edit: Next codepage",
  action = function ()
    Keys"ShiftF8"
    if not Area.Menu then return end

    --far.Message(("%#08x"):format(Menu.ItemStatus()))
    repeat
      Keys"Down"
    until band(Menu.ItemStatus(), 0x0000003C) == 0

    return Keys"Enter"
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftG",
  flags = "",
  description = "Edit: Goto…",
  action = function () return Keys"AltF8" end, ---
} ---
--]]
---------------------------------------- File
-- [[
Macro {
  area = "Editor",
  key = "CtrlAltShiftL",
  flags = "",
  description = "Edit: Lock/Unlock",
  action = function () return Keys"CtrlL" end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltShiftEnter",
  flags = "",
  description = "Edit: Insert full filename",
  action = function () return Keys"CtrlF" end, ---
} ---
--]]

--[[
Macro {
  area = "Editor",
  key = "CtrlO",
  flags = "",
  description = "Edit: Switch to panels",
  action = function () return Keys"F12 0" end, ---
} ---
--]]

-- [[
Macro {
  area = "Editor",
  key = "CtrlS",
  flags = "",
  description = "Edit: Save file",
  action = function ()
    local IsExist = mf.fexist(Editor.FileName)
    --far.Message(tostring(mIsExist), Editor.FileName)
    Keys"F2" -- Сохранение
    if IsExist and Area.Dialog then
      return Keys"Enter" -- Подтверждение сохранения для ReadOnly-файла
    end
  end, ---
} ---
--]]

-- Save file with codepage UTF-8 without BOM.
-- Сохранение файла в кодировке UTF-8 без BOM.
function unit.SaveAsUtf8noBOM (Ask)
  --local isOk = true -- DEBUG only
  if Ask then
    local isOk = far.Message("Save this file as UTF-8?",
                             "Warning!", ";YesNo", "w") == 1
    --far.Message(isOk, "SaveAsUtf8noBOM")
    if not isOk then return end -- Отмена --> Не сохранять
  end

  --far.Message(tostring(check), Editor.FileName)

  local Info = editor.GetInfo() -- Сохранение текущих линии и позиции
  Keys"ShiftF2" -- Сохранение
  Keys"Tab" -- Переключение на выбор кодовой страницы
  local id = Dlg.CurPos
  Keys"CtrlDown" -- Раскрытие списка

  -- Поиск в списке
  local sfind = string.find
  local value = Dlg.GetValue(id, 0) or "" -- Значение
  --far.Message(value, Dlg.GetValue(id, 7))
  if not sfind(value, "65001", 1, true) then
    -- Переход на самый верхний элемент списка
    local start = Dlg.GetValue(id, 7)
    while Dlg.GetValue(id, 7) <= start do Keys"Up" end
    Keys"Down"
    -- Поиск по всем элементам списка
    value = Dlg.GetValue(id, 0) or ""
    start = Dlg.GetValue(id, 7) - 1
    while Dlg.GetValue(id, 7) > start and
          not sfind(value, "65001", 1, true) do
      Keys"Down"
      value = Dlg.GetValue(id, 0) or ""
    end
    -- Элемент не найден --> Отмена
    if not sfind(value, "65001", 1, true) then
      return Keys"Esc Esc" -- Отмена списка и окна сохранения
    end
  end

  Keys"Enter" -- Закрытие списка с выбором элемента
  Keys"Tab Subtract" -- Отмена выбора сигнатуры (BOM)

  Keys"Enter" -- Закрытие окна сохранения с подтверждением
  -- Закрытие подтверждающих окон:
  if Area.Dialog then Keys"Enter" end
  if Area.Dialog then Keys"Enter" end

  -- Восстановление текущих линии и позиции
  return editor.SetPosition(Info.EditorID, Info.CurLine, Info.CurPos)
end ---- SaveAsUtf8noBOM

-- [[
Macro {
  area = "Editor",
  key = "CtrlShiftS",
  flags = "",
  description = "Edit: Save as UTF-8 w/o BOM",
  action = function ()
    return unit.SaveAsUtf8noBOM(true)
  end, ---
} ---
--]]
---------------------------------------- Search
-- [[
Macro {
  area = "Editor",
  key = "CtrlF",
  flags = "",
  description = "Edit: Find…",
  action = function () return Keys"F7" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlR",
  flags = "",
  description = "Edit: Replace…",
  action = function () return Keys"CtrlF7" end, ---
} ---
Macro {
  area = "Editor",
  key = "F3",
  flags = "",
  description = "Edit: Find next",
  action = function () return Keys"ShiftF7" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlF3",
  flags = "",
  description = "Edit: Find next & center",
  action = function ()
    Keys"ShiftF7"

    if Area.Dialog then return end -- Не найдено

    local Info = editor.GetInfo()
    if not Info then return end

    local shift = Info.CurPos - Info.WindowSizeX / 4 * 3
    if shift > 0 then
      return editor.SetPosition(Info.EditorID, -1, Info.LeftPos + shift)
    end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltShiftF7",
  flags = "",
  description = "Edit: Replace all",
  action = function ()
    Keys"CtrlF7 Enter" -- Замена первого вхождения

    if Area.Dialog then
      return Keys"Right Enter" -- Замена остальных вхождений
    end
  end, ---
} ---
--]]
---------------------------------------- Space
-- [[
Macro {
  area = "Editor",
  key = "AltBS",
  flags = "",
  description = "Edit: Tabulation",
  action = function () return Keys"Tab" end, ---
} ---
Macro {
  area = "Editor",
  key = "ShiftBS",
  flags = "",
  description = "Edit: Double space",
  action = function () return Keys"Space Space" end, ---
} ---

Macro {
  area = "Editor",
  key = "Tab",
  flags = "",
  description = "Edit: Spaced tab / Indent",
  action = function ()
    local Info = editor.GetInfo()
    if Info.BlockType == BlockNoneType then
      local Pos = Info.CurPos
      Pos = 4 - (Pos - 1) % 4
      --far.Message(Pos, Info.CurPos)
      for k = 1, Pos do Keys"Space" end
    else
      return Keys"AltI" -- Сдвиг выделения вправо
    end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "ShiftTab",
  flags = "",
  description = "Edit: Spaced half-tab / Unindent",
  action = function ()
    local Info = editor.GetInfo()
    if Info.BlockType == BlockNoneType then
      local Pos = Info.CurPos
      Pos = 2 - (Pos - 1) % 2
      --far.Message(Pos, Info.CurPos)
      for k = 1, Pos do Keys"Space" end
    else
      return Keys"AltU" -- Сдвиг выделения влево
    end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltShiftTab",
  flags = "",
  description = "Edit: Table-Tab",
  condition = function ()
    local Info = editor.GetInfo()
    return Info.BlockType == BlockNoneType
  end, ---
  action = function ()
    Keys"Tab Left" -- Табуляция с сохранением позиции
    local Info = editor.GetInfo()
    if Info.CurLine < Info.TotalLines then
      return Keys"Down" -- Перемещение на следующую строку
    end
  end, ---
} ---
--]]
---------------------------------------- Move text
-- [[
Macro {
  area = "Editor",
  key = "Left",
  flags = "",
  description = "Edit: Left within line",
  action = function () return Keys"CtrlS" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlD",
  flags = "",
  description = "Edit: Left within file",
  action = function () return Keys"Left" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftD",
  flags = "",
  description = "Edit: Right within file",
  action = function ()
    local Info = editor.GetInfo()
    local s = editor.GetString(Info.EditorID, 0, 2)
    if Info.CurPos > s:len() then
      return Keys"Down Home"
    else
      return Keys"Right"
    end
  end, ---
} ---

Macro {
  area = "Editor",
  key = "Num4",
  flags = "",
  description = "Edit: Left within line",
  action = function () return Keys"CtrlS" end, ---
} ---
Macro {
  area = "Editor",
  key = "Num6",
  flags = "",
  description = "Edit: Right within line",
  action = function () return Keys"Right" end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltHome",
  flags = "",
  description = "Edit: Start of first line",
  action = function () return Keys"CtrlHome Home" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltEnd",
  flags = "",
  description = "Edit: Start of last line",
  action = function () return Keys"CtrlEnd Home" end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlNum1",
  flags = "",
  description = "Edit: End of last line",
  action = function () return Keys"CtrlEnd End" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlNum7",
  flags = "",
  description = "Edit: Start of first line",
  action = function () return Keys"CtrlHome Home" end, ---
} ---
--]]
---------------------------------------- Move block
--[[
Macro {
  area = "Editor",
  key = "CtrlShiftI",
  flags = "",
  description = "Edit: Shift 4fold block right",
  action = function () return Keys"AltI AltI AltI AltI" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftU",
  flags = "",
  description = "Edit: Shift 4fold block left",
  action = function () return Keys"AltU AltU AltU AltU" end, ---
} ---

Macro {
  area = "Editor",
  key = "AltShiftI",
  flags = "",
  description = "Edit: Shift twice block right",
  action = function () return Keys"AltI AltI" end, ---
} ---
Macro {
  area = "Editor",
  key = "AltShiftU",
  flags = "",
  description = "Edit: Shift twice block left",
  action = function () return Keys"AltU AltU" end, ---
} ---
--]]
---------------------------------------- Position
-- Shift a current line from screen top/bottom.
-- Смещение текущей линии относительно верха/низа экрана.
function unit.ShiftCurLine (Shift)
  local Info = editor.GetInfo()
  local Line = Info.CurLine
  if Shift > 0 then
    Line = math.max(Line - Shift, 1)
  else
    Line = math.max(Line - (Info.WindowSizeY + Shift), 1)
  end

  return editor.SetPosition(Info.EditorID, { TopScreenLine = Line })
end ---- ShiftCurLine

-- [[
Macro {
  area = "Editor",
  key = "CtrlEnter",
  flags = "",
  description = "Edit: Shift up current line",
  action = function () return unit.ShiftCurLine(7) end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlNumEnter",
  flags = "",
  description = "Edit: Shift up current line",
  action = function () return unit.ShiftCurLine(7) end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltEnter",
  flags = "",
  description = "Edit: Shift down current line",
  action = function () return unit.ShiftCurLine(-4) end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltNumEnter",
  flags = "",
  description = "Edit: Shift down current line",
  action = function () return unit.ShiftCurLine(-4) end, ---
} ---
--]]
---------------------------------------- Clipboard
-- [[
Macro {
  area = "Editor",
  key = "CtrlC",
  flags = "",
  description = "Edit: Copy selection only",
  action = function ()
    local Info = editor.GetInfo()
    if Info.BlockType ~= BlockNoneType then
      return Keys"CtrlC"
    end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlIns",
  flags = "",
  description = "Edit: Copy selection only",
  action = function ()
    local Info = editor.GetInfo()
    if Info.BlockType ~= BlockNoneType then
      return Keys"CtrlIns"
    end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftIns",
  flags = "",
  description = "Edit: Add to clipboard",
  action = function ()
    local Info = editor.GetInfo()
    if Info.BlockType ~= BlockNoneType then
      return Keys"CtrlAdd"
    end
  end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltV",
  flags = "",
  description = "Edit: Paste + Down",
  action = function () return Keys"CtrlV Down" end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftV",
  flags = "",
  description = "Edit: Paste + Down + End",
  action = function () return Keys"CtrlV Down End" end, ---
} ---
--]]
---------------------------------------- Numeration
do
  local isdigit = strings.isdigit

-- Find a number position.
-- Поиск положения числа.
--[[
  -- @params:
  Info   (table) - info about editor state.
  Line  (number) - line number (@default = current line).
  Pos   (number) - position number (@default = current position).
  -- @return:
  s (nil|string) - line content.
  PosB  (number) - number begin position.
  PosE  (number) - number end position.
--]]
function unit.FindNumberPos (Info, Line, Pos)
  local Info = Info or editor.GetInfo()

  local s = editor.GetString(Info.EditorID, Line or 0, 2)
  --far.Message(s, s:len())
  if not s then return end
  local Len = s:len()
  if Len == 0 then return end

  local Pos = Pos or Info.CurPos
  if Pos <= 0 then
    Pos = Len + Pos + 1
  end

  local PosB, PosE -- begin/end pos

  local atEnd = Len < Pos
  if atEnd then PosE = Len end

  local f = isdigit(s:sub(Pos, Pos))
  --far.Message(f, Pos)
  if not f then
    if atEnd or Pos < 2 then return end
    Pos = Pos - 1
    PosE = Pos
    f = isdigit(s:sub(Pos, Pos))
    if not f then return end
  end

  local k = Pos
  while k > 0 and isdigit(s:sub(k, k)) do
    k = k - 1
  end
  PosB = k + 1

  if not PosE then
    local k = Pos
    while k <= Len and isdigit(s:sub(k, k)) do
      k = k + 1
    end
    PosE = k - 1
  end
  if not PosB and not PosE or PosE < PosB then return end

  --[[
  local t = {
    tostring(PosB),
    tostring(PosE),
    '"'..s:sub(PosB, PosE)..'"',
  } ---
  far.Message(table.concat(t, "\n"), "FindNumberPos")
  --]]

  return s, PosB, PosE
end ---- FindNumberPos

-- Find a string with number
-- on specified position of lines above/below specified line.
-- Поиск строки с числом
-- на указанной позиции линий выше/ниже указанной линии.
--[[
  -- @params:
  Info   (table) - info about editor state.
  Line  (number) - line number (@default = current line).
  Pos   (number) - position number (@default = current position).
  Shift (number) - direction toward specified line.
  Limit (number) - count of searched lines.
  -- @return:
  s (nil|string) - line content.
  PosB  (number) - number begin position.
  PosE  (number) - number end position.
--]]
function unit.FindNumberStr (Info, Line, Pos, Shift, Limit)
  local Info = Info or editor.GetInfo()

  local Pos  = Pos  or Info.CurPos
  local Line = Line or Info.CurLine
  local Count = Info.TotalLines
  local Shift, Limit = Shift or -1, Limit or Count

  local abs, FindNumberPos = math.abs, unit.FindNumberPos

  -- Просмотр строк выше/ниже:
  local s, PosB, PosE
  local k = Line
  while not s and
        abs(k - Line) <= Limit and
        (k >= 0 and k < Count) do
    k = k + Shift
    s, PosB, PosE = FindNumberPos(Info, k, Pos)
    --[[
    if s then
      local t = {
        tostring(PosB),
        tostring(PosE),
        '"'..(s and s:sub(PosB, PosE) or "")..'"',
        '"'..(s or "")..'"',
      } ---
      far.Message(table.concat(t, "\n"), "FindNumberStr")
    end
    --]]
  end

  --[[
  local t = {
    tostring(k),
    tostring(PosB),
    tostring(PosE),
    s,
    '"'..(s and s:sub(PosB, PosE) or "")..'"',
  } ---
  far.Message(table.concat(t, "\n"), "FindNumberStr")
  --]]

  editor.SetPosition(Info.EditorID, Info)

  if not s then return end

  return s:sub(PosB, PosE)
end ---- FindNumberStr

end -- do
do
  local isdigit = strings.isdigit
  local digit, todigit = strings.digit, strings.todigit

-- Shift a digit value on current position of current line.
-- Смещение значения цифры на текущей позиции текущей линии.
function unit.ShiftDigit (Shift)
  local Info = editor.GetInfo()

  local s = editor.GetString(Info.EditorID, 0, 2)
  --far.Message(s:len(), Pos)
  if not s then return end
  local Len = s:len()
  if Len == 0 then return end

  local Pos = Info.CurPos
  local atEnd = Len < Pos
  if atEnd then Pos = Len end

  local c = todigit(s:sub(Pos, Pos))
  --far.Message(c, Pos)
  if c < 0 then
    if atEnd or Pos < 2 then return end
    Pos = Pos - 1
    c = todigit(s:sub(Pos, Pos))
    if c < 0 then return end
  end

  c = digit((c + Shift) % 10)
  s = s:sub(1, Pos - 1)..c..s:sub(Pos + 1, -1)

  return editor.SetString(Info.EditorID, 0, s)
end ---- ShiftDigit

  local ssub, srep = string.sub, string.rep

-- Shift a number value on current position of current line.
-- Смещение значения числа на текущей позиции текущей линии.
function unit.ShiftNumber (Shift)
  local Info = editor.GetInfo()
  local s, PosB, PosE = unit.FindNumberPos(Info, 0, Info.CurPos)
  if not s then return end

  local c = s:sub(PosB, PosE)
  local n = tonumber(c)
  if not n then return end
  --far.Message(n, Shift)

  n = n + Shift
  local Len = c:len()
  if n >= 0 then
    c = ssub(srep("0", Len)..tostring(n), -Len, -1)
  else
    c = srep("9", Len)
  end
  s = s:sub(1, PosB - 1)..c..s:sub(PosE + 1, -1)

  return editor.SetString(Info.EditorID, 0, s)
end ---- ShiftNumber

end -- do

-- [[
Macro {
  area = "Editor",
  key = "AltLeft",
  flags = "",
  description = "Edit: Digit decrement",
  action = function () return unit.ShiftDigit(-1) end, ---
} ---
Macro {
  area = "Editor",
  key = "AltRight",
  flags = "",
  description = "Edit: Digit increment",
  action = function () return unit.ShiftDigit(1) end, ---
} ---
--]]

Macro {
  area = "Editor",
  key = "AltDown",
  flags = "",
  description = "Edit: Number decrement",
  action = function () return unit.ShiftNumber(-1) end, ---
} ---
Macro {
  area = "Editor",
  key = "AltUp",
  flags = "",
  description = "Edit: Number increment",
  action = function () return unit.ShiftNumber(1) end, ---
} ---

do
  local srep, format = string.rep, string.format

-- Make a number value with separators.
-- Формирование значения числа с разделителями.
--[[
  -- @params:
  s     (string) - a string with number.
  sep   (string) - a separator value.
  group (number) - a number of digits to separate as group.
  limit (number) - a maximum number of digits to separate never.
--]]
function unit.toseparate (s, sep, group, limit)
  if not s then return end

  local len = s:len()
  local group = group or 3
  if len <= group then return end
  if limit and len <= limit then return end

  --far.Message(reverse(c), Separator)
  local sep = sep or " "
  s = s:reverse():gsub(srep(".", group), "%0"..sep)
  return s:reverse():gsub(format("^[%s]+", sep), "")
end ---- toseparate

-- Insert separator to number value.
-- Вставка разделителя в значение числа.
--[[
  -- @params:
  Separator (string) - a separator value.
  GroupSize (number) - a number of digits to separate as group.
  MaxDigits (number) - a maximum number of digits to separate never.
--]]
function unit.SeparateNumber (Separator, GroupSize, MaxDigits)
  local Info = editor.GetInfo()
  local s, PosB, PosE = unit.FindNumberPos(Info, 0, Info.CurPos)
  if not s then return end

  local c = s:sub(PosB, PosE)
  if not c then return end

  c = unit.toseparate(c, Separator, GroupSize, MaxDigits)
  if not c then return end

  s = s:sub(1, PosB - 1)..c..s:sub(PosE + 1, -1)

  return editor.SetString(Info.EditorID, 0, s)
end ---- SeparateNumber

end -- do
do
  local format = string.format
  local round  = numbers.round

  local ByteFold = 1024
  local BytePrefixes = {
    { name = "B",   fold = 1, },
    { name = "KiB", fold = ByteFold, },
    { name = "MiB", fold = ByteFold*ByteFold, },
    { name = "GiB", fold = ByteFold*ByteFold*ByteFold, },
    { name = "TiB", fold = ByteFold*ByteFold*ByteFold*ByteFold, },
  } --- BytePrefixes

-- Make a size value with prefixes.
-- Формирование значения размера с использованием префиксов.
--[[
  -- @params:
  v (string|number) - a size value.
  -- @return:
  value    (string) - size using prefix.
  prefix   (string) - prefix name.
--]]
function unit.tobytefold (v)
  if not v then return end

  local n = v
  if type(n) == 'string' then n = tonumber(n) end
  if not n then return end

  local Prefixes = BytePrefixes
  local k, count = 1, #Prefixes
  while k <= count and Prefixes[k].fold <= n do k = k + 1 end
  k = k - 1
  local Prefix = Prefixes[k]
  if k == 1 then return end
  --if k == 1 then return 1, Prefix.name end

  n = n / Prefix.fold
  if n < 10 then
    n = format("%.2f", round(n * 100) / 100)
  elseif n < 100 then
    n = format("%.1f", round(n * 10) / 10)
  else
    n = format("%.0f", round(n))
  end

  --far.Message(n, Prefix.name)

  return n, Prefix.name
end ---- tobytefold

  local FoldByteFmt = "%s %s (%s B)"

-- Make a size value as a byte measure.
-- Формирование значения размера как размерности в байтах.
--[[
  -- @params: @see unit.SeparateNumber.
--]]
function unit.FoldByteSize (Separator, GroupSize, MaxDigits)
  local Info = editor.GetInfo()
  local s, PosB, PosE = unit.FindNumberPos(Info, 0, Info.CurPos)
  if not s then return end

  local c = s:sub(PosB, PosE)
  if not c then return end

  -- Size in bytes with separators.
  local b = unit.toseparate(c, Separator, GroupSize, MaxDigits) or c
  --if not b then return end

  -- Size in bytefolds.
  local f, n = unit.tobytefold(c)
  if not f then return end

  c = FoldByteFmt:format(f, n, b)

  s = s:sub(1, PosB - 1)..c..s:sub(PosE + 1, -1)

  editor.SetString(Info.EditorID, 0, s)
  return editor.SetPosition(Info.EditorID, 0, PosB + c:len() - 1)
end ---- FoldByteSize

end -- do

-- [[
Macro {
  area = "Editor",
  key = "AltQ",
  flags = "",
  description = "Edit: Number spacing",
  action = function ()
    return unit.SeparateNumber(" ", 3, 4)
  end, ---
} ---

Macro {
  area = "Editor",
  key = "AltShiftQ",
  flags = "",
  description = "Edit: Bytes folding",
  action = function ()
    return unit.FoldByteSize(" ", 3, 4)
  end, ---
} ---
--]]
---------------------------------------- Readme

---------------------------------------- -- Page number
-- [[
Macro {
  area = "Editor",
  key = "AltP",
  flags = "",
  description = "ReadMe: Text (|)",
  action = function ()
    Keys"End"
    print" ()"
    Keys"Left"
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltP",
  flags = "",
  description = "ReadMe: Text (|) Text",
  action = function ()
    print" ()"
    Keys"Left"
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlP",
  flags = "",
  description = "ReadMe: (Text)|",
  action = function ()
    print"("
    Keys"End"
    print")"
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShiftP",
  flags = "",
  description = "ReadMe: (Text)| + Next",
  action = function ()
    print"("
    Keys"End"
    print")"
    Keys"Down End CtrlLeft"
  end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlAltShiftP",
  flags = "",
  description = "ReadMe: (Number)| + Next",
  action = function ()
    print"("
    Keys"End"
    print")"
    Keys"Down End"
    -- TODO: Доделать: выделять только числа, текст пропускать?!
    Keys"CtrlLeft"
  end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlO",
  flags = "",
  description = "ReadMe: (|Number)",
  action = function ()
    Keys"End"
    print")"
    Keys"CtrlLeft"
    print"("
  end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltShiftO",
  flags = "",
  description = "ReadMe: (Num / Num)| + Next",
  action = function ()
    Keys"End"
    print")"
    Keys"CtrlLeft CtrlLeft CtrlLeft"
    print"("
    Keys"Down End"
  end, ---
} ---

-- Autoset a previous page number.
-- Автоустановка предыдущего номера страницы.
Macro {
  area = "Editor",
  key = "AltShiftZ",
  flags = "",
  description = "ReadMe: (Num) from up",
  action = function ()
    Keys"End"
    local Info = editor.GetInfo()
    -- Поиск с предпоследней позиции, так исключается ")"!
    local n = unit.FindNumberStr(Info, Info.CurLine, -2, -1, 100)
    print" ()"
    Keys"Left"
    if n then
      print(n)
    end
  end, ---
} ---
--]]
---------------------------------------- -- List bullet
-- [[
do

local BulletSep = ". "

local Bullets = {
  ["#"] = { level = "Num",  key = "Alt1", },
  ["*"] = { level = "1",    key = "AltShift1", },
  ["-"] = { level = "2",    key = "Alt2", },
  [":"] = { level = "Lib",  key = "AltShift2", },
  ["~"] = { level = "3",    key = "Alt3", },
  ["·"] = { level = "4",    key = "AltShift3", },
} --- Bullets

  local DescFmt = "Bullet: '%s%s' (Level %s)"

for k, v in pairs(Bullets) do
  if k ~= "" then
    Macro {
      area = "Editor",
      key = v.key,
      flags = "",
      description = DescFmt:format(k, BulletSep, v.level),
      action = function ()
        print(k..BulletSep)
        --prints(k, BulletSep)
      end, ---
    } ---
  end
end

--[=[
-- WARN: Закомментировано, т.к. занято на Quote-макросы.
local IndentBullets = {
  ["-"]     = { level = "2",    key = "CtrlAltShift1", },
  ["  ~"]   = { level = "3",    key = "CtrlAltShift2", },
  ["    ·"] = { level = "4",    key = "CtrlAltShift3", },
} --- IndentBullets

  local DescFmt = "Bullet: '%s%s' (L%s) + Next"

for k, v in pairs(IndentBullets) do
  if k ~= "" then
    Macro {
      area = "Editor",
      key = v.key,
      flags = "",
      description = DescFmt:format(k, BulletSep, v.level),
      action = function ()
        local Info = editor.GetInfo()
        print(k..BulletSep)
        return editor.SetPosition(Info.EditorID,
                                  Info.CurLine + 1, Info.CurPos)
      end, ---
    } ---
  end
end
--]=]
end -- do
--]]
---------------------------------------- -- Section number
-- [[
-- Autoset a section number (incremently).
-- Автоустановка номера раздела (с инкрементом).
local function AutoSectionNumber ()
  local Info = editor.GetInfo()
  local s = unit.FindNumberStr(Info, Info.CurLine, Info.CurPos, -1, 100)
  -- TODO: Переделать с использованием только Lua, без Keys/print.
  if s then
    local sLen = s:len()
    local n = tostring(tonumber(s) + 1)
    local nLen = n:len()
    --far.Message('"'..s..'"\n"'..n..'"\n')
    if nLen > sLen then
      Keys"CtrlS"
    elseif nLen < sLen then
      print("0")
    end
    return print(n..". ")

  else
    return print("1. ")
  end
end ---- AutoSectionNumber

  local SectionPat = "[^\.]*\."

-- Clear a section number from all supersections' numbers.
-- Очистка номера раздела от всех номеров надразделов.
--[[
  -- @params:
  Level (number) - a number of sections to clear (@default = all but last).
  Subst (string) - a substitution of section number (@default = two spaces).
  Kind  (string) - a kind of section numeration (@default: "both"):
                   "number", "roman", "both", "all".
--]]
local function ClearSectionNumber (Level, Subst, Kind)
  local Info = editor.GetInfo()
  local id = Info.EditorID

  -- Пропуск пустых строк:
  local s -- Текущая линия
  local Line = Info.CurLine
  repeat
    if Line == Info.TotalLines then return end
    s = editor.GetString(id, 0, 2)
    -- Следующая линия:
    Line = Line + 1
    editor.SetPosition(id, Line)
  until not s:find("^%s-$")

  local PosB, PosE = s:cfind("[^%s]+") -- Позиция начала и конца
  if not PosB then return end
  --far.Message(PosE, PosB)

  -- Подстрока с номерами:
  local c = s:sub(PosB, PosE)
  if c == s then return end -- Только текст
  --far.Message(c, c:len())

  if c:sub(-1, -1) ~= "." then c = c.."." end
  local _, Count = c:gsub(SectionPat, "") -- Количество номеров
  --far.Message(c, Count)

  local Level = Level or Count - 1
  local Subst = Subst or "  "
  local Kind  = Kind or "both"

  Count = Level

  local function ReplaceSection (s)
    if s == "." then return "" end
    if Kind == "all" then return Subst end

    if Kind == "number" then
      if s:find("^%d+\.$") then return Subst end
    elseif Kind == "roman"  then
      if s:find("^[IVXLCDMivxlcdm]+\.$") then return Subst end
    elseif Kind == "both" then
      if s:find("^[%dIVXLCDMivxlcdm]+\.$") then return Subst end
    end

    Count = Count - 1 -- Без замены
  end -- ReplaceSection

  c, Count = c:gsub(SectionPat, ReplaceSection, Level)
  --far.Message('"'..c..'"', tostring(Level - Count > 0))
  --far.Message('"'..c..'"', tostring(Level).." - "..tostring(Count))

  --[[
  local t = {
    tostring(PosB),
    tostring(PosE),
    '"'..c..'"',
    '"'..s..'"',
  } ---
  far.Message(table.concat(t, "\n"), Line)
  --]]

  if Count > 0 and Count == Level then
    s = s:sub(1, PosB - 1)..c..s:sub(PosE + 1, -1)
    --far.Message('"'..s..'"', c:len())

    editor.SetPosition(id, Line - 1)    -- Текущая линия
    editor.SetString(id, 0, s)          -- Обновление линии
    return editor.SetPosition(id, Line) -- Следующая линия
  end
end -- ClearSectionNumber

Macro {
  area = "Editor",
  key = "AltZ",
  flags = "",
  description = "ReadMe: 'Num. ' from up",
  action = function ()
    return AutoSectionNumber()
  end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlY",
  flags = "",
  description = "ReadMe: Clear first 'Num. '",
  action = function ()
    return ClearSectionNumber(1, nil, "both")
  end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlShiftY",
  flags = "",
  description = "ReadMe: Clear all 'Num. ' but last",
  action = function ()
    return ClearSectionNumber(nil, nil, "both")
  end, ---
} ---
--]]
---------------------------------------- Characters
-- [[
do

local BSh = "BackSlash"

local Characters = {
  -- Alt + <a> --           -- Alt + Shift + <a> --

  -- Latin key-characters:                          -- Latin number-characters:
  ["["] = "Alt[",       ["{"] = "AltShift[",
  ["]"] = "Alt]",       ["}"] = "AltShift]",
  [","] = "Alt,",       ["<"] = "AltShift,",        ["#"] = "CtrlAltShift,",
  ["."] = "Alt.",       [">"] = "AltShift.",        ["^"] = "CtrlAltShift.",
  [";"] = "Alt;",       [":"] = "AltShift;",        ["$"] = "CtrlAltShift;",
  ["'"] = "Alt'",       ['"'] = "AltShift'",        ["@"] = "CtrlAltShift'",
  ["`"] = "Alt`",       ["~"] = "AltShift`",
  ["/"] = "Alt/",       ["?"] = "AltShift/",        ["&"] = "CtrlAltShift/",
 ["\\"] = "Alt"..BSh,   ["|"] = "AltShift"..BSh,    ["‾"] = "CtrlAltShift"..BSh,

  -- Special characters:
  [" "] = "CtrlShiftSpace",
  ["…"] = "CtrlAlt/",

  ["/"] = "Shift"..BSh,
  ["°"] = "Ctrl"..BSh,
  [""] = "CtrlShift"..BSh,
  ["―"] = "CtrlAlt"..BSh,

  ["≤"] = "CtrlAlt,",
  ["≥"] = "CtrlAlt.",

  -- Math/Lang characters with Numpad:
  -- Num+ — Add --                  -- Num* — Multiply --
  ["−"] = "ShiftAdd",               ["⋅"] = "ShiftMultiply",
  ["±"] = "CtrlAdd",                ["×"] = "CtrlMultiply",
  ["∓"] = "CtrlShiftAdd",           ["¤"] = "CtrlShiftMultiply",
  [" "] = "CtrlAltAdd",             ["·"] = "CtrlAltMultiply",
  ["∑"] = "AltAdd",                 ["∏"] = "AltMultiply",
  ["∫"] = "AltShiftAdd",            ["∂"] = "AltShiftMultiply",

  -- Num- — Subtract --             -- Num/ — Divide --
  ["­"] = "ShiftSubtract",          ["÷"] = "ShiftDivide",
  ["—"] = "CtrlSubtract",           ["∕"] = "CtrlDivide",
  ["‑"] = "CtrlShiftSubtract",      ["∞"] = "CtrlShiftDivide",
  ["–"] = "CtrlAltSubtract",        ["⁄"] = "CtrlAltDivide",
  [" "] = "AltSubtract",            ["√"] = "AltDivide",
  ["‒"] = "AltShiftSubtract",       ["∛"] = "AltShiftDivide",

  -- Graphic characters with Numpad:
  ["┼"] = "CtrlAltShiftAdd",        ["●"] = "CtrlAltShiftMultiply",
  ["─"] = "CtrlAltShiftSubtract",   ["│"] = "CtrlAltShiftDivide",
} --- Characters

----------------------------------------
  local u8byte = strings.u8byte -- UTF-8 char to codepoint
  local ucp2s  = strings.ucp2s  -- Char codepoint to string

  local DescFmt = "Char: '%s' | U-%s"

for k, v in pairs(Characters) do
  if k ~= "" then
    Macro {
      area = "Editor",
      key = v,
      flags = "",
      description = DescFmt:format(k, ucp2s(u8byte(k), true)),
      action = function () print(k) end, ---
    } ---
  end
end

end -- do
--]]
--------------------------------------------------------------------------------
