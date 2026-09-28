loadstring(game:HttpGet("https://raw.githubusercontent.com/brn3d/lib.lua/refs/heads/main/lib.lua"))()
local Library = getgenv().Library

local Window = Library:Window({
    Name = "Example",
    Size = UDim2.fromOffset(510, 550),
})

local CombatTab = Window:Tab({ Name = "Combat" })
local VisualTab  = Window:Tab({ Name = "Visual" })
local MiscTab    = Window:Tab({ Name = "Misc" })
local ThemeTab   = Window:Tab({ Name = "Theme" })

-- ── Combat ────────────────────────────────────────────────────────────────────

local AimbotSec  = CombatTab:Section({ Name = "Aimbot",     Side = "left"  })
local TriggerSec = CombatTab:Section({ Name = "Triggerbot", Side = "right" })

local AimbotToggle = AimbotSec:Toggle({
    Name     = "Enabled",
    Flag     = "aimbot_on",
    Callback = function(v) print("aimbot", v) end,
})

AimbotToggle:Keybind({
    Name = "Aimbot Key",
    Flag = "aimbot_key",
    Key  = Enum.KeyCode.CapsLock,
    Mode = "Toggle",
    Callback = function(v) print("aimbot key", v) end,
})

AimbotToggle:Colorpicker({
    Name     = "Color",
    Flag     = "aimbot_color",
    Default  = Color3.fromRGB(88, 166, 255),
    Callback = function(c, a) print("aimbot color", c, a) end,
})

AimbotSec:Dropdown({
    Name     = "Target Part",
    Flag     = "aimbot_part",
    Options  = { "Head", "Chest", "Pelvis", "Nearest" },
    Default  = "Head",
    Callback = function(v) print("target part", v) end,
})

AimbotSec:Slider({
    Name     = "FOV",
    Flag     = "aimbot_fov",
    Min      = 10,
    Max      = 360,
    Default  = 90,
    Suffix   = "°",
    Callback = function(v) print("fov", v) end,
})

AimbotSec:Slider({
    Name     = "Smoothness",
    Flag     = "aimbot_smooth",
    Min      = 0,
    Max      = 100,
    Default  = 40,
    Suffix   = "%",
    Callback = function(v) print("smooth", v) end,
})

AimbotSec:Toggle({
    Name     = "Prediction",
    Flag     = "aimbot_pred",
    Callback = function(v) print("prediction", v) end,
})

AimbotSec:Toggle({
    Name     = "Visibility Check",
    Flag     = "aimbot_vis",
    Callback = function(v) print("vis check", v) end,
})

AimbotSec:Button({
    Name     = "Reset Settings",
    Callback = function() print("reset") end,
})

local Basic, Advanced = AimbotSec:SubSection({
    Names = { "Basic", "Advanced" },
    Count = 2,
})

Basic:Toggle({ Name = "Lock On",    Flag = "basic_lockon",   Callback = function(v) print("lock on", v) end })
Basic:Slider({ Name = "Sensitivity",Flag = "basic_sens", Min = 0, Max = 100, Default = 50, Suffix = "%", Callback = function(v) print("sens", v) end })

Advanced:Toggle({ Name = "Bone Priority", Flag = "adv_bone",  Callback = function(v) print("bone", v) end })
Advanced:Slider({ Name = "Reaction Time", Flag = "adv_react", Min = 0, Max = 500, Default = 100, Suffix = "ms", Callback = function(v) print("react", v) end })

TriggerSec:Toggle({
    Name     = "Enabled",
    Flag     = "trigger_on",
    Callback = function(v) print("trigger", v) end,
})

TriggerSec:Slider({
    Name     = "Delay",
    Flag     = "trigger_delay",
    Min      = 0,
    Max      = 500,
    Default  = 50,
    Suffix   = "ms",
    Callback = function(v) print("trigger delay", v) end,
})

TriggerSec:Toggle({
    Name     = "Burst Mode",
    Flag     = "trigger_burst",
    Callback = function(v) print("burst", v) end,
})

TriggerSec:Textbox({
    Name        = "Whitelist",
    Flag        = "trigger_whitelist",
    Placeholder = "Username...",
    Callback    = function(v) print("whitelist", v) end,
})

-- ── Visual ────────────────────────────────────────────────────────────────────

local ESPSec  = VisualTab:Section({ Name = "ESP",  Side = "left"  })
local GlowSec = VisualTab:Section({ Name = "Glow", Side = "right" })

local ESPToggle = ESPSec:Toggle({
    Name     = "Enabled",
    Flag     = "esp_on",
    Callback = function(v) print("esp", v) end,
})

ESPToggle:Colorpicker({
    Name     = "Color",
    Flag     = "esp_color",
    Default  = Color3.fromRGB(255, 85, 115),
    Callback = function(c) print("esp color", c) end,
})

