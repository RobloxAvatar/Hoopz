local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
 
local lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local window = lib:MakeWindow({Name = "Hoopz WalkSpeed UI"})
local main = window:MakeTab({Name = "Main"})

_G.Ws = 16
 
main:AddSlider({Name = "WalkSpeed", Min = 16, Max = 19, Default = 16, Color = Color3.fromRGB(80, 80, 255), Increment = 0.1, Callback = function(v)
    _G.Ws = v
end})

local gmt = getrawmetatable(game)
local oldIndex = gmt.__index
setreadonly(gmt, false)

gmt.__index = newcclosure(function(Self,Key)
    if tostring(Self) == "Humanoid" and tostring(Key) == "WalkSpeed" then
        return _G.Ws
    end
    return oldIndex(Self,Key)
end)

while wait() do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Ws
end

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    while wait() do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Ws
    end
end)
