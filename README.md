# DevilsHubCracked

Devils Hub is a free script hub released mainly for having a pretty good list of games. The only issue is, they log ips and log them to a webhook.
![image](https://user-images.githubusercontent.com/37047409/199883389-19a2625f-69b3-4b0d-a2fb-67ff37b56957.png)
![image](https://user-images.githubusercontent.com/37047409/199883935-8c366231-0560-43c4-8d19-ff7b520007ef.png)

(We already deleted the webhook)

They log ips in a public github and use that as a blacklist system.
(This script Bypasses all blacklists + loggers)

So I've released a script that bypasses pretty much anything logging you if you still want to use this hub securely.

What this blocks:
IP LOGGERS
BLACKLIST SYSTEMS
GROUP CHECK
KICKS

This script also bypasses their really bad key system + autofilling it out for you.

Here's the Bypass script:
```lua
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
```
