-- main.lua script for spawning a fruit in front of the player in Blox Fruits

-- Print a message to indicate that the script has loaded successfully
print("main.lua has been loaded successfully.")

-- Define the function to spawn a fruit
function spawnFruit(fruitName)
    -- Get the local player
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Check if the fruit exists in ServerStorage
    local fruitModel = game.ServerStorage:FindFirstChild(fruitName)
    
    if fruitModel then
        -- Clone the fruit model
        local fruitClone = fruitModel:Clone()

        -- Get the player's position and create a spawn position in front of the character
        local spawnPosition = character.HumanoidRootPart.Position + (character.HumanoidRootPart.CFrame.LookVector * 5)

        -- Set the cloned fruit's position
        fruitClone:SetPrimaryPartCFrame(CFrame.new(spawnPosition))

        -- Parent the fruit to the workspace
        fruitClone.Parent = workspace

        print(fruitName .. " has been spawned in front of the player.")
    else
        print("Error: The fruit " .. fruitName .. " does not exist in ServerStorage.")
    end
end