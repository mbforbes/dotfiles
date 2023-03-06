SCHEDULES_TEXT = hs.styledtext.getStyledTextFromData([[
<p>6h day:</p>
<ul>
<li>8:30 &ndash; 12:30 &mdash; work [4h]</li>
<ul>
    <li>8:30 &ndash; 9:15 &mdash; Genki [45m]</li>
    <li>9:15 &ndash; 9:35 &mdash; Breakfast [20m]</li>
    <li>9:35 &ndash; 10:20 &mdash; J Apps [45m]</li>
    <li>10:20 &ndash; 10:30 &mdash; Break [10m]</li>
    <li>10:30 &ndash; 11:25 &mdash; <b>Block1</b>: Website [55m]</li>
    <li>11:25 &ndash; 11:35 &mdash; Break [10m]</li>
    <li>11:35 &ndash; 12:30 &mdash; <b>Block2</b>: Website [55m]</li>
</ul>
<li>12:30 &ndash; 4:30 &mdash; lunch + break [4h]</li>
<li>4:30 &ndash; 6:30 &mdash; work [2h]</li>
<ul>
    <li>4:30 &ndash; 5:15 &mdash; Admin (inbox + travel planning) [45m]</li>
    <li>5:15 &ndash; 5:25 &mdash; Break [10m]</li>
    <li>5:25 &ndash; 6:30 &mdash; <b>Block3</b>: Prj or Biz [1h 5m]</li>
</ul>
</ul>
<br/>
<p>7h day:</p>
<ul>
<li>8:30 &ndash; 12:30 &mdash; work [4h]</li>
<ul>
    <li>8:30 &ndash; 9:15 &mdash; Genki [45m]</li>
    <li>9:15 &ndash; 9:35 &mdash; Breakfast [20m]</li>
    <li>9:35 &ndash; 10:20 &mdash; J Apps [45m]</li>
    <li>10:20 &ndash; 10:30 &mdash; Break [10m]</li>
    <li>10:30 &ndash; 11:25 &mdash; <b>Block1</b>: Website [55m]</li>
    <li>11:25 &ndash; 11:35 &mdash; Break [10m]</li>
    <li>11:35 &ndash; 12:30 &mdash; <b>Block2</b>: Website [55m]</li>
</ul>
<li>12:30 &ndash; 3:30 &mdash; lunch + break [3h]</li>
<li>3:30 &ndash; 6:30 &mdash; work [3h]</li>
<ul>
    <li>3:30 &ndash; 4:15 &mdash; Admin (inbox + travel planning) [45m]</li>
    <li>4:15 &ndash; 4:20 &mdash; Break [5m]</li>
    <li>4:20 &ndash; 5:20 &mdash; <b>Block3</b>: Prj or Biz [1h 5m]</li>
    <li>5:20 &ndash; 5:30 &mdash; Break [10m]</li>
    <li>5:30 &ndash; 6:30 &mdash; <b>Block4</b>: Prj or Biz [1h 5m]</li>
</ul>
</ul>
<br/>
<p>8h day:</p>
<ul>
<li>8:30 &ndash; 12:30 &mdash; work [4h]</li>
<ul>
    <li>8:30 &ndash; 9:15 &mdash; Genki [45m]</li>
    <li>9:15 &ndash; 9:35 &mdash; Breakfast [20m]</li>
    <li>9:35 &ndash; 10:20 &mdash; J Apps [45m]</li>
    <li>10:20 &ndash; 10:30 &mdash; Break [10m]</li>
    <li>10:30 &ndash; 11:25 &mdash; <b>Block1</b>: Website [55m]</li>
    <li>11:25 &ndash; 11:35 &mdash; Break [10m]</li>
    <li>11:35 &ndash; 12:30 &mdash; <b>Block2</b>: Website [55m]</li>
</ul>
<li>12:30 &ndash; 2:00 &mdash; lunch + break [1.5h]</li>
<li>2:00 &ndash; 6:00 &mdash; work [4h]</li>
<ul>
    <li>2:00 &ndash; 2:45 &mdash; Admin (inbox + travel planning) [45m]</li>
    <li>2:45 &ndash; 2:50 &mdash; Break [5m]</li>
    <li>2:50 &ndash; 3:50 &mdash; <b>Block3</b>: Prj or Biz [1h]</li>
    <li>3:50 &ndash; 4:00 &mdash; Break [10m]</li>
    <li>4:00 &ndash; 4:55 &mdash; <b>Block4</b>: Prj or Biz [55m]</li>
    <li>4:55 &ndash; 5:00 &mdash; Break [5m]</li>
    <li>5:00 &ndash; 6:00 &mdash; <b>Block5</b>: Prj or Biz [1h]</li>
</ul>
</ul>
<br/>
]], "html")

-- Paste Multi-line String
-- TODO: Why wasn't this in a clipboard util? I guess it's kinda broken?
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
    hs.notify.new({title="Running Schedules", informativeText="🗓"}):send()
    -- save clipboard data to temp
    tempClipboard = hs.pasteboard.uniquePasteboard()
    hs.pasteboard.writeAllData(tempClipboard, hs.pasteboard.readAllData(nil))

    -- load string into clipboard and paste
    hs.pasteboard.writeObjects(SCHEDULES_TEXT)
    hs.eventtap.keyStroke({'cmd'}, 'v')

    -- recall clipboard data
    hs.pasteboard.writeAllData(nil, hs.pasteboard.readAllData(tempClipboard))
    hs.pasteboard.deletePasteboard(tempClipboard)
end)
