hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
    hs.notify.new({title="Opening VS Code", informativeText=""}):send()
    local vsc = hs.application.open("com.microsoft.VSCode")
    -- Doesn't work
    -- vsc:selectMenuItem({"Go", "Go to File... [^X ^F]"})
end)
