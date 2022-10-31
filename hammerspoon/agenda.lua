-- thanks to
-- https://stackoverflow.com/a/68274795

-- Notes on pasting rich text into Apple Notes:
-- * If we paste raw text (w/ hyphens and tabs), Apple Notes won't format it
-- * If we create a dashed list (⌘⇧8) then paste, Apple Notes won't adapt to it
-- * So we load rich text onto the clipboard by parsing HTML
-- * This still doesn't do dashes, my preferred bullet style, so if I really want
--   that I can write code to emit the keypresses.
-- * I do wonder exactly what rich data Apple Notes puts into the clipboard when
--   you copy. From brief Googling this seems hard to inspect, but it might be
--   possible (pbv was one lead, but didn't show the full data?).
AGENDA_TEXT = hs.styledtext.getStyledTextFromData([[
<ul>
    <li>admin</li>
    <ul>
        <li>inboxes []</li>
        <li>travel planning []</li>
    </ul>
    <li>daily</li>
    <ul>
        <li>meditate []</li>
        <li>Japanese []</li>
    </ul>
    <li>projects</li>
    <ul>
        <li>websiite []</li>
        <li>voxels []</li>
    </ul>
</ul>
]], "html")

-- Paste Multi-line String
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
    hs.notify.new({title="Running Agenda", informativeText="🗓"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(AGENDA_TEXT)
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)
