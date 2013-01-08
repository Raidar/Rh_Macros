--[[ Search macros ]]--

----------------------------------------
--[[ description:
  -- Macros for search.
  -- Макросы для поиска.
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
--local unit = {}

local guids = {}
--unit.guids = guids
--guids.PluginCmds = "937F0B1C-7690-4F85-8469-AA935517F202"

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- Shell

---------------------------------------- Editor

---------------------------------------- -- '(' -- Brackets
-- [[
guids.Brackets = "B66C436D-E657-419C-86D3-6834B9ACF3D2"

local IsExist = function () return PluginExist(guids.Brackets) end

Macro {
  area = "Editor",
  key = "CtrlShift9",
  flags = "DisableOutput",
  description = "Find: Paired bracket",
  condition = IsExist,
  action = function ()
             CallPlugin(guids.Brackets, 0) -- Find forward
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShift0",
  flags = "DisableOutput",
  description = "Find: Select bracket",
  condition = IsExist,
  action = function ()
             CallPlugin(guids.Brackets, 2) -- Select forward
           end, ---
} ---
--]]

--------------------------------------------------------------------------------
