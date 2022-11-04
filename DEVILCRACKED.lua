--Documented with comments so you know what the script is doing

local old
old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod() -- Gets the name of the function its calling
    local args = {...} -- Gets the table of the called arguments
    
    if method == "HttpGet" and args[1]:find("api.ipify.org") then
        --This checks if it's doing an HttpGet on the Site that its mainly logging your ip from, then it returns nil blocking your ip from sending back.
        return nil
    end
    if method == "HttpGet" and args[1]:find("webhook") then
        --This checks to see if a request is trying to make you send a webhook, and then blocks it.
        return nil
    end
    
    
    local ReturnNothing = {'KADAIPBLACKLISTGARXA', 'DEVIL-Black-Listed-Players', 'Niggas-Was-Here'}
    for _,v in pairs(ReturnNothing) do
        if method == "HttpGet" and args[1]:find(v) then
            return {}
        end
    end
    --What this does is it goes through all the blacklists they have and bypasses them.
    
    
    if method == "IsInGroup" and self == game:GetService("Players").LocalPlayer then
        --Since the script requires you to be in a certain group, this will return true; making the script think you're actually in the group
        return true
    end
    
    if method:lower() == "kick" and self == game:GetService("Players").LocalPlayer and checkcaller() then
        -- This checks if the script is trying to kick you, and then sends back a nil request to prevent it from kicking you.
        -- checkcaller() means that if the script is actually coming from a Executed script (not scripts coming from inside the games)
        return nil
    end
    
    return old(self, ...) -- Returning the original response if it passes the checks
end))

-- Hooks another check for if you're in the group if the first one didn't work.
hookfunction(game:GetService("Players").LocalPlayer.IsInGroup, function()
    return true
end)

--Runs a saved copy of the script so he can't update stuff
--(NOT RECOMMENDED TO RUN THIS LOADSTRING ALONE)
loadstring(game:HttpGet("https://raw.githubusercontent.com/harunscripts/DevilsHubCracked/main/DONTRUNTHIS.lua"))()


--Hooks any checks for dex
delay(1, function()
    for i,v in pairs(getconnections(game.CoreGui.ChildAdded)) do
        v:Disable()
    end
end)

--Automatically fills the key out for you.
local CGui = game:GetService("CoreGui")
CGui:WaitForChild("DEVIL Hub"):WaitForChild("Main Frame"):WaitForChild("InsertKey").Text = "YY76Gr4HW4FGhwQbYJ26"
