--[[

  Welcome! This is a free to use API, you can use it in your scripts, with credit preferably. 
  Thanks to sources from Infinite Yield, Tiger Admin, and others.

  Made by the creators of GEX Toolbar.

]]

local Version = 0.0.1

local API = {}
local Toggleables = {}

-- Compatibility Check

local Compatibility = {}

if not ((getgenv and getgenv()) or _G) then
	
end

if not getconnections then
    Compatibility["getconnections"] = false
else
    Compatibility["getconnections"] = true
end
if not hookmetamethod then
    Compatibility["hookmetamethod"] = false
else
    Compatibility["hookmetamethod"] = true
end
if not getnamecallmethod then
    Compatibility["getnamecallmethod"] = false
else
    Compatibility["getnamecallmethod"] = true
end
local GameEnvironment

if not ((getgenv and getgenv()) or _G) then
    Compatibility["getgenv"] = false
else
    if not (getgenv and getgenv()) then
        GameEnvironment = _G
    else
        GameEnvironment = getgenv()
    end

    Compatibility["getgenv"] = true
end

local Player = game.Players.LocalPlayer


-- Area where I create all the toggleables for things like Flying, Noclip, ect



-- This is the functions area. You can call them with API:FunctionName() and any variable names

--[[

      TOGGLEABLE VARIABLES SECTION

]]

function API:Toggle(value, type, newvalue)
    if type == "boolean" then
        API.Toggleables[value] = not API.Toggleables[value]
    elseif type == "string" then
        API.Toggleables[value] = newvalue
    end
end

-- initialize the toggles

if invisRunning then return end
	invisRunning = true
	-- Full credit to AmokahFox @V3rmillion
	local Player = speaker
	repeat wait(.1) until Player.Character
	local Character = Player.Character
	Character.Archivable = true
	local IsInvis = false
	local IsRunning = true
	local InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = Lighting
	local Void = workspace.FallenPartsDestroyHeight
	InvisibleCharacter.Name = ""
	local CF

	local invisFix = RunService.Stepped:Connect(function()
		pcall(function()
			local IsInteger
			if tostring(Void):find'-' then
				IsInteger = true
			else
				IsInteger = false
			end
			local Pos = Player.Character.HumanoidRootPart.Position
			local Pos_String = tostring(Pos)
			local Pos_Seperate = Pos_String:split(', ')
			local X = tonumber(Pos_Seperate[1])
			local Y = tonumber(Pos_Seperate[2])
			local Z = tonumber(Pos_Seperate[3])
			if IsInteger == true then
				if Y <= Void then
					Respawn()
				end
			elseif IsInteger == false then
				if Y >= Void then
					Respawn()
				end
			end
		end)
	end)

	for i,v in pairs(InvisibleCharacter:GetDescendants())do
		if v:IsA("BasePart") then
			if v.Name == "HumanoidRootPart" then
				v.Transparency = 1
			else
				v.Transparency = .5
			end
		end
	end

	function Respawn()
		IsRunning = false
		if IsInvis == true then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				IsInvis = false
				InvisibleCharacter.Parent = nil
				invisRunning = false
			end)
		elseif IsInvis == false then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				TurnVisible()
			end)
		end
	end

	local invisDied
	invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
		Respawn()
		invisDied:Disconnect()
	end)

	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
	Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = Lighting
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	execCmd('fixcam')
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false

	function TurnVisible()
		if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
		CF = workspace.CurrentCamera.CFrame
		Character = Character
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end

--[[

      PLAYER FUNCTIONS

]]

function API:Speed(speed)
  Player.Character.Humanoid.WalkSpeed = speed --[[  Calls the Humanoid, then WalkSpeed. ]]
end

function API:JumpPower(power)
  Player.Character.Humanoid.JumpPower = power
end

--[[

      WORKSPACE FUNCTIONS

]]

function API:Gravity(grav)
  workspace.Gravity = grav
end


