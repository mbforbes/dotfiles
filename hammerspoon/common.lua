-- Utilities used elsewhere

-- chrome: hs.application, Google Chrome
-- musicURL: string, what to open
function startMusic(chrome, musicURL)
    -- TODO: If already running, this will overwrite current location, and would want to add New Window.
    -- chrome:selectMenuItem({"File", "New Window"})
    chrome:selectMenuItem({"File", "Open Location..."})
    hs.eventtap.keyStrokes(musicURL, chrome)
    hs.eventtap.keyStroke({}, 'return', chrome)
    -- Move to top left corner with Moom
    hs.eventtap.keyStroke({'cmd'}, 'm')
    hs.eventtap.keyStroke({}, '9')
end

-- chrome: hs.application, Google Chrome
-- tabs: table, str array of URLs to open
function openTabs(chrome, tabs)
    for i = 1, #tabs do
        if i == 1 then
            chrome:selectMenuItem({"File", "New Window"})
        else
            chrome:selectMenuItem({"File", "New Tab"})
        end
        chrome:selectMenuItem({"File", "Open Location..."})
        hs.eventtap.keyStrokes(tabs[i], chrome)
        -- There's delay with keyStroke (200ms), but reducing bugs things out.
        -- Damn, wish there was a way to do things w/ APIs rather than key presses...
        hs.eventtap.keyStroke({}, 'return', chrome)
    end
end

-- TODO: this is buggy, probably the number input
-- minutes: string, raw minutes (e.g., "30")
function startTimer(minutes)
    local pomo = hs.application.open("Smart Countdown Timer", 1)
    hs.eventtap.keyStrokes(minutes, pomo)
    hs.eventtap.keyStroke({}, 'm', pomo)
    hs.eventtap.keyStroke({}, 'return', pomo)
    hs.eventtap.keyStroke({}, 'space', pomo)
    hs.eventtap.keyStroke({'cmd'}, 'w', pomo)
end

function getKanjiDay()
    kanji = {
        "&#26085;", -- 日
        "&#26376;", -- 月
        "&#28779;", -- 火
        "&#27700;", -- 水
        "&#26408;", -- 木
        "&#37329;", -- 金
        "&#22303;", -- 土
    }
    -- lua dates: http://www.lua.org/pil/22.1.html
    return kanji[os.date("%w") + 1]
end
