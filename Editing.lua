--[[ Editing macros ]]--

----------------------------------------
--[[ description:
  -- Macros for text editing with plugins.
  -- Макросы для правки текста с плагинами.
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

local BlockNoneType = F.BTYPE_NONE

local editor = editor

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

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'R' -- EditCase
-- [[
guids.EditCase = "0E92FC81-4888-4297-A85D-31C79E0E0CEE"

local Exist = function () return PluginExist(guids.EditCase) end

Macro {
  area = "Editor",
  key = "F5",
  flags = "DisableOutput",
  description = "Case: Next case",
  condition = Exist,
  action = function ()
             return CallPlugin(guids.EditCase, 4)
           end, ---
} ---

Macro {
  area = "Editor",
  key = "CtrlShiftF5",
  flags = "DisableOutput",
  description = "Case: Sentence case for Bulleted line",
  condition = Exist,
  action = function ()
             local Info = editor.GetInfo()
             Keys"ShiftHome CtrlShiftRight CtrlShiftLeft ShiftRight"
             CallPlugin(guids.EditCase, 0)
             editor.Select(Info.EditorID, BlockNoneType)
             return editor.SetPosition(Info.EditorID, -1, Info.CurPos)
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlAltShiftF5",
  flags = "DisableOutput",
  description = "Case: Sentence case for Numbered line",
  condition = Exist,
  action = function ()
             local Info = editor.GetInfo()
             Keys"ShiftHome CtrlShiftRight CtrlShiftRight CtrlShiftLeft ShiftRight"
             CallPlugin(guids.EditCase, 0)
             editor.Select(Info.EditorID, BlockNoneType)
             return editor.SetPosition(Info.EditorID, -1, Info.CurPos)
           end, ---
} ---
--]]
--------------------------------------------------------------------------------
