# main.py script for spawning a fruit in front of the player in Blox Fruits

# Print a message to indicate that the script has loaded successfully
print("main.py has been loaded successfully.")

# Define the function to spawn a fruit
def spawn_fruit(fruit_name):
    # Get the local player and character
    player = game.Players.LocalPlayer
    character = player.Character or player.CharacterAdded:Wait()

    # Get the fruit model from ServerStorage
    fruit_model = game.ServerStorage:FindFirstChild(fruit_name)

    # Check if the fruit exists
    if fruit_model:
        # Clone the fruit model and set its position
        fruit_clone = fruit_model:Clone()
        fruit_clone:SetPrimaryPartCFrame(character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))

        # Parent the fruit to the workspace
        fruit_clone.Parent = workspace

        print(f"{fruit_name} has been spawned in front of the player.")
    else:
        print(f"Error: The fruit {fruit_name} does not exist in ServerStorage.")
