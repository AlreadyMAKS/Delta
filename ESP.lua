local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local function DrawChams(character)

    local Highlight = character:FindFirstChild("Highlight")

    if Highlight == nil then
        Highlight = Instance.new("Highlight")
    end

    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Parent = character

    Highlight.Enabled = _G.ESPChamsActive
    Highlight.FillColor = _G.ESPChamsColor
    Highlight.FillTransparency = _G.ESPChamsTransparency

    local Connection;
	Connection = RunService.RenderStepped:Connect(function()
        Highlight.Enabled = _G.ESPChamsActive
        Highlight.FillColor = _G.ESPChamsColor
        Highlight.FillTransparency = _G.ESPChamsTransparency

        if Highlight == nil or Highlight.Parent == nil then
            Connection:Disconnect()
        end
	end)

end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()


local Skeletons = {}

local function Draw(character)

    if _G.ESPActive then
        
        DrawChams(character)

    end

end

game.Players.PlayerAdded:Connect(function(v)
    if v.Character then
        Draw(v.Character)
        table.insert(Skeletons, Library:NewSkeleton(Player, true));
    end
    v.CharacterAdded:Connect(function(character)
        Draw(character)
    end)
end)

for _, v in pairs(game.Players:GetPlayers()) do
    if v.Character then
        Draw(v.Character)
        table.insert(Skeletons, Library:NewSkeleton(Player, true));
    end
    v.CharacterAdded:Connect(function(character)
        Draw(character)
    end)
end
