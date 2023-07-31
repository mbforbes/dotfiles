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

-- Some deprecated parts, may want to introduce again:
--
-- Work today: <b>inbox, travel planning, website</b><br/>
-- Travel today: <b>x</b><br/>
-- Done @ <b>x</b><br/>
--
-- Schedule:
-- <ul>
-- <li><b>8:00 &ndash; 8:30 AM</b>: wakeup, coffee, set work goals</li>
-- <li><b>8:30 &ndash; 12:30 PM</b>: work block 1 (4h) (incl. breakfast break, limit 30m!)</li>
-- <li><b>12:30 &ndash; 2:00 PM</b>: midday break: exercise (30m), lunch break (1h)</li>
-- <li><b>2:00 &ndash; 3:00 PM</b>: Japanese study time</li>
-- <li><b>3:00 &ndash; 4:00 PM</b>: admin (inboxes; Things (travel / life / logistics))</li>
-- <li><b>4:00 &ndash; 6:00 PM</b>: work block 2 (2h)</li>
-- <li><b>6:00 &ndash; 7:00 PM</b>: project time (1h)</li>
-- </ul>
-- <br>

function get_agenda_a_text()
    return hs.styledtext.getStyledTextFromData([[
<br><br>
<h2>]] .. os.date("%A") .. [[</h2>
]] .. os.date("%x") .. [[ (]] .. getKanjiDay() .. [[)<br/>
<br/>
Work goal(s)<br/>
<ul><li>???</li></ul>
<br/>
Exercise today<br/>
<ul><li>???</li></ul>
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
Admin<br/>
<ul>
<li>messages</li>
<li>gmail</li>
<li>messenger</li>
<li>whatsapp</li>
<li>slack</li>
<li>things</li>
</ul>
<br/>
Schedule
<ul>
<li><b>8:00 &ndash; 8:30 AM</b>: wakeup, coffee, set work goals</li>
<li><b>8:30 &ndash; 12:30 PM</b>: work block 1 (4h) (incl. breakfast break, limit 30m!)</li>
<li><b>12:30 &ndash; 2:00 PM</b>: midday break: exercise (30m), lunch break (1h)</li>
<li><b>2:00 &ndash; 3:00 PM</b>: Japanese study time</li>
<li><b>3:00 &ndash; 4:00 PM</b>: admin (inboxes; Things (travel / life / logistics))</li>
<li><b>4:00 &ndash; 6:00 PM</b>: work block 2 (2h)</li>
<li><b>6:00 &ndash; 7:00 PM</b>: project time (1h)</li>
</ul>
<br>
Notes
<br>
]], "html")
end

-- Paste Multi-line String
-- TODO: Why wasn't this in a clipboard util? I guess it's kinda broken?
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
    hs.notify.new({title="Running Agenda A", informativeText="🗓"}):send()
    print("Running Agenda A")
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- copied from line.lua
    hs.pasteboard.writeObjects(hs.image.imageFromPath("~/GoogleDrive/images/misc/gray-line.png"))
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(get_agenda_a_text())
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)

    -- move back up to top (shifting down for some reason)
    hs.eventtap.keyStroke({'cmd'}, 'up')
end)

-- Just add to Things via Apple Shortcut
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
--     hs.notify.new({title="Running Agenda", informativeText="🗓"}):send()
--     hs.shortcuts.run("Daily Agenda")
-- end)
