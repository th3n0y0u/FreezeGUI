local Players = game:GetService("Players")

local debounce = false

local canGive = false

local tool = game.ReplicatedStorage:FindFirstChild("HyperlaserGun")

local player = script.Parent.Parent.Parent.Parent

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
	freeze.Name = "FreezeSound"
	freeze.SoundId = "rbxassetid://2364677393" 
	freeze.PlaybackSpeed = 1
	freeze.Volume = 1
	freeze:Play()
	coroutine.resume(coroutine.create(function()
		wait(freeze.TimeLength) 
		freeze:Destroy()
	end) )
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
	wait(1.5)
	script.Parent.FreezeAllPlayers.Text = "FREEZE ALL PLAYERS"
end

local function fired()
	script.Parent.FreezeAllPlayers.Text = "Are you sure that you want to do this?"
	script.Parent.FreezeAllPlayers.MouseButton1Down:Connect(function(click)
		fired2() 
	end)
end

function notonEntered(enterPressed)
	if debounce == false then
		if game.Players:FindFirstChild(script.Parent.UnfreezePlayer.Text) then
			local target = game.Players:FindFirstChild(script.Parent.UnfreezePlayer.Text)
			if target.Character ~= nil then
				if target ~= script.Parent.Parent.Name then
					target.Character.HumanoidRootPart.Anchored = false
				else
					print("stop unfreezing yourself nerd")
				end
			else
				print("stop it")
			end
		end
	end
end
local function unfired2()
	script.Parent.UnFreezeAllPlayers.Text = "INITALIZING..."
	wait(3)
	for i, player in pairs(Players:GetPlayers()) do
		if player.Name ~= script.Parent.Parent.Name then
			player.Character.HumanoidRootPart.Anchored = false
		else
			print("No unfreezing yourself.")
		end
	end
	wait(3)
	script.Parent.UnFreezeAllPlayers.Text = "Fired.."
	wait(1.5)
	script.Parent.UnFreezeAllPlayers.Text = "UNFREEZE ALL PLAYERS"
end

local function unfired()
	script.Parent.UnFreezeAllPlayers.Text = "Are you sure that you want to do this?"
	script.Parent.UnFreezeAllPlayers.MouseButton1Down:Connect(function(click)
		unfired2() 
	end)
end 


local function item()
	if canGive == false then
		canGive = true
		for v = 1, tonumber(script.Parent.UserInput.Text), 1 do
			local clone = tool:Clone()
			clone.Parent = player.Backpack 
		end
		wait(1)
		canGive = false
	end
end

local function prompt()
	script.Parent.UserInput.Text = "Please input a number here for many laser guns"
	script.Parent.UserInput.FocusLost:Connect(function(player)
		item()
	end)
end 

script.Parent.Gun.MouseButton1Down:Connect(function(player)
	prompt()
end) 

script.Parent.FreezeAllPlayers.MouseButton1Down:Connect(fired)
script.Parent.UnFreezeAllPlayers.MouseButton1Down:Connect(unfired)
script.Parent.FreezePlayer.FocusLost:Connect(onEntered) 
script.Parent.UnfreezePlayer.FocusLost:Connect(notonEntered)  

-- Exit and Enter 
function exitandenter()
	if script.Parent.Parent.Parent.Frame.Visible == false then
		script.Parent.Parent.Parent.Frame.Visible = true
	else
		script.Parent.Parent.Parent.Frame.Visible = false 
	end
end

script.Parent.MouseButton1Down:Connect(exitandenter) 