--[[ Search macros ]]--

----------------------------------------
--[[ description:
  -- Macros for find and replace with plugins.
  -- Макросы для поиска и замены с плагинами.
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

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local guids, guid = {}
--unit.guids = guids

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- Shell

---------------------------------------- Editor

---------------------------------------- '(' -- Brackets
-- [[
guid = "B66C436D-E657-419C-86D3-6834B9ACF3D2"
guids.Brackets = guid

local Exist = function () return PluginExist(guid) end

Macro {
  area = "Editor",
  key = "CtrlShift9",
  flags = "DisableOutput",
  description = "Find: Paired bracket",
  condition = Exist,
  action = function ()
             return CallPlugin(guid, 0) -- Find forward
           end, ---
} ---
Macro {
  area = "Editor",
  key = "CtrlShift0",
  flags = "DisableOutput",
  description = "Find: Select bracket",
  condition = Exist,
  action = function ()
             return CallPlugin(guid, 2) -- Select forward
           end, ---
} ---
--]]
--------------------------------------------------------------------------------
