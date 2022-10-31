hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
    hs.notify.new({title="Running Daily Note", informativeText="📝"}):send()

    -- Note created & opened in Apple Shortcuts
    hs.shortcuts.run("Open daily note")

    -- Float it
    local app = hs.application.find("Notes")
    app:selectMenuItem({"Window", "Float Selected Note"})

    -- Move cursor to end of note.
    -- There's kind of a bug here (first often gets eaten), so we do it twice.
    hs.eventtap.keyStroke({"alt", "shift"}, ".")
    hs.eventtap.keyStroke({"alt", "shift"}, ".")

    -- Close the main window so we can focus only on the note.
    local mw = app:getWindow("Notes")
    mw:close()
end)
