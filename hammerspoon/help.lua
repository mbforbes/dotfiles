--[[
Old text. Note we're limited to ~4 lines for a notification to display it all!
- H: Help — 🤷‍♂️ Display this message
- E: Exists — 🙋‍♂️ Notification ping
- C: Cleanup — 🗑 Spaces, apps, windows
- D: Daily note — 📝 Maybe create, open
- A: Agenda — 🗓 Plain text planning

For future, can probably remove H and E to get some more real estate.
--]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    hs.notify.new({
        title="Help: Installed Shortcuts (⌘⌥⌃)",
        informativeText=[[
- H: Help           - A: Agenda
- E: Exists         - J: Japanese
- C: Cleanup     - S: Schedules
- D: Daily note
]]
    }):send()
end)
