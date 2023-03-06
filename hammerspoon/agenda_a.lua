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
-- <p>Not on agenda: exercise, food, projects, reading, explicit free time (or meditate).</p>

AGENDA_A_TEXT = hs.styledtext.getStyledTextFromData([[
<h2>]] .. os.date("%A") .. [[</h2>
]] .. os.date("%x") .. [[ (]] .. getKanjiDay() .. [[)<br/>
<br/>
Work today: <b>inbox, website</b><br/>
Travel today: <b>x</b><br/>
Done @ <b>x</b><br/>
<br/>
Japanese<br/>
<ul>
<li>j block 1: Genki</li>
<li>
    j block 2: apps
    <ul>
        <li>KW: new</li>
        <li>KW: review</li>
        <li>WK: review</li>
        <li>WK: new</li>
        <li>Anki: review</li>
        <li>Anki: new</li>
    </ul>
</li>
</ul>
<br/>
Inbox<br/>
<ul>
<li>messages</li>
<li>gmail</li>
<li>messenger</li>
<li>whatsapp</li>
<li>slack</li>
<li>things</li>
</ul>
<br/>
Website goal: <b>x</b><br/>
<br/>
]], "html")

-- Paste Multi-line String
-- TODO: Why wasn't this in a clipboard util? I guess it's kinda broken?
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
    hs.notify.new({title="Running Agenda A", informativeText="🗓"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(AGENDA_A_TEXT)
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)

-- Just add to Things via Apple Shortcut
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
--     hs.notify.new({title="Running Agenda", informativeText="🗓"}):send()
--     hs.shortcuts.run("Daily Agenda")
-- end)
