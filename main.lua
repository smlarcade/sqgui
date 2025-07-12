-- Create the main GUI screen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

-- Create the main frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Parent = ScreenGui

-- Create a title label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Text = "Roblox Exploit GUI"
TitleLabel.TextSize = 24
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = MainFrame

-- Create a speed hack button
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 200, 0, 50)
SpeedButton.Position = UDim2.new(0.5, -100, 0.2, 0)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Text = "Speed Hack"
SpeedButton.TextSize = 20
SpeedButton.Font = Enum.Font.SourceSansBold
SpeedButton.Parent = MainFrame

-- Function to enable speed hack
SpeedButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 100  -- Set speed to 100
end)

-- Create a fly hack button
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0.5, -100, 0.35, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Text = "Fly Hack"
FlyButton.TextSize = 20
FlyButton.Font = Enum.Font.SourceSansBold
FlyButton.Parent = MainFrame

-- Function to enable fly hack
FlyButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 50, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = character.PrimaryPart

    game:GetService("RunService").RenderStepped:Connect(function()
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)
    end)
end)

-- Create a teleport button
local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(0, 200, 0, 50)
TeleportButton.Position = UDim2.new(0.5, -100, 0.5, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Text = "Teleport"
TeleportButton.TextSize = 20
TeleportButton.Font = Enum.Font.SourceSansBold
TeleportButton.Parent = MainFrame

-- Function to teleport the player
TeleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local targetPosition = Vector3.new(0, 100, 0)  -- Set your target position here
    character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end)

-- Create a fling button
local FlingButton = Instance.new("TextButton")
FlingButton.Size = UDim2.new(0, 200, 0, 50)
FlingButton.Position = UDim2.new(0.5, -100, 0.65, 0)
FlingButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.Text = "Fling Player"
FlingButton.TextSize = 20
FlingButton.Font = Enum.Font.SourceSansBold
FlingButton.Parent = MainFrame

-- Create a dropdown to select the player to fling
local PlayerDropdown = Instance.new("Dropdown")
PlayerDropdown.Size = UDim2.new(0, 200, 0, 30)
PlayerDropdown.Position = UDim2.new(0.5, -100, 0.8, 0)
PlayerDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerDropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
PlayerDropdown.Text = "Select Player"
PlayerDropdown.TextSize = 18
PlayerDropdown.Font = Enum.Font.SourceSans
PlayerDropdown.Parent = MainFrame

-- Populate the dropdown with player names
for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Name ~= game.Players.LocalPlayer.Name then
        local option = Instance.new("TextButton")
        option.Size = UDim2.new(1, 0, 0, 30)
        option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        option.TextColor3 = Color3.fromRGB(0, 0, 0)
        option.Text = player.Name
        option.TextSize = 18
        option.Font = Enum.Font.SourceSans
        option.Parent = PlayerDropdown
    end
end

-- Function to fling the selected player
FlingButton.MouseButton1Click:Connect(function()
    local selectedPlayerName = PlayerDropdown.Text
    local targetPlayer = game.Players:FindFirstChild(selectedPlayerName)
    if targetPlayer then
        local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 500, 0)  -- Set the fling force here
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Parent = targetCharacter.PrimaryPart

        game:GetService("RunService").RenderStepped:Connect(function()
            bodyVelocity.Velocity = Vector3.new(0, 500, 0)
        end)
    end
end)