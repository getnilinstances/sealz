local sealz = loadstring(game:HttpGet("https://raw.githubusercontent.com/getnilinstances/sealz/refs/heads/main/source/interface.luau"))();

local water = sealz:Watermark();
local notify = sealz:Notification();
local Window = sealz.new({
	Title = "Sealz.luau",
	Description = "Interface suit",	
	Keybind = "Insert",
});

local LegitMenu = Window:AddTab("Legit");
local IndicatorWindow = Window:AddWindow({
	ZIndex = 1000,
	Id = "KeybindsWindowIndicator",	
});

local KeybindsWindow = Window:AddWindow({
	ZIndex = 700,
	Id = "KeybindsWindowIndicator",	
});

print(KeybindsWindow:GetValue())
KeybindsWindow:AddLabel("Keybinds"):Center();
IndicatorWindow:AddLabel("Indicators"):Center()

local AimbotMenu = LegitMenu:AddMenu();
local TriggerbotMenu = LegitMenu:AddMenu();

local AimbotSection = AimbotMenu:AddSection({
	Title = "Aimassist",
	Icon = "mouse-button-left"
});

local AimbotSettingSection = AimbotMenu:AddSection({
	Title = "Configuration",
	Icon = "gear"
});


local TriggerbotSection = TriggerbotMenu:AddSection({
	Title = "Triggerbot",
	Icon = "crosshairs"
});

local TriggerboSettingtSection = TriggerbotMenu:AddSection({
	Title = "Configuration",
	Icon = "gear"
});

local Enabled = AimbotSection:AddLabel("Enabled");

local Aimbot = Enabled:AddKeybind({
	Blacklist = {},
	Default = "M1",
	Mode = "Hold",
	Flag = "AimbotKeybind",
	Callback = function(v)
		print(v)
	end,
})

task.spawn(function()
	local AimbotBind = KeybindsWindow:AddLabel("Aimbot"):Icon("crosshairs");
	
	while true do task.wait()
		AimbotBind:SetVisible(Aimbot:IsActive())
	end
end)

Enabled:AddToggle({
	Flag = "AimbotEnabled",
	Default = false,
	Callback = function(v)
		print(v)
	end,
});

