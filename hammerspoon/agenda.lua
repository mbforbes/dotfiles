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
--
-- Notes on agenda backburner items:
-- * meditate
-- * voxels
AGENDA_TEXT = hs.styledtext.getStyledTextFromData([[
<ul>
    <li>
        inboxes []
        <ol>
            <li>messages</li>
            <li>gmail</li>
            <li>fb messenger</li>
            <li>whatsapp</li>
            <li>slack</li>
            <li>things</li>
        </ol>
    </li>
    <li>travel planning []</li>
    <li>Japanese []</li>
    <ol>
        <li>genki []</li>
        <li>anki</li>
        <li>wk</li>
        <li>kw</li>
    </ol>
    <li>website []</li>
</ul>
]], "html")

-- Paste Multi-line String
-- TODO: Why wasn't this in a clipboard util? I guess it's kinda broken?
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
--     hs.notify.new({title="Running Agenda", informativeText="🗓"}):send()
--     -- save clipboard data to temp
--     tempClipboard = hs.pasteboard.uniquePasteboard()
--     hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

--     -- load string into clipboard and paste
--     hs.pasteboard.writeObjects(AGENDA_TEXT)
--     hs.eventtap.keyStroke({'cmd'}, 'v')

--     -- recall clipboard data
--     hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
--     hs.pasteboard.deletePasteboard(tempClipboard)
-- end)

-- Just add to Things via Apple Shortcut
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
    hs.notify.new({title="Running Agenda", informativeText="🗓"}):send()

    hs.shortcuts.run("Daily Agenda")
end)
