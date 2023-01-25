-- NOTE: This all works kinda bad because of sequencing errors :-(
--
-- - [ ] 1. Messages
-- - [ ] 2. Chrome: Gmail
-- - [ ] 3. Chrome: FB Messenger
-- - [ ] 4. Chrome: Whatsapp
-- - [ ] 5. Slack
-- - [ ] 6. Things
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
    hs.notify.new({title="Running Inboxes", informativeText="📨"}):send()

    local chrome = hs.application.open("Google Chrome", 10, true)

    -- Music
    -- NOTE: Maybe make separate hotkey if desired.
    -- TODO: Shuffle playlist if possible.
    local musicURL = "https://www.youtube.com/watch?v=AXNVMSy1GpI&list=PLGh8nnGk_kLjVq2wiefjT_Z2lkCHPQbIo"
    startMusic(chrome, musicURL)

    -- 6: Things
    local things = hs.application.open("com.culturedcode.ThingsMac")

    -- 5: Slack
    -- Slack doesn't appear to ever say it's ready, even passing, e.g., 10 seconds and true
    -- (wait for first window). HS just seems to wait this many seconds before continuing.
    local slack = hs.application.open("Slack", 3)
    -- The following causes an error even if I allow the open() call to wait for 10 seconds AND
    -- pass true (wait for first window). Might have to add a manual sleep. Not worth it since
    -- slack workspaces not that plentiful yet.
    -- slack:selectMenuItem({"File", "Workspace", "Tipsy Tuesday"})

    -- Chrome tabs: 2: Gmail, 3: FB Messenger, 4: Whatsapp
    local tabs = {
        "https://mail.google.com/",
        "https://messenger.com/",
        "https://web.whatsapp.com/",
    }
    openTabs(chrome, tabs)
    -- Back to first tab.
    chrome:selectMenuItem({"Tab", "Select Next Tab"})
    chrome:mainWindow():maximize()

    -- 1: Messages
    local messages = hs.application.open("Messages")

    -- Start timer for 30 minutes
    startTimer("30")
end)
