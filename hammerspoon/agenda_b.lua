-- See agenda_a.lua for more notes.

function get_agenda_b_text()
    return hs.styledtext.getStyledTextFromData([[
<hr />
<h2>]] .. os.date("%A") .. [[</h2>
]] .. os.date("%x") .. [[ (]] .. getKanjiDay() .. [[)<br/>
<br/>
Work today: <b>travel planning, biz</b><br/>
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
Travel planning goal: <b>x</b><br/>
Biz goal: <b>x</b><br/>
<br/>
Morning schedule:
<ul>
<li>8:30 &ndash; 9:15 &mdash; Genki [45m]</li>
<li>9:15 &ndash; 9:40 &mdash; Breakfast [25m]</li>
<li>9:40 &ndash; 10:25 &mdash; J Apps [45m]</li>
<li>10:25 &ndash; 10:35 &mdash; Break [10m]</li>
<li>10:35 &ndash; 11:30 &mdash; <b>Travel planning</b> [55m]</li>
<li>11:30 &ndash; 11:35 &mdash; Break [5m]</li>
<li>11:35 &ndash; 12:30 &mdash; <b>Biz</b> [55m]</li>
</ul>
<br>
]], "html")
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
    hs.notify.new({title="Running Agenda B", informativeText="🗓"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(get_agenda_b_text())
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)
