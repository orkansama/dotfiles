local mainMod = "SUPER"

local terminal = "alacritty"
local fileManager = "dolphin"
local browser = "firefox"
local applicationSwitcher = "rofi -show drun"
local clipboardHistory = "rofi -modi clipboard:~/.config/hypr/scripts/cliphist-rofi-img -show clipboard -show-icons"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(applicationSwitcher))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd(clipboardHistory))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("maximized", "toggle"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind("ALT + SHIFT + TAB", function ()
    local clientIsFullScreen = hl.fullscreen_state_client;
    hl.dispatch(hl.dsp.window.cycle_next());
    hl.dispatch(hl.dsp.window.fullscreen("maximized", "toggle"));
end)

hl.bind("ALT + TAB", function ()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }));
    hl.dispatch(hl.dsp.window.fullscreen("maximized", "toggle"));
end)

-- hl.bind("ALT + TAB", hl.dsp.window.cycle_next({ next = false }))

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + CTRL + l", function()
    local active_ws = hl.get_active_workspace()
    local last_ws = 3

    if active_ws.id ~= last_ws then
        hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
    end
end)

hl.bind(mainMod .. " + CTRL + h", function()
    local active_ws = hl.get_active_workspace()
    local last_ws = 1

    if active_ws.id ~= last_ws then
        hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
    end
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
