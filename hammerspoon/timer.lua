hammerspoonMode = hs.hotkey.modal.new({"cmd", "alt", "ctrl"}, "T")

function shortcutTimer(minutes)
    local msg = "Started " .. minutes .. "m timer"
    print(msg)
    hs.notify.new({title=msg, informativeText="⏲️"}):send()
    local shortcut = "Timer " .. minutes .. "m"
    hs.shortcuts.run(shortcut)
end

hammerspoonMode:bind('', '`', function()
    shortcutTimer('5')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '1', function()
    shortcutTimer('10')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', 'q', function()
    shortcutTimer('15')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '2', function()
    shortcutTimer('20')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', 'w', function()
    shortcutTimer('25')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '3', function()
    shortcutTimer('30')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', 'e', function()
    shortcutTimer('35')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '4', function()
    shortcutTimer('40')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', 'r', function()
    shortcutTimer('45')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '5', function()
    shortcutTimer('50')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', 't', function()
    shortcutTimer('55')
    hammerspoonMode:exit()
end)

hammerspoonMode:bind('', '6', function()
    shortcutTimer('60')
    hammerspoonMode:exit()
end)


-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
--     print("Started 45m timer")
--     hs.notify.new({title="Starting 45m timer", informativeText="⏲️"}):send()
--     hs.shortcuts.run("Timer 45m")
-- end)
