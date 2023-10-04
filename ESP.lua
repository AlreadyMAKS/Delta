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

local function GetPositions(startpart,endpart)

    return camera:WorldToScreenPoint((startpart.CFrame * CFrame.new(0,startpart.Size.Y/2,0)).Position), camera:WorldToScreenPoint((endpart.CFrame * CFrame.new(0,-endpart.Size.Y/2,0)).Position)

end

local function DrawSkeleton(character)

    local Torso = Drawing.new("Line")
    local From,To = GetPositions(Character.UpperTorso,Character.LowerTorso)
    Torso.From = From
    Torso.To = To

end

local function Draw(character)

    Drawing.clear()

    DrawChams(character)

    DrawSkeleton(character)

end

game.Players.PlayerAdded:Connect(function(v)
    if v.Character then
        Draw(v.Character)
    end
    v.CharacterAdded:Connect(function(character)
        Draw(character)
    end)
end)

for _, v in pairs(game.Players:GetPlayers()) do
    if v.Character then
        Draw(v.Character)
    end
    v.CharacterAdded:Connect(function(character)
        Draw(character)
    end)
end
