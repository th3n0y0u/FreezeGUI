local Players = game:GetService("Players")

local debounce = false

function onEntered(enterPressed)
	if debounce == false then
		if game.Players:FindFirstChild(script.Parent.FreezePlayer.Text) then
			local target = game.Players:FindFirstChild(script.Parent.FreezePlayer.Text)
			if target.Character ~= nil then
				if target ~= script.Parent.Parent.Name then
					target.Character.HumanoidRootPart.Anchored = true
				else
					print("stop freezing yourself nerd")
				end
			else
				print("stop it")
			end
		end
	end
end

function sound()
	local freeze = Instance.new("Sound")
	freeze.SoundId = "rbxassetid://2364677393" 
	freeze.Volume = 1
	freeze.Parent = game.Workspace
	freeze.Playing = true
	wait(freeze.TimeLength) 
	freeze:Destroy()
end

local function fired2()
	script.Parent.FreezeAllPlayers.Text = "INITALIZING..."
	wait(3)
	for i, player in pairs(Players:GetPlayers()) do
		if player.Name ~= script.Parent.Parent.Name then
			player.Character.HumanoidRootPart.Anchored = true
		else
			print("No freezing yourself.")
		end
	end
	wait(3)
	script.Parent.FreezeAllPlayers.Text = "Fired.."
	sound()
end

local function fired()
	script.Parent.FreezeAllPlayers.Text = "Are you sure that you want to do this?"
	script.Parent.FreezeAllPlayers.MouseButton1Down:Connect(function(click)
		fired2() 
	end)
end
local function item()
	for v = 1, tonumber(script.Parent.UserInput.Text), 1 do
		local tool = game.ReplicatedStorage.HyperlaserGun:Clone()
		tool.Parent = script.Parent.Parent.Parent.Parent.Backpack 
	end
end

local function prompt()
	script.Parent.UserInput.Text = "Please input a number here for many laser guns"
	script.Parent.UserInput.FocusLost:Connect(function(lost)
		item()
	end)
end 

script.Parent.FreezeAllPlayers.MouseButton1Down:Connect(fired)
script.Parent.FreezePlayer.FocusLost:Connect(onEntered) 
script.Parent.Gun.MouseButton1Down:Connect(prompt)

-- Exit and Enter 
function exitandenter()
	if script.Parent.Parent.Parent.Frame.Visible == false then
		script.Parent.Parent.Parent.Frame.Visible = true
	else
		script.Parent.Parent.Parent.Frame.Visible = false 
	end
end

script.Parent.MouseButton1Down:Connect(exitandenter) 