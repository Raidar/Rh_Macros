--[[ Search macros with plugins ]]--

----------------------------------------
--[[ description:
  -- Macros for find and replace with plugins.
  -- Макросы для поиска и замены с плагинами.
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
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

local Async = function () return mmode(3, 1) end

local Plugin = Plugin or {}
local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- Common

---------------------------------------- 'F' -- LuaFAR Search
-- [[
guids.LFSearch = "8E11EA75-0303-4374-AC60-D1E38F865449"

local Exist = function () return PluginExist(guids.LFSearch) end

Macro {
  area = "Shell Editor",
  key = "LCtrlShiftF",
  flags = "",
  description = "SnR: Find",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFSearch, 1)
    if PluginMenu(guids.LFSearch) then return Keys"1" end
    -- TODO: Добавить подстановку из предыдущего поиска.
  end, ---
} ---
Macro {
  area = "Shell Editor",
  key = "LCtrlShiftR",
  flags = "",
  description = "SnR: Replace",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFSearch, 2)
    if PluginMenu(guids.LFSearch) then return Keys"2" end
    -- TODO: Добавить подстановку из предыдущего поиска.
  end, ---
} ---

Macro {
  area = "Shell",
  key = "LCtrlShiftN",
  flags = "",
  description = "SnR: Rename",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFSearch, 3)
    if PluginMenu(guids.LFSearch) then return Keys"3" end
  end, ---
} ---

Macro {
  area = "Editor",
  key = "ShiftF3",
  flags = "",
  description = "SnR: Repeat",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFSearch, 3)
    if PluginMenu(guids.LFSearch) then return Keys"3" end
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShiftF7",
  flags = "",
  description = "SnR: Menu",
  condition = Exist,
  action = function ()
    return PluginMenu(guids.LFSearch)
  end, ---
} ---
--]]
---------------------------------------- Editor

---------------------------------------- '(' -- Brackets
-- [[
guids.Brackets = "B66C436D-E657-419C-86D3-6834B9ACF3D2"

local Exist = function () return PluginExist(guids.Brackets) end

Macro {
  area = "Editor",
  key = "LCtrlShift9",
  flags = "",
  description = "Find: Paired bracket",
  condition = Exist,
  action = function ()
    return CallPlugin(guids.Brackets, 0) -- Find forward
  end, ---
} ---
Macro {
  area = "Editor",
  key = "LCtrlShift0",
  flags = "",
  description = "Find: Select bracket",
  condition = Exist,
  action = function ()
    return CallPlugin(guids.Brackets, 2) -- Select forward
  end, ---
} ---
--]]
--------------------------------------------------------------------------------
