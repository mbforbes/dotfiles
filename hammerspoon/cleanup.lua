hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
    hs.notify.new({title="Running Cleanup", informativeText="🧹"}):send()

    -- close apps via the Shortcut I made in Apple Shortcuts!
    hs.shortcuts.run("Close Apps")

    -- macOS Desktops are called "Spaces"
    -- https://www.hammerspoon.org/docs/hs.spaces.html
    local allSpaces = hs.spaces.allSpaces()
    for screen, spaces in pairs(allSpaces) do
        -- print("SCREEN:")
        -- print(screen)
        -- print("SPACES:")
        -- print(spaces)
        for i = 1, #spaces do
            -- print("removing space:")
            -- print(spaces[i])
            hs.spaces.removeSpace(spaces[i])
        end
    end

    -- Close windows (esp. Finder, which should be all that's remaining)
    local result = hs.window.allWindows()
    for i = 1, #result do
        -- print(result[i], result[i]:application())
        result[i]:close()
    end
end)
