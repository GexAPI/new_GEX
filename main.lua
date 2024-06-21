--[[

  Welcome! This is a free to use API, you can use it in your scripts, with credit preferably. 
  Thanks to sources from Infinite Yield, Tiger Admin, and others.

  Made by the creators of GEX Toolbar.

]]

local CurrentVersion = "0.0.2"
local Old_Version = game:GetService("HttpService"):JSONDecode((game:HttpGet("https://raw.githubusercontent.com/TheXbots/new_GEX/main/Version.lua"))).Version

if not CurrentVersion == Old_Version then
    print("API is outdated! Please get latest version.")
end

local API = {}
local Toggleables = {}

local Player = game.Players.LocalPlayer

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

-- Compatibility Check

local Compatibility = {}

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local sc = (debug and debug.setconstant) or setconstant
local gc = (debug and debug.getconstants) or getconstants
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop

if not sethidden then
    Compatibility["sethidden"] = false
    API:Notif("'sethidden' command not available.",5)
else
    Compatibility["sethidden"] = true
end
if not getnilinstances then
    Compatibility["getnilinstances"] = false
	API:Notif("'getnilinstances' command not available.",5)
else
    Compatibility["getnilinstances"] = true
end
if not fireproximityprompt then
    Compatibility["fireproximityprompt"] = false
	API:Notif("'fireproximityprompt' command not available.",5)
else
    Compatibility["fireproximityprompt"] = true
end
if not firetouchinterest then
    Compatibility["firetouchinterest"] = false
	API:Notif("'firetouchinterest' command not available.",5)
else
    Compatibility["firetouchinterest"] = true
end
if not fireclickdetector then
    Compatibility["fireclickdetector"] = false
	API:Notif("'fireclickdetector' command not available.",5)
else
    Compatibility["fireclickdetector"] = true
end
if not sc or not getgc or not gc then
    Compatibility["getgc"] = false
	API:Notif("'getgc' command not available.",5)
else
    Compatibility["getgc"] = true																																																																																																																																																																																																																																																																																																													
end
if not saveinstance then
    Compatibility["saveinstance"] = false
	API:Notif("'saveinstance' command not available.",5)
else
    Compatibility["saveinstance"] = true
end
if not writefile then
    Compatibility["writefile"] = false
	API:Notif("'writefile' command not available.",5)
else
    Compatibility["writefile"] = true
end
if not getconnections then
    Compatibility["getconnections"] = false
	API:Notif("'getconnections' command not available.",5)
else
    Compatibility["getconnections"] = true
end
if not hookmetamethod then
    Compatibility["hookmetamethod"] = false
	API:Notif("'hookmetamethod' command not available.",5)
else
    Compatibility["hookmetamethod"] = true
end
if not getnamecallmethod then
    Compatibility["getnamecallmethod"] = false
	API:Notif("'getnamecallmethod' command not available.",5)
else
    Compatibility["getnamecallmethod"] = true
end
if not queueteleport then
    Compatibility["queueteleport"] = false
	API:Notif("'queueteleport' command not available.",5)
else
    Compatibility["queueteleport"] = true
end
if not setfpscap then
    Compatibility["setfpscap"] = false
	API:Notif("'setfpscap' command not available.",5)
else
    Compatibility["setfpscap"] = true
end
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

