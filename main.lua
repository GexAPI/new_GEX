--[[

  Welcome! This is a free to use API, you can use it in your scripts, with credit preferably. 
  Thanks to sources from Infinite Yield, Tiger Admin, and others.

  Made by the creators of GEX Toolbar.

]]

local API = {}

function API:Tween(Obj, Prop, New, Time)
	if not Time then
		Time = .5
	end
	local TweenService = game:GetService("TweenService")
	local info = TweenInfo.new(
		Time, 
		Enum.EasingStyle.Quart, 
		Enum.EasingDirection.Out, 
		0, 
		false,
		0
	)
	local propertyTable = {
		[Prop] = New,
	}

	TweenService:Create(Obj, info, propertyTable):Play()
end

function API:Notif(Text,Dur)
	task.spawn(function()
		if not Dur then
			Dur = 1.5
		end
		local Notif = Instance.new("ScreenGui")
		local Frame_1 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		Notif.Parent = (game:GetService("CoreGui") or gethui())
		Notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame_1.Parent = Notif
		Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame_1.BackgroundTransparency=1
		Frame_1.BorderSizePixel = 0
		Frame_1.Position = UDim2.new(0, 0, 0.0500000007, 0)
		Frame_1.Size = UDim2.new(1, 0, 0.100000001, 0)
		TextLabel.Parent = Frame_1
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.TextTransparency =1
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Highway
		TextLabel.Text = Text or "Text not found"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 21.000
		API:Tween(Frame_1,"BackgroundTransparency",0.350,.5)
		API:Tween(TextLabel,"TextTransparency",0,.5)
		wait(Dur+.7)
		API:Tween(Frame_1,"BackgroundTransparency",1,.5)
		API:Tween(TextLabel,"TextTransparency",1,.5)
		wait(.7)
		Notif:Destroy()
	end)
	return
end

local CurrentVersion = "0.0.3"
local Old_Version = game:GetService("HttpService"):JSONDecode((game:HttpGet("https://raw.githubusercontent.com/TheXbots/new_GEX/main/Version.lua"))).Version

if not CurrentVersion == Old_Version then
    print("API is outdated! Please get latest version.")
end

API.Toggleables = {}

local Player = game.Players.LocalPlayer

local CheckCompatibility = true -- IF YOU CHECK THIS TO FALSE, IT WILL ALMOST GUARANTEE A SCRIPT BREAK
local OverrideCompatibility = false -- This will automatically make it assume each function exists.

