local spawnfruit = function()
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "FruitSpawner"
    frame.Size = UDim2.new(0.3, 0, 0.3, 0)
    frame.Position = UDim2.new(0.35, 0, 0.35, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = playerGui

    local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    uiAspectRatioConstraint.AspectRatio = 1
    uiAspectRatioConstraint.Parent = frame

    local uiScale = Instance.new("UIScale")
    uiScale.Scale = 1
    uiScale.Parent = frame

    local button = Instance.new("TextButton")
    button.Name = "SpawnFruitButton"
    button.Size = UDim2.new(0.5, 0, 0.5, 0)
    button.Position = UDim2.new(0.25, 0, 0.25, 0)
    button.Text = "Spawn Fruit"
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local character = player.Character or player.CharacterAdded:Wait()
        local fruit = Instance.new("Part")
        fruit.Name = "Fruit"
        fruit.Size = Vector3.new(1, 1, 1)
        fruit.Position = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 5
        fruit.Anchored = true
        fruit.BrickColor = BrickColor.new("Bright red")
        fruit.Parent = workspace
    end)

    local userInputService = game:GetService("UserInputService")
    local function updateScale()
        if userInputService.TouchEnabled and not userInputService.KeyboardEnabled then
            -- Mobile
            uiScale.Scale = 2
        else
            -- Desktop
            uiScale.Scale = 1
        end
    end

    userInputService.TouchEnabled:Connect(updateScale)
    userInputService.KeyboardEnabled:Connect(updateScale)

    updateScale()
end

-- Call the function to create the UI
spawnfruit()