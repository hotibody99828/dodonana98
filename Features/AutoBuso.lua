-- ==================================================
-- AUTO BUSO HAKI (ជាមួយ Config Save) - WITH SET
-- ==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

-- ==================================================
-- STATE
-- ==================================================
_G.YOKUDO_BusoEnabled = false
_G.YOKUDO_BusoLoopConnection = nil
_G.YOKUDO_BusoCharConnection = nil

-- ==================================================
-- CHECK BUSO
-- ==================================================
local function IsBusoOn()
    local username = Player.Name
    local character = workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(username)
    if character then
        return character:FindFirstChild("HasBuso") ~= nil
    end
    return false
end

-- ==================================================
-- TURN ON BUSO
-- ==================================================
local function TurnOnBuso()
    local Remote = ReplicatedStorage:FindFirstChild("Remotes")
    if Remote then
        local CommF = Remote:FindFirstChild("CommF_")
        if CommF then
            pcall(function()
                CommF:InvokeServer("Buso")
            end)
        end
    end
end

-- ==================================================
-- START AUTO BUSO
-- ==================================================
function startAutoBuso()
    if _G.YOKUDO_BusoLoopConnection then return end
    TurnOnBuso()
    _G.YOKUDO_BusoLoopConnection = RunService.Stepped:Connect(function()
        if not _G.YOKUDO_BusoEnabled then return end
        if not IsBusoOn() then
            TurnOnBuso()
        end
    end)
    _G.YOKUDO_BusoCharConnection = Player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if _G.YOKUDO_BusoEnabled then TurnOnBuso() end
    end)
end

-- ==================================================
-- STOP AUTO BUSO
-- ==================================================
function stopAutoBuso()
    if _G.YOKUDO_BusoLoopConnection then 
        _G.YOKUDO_BusoLoopConnection:Disconnect() 
        _G.YOKUDO_BusoLoopConnection = nil 
    end
    if _G.YOKUDO_BusoCharConnection then 
        _G.YOKUDO_BusoCharConnection:Disconnect() 
        _G.YOKUDO_BusoCharConnection = nil 
    end
end

-- ==================================================
-- ⭐ SET FUNCTION (សម្រាប់ ConfigManager)
-- ==================================================
function _G.YOKUDO_SetBuso(enabled)
    if enabled == _G.YOKUDO_BusoEnabled then return end
    
    _G.YOKUDO_BusoEnabled = enabled
    if enabled then
        startAutoBuso()
        print("✅ Auto Buso: ON")
    else
        stopAutoBuso()
        print("❌ Auto Buso: OFF")
    end
    
    if _G.YOKUDO_UpdateUI_Buso then
        _G.YOKUDO_UpdateUI_Buso(enabled)
    end
    
    if _G.YOKUDO_UpdateConfig then
        _G.YOKUDO_UpdateConfig("AutoBuso", enabled)
    end
end

-- ==================================================
-- TOGGLE FUNCTION
-- ==================================================
function _G.YOKUDO_ToggleAutoBuso()
    _G.YOKUDO_SetBuso(not _G.YOKUDO_BusoEnabled)
end

-- ==================================================
-- STATE (ប្រើ or false ដើម្បីកុំឲ្យ Reset)
-- ==================================================
_G.YOKUDO_BusoEnabled = _G.YOKUDO_BusoEnabled or false

print("✅ AutoBuso Loaded (Config Ready - With Set)")
