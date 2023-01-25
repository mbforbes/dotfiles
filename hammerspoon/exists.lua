hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
    hs.notify.new({title="What's up, idiot", informativeText="Welcome to controlling your computer"}):send()

    -- Snippet: Print all running apps
    -- local apps = hs.application.runningApplications()
    -- for k, v in pairs(apps) do
    --     print(k, v)
    -- end

    -- Snippet: start pomo timer for 30m
    -- local pomo = hs.application.open("Smart Countdown Timer")
    -- hs.eventtap.keyStrokes("30", pomo)
    -- hs.eventtap.keyStroke({}, 'm', pomo)
    -- hs.eventtap.keyStroke({}, 'return', pomo)
    -- hs.eventtap.keyStroke({}, 'space', pomo)
    -- hs.eventtap.keyStroke({'cmd'}, 'w', pomo)
end)
