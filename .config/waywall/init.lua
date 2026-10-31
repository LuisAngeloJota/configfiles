local waywall = require("waywall")
local helpers = require("waywall.helpers")

os.setenv("LD_PRELOAD", "/usr/lib/libmimalloc.so")

local thin = "*-Caps_Lock"
local tall = "*-Super_L"
local wide = "*-Tab"
local toggle_ninbot = "*-MMB"
local remapped = {
    ["RIGHTALT"] = "0",
    ["Z"] = "F3",
    ["MB5"] = "RIGHTSHIFT",
}

local normal_sens = 2.216732347060618
local tall_sens = 0.14953943812588236

local ninbot_path = "/home/la/.opt/ninbot.jar"
local overlay_path = "/home/la/.config/waywall/measuring_overlay.png"
local crosshair_path = "/home/la/.config/waywall/crosshair.png"

local is_ninbot_running = function()
    local handle = io.popen("pgrep -f 'ninbot.jar'")
    local result = handle:read("*l")
    handle:close()
    return result ~= nil
end

helpers.res_mirror({
    src = { x = 1, y = 19, w = 83, h = 27 },
    dst = { x = 1130, y = 486, w = 4 * 83, h = 4 * 27 },
}, 340, 1080)

helpers.res_mirror({
    src = { x = 1, y = 19, w = 83, h = 27 },
    dst = { x = 1130, y = 486, w = 4 * 83, h = 4 * 27 },
}, 340, 16384)

helpers.res_mirror({
    src = { x = 0, y = 15958, w = 340, h = 426 },
    dst = { x = 1130, y = 654, w = 340, h = 426 },
}, 340, 16384)

helpers.res_mirror({
    src = { x = 155, y = 7902, w = 30, h = 580 },
    dst = { x = 0, y = 370, w = 790, h = 340 },
}, 340, 16384)

helpers.res_image(overlay_path, {
    dst = { x = 0, y = 370, w = 790, h = 340 },
}, 340, 16384)

helpers.res_image(crosshair_path, {
    dst = { x = 952, y = 532, w = 15, h = 15 },
}, 340, 16384)

local config = {
    experimental = {
        jit = true,
        tearing = true,
    },
    input = {
        layout = "us",
        repeat_rate = 50,
        repeat_delay = 200,
        remaps = remapped,
        sensitivity = normal_sens,
        confine_pointer = true,
    },
    theme = {
        background = "#000000ff",
        ninb_anchor = "topright",
    },
}

config.actions = {
    [thin] = helpers.toggle_res(340, 1080, normal_sens),
    [tall] = helpers.toggle_res(340, 16384, tall_sens),
    [wide] = helpers.toggle_res(1920, 340, normal_sens),

    [toggle_ninbot] = function()
        if not is_ninbot_running() then
            waywall.exec("java -Dawt.useSystemAAFontSettings=gasp -jar " .. ninbot_path)
            waywall.show_floating(true)
        else
            helpers.toggle_floating()
        end
    end,
}

return config