local Compatibility = {}
-- Compatibility Check
if CheckCompatibility == true then
    local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
    local sc = (debug and debug.setconstant) or setconstant
    local gc = (debug and debug.getconstants) or getconstants
    local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop

    if not sethidden then
        Compatibility["sethidden"] = false
        API:Notif("'sethidden' command not available.",5)
    else
        Compatibility["sethidden"] = true
        API:Notif("'sethidden' command available.",5)
    end
    wait(0.8)
    if not getnilinstances then
        Compatibility["getnilinstances"] = false
        API:Notif("'getnilinstances' command not available.",5)
    else
        Compatibility["getnilinstances"] = true
        API:Notif("'getnilinstances' command available.",5)
    end
    wait(0.8)
    if not fireproximityprompt then
        Compatibility["fireproximityprompt"] = false
        API:Notif("'fireproximityprompt' command not available.",5)
    else
        Compatibility["fireproximityprompt"] = true
        API:Notif("'fireproximityprompt' command available.",5)
    end
    wait(0.8)
    if not firetouchinterest then
        Compatibility["firetouchinterest"] = false
        API:Notif("'firetouchinterest' command not available.",5)
    else
        Compatibility["firetouchinterest"] = true
        API:Notif("'firetouchinterest' command available.",5)
    end
    wait(0.8)
    if not fireclickdetector then
        Compatibility["fireclickdetector"] = false
        API:Notif("'fireclickdetector' command not available.",5)
    else
        Compatibility["fireclickdetector"] = true
        API:Notif("'fireclickdetector' command available.",5)
    end
    wait(0.8)
    if not sc or not getgc or not gc then
        Compatibility["getgc"] = false
        API:Notif("'getgc' command not available.",5)
    else
        Compatibility["getgc"] = true
        API:Notif("'getgc' command available.",5)																																																																																																																																																																																																																																																																																																													
    end
    wait(0.8)
    if not saveinstance then
        Compatibility["saveinstance"] = false
        API:Notif("'saveinstance' command not available.",5)
    else
        Compatibility["saveinstance"] = true
        API:Notif("'saveinstance' command available.",5)
    end
    wait(0.8)
    if not writefile then
        Compatibility["writefile"] = false
        API:Notif("'writefile' command not available.",5)
    else
        Compatibility["writefile"] = true
        API:Notif("'writefile' command available.",5)
    end
    wait(0.8)
    if not getconnections then
        Compatibility["getconnections"] = false
        API:Notif("'getconnections' command not available.",5)
    else
        Compatibility["getconnections"] = true
        API:Notif("'getconnections' command available.",5)
    end
    wait(0.8)
    if not hookmetamethod then
        Compatibility["hookmetamethod"] = false
        API:Notif("'hookmetamethod' command not available.",5)
    else
        Compatibility["hookmetamethod"] = true
        API:Notif("'hookmetamethod' command available.",5)
    end
    wait(0.8)
    if not getnamecallmethod then
        Compatibility["getnamecallmethod"] = false
        API:Notif("'getnamecallmethod' command not available.",5)
    else
        Compatibility["getnamecallmethod"] = true
        API:Notif("'getnamecallmethod' command available.",5)
    end
    wait(0.8)
    if not queueteleport then
        Compatibility["queueteleport"] = false
        API:Notif("'queueteleport' command not available.",5)
    else
        Compatibility["queueteleport"] = true
        API:Notif("'queueteleport' command available.",5)
    end
    wait(0.8)
    if not setfpscap then
        Compatibility["setfpscap"] = false
        API:Notif("'setfpscap' command not available.",5)
    else
        Compatibility["setfpscap"] = true
        API:Notif("'setfpscap' command available.",5)
    end
    wait(0.8)
    local GameEnvironment

    if not ((getgenv and getgenv()) or _G) then
        Compatibility["getgenv"] = false
        API:Notif("'getgenv' command not available.",5)
    else
        if not (getgenv and getgenv()) then
            GameEnvironment = _G
        else
            GameEnvironment = getgenv()
        end

        Compatibility["getgenv"] = true

        API:Notif("'getgenv' command available.",5)
    end
    local counter = 0
    for i,v in pairs(Compatibility) do
        if v == false then
            counter += 1
        end
    end

    if #Compatibility/2 < counter then
        API:Notif("Your executor lacks many crucial functions.",5)
    end
else
    if OverrideCompatibility == true then
        if not (getgenv and getgenv()) then
            GameEnvironment = _G
        else
            GameEnvironment = getgenv()
        end
        Compatibility["getgenv"] = true
        Compatibility["setfpscap"] = true
        Compatibility["queueteleport"] = true
        Compatibility["getnamecallmethod"] = true
        Compatibility["hookmetamethod"] = true
        Compatibility["getconnections"] = true
        Compatibility["writefile"] = true
        Compatibility["saveinstance"] = true
        Compatibility["getgc"] = true
        Compatibility["fireclickdetector"] = true
        Compatibility["firetouchinterest"] = true
        Compatibility["fireproximityprompt"] = true
        Compatibility["getnilinstances"] = true
        Compatibility["sethidden"] = true
    else
        Compatibility["getgenv"] = false
        Compatibility["setfpscap"] = false
        Compatibility["queueteleport"] = false
        Compatibility["getnamecallmethod"] = false
        Compatibility["hookmetamethod"] = false
        Compatibility["getconnections"] = false
        Compatibility["writefile"] = false
        Compatibility["saveinstance"] = false
        Compatibility["getgc"] = false
        Compatibility["fireclickdetector"] = false
        Compatibility["firetouchinterest"] = false
        Compatibility["fireproximityprompt"] = false
        Compatibility["getnilinstances"] = false
        Compatibility["sethidden"] = false
    end
end

-- Area where I create all the toggleables for things like Flying, Noclip, ect

API.Toggleables["Flying"] = false
API.Toggleables["Noclip"] = false
API.Toggleables["God"] = false
API.Toggleables["Invis"] = false
API.Toggleables["InfJump"] = false


-- This is the functions area. You can call them with API:FunctionName() and any variable names

--[[

      TOGGLEABLE VARIABLES SECTION

]]

function API:Toggle(value, type, newvalue)
	if type == "boolean" then
	     API.Toggleables[value] = not API.Toggleables[value]
	elseif type == "string" then
	     API.Toggleables[value] = newvalue
	elseif not type then
	     API.Toggleables[value] = not API.Toggleables[value]
	end
end

-- initialize the toggles

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

for i,v in pairs(Compatibility) do
    print(v)
end