ESPSec:Toggle({ Name = "Boxes",     Flag = "esp_boxes",    Callback = function(v) print("boxes", v) end })
ESPSec:Toggle({ Name = "Names",     Flag = "esp_names",    Callback = function(v) print("names", v) end })
ESPSec:Toggle({ Name = "Skeletons", Flag = "esp_skeleton", Callback = function(v) print("skeleton", v) end })

ESPSec:Slider({
    Name     = "Max Distance",
    Flag     = "esp_dist",
    Min      = 0,
    Max      = 1000,
    Default  = 500,
    Suffix   = "m",
    Callback = function(v) print("esp dist", v) end,
})

GlowSec:Toggle({ Name = "Enabled",    Flag = "glow_on",  Callback = function(v) print("glow", v) end })
GlowSec:Slider({ Name = "Brightness", Flag = "glow_br",  Min = 0, Max = 100, Default = 50, Suffix = "%", Callback = function(v) print("glow br", v) end })

-- ── Misc ──────────────────────────────────────────────────────────────────────

local MoveSec = MiscTab:Section({ Name = "Movement",  Side = "left"  })
local UtilSec = MiscTab:Section({ Name = "Utilities", Side = "right" })

MoveSec:Toggle({ Name = "Bunny Hop",   Flag = "bhop",   Callback = function(v) print("bhop", v) end })
MoveSec:Toggle({ Name = "Auto Strafe", Flag = "strafe", Callback = function(v) print("strafe", v) end })
MoveSec:Toggle({ Name = "No Clip",     Flag = "noclip", Callback = function(v) print("noclip", v) end })

MoveSec:Slider({
    Name     = "Speed Multiplier",
    Flag     = "speed",
    Min      = 1,
    Max      = 5,
    Default  = 1,
    Suffix   = "x",
    Callback = function(v) print("speed", v) end,
})

MoveSec:Keybind({
    Name     = "NoClip Key",
    Flag     = "noclip_key",
    Key      = Enum.KeyCode.N,
    Mode     = "Toggle",
    Callback = function(v) print("noclip key", v) end,
})

UtilSec:Toggle({ Name = "Spectator List", Flag = "speclist",    Callback = function(v) print("speclist", v) end })
UtilSec:Toggle({ Name = "Auto Accept",    Flag = "autoaccept",  Callback = function(v) print("autoaccept", v) end })

UtilSec:Textbox({
    Name        = "Status Message",
    Flag        = "status",
    Placeholder = "e.g. idle",
    Callback    = function(v) print("status", v) end,
})

-- ── Theme ─────────────────────────────────────────────────────────────────────

local ThemeSec  = ThemeTab:Section({ Name = "Theme",   Side = "left"  })
local ConfigSec = ThemeTab:Section({ Name = "Configs", Side = "right" })

ThemeSec:Dropdown({
    Name     = "Active Theme",
    Flag     = "selected_theme",
    Options  = {
        "Carbon", "Catppuccin", "Crimson", "Dark", "Emerald",
        "Everforest", "Gruvbox", "Nord", "OneDark", "Orange",
        "Preset", "Purple", "RosePine", "TokyoNight",
    },
    Default  = "Preset",
    Callback = function(v) Library:SetTheme(v) end,
})

local function GetConfigs()
    local dir = Library.Directory .. "/Configs"
    local out = {}
    if isfolder(dir) then
        for _, f in ipairs(listfiles(dir)) do
            if f:sub(-5) == ".json" then
                local n = f:match("([^\\/]+)%.json$")
                if n then table.insert(out, n) end
            end
        end
    end
    table.sort(out)
    return out
end

local ConfigDrop = ConfigSec:Dropdown({
    Name    = "Saved Configs",
    Flag    = "selected_config",
    Options = GetConfigs(),
})

ConfigSec:Textbox({
    Name        = "Config Name",
    Flag        = "config_name",
    Default     = "default",
    Placeholder = "Name...",
    Callback    = function(v) Library.Flags["config_name"] = v end,
})

ConfigSec:Button({
    Name     = "Save Config",
    Callback = function()
        local name = tostring(Library.Flags["config_name"] or "default"):gsub("%s+", "")
        if name == "" then name = "default" end
        Library:SaveConfig(name)
        ConfigDrop:Refresh(GetConfigs())
        ConfigDrop:Set(name)
    end,
})

ConfigSec:Button({
    Name     = "Load Config",
    Callback = function()
        local name = Library.Flags["selected_config"]
        if name then Library:LoadConfig(name) end
    end,
})

-- ── Dock ──────────────────────────────────────────────────────────────────────

Library:Dock({
    Buttons = {
        {
            Icon     = "rbxassetid://111911305350051",
            Toggle   = true,
            Default  = true,
            Callback = function(state) Window:Visible(state) end,
        },
    },
})

-- ── Watermark ─────────────────────────────────────────────────────────────────

Library:Watermark({
    Name    = "Example",
    Modules = {
        { Type = "Fps"  },
        { Type = "Ping" },
        { Type = "Time" },
    },
})
