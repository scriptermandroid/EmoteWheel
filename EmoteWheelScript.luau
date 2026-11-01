local uis = game:GetService("UserInputService")
local players = game:GetService("Players")

local emotewheelgui = script.Parent

local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character.Humanoid or character:WaitForChild("Humanoid")
local animator = humanoid.Animator or humanoid:WaitForChild("Animator")

local forwardButton = emotewheelgui.Frame.forward
local backButton = emotewheelgui.Frame.backward

local factor = 1

local emotes = emotewheelgui.Emotes:GetChildren()

local slots = emotewheelgui.Frame.ImageLabel:GetChildren()

local counter = emotewheelgui.Frame.PageCounter

local stopButton = emotewheelgui.Frame.StopButton

local searchBar = emotewheelgui.Frame.SearchBar
local searchList = {}
local search = false
searchBar.Text = "Search"

local slot1 = slots[1]
local slot2 = slots[2]
local slot3 = slots[3]
local slot4 = slots[4]
local slot5 = slots[5]
local slot6 = slots[6]
local slot7 = slots[7]
local slot8 = slots[8]

for i = 1, #slots, 1 do
	slots[i].Text = ""
end


local pagesmax = math.ceil(#emotes / #slots) --math.ceil rounds up decimal or leaves it the same if not a decimal
local pageremainder = #emotes % #slots




for i = 1, #emotes, 1  do
	if i > 8 then
		break
	end
	
	slots[i].Text = emotes[i].Name
	
end



uis.InputBegan:Connect(function(key, used)

	if key.KeyCode == Enum.KeyCode.H and not emotewheelgui.Enabled and not used then
		
		counter.Text = factor .. " of " .. pagesmax
		search = false
		searchBar.Text = "Search"
		
		factor = 1
		counter.Text = factor .. " of " .. pagesmax
		
		backButton.Visible = true
		backButton.Active = true
		backButton.Interactable = true
		forwardButton.Visible = true
		forwardButton.Active = true
		forwardButton.Interactable = true
		counter.Visible = true
		
		
		
		for i = 1, #slots, 1 do --= (8-temp2 +1)


			slots[i].Active = true
			slots[i].Interactable = true
			slots[i].Visible = true
		end
		
		for i = 1, #emotes, 1  do
			if i > 8 then
				break
			end

			slots[i].Text = emotes[i].Name

		end
		
		for i = 1, #slots, 1 do
			if slots[i].Text == "" then
			--	slots[i].Active = false
			--	slots[i].Interactable = false
			else 
				slots[i].Active = true
				slots[i].Interactable = true
			end
		end
		
		
		emotewheelgui.Enabled = true
		
		

		
		
	elseif key.KeyCode == Enum.KeyCode.H and emotewheelgui.Enabled and not used then
		
		emotewheelgui.Enabled = false
		
	end
	
	
	
	
end)



function search()
	
end

slot1.MouseButton1Click:Connect(function()
	if emotes[1 + 8 * (factor-1)] ~= nil or searchList[1] ~= nil then
		if not search then

			animator:LoadAnimation(emotes[1 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[1]):Play()
		end
	end
	

end)

slot2.MouseButton1Click:Connect(function()
	if emotes[2 + 8 * (factor-1)] ~= nil or searchList[2] ~= nil then
		if not search then

			animator:LoadAnimation(emotes[2 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[2]):Play()
		end
	end
		
end)

slot3.MouseButton1Click:Connect(function()
	if emotes[3 + 8 * (factor-1)] ~= nil or searchList[3] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[3 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[3]):Play()
		end
	end

end)

slot4.MouseButton1Click:Connect(function()
	if emotes[4 + 8 * (factor-1)] ~= nil or searchList[4] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[4 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[4]):Play()

		end
	end

	
end)

slot5.MouseButton1Click:Connect(function()
	if emotes[5 + 8 * (factor-1)] ~= nil or searchList[5] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[5 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[5]):Play()
		end
	end

	
end)

slot6.MouseButton1Click:Connect(function()
	if emotes[6 + 8 * (factor-1)] ~= nil or searchList[6] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[6 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[6]):Play()
		end
	end


end)

slot7.MouseButton1Click:Connect(function()
	if emotes[7 + 8 * (factor-1)] ~= nil or searchList[7] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[7 + 8 * (factor-1)]):Play()
		else 


			animator:LoadAnimation(searchList[7]):Play()
		end
	end

	
end)

slot8.MouseButton1Click:Connect(function()
	if emotes[8 + 8 * (factor-1)] ~= nil or searchList[8] ~= nil then
		if not search then
			animator:LoadAnimation(emotes[8 + 8 * (factor-1)]):Play()
		else 

			animator:LoadAnimation(searchList[8]):Play()
		end
	end

	
end)


forwardButton.MouseButton1Click:Connect(function()
	

	
	
	if factor == pagesmax then
		return
	end
	
	
	for i = 1, #slots, 1 do --clears slots names
		slots[i].Text = ""
	end
	
	
	
	
	


	--this function needs to ensure factor doesnt go out of bounds
	factor += 1 -- factor changes what emote is on the slot
	
	counter.Text = factor .. " of " .. pagesmax
	

	for i = 1, #slots, 1  do --this loop changes the name on the slot
		if i + 8 * (factor-1) > #emotes then --this is a check that a nonexistent emote is not added to a slot
			break
		end

		slots[i].Text = emotes[i + 8 * (factor-1)].Name

	end
	
	
	for i = 1, #slots, 1 do
		if slots[i].Text == "" then
			slots[i].Active = false
			slots[i].Interactable = false
		else 
			slots[i].Active = true
			slots[i].Interactable = true
		end
	end
	

end)

backButton.MouseButton1Click:Connect(function()
	
	
	
	if factor == 1 then
		return
	end
	
	
	
	for i = 1, #slots, 1 do --clears slots names
		slots[i].Text = ""
	end
	
	
	--this function needs to ensure factor doesnt go out of bounds
	factor = factor - 1 -- factor changes what emote is on the slot
	
	
	counter.Text = factor .. " of " .. pagesmax

	for i = 1, #slots, 1  do --this loop changes the name on the slot
		if i + 8 * (factor-1) > #emotes then --this is a check that a nonexistent emote is not added to a slot
			break
		end

		slots[i].Text = emotes[i + 8 * (factor-1)].Name

	end
	
	for i = 1, #slots, 1 do
		if slots[i].Text == "" then
			slots[i].Active = false
			slots[i].Interactable = false
			--slots[i].Visible = false
		else 
			slots[i].Active = true
			slots[i].Interactable = true
			--slots[i].Visible = true
			
		end
	end

end)

stopButton.MouseButton1Click:Connect(function()
	for i,v in pairs(animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end)



searchBar:GetPropertyChangedSignal("Text"):Connect(function()
	
	if searchBar.Text == "Search" then
		return
	end
	
	backButton.Visible = false
	backButton.Active = false
	backButton.Interactable = false
	forwardButton.Visible = false
	forwardButton.Active = false
	forwardButton.Interactable = false
	counter.Visible = false
	
	
	for i = 1, #slots, 1 do --= (8-temp2 +1)
		slots[i].Active = true
		slots[i].Interactable = true
		slots[i].Visible = true
	end

	searchList = {}
	search = true
	
	for i = 1, #emotes, 1 do
		
		
		if string.find(string.lower(emotes[i].Name), string.lower(searchBar.Text)) then
			
			table.insert(searchList, emotes[i])
			
			
			
		end
	end
	
	if #searchList > 8 then
		local temp = #searchList
		for i = 9, temp, 1 do
			table.remove(searchList, 9)
		end
	end
	

		
	for i = 1, #searchList, 1  do
		
		slots[i].Text = searchList[i].Name
		
	end
	
	local temp2 = 8 - #searchList
	-- temp2 = 7
	
	-- t
	if temp2 ~= 0 then
		for i = (8-temp2 +1), 8, 1 do --= (8-temp2 +1) 8-7+1 = 2, 7, 
			slots[i].Active = false
			slots[i].Interactable = false
			slots[i].Visible = false
		end
	end
		
	
	
	
end)

searchBar.FocusLost:Connect(function()
	
	if searchBar.Text == "" then
		search = false
		searchBar.Text = "Search"
		
		for i = 1, #slots, 1 do --= (8-temp2 +1)

		
			slots[i].Active = true
			slots[i].Interactable = true
			slots[i].Visible = true
		end

		searchList = {}
		
		backButton.Visible = true
		backButton.Active = true
		backButton.Interactable = true
		forwardButton.Visible = true
		forwardButton.Active = true
		forwardButton.Interactable = true
		counter.Visible = true
		
		factor = 1
		counter.Text = factor .. " of " .. pagesmax
	end

	search = true
	

end)
	


--1,2,3,4,5,6,7,8 (1)
--9,10,11,12,13,14,15,16 (2)
--(1 to 8) + 8 * (pgnumber - 1)