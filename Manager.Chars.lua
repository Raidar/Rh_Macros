--[[ Editor macros ]]--

----------------------------------------
--[[ description:
  -- Macros for editor area.
  -- Макросы для области редактора.
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

----------------------------------------
--local context = context

local strings = require 'context.utils.useStrings'

----------------------------------------
--[[
local debugs = require "context.utils.useDebugs"
local logShow = debugs.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
--local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- Conditions

local function Exist ()

  return true

end

local function IsDlgEdit ()

  return not Area.Dialog or
         Area.Dialog and Dlg.ItemType == F.DI_EDIT

end -- IsDlgEdit

local function ExistSpec ()

  if Area.Menu then return end

  return IsDlgEdit() and Exist()

end -- ExistSpec

---------------------------------------- Characters
-- [[
do

local BSh = "BackSlash"

local Characters = {
  -- Alt + <a>          -- Alt+Shift + <a>          -- Ctrl+Alt+Shift + <a>

  -- Latin key-characters:                          -- Latin number-characters:
  ["["] = "LAlt[",      ["{"] = "LAltShift[",
  ["]"] = "LAlt]",      ["}"] = "LAltShift]",
  [","] = "LAlt,",      ["<"] = "LAltShift,",       ["#"] = "LCtrlLAltShift,",
  ["."] = "LAlt.",      [">"] = "LAltShift.",       ["^"] = "LCtrlLAltShift.",
  [";"] = "LAlt;",      [":"] = "LAltShift;",       ["$"] = "LCtrlLAltShift;",
  ["'"] = "LAlt'",      ['"'] = "LAltShift'",       ["@"] = "LCtrlLAltShift'",
  ["`"] = "LAlt`",      ["~"] = "LAltShift`",       --["ʼ"] = "LCtrlLAltShift'",
  ["/"] = "LAlt/",      ["?"] = "LAltShift/",       ["&"] = "LCtrlLAltShift/",
 ["\\"] = "LAlt"..BSh,  ["|"] = "LAltShift"..BSh,   ["‾"] = "LCtrlLAltShift"..BSh,

  ["ʻ"] = "RAlt;",      ["ʽ"] = "RAltShift;",       --[""] = "RCtrlRAltShift;",
  ["ʼ"] = "RAlt'",      ['ˮ'] = "RAltShift'",       --[""] = "RCtrlRAltShift'",
  ["°"] = "RAlt"..BSh,  ["¦"] = "RAltShift"..BSh,   ["‖"] = "RCtrlRAltShift"..BSh,

  -- Special characters:
  --[""]
  
  [" "] = "LCtrlShiftSpace",
  ["…"] = "LCtrlLAlt/",

  ["°"] = "|", --["°"] = "Shift"..BSh,
  ["́"] = "LCtrl"..BSh,
  ["§"] = "LCtrlShift"..BSh,
  ["―"] = "LCtrlLAlt"..BSh,

  ["≤"] = "LCtrlLAlt,",
  ["≥"] = "LCtrlLAlt.",

  -- Index characters:
  --₁₂₃₄₅₆₇₈₉₀₊₋₌₍₎
  --¹²³⁴⁵⁶⁷⁸⁹⁰⁺⁻⁼⁽⁾
  ["₁"] = "RCtrlLAlt1", ["¹"] = "RCtrlLAltShift1",
  ["₂"] = "RCtrlLAlt2", ["²"] = "RCtrlLAltShift2",
  ["₃"] = "RCtrlLAlt3", ["³"] = "RCtrlLAltShift3",
  ["₄"] = "RCtrlLAlt4", ["⁴"] = "RCtrlLAltShift4",
  ["₅"] = "RCtrlLAlt5", ["⁵"] = "RCtrlLAltShift5",
  ["₆"] = "RCtrlLAlt6", ["⁶"] = "RCtrlLAltShift6",
  ["₇"] = "RCtrlLAlt7", ["⁷"] = "RCtrlLAltShift7",
  ["₈"] = "RCtrlLAlt8", ["⁸"] = "RCtrlLAltShift8",
  ["₉"] = "RCtrlLAlt9", ["⁹"] = "RCtrlLAltShift9",
  ["₀"] = "RCtrlLAlt0", ["⁰"] = "RCtrlLAltShift0",
  ["₋"] = "RCtrlLAlt-", ["⁻"] = "RCtrlLAltShift-",
  ["₊"] = "RCtrlLAlt=", ["⁺"] = "RCtrlLAltShift=",
  ["₌"] = "RCtrlLAlt"..BSh,
  ["⁼"] = "RCtrlLAltShift"..BSh,

  -- Math/Lang characters with Numpad:
  -- Num+ — Add --                  -- Num* — Multiply --
  ["−"] = "ShiftAdd",               ["⋅"] = "ShiftMultiply",
  ["±"] = "LCtrlAdd",               ["×"] = "LCtrlMultiply",
  ["∓"] = "LCtrlShiftAdd",          ["¤"] = "LCtrlShiftMultiply",
  ["†"] = "LCtrlLAltAdd",           ["·"] = "LCtrlLAltMultiply",
  ["∑"] = "LAltAdd",                ["∏"] = "LAltMultiply",
  ["∫"] = "LAltShiftAdd",           ["∂"] = "LAltShiftMultiply",

  -- Num- — Subtract --             -- Num/ — Divide --
  ["­"] = "ShiftSubtract",          ["÷"] = "ShiftDivide",
  ["—"] = "LCtrlSubtract",          ["∕"] = "LCtrlDivide",
  ["‑"] = "LCtrlShiftSubtract",     ["∞"] = "LCtrlShiftDivide",
  ["–"] = "LCtrlLAltSubtract",      ["⁄"] = "LCtrlLAltDivide",
  [" "] = "LAltSubtract",           ["√"] = "LAltDivide",
  ["‒"] = "LAltShiftSubtract",      ["∛"] = "LAltShiftDivide",

  -- Graphic characters with Numpad:
  ["┼"] = "LCtrlLAltShiftAdd",        ["●"] = "LCtrlLAltShiftMultiply",
  ["─"] = "LCtrlLAltShiftSubtract",   ["│"] = "LCtrlLAltShiftDivide",

} --- Characters

----------------------------------------
  local u8byte = strings.u8byte -- UTF-8 char to codepoint
  local ucp2s  = strings.ucp2s  -- Char codepoint to string

  local DescFmt = "Char: '%s' | U-%s"

for k, v in pairs(Characters) do
  if k ~= "" then
    Macro {
      area = "Editor Dialog",
      key = v,
      flags = "",
      description = DescFmt:format(k, ucp2s(u8byte(k), true)),
      condition = ExistSpec,

      action = function () print(k) end, ---

    } ---

  end
end -- for

end -- do
--]]
--------------------------------------------------------------------------------
