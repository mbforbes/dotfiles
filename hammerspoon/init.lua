--[[
**********************************
******* Reference material *******
**********************************
--]]

-- default config file set to here (~/repos/dotfiles/hammerspoon/init.lua), see
-- https://github.com/Hammerspoon/hammerspoon/issues/1734#issuecomment-379854489

-- this from getting started guide
-- https://www.hammerspoon.org/go/
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--     hs.notify.new({title="What's up, idiot", informativeText="Welcome to controlling your computer"}):send()
-- end)

-- Print this if you want to see where it will look for spoons (it's a lot of places)
-- print(package.path)

-- If you're doing `hs.loadSpoon()` instead of `require()` you have to
-- return something, even a {}. Otherwise hammerspoon's code tries to access
-- fields on the returned object (which is probably implicitly a boolean
-- `true` or something). Here's an example of what you can add at the end:
-- local obj={}
-- return obj

-- Catching globe (fn) presses. Eventually buggy, maybe my fault:
-- https://gist.github.com/zzamboni/c5e31cb33ca3fcdee5f1e629ee028b62

-- This one seems fun --- reporting battery ETA
-- https://github.com/pstadler/dotfiles/blob/master/hammerspoon/battery.lua

-- Another note, I enjoyed this Lua reference:
-- https://learnxinyminutes.com/docs/lua/


--[[
**********************************
******** Background tasks ********
**********************************
--]]

-- Reload hammerspoon config when changes
require("reloader")

-- Turn off bluetooth when computer goes to sleep, turn it on (always) when opening
require("bluetooth_sleep")

--[[
**********************************
******* Keypress shortcuts *******
**********************************
--]]

-- Common utilities
require("common")

-- H: Help: Display potential shortcuts.
-- I could probably auto-generate this from what I load...
require("help")

-- E: Exists: Just sends a message if alive :-)
require("exists")

-- C: Cleanup: Remove all spaces, close all apps and windows
require("cleanup")

-- D: Daily note: Create if needed and open it
require("daily_note")

-- A: Agenda: Dump in text of agenda to plan
require("agenda")

-- J: Japanese: Open study material, music, timer
require("japanese")

-- I: Inboxes: Open inboxes, music, timer
require("inboxes")
