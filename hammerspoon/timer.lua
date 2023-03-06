hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
    hs.notify.new({title="Starting 45m timer", informativeText="⏲️"}):send()
    hs.shortcuts.run("Timer 45m")
end)