AimbotSection:AddLabel(
	sealz:RichText("Silent-Aim").red().output() -- text with red color
):Icon(
	sealz:RichText("triangle-exclamation").red().output()
) -- add icon with red color to label
	:AddToggle({
	Flag = "SilentAim",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

AimbotSection:AddLabel("Hitboxes"):AddDropdown({
	Flag = "AimbotHitboxes",
	Values = {"Head","Arms","Hands","Body","Legs","Foots"},
	Default = {
		Head = true
	},
	Multi = true,
	Callback = function(v)
		print(v)
	end,
})

AimbotSection:AddLabel("Wallcheck"):AddToggle({
	Flag = "AimbotWallcheck",
	Default = false,
	Callback = function(v)
		print(v)
		
	end,
})
	
local smooth = AimbotSection:AddLabel("Smoothness");
local smoothoption = smooth:AddOption(
	275 -- width of window
);

smooth:AddToggle({
	Flag = "AimbotSmoonthness",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

smoothoption:AddLabel("Smoothness X"):AddSlider({
	Min = 0,
	Max = 100,
	Type = "%",
	Flag = "SmoothX",
	Callback = function(v)
		print(v)
	end,
});

smoothoption:AddLabel("Smoothness Y"):AddSlider({
	Min = 0,
	Max = 100,
	Type = "%",
	Flag = "SmoothY",
	Callback = function(v)
		print(v)
	end,
})

local visualise = AimbotSection:AddLabel("Visualise");

visualise:AddColorPicker({
	Flag = "AimbotVisualColor",
	Default = Color3.fromRGB(255,0,0),
	Callback = function(v)
		print(v)
	end,
})

visualise:AddToggle({
	Flag = "AimbotVisualEnabled",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

local Random = AimbotSettingSection:AddLabel("Randomization");

Random:AddSlider({
	Min = 0,
	Max = 20,
	Type = "px",
	Size = 100, -- size of slider
	Flag = "AimbotRandomPower",
	Callback = function(v)
		print(v)
	end,
})

Random:AddToggle({
	Flag = "AimbotRandom",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

local Curve = AimbotSettingSection:AddLabel("Curve");

Curve:AddSlider({
	Min = 0,
	Max = 20,
	Type = "px",
	Size = 100, -- size of slider
	Flag = "AimbotCurvePower",
	Callback = function(v)
		print(v)
	end,
})

Curve:AddToggle({
	Flag = "AimbotCurve",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

local RCS = AimbotSettingSection:AddLabel("Recoil Control");

RCS:AddSlider({
	Min = 0,
	Max = 100,
	Type = "%",
	Size = 100, -- size of slider
	Flag = "AimbotRecoilPower",
	Callback = function(v)
		print(v)
	end,
})

RCS:AddToggle({
	Flag = "AimbotRecoil",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

TriggerbotSection:AddLabel("Enabled"):Context(function(Label)
	local Triggerbot = Label:AddKeybind({
		Blacklist = {},
		Default = "C",
		Mode = "Hold",
		Flag = "TriggerbotKeybind",
		Callback = function(v)
			print(v)
		end,
	});
	
	task.spawn(function()
		local TriggerbotBind = KeybindsWindow:AddLabel("Triggerbot"):Icon("crosshairs-slash");

		while true do task.wait()
			TriggerbotBind:SetVisible(Triggerbot:IsActive())
		end
	end)
	
	Label:AddToggle({
		Flag = "Triggerbot",
		Default = false,
		Callback = function(v)
			print(v)
		end,
	});
end);


TriggerbotSection:AddLabel("Hitboxes"):AddDropdown({
	Flag = "TriggerbotHitboxes",
	Values = {"Head","Arms","Hands","Body","Legs","Foots"},
	Default = {
		Head = true
	},
	Multi = true,
	Callback = function(v)
		print(v)
	end,
})

TriggerbotSection:AddLabel("Wallcheck"):AddToggle({
	Flag = "TriggerbotWallcheck",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

TriggerbotSection:AddLabel("Multi Points"):AddSlider({
	Flag = "TriggerbotMultiPoints",
	Min = 1,
	Max = 100,
	Type = "%",
	Default = 50,
	Callback = function(v)
		print(v)
	end,
})

TriggerbotSection:AddLabel("Reaction Time"):AddSlider({
	Flag = "TriggerbotDelay",
	Min = 1,
	Max = 1000,
	Type = "ms",
	Default = 50,
	Callback = function(v)
		print(v)
	end,
})

TriggerboSettingtSection:AddLabel("Hit-Chance"):AddSlider({
	Flag = "TriggerbotHitchance",
	Min = 1,
	Max = 100,
	Type = "%",
	Default = 50,
	Callback = function(v)
		print(v)
	end,
})

TriggerboSettingtSection:AddLabel("Magnet"):AddToggle({
	Flag = "TriggerbotMagnet",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})
	
TriggerboSettingtSection:AddLabel("Seed"):Context(function(Label)
	Label:AddDropdown({
		Flag = "TriggerbotSeedMode",
		Values = {"Mode 1","Mode 2"},
		Default = "Mode 1",
		Callback = function(v)
			print(v)
		end,
	})
	
	Label:AddToggle({
		Flag = "TriggerbotSeed",
		Default = false,
		Callback = function(v)
			print(v)
		end,
	})	
end);

local VisualsMenu = Window:AddTab("Visuals");

local Players = VisualsMenu:AddMenu();
local Visuals = VisualsMenu:AddMenu();
local World = VisualsMenu:AddMenu();

local PlayersSeciton =Players:AddSection({
	Title = "Players",
	Icon = "person"
})

local ObjectSeciton = Visuals:AddSection({
	Title = "Players",
	Icon = "cube"
})

local WorldsSeciton = World:AddSection({
	Title = "Worlds",
	Icon = "star"
})

local FOV = WorldsSeciton:AddLabel("Field Of View");

FOV:AddOption(300):AddLabel("Field Of View"):AddSlider({
	Flag = "FOVValue",
	Min = 1,
	Max = 120,
	Rounding = 1,
	Type = "%",
	Callback = function(v)
		print(v)
	end,
})

FOV:AddToggle({
	Flag = "FOV",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

WorldsSeciton:AddLabel("Indicators"):AddToggle({
	Flag = "IndicatorToggle",
	Default = false,
	Callback = function(v)
		IndicatorWindow:SetWindow(v);
	end,
})

WorldsSeciton:AddLabel("Keybinds"):AddToggle({
	Flag = "KeybindsWindow",
	Default = false,
	Callback = function(v)
		KeybindsWindow:SetWindow(v);
	end,
})

ObjectSeciton:AddLabel("Enabled"):AddToggle({
	Flag = "OBJ",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Weapon"):AddToggle({
	Flag = "OBJWeapon",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Bomb"):AddToggle({
	Flag = "OBJBomb",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Kit"):AddToggle({
	Flag = "OBJKit",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Windows"):AddToggle({
	Flag = "OBJWindows",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Pallets"):AddToggle({
	Flag = "OBJPallets",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

ObjectSeciton:AddLabel("Generators"):AddToggle({
	Flag = "OBJGenerators",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Enabled"):AddToggle({
	Flag = "ESP",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Box"):AddToggle({
	Flag = "ESPBox",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Username"):AddToggle({
	Flag = "ESPUsername",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Chams"):AddToggle({
	Flag = "ESPChams",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Health"):AddToggle({
	Flag = "ESPHealth",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Flags"):AddToggle({
	Flag = "ESPFlags",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

PlayersSeciton:AddLabel("Tracer"):AddToggle({
	Flag = "ESPTracer",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

local MiscMenu = Window:AddTab("Misc");

local Extra = MiscMenu:AddMenu();

local Extras = Extra:AddSection({
	Title = "Extras",
	Icon = "controller"
});

Extras:AddLabel("DDos On Peek"):AddToggle({
	Flag = "DDos",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

Extras:AddLabel("DDos On Peek"):AddToggle({
	Flag = "DDos",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

Extras:AddLabel("Netflix Screen share"):AddToggle({
	Flag = "Netflix",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

Extras:AddLabel("Desync"):AddToggle({
	Flag = "Netflix",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

Extras:AddLabel("Some stupid larper feature"):AddToggle({
	Flag = "larp1",
	Default = false,
	Callback = function(v)
		print(v)
	end,
})

local ScriptsMenu = Window:AddTab("Scripts");

ScriptsMenu:AddMenu():AddSection({
	Title = "Lua Scripts",
	Icon = "code"
}):AddLabel("Larp");

local SettingsMenu = Window:AddTab("Settings");

local Config = SettingsMenu:AddMenu();
local Interface = SettingsMenu:AddMenu();

Config:AddConfig("Sealz")

notify.new({
	Title = "Sealz.lua",
	Content = "Image has been loaded.",
	Duration = 10,
})

task.spawn(function()
	local interface = Interface:AddSection({
		Title = "Interface",
		Icon = "rectangle-list"
	})
		
	local wm = interface:AddLabel("Watermark");
	
	local Test = water.new("code","Aim by yourself");
	
	Test:Input(function()
		Window:Toggle();	
	end);
	
	water.new("rectangle-list-pencil","Interface"):Input(function()
		Window:ForceCenter()
	end)

	local GC = water.new("memory-card","Interface");
	local Pings = water.new("chart-three-vertical-bars","");
	local FPS = water.new("computer-monitor","");

	IndicatorWindow:AddLabel("Spread"):Icon("crosshairs");
	IndicatorWindow:AddLabel("DT"):Icon("bullet-flying");
	IndicatorWindow:AddLabel("NS"):Icon("crosshairs-slash");

	wm:AddDropdown({
		Flag = "WatermarkPos",
		Default = "Middle",
		Values = {"Left","Middle","Right"},
		Callback = function(v)
			water:SetPosition(v);
		end,
	})

	wm:AddDropdown({
		Flag = "WatermarkItem",
		Default = {
			Version = true,
			Ping = false,
			FPS = true,
		},
		Values = {
			"Version",
			"Ping",
			"FPS"
		},
		Multi =true,
		Callback = function(v)
			GC:SetVisible(v.Version);
			Pings:SetVisible(v.Ping)
			FPS:SetVisible(v.FPS)
		end,
	})

	wm:AddToggle({
		Flag = "Watermark",
		Default = true,
		Callback = function(v)
			water:SetVisible(v);
		end,
	})
	
	
	while true do task.wait(0.1)
		GC:SetText(tostring(gcinfo()));
		Pings:SetText(tostring(math.random(100,120))..'ms');
		FPS:SetText(tostring(math.random(175,180))..' FPS')
	end
end)


task.spawn(function()
	while true do
		
		notify.new({
			Title = "Notification",
			Content = "Notification Content.",
			Duration = 5,
		})
		task.wait(5)
		
	end
end)

print(sealz.Flags)
