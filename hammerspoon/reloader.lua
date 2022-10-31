-- Reloads hammerspoon when scripts change. Minimally tweaked from
-- https://www.hammerspoon.org/go/#fancyreload

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/repos/dotfiles/hammerspoon/", reloadConfig):start()
-- hs.alert.show("Config loaded")
hs.notify.new({title="Config reloaded", informativeText=""}):send()
