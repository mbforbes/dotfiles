-- See agenda_a.lua for more notes.

function get_agenda_b_text()
    return hs.styledtext.getStyledTextFromData([[
<hr />
<h2>]] .. os.date("%A") .. [[</h2>
]] .. os.date("%x") .. [[ (]] .. getKanjiDay() .. [[)<br/>
<br/>
Japanese upkeep:<br/>
<ul>
<li>KW: new</li>
<li>KW: review</li>
<li>WK: review</li>
<li>Anki: review</li>
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
Exercise:<br/>
<ul><li><b>???</b></li></ul>
<br/>
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
