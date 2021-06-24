local Players = game:GetService("Players")

local debounce = false

local canGive = false

local player = script.Parent.Parent.Parent.Parent

local tool = game.ReplicatedStorage:FindFirstChild("HyperlaserGun")

function mainclass()

	local function sound()
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
	
	local function onentered(player, text)
		if debounce == false then
			if game.Players:FindFirstChild(text) then
				local target = game.Players:FindFirstChild(text)
				if target.Character ~= nil then
					if tostring(target) ~= script.Parent.Parent.Parent.Parent.Name then
						target.Character.HumanoidRootPart.Anchored = true
					elseif tostring(target) == script.Parent.Parent.Parent.Parent.Name then
						print("stop freezing yourself nerd")
					end
				else
					print("stop it")
				end
			end
		end
	end
	
	local function notonentered(player, text)
		if debounce == false then
			if game.Players:FindFirstChild(text) then
				local target = game.Players:FindFirstChild(text)
				if target.Character ~= nil then
					if tostring(target) ~= script.Parent.Parent.Parent.Parent.Name then
						target.Character.HumanoidRootPart.Anchored = false
					elseif tostring(target) == script.Parent.Parent.Parent.Parent.Name then
						print("stop unfreezing yourself nerd")
					end
				else
					print("stop it")
				end
			end
		end
	end
	
	local function fired2()
		script.Parent.FreezeAllPlayers.Text = "INITALIZING..."
		wait(3)
		for i, player in pairs(Players:GetPlayers()) do
			if player.Name ~= script.Parent.Parent.Parent.Parent.Name then
				player.Character.HumanoidRootPart.Anchored = true
			elseif player.Name == script.Parent.Parent.Parent.Parent.Name then
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

	local function unfired2()
		script.Parent.UnFreezeAllPlayers.Text = "INITALIZING..."
		wait(3)
		for i, player in pairs(Players:GetPlayers()) do
			if player.Name ~= script.Parent.Parent.Parent.Parent.Name then
				player.Character.HumanoidRootPart.Anchored = false
			elseif player.Name == script.Parent.Parent.Parent.Parent.Name then
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
	
	local function item(player, text)
		if canGive == false then
			canGive = true
			for v = 1, tonumber(text), 1 do
				local clone = tool:Clone()
				clone.Parent = player.Backpack 
			end
			wait(1)
			canGive = false
		end
	end

	script.Parent.FreezeAllPlayers.MouseButton1Down:Connect(fired)
	script.Parent.UnFreezeAllPlayers.MouseButton1Down:Connect(unfired)
	script.Parent.CanGive.OnServerEvent:Connect(item)
	script.Parent.OnEntered.OnServerEvent:Connect(onentered)
	script.Parent.NotOnEntered.OnServerEvent:Connect(notonentered)
end

mainclass()
