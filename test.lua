local settings = {
    LootESP = true
}

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlreadyMAKS/Delta/main/GUI%20Library.lua"))()

local Window = GuiLibrary:MakeWindow({Name = "DeltaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "DeltaWareTest"})

local GeneralTab = Window:MakeTab({
	Name = "General",
	Icon = "rbxassetid://0",
	PremiumOnly = false
})

local ESPTab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://0",
	PremiumOnly = false
})

local AimbotTab = Window:MakeTab({
	Name = "Aimbot",
	Icon = "rbxassetid://0",
	PremiumOnly = false
})

local LootESPTab = Window:MakeTab({
	Name = "LootESP",
	Icon = "rbxassetid://0",
	PremiumOnly = false
})

--General

local Section = GeneralTab:AddSection({
	Name = "Main Switches"
})

GeneralTab:AddToggle({
	Name = "ESP Enabled",
	Default = false,
	Callback = function(Value)
		_G.ESPActive = Value
	end    
})

GeneralTab:AddToggle({
	Name = "Aimbot Enabled",
	Default = false,
	Callback = function(Value)
		_G.AimBotActive = Value
	end    
})

GeneralTab:AddToggle({
	Name = "LootESP Enabled",
	Default = false,
	Callback = function(Value)
		_G.LootESPActive = Value
	end    
})

GeneralTab:AddButton({
	Name = "Unload script",
	Callback = function()
        _G.LootESPRenderDistance = 100
        _G.ESPChamsColor = Color3.fromRGB(255, 0, 0)
        _G.ESPChamsActive = false
        _G.LootESPActive = false
        _G.ESPActive = false
        GuiLibrary:Destroy()
        script:Destroy()
  	end    
})

--Esp

local Section = ESPTab:AddSection({
	Name = "Basic"
})

ESPTab:AddToggle({
	Name = "Include Bots",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

ESPTab:AddToggle({
	Name = "Ignore clan",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

local Section = ESPTab:AddSection({
	Name = "Visual"
})

ESPTab:AddToggle({
	Name = "Show Box",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

ESPTab:AddToggle({
	Name = "Show Chams",
	Default = false,
	Callback = function(Value)
		_G.ESPChamsActive = Value
	end    
})

ESPTab:AddToggle({
	Name = "Show Skeleton",
	Default = false,
	Callback = function(Value)
		_G.ESPSkeletonActive = Value
	end    
})

ESPTab:AddToggle({
	Name = "Show Name",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

ESPTab:AddToggle({
	Name = "Show Health",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

ESPTab:AddToggle({
	Name = "Show Weapon",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

local Section = ESPTab:AddSection({
	Name = "Advanced"
})

ESPTab:AddColorpicker({
	Name = "Box Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

ESPTab:AddColorpicker({
	Name = "Skeleton Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		_G.ESPSkeletonColor = Value
	end	  
})

ESPTab:AddColorpicker({
	Name = "Chams Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		_G.ESPChamsColor = Value
	end	  
})

ESPTab:AddSlider({
	Name = "Chams Transparency",
	Min = 0,
	Max = 100,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.ESPChamsTransparency = Value / 100
	end    
})

ESPTab:AddColorpicker({
	Name = "Text Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

-- LootEsp

local Section = LootESPTab:AddSection({
	Name = "Basic"
})

LootESPTab:AddSlider({
	Name = "Render Distance",
	Min = 10,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Studs",
	Callback = function(Value)
		_G.LootESPRenderDistance = Value
	end    
})

-- Aimbot

local Section = AimbotTab:AddSection({
	Name = "Basic"
})

AimbotTab:AddToggle({
	Name = "Silent Aim",
	Default = false,
	Callback = function(Value)
		_G.SilentAimActive = Value
	end    
})

local Section = AimbotTab:AddSection({
	Name = "Advanced"
})

AimbotTab:AddDropdown({
	Name = "Aim Target",
	Default = "Head",
	Options = {"Head", "UpperTorso","LowerTorso"},
	Callback = function(Value)
		_G.SilentAimTarget = Value
	end    
})

AimbotTab:AddSlider({
	Name = "Trigger Distance",
	Min = 100,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Studs",
	Callback = function(Value)
		_G.SilentAimTrigger = Value
	end    
})

_G.ESPChamsActive = false
_G.ESPActive = false
_G.ESPChamsColor = Color3.fromRGB(255, 0, 0)
_G.ESPChamsTransparency = 0
_G.ESPSkeletonActive = false
_G.ESPSkeletonColor = Color3.fromRGB(255, 0, 0)

_G.LootESPActive = false
_G.LootESPRenderDistance = 100

_G.SilentAimActive = false
_G.SilentAimTrigger = 100
_G.SilentAimTarget = "Head"

loadstring(game:HttpGet("https://raw.githubusercontent.com/AlreadyMAKS/Delta/main/ESP.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlreadyMAKS/Delta/main/LootEsp.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlreadyMAKS/Delta/main/SilentAim.lua"))()
