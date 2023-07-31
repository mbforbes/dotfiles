hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    hs.notify.new({title="Running Line", informativeText="⎯"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load image into clipboard and paste
    hs.pasteboard.writeObjects(hs.image.imageFromPath("~/GoogleDrive/images/misc/gray-line.png"))
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)
