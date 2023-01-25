-- NOTE: This all works kinda bad because of sequencing errors :-(
--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
    hs.notify.new({title="Starting Japanese", informativeText="🇯🇵"}):send()

    -- TODO: Use multiple Spaces?

    -- Music (Chrome)
    local chrome = hs.application.open("Google Chrome", 10, true)

    -- Music
    -- NOTE: Maybe make separate hotkey if desired.
    local musicURL = "https://www.youtube.com/watch?v=gwt8rbxY8CI"
    startMusic(chrome, musicURL)

    -- TODO: Up to 45 if using intermediate reminders (see next)
    -- Start timer for 15 minutes
    startTimer("15")

    -- TODO: Send reminder to switch over from memorization to
    -- textbook after X (e.g., 15) minutes

    -- Open Chrome Tab group
    local tabs = {
        "https://jisho.org/",
        "https://translate.google.com/?sl=ja&tl=en",
        "https://www.wanikani.com/dashboard",
        "https://kaniwani.com/",
    }
    openTabs(chrome, tabs)
    hs.eventtap.keyStroke({'cmd'}, 'm')
    hs.eventtap.keyStroke({}, '4')

    -- Open Anki
    local anki = hs.application.open("Anki")

    -- Open Genki
    -- NOTE: Could open Preview first and close any other files, if desired
    hs.shortcuts.run("Open Genki")

    -- Open VLC (w/ tracks pre-loaded?)
    local vlc = hs.application.open("VLC")

    -- Maybe: Add checklist to note for process? I like the idea of removing "what do I do?"
    -- barrier, but I do wonder whether this will make me spend more computer time on WaniKani /
    -- / KaniWani / Anki reviews, and less on Genki, which I want to make more progress on.
end)
