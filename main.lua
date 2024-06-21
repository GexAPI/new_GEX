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

-- Compatibility Check

local Compatibility = {}

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local sc = (debug and debug.setconstant) or setconstant
local gc = (debug and debug.getconstants) or getconstants
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop

if not sethidden then
    Compatibility["sethidden"] = false
else
    Compatibility["sethidden"] = true
end
if not getnilinstances then
    Compatibility["getnilinstances"] = false
else
    Compatibility["getnilinstances"] = true
end
if not fireproximityprompt then
    Compatibility["fireproximityprompt"] = false
else
    Compatibility["fireproximityprompt"] = true
end
if not firetouchinterest then
    Compatibility["firetouchinterest"] = false
else
    Compatibility["firetouchinterest"] = true
end
if not fireclickdetector then
    Compatibility["fireclickdetector"] = false
else
    Compatibility["fireclickdetector"] = true
end
if not sc or not getgc or not gc then
    Compatibility["getgc"] = false
else
    Compatibility["getgc"] = true																																																																																																																																																																																																																																																																																																													
end
if not saveinstance or saveinstance() then
    Compatibility["saveinstance"] = false
else
    Compatibility["saveinstance"] = true
end
if not writefile then
    Compatibility["writefile"] = false
else
    Compatibility["writefile"] = true
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
if not queueteleport then
    Compatibility["queueteleport"] = false
else
    Compatibility["queueteleport"] = true
end
if not setfpscap then
    Compatibility["setfpscap"] = false
else
    Compatibility["setfpscap"] = true
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


