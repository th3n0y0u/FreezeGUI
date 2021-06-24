local Players = game:GetService("Players")

local player = script.Parent.Parent.Parent.Parent

local function mainclass()
	local function onEntered(enterPressed)
		script.Parent.OnEntered:FireServer(script.Parent.FreezePlayer.Text)
	end
	
	local function notonEntered(enterPressed)
		script.Parent.NotOnEntered:FireServer(script.Parent.UnfreezePlayer.Text)
	end

	local function prompt()
		script.Parent.UserInput.Text = "Please input a number here for many laser guns"
		script.Parent.UserInput.FocusLost:Connect(function(player)
			script.Parent.CanGive:FireServer(script.Parent.UserInput.Text)
		end)
	end 
	
	script.Parent.Gun.MouseButton1Down:Connect(function(player)
		prompt()
	end) 
	 
	script.Parent.FreezePlayer.FocusLost:Connect(onEntered) 
	script.Parent.UnfreezePlayer.FocusLost:Connect(notonEntered) 
end	
mainclass()
