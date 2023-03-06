-- See agenda_a.lua for more notes.

AGENDA_B_TEXT = hs.styledtext.getStyledTextFromData([[
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
]], "html")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
    hs.notify.new({title="Running Agenda B", informativeText="🗓"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(AGENDA_B_TEXT)
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)
