-- ==================================================
-- CONFIG MANAGER (SEA2) - WITH SET FUNCTIONS
-- ==================================================

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- ==================================================
-- CONFIG PATH (ប្រើ Username)
-- ==================================================
local CONFIG_FOLDER = "YOKUDOSEA2/"
local CONFIG_FILE = CONFIG_FOLDER .. Player.Name .. ".json"

-- ==================================================
-- CREATE FOLDER IF NOT EXISTS
-- ==================================================
pcall(function()
    if makefolder then
        makefolder(CONFIG_FOLDER)
    end
end)

-- ==================================================
-- DEFAULT CONFIG (តែ Features ប៉ុណ្ណោះ)
-- ==================================================
local DEFAULT = {
    AutoBuso = true,
    AutoDarkBeard = false,
    AutoCursedCaptain = false,
    AutoCore = false,
    WalkOnWater = false,
    AutoClickAttack = false,
    AutoBuySword = false,
    AutoUnlockHaki = false,
    WeaponType = "Melee",
}

-- ==================================================
-- INIT
-- ==================================================
_G.YOKUDO_Config = _G.YOKUDO_Config or {}

-- ==================================================
-- LOAD CONFIG
-- ==================================================
function _G.YOKUDO_LoadConfig()
    print("📁 Loading config for: " .. Player.Name)
    print("📁 Config file: " .. CONFIG_FILE)
    
    local json = nil
    
    if readfile then
        local ok, data = pcall(readfile, CONFIG_FILE)
        if ok then json = data end
    elseif syn and syn.crypt then
        local ok, data = pcall(syn.crypt.custom_readfile, CONFIG_FILE)
        if ok then json = data end
    end
    
    if json and json ~= "" then
        local config = HttpService:JSONDecode(json)
        if config then
            for k, v in pairs(DEFAULT) do
                _G.YOKUDO_Config[k] = config[k] ~= nil and config[k] or v
            end
            
            print("✅ Config Loaded for: " .. Player.Name)
            print("   AutoBuso: " .. tostring(_G.YOKUDO_Config.AutoBuso))
            print("   AutoDarkBeard: " .. tostring(_G.YOKUDO_Config.AutoDarkBeard))
            print("   AutoCursedCaptain: " .. tostring(_G.YOKUDO_Config.AutoCursedCaptain))
            print("   AutoCore: " .. tostring(_G.YOKUDO_Config.AutoCore))
            print("   WalkOnWater: " .. tostring(_G.YOKUDO_Config.WalkOnWater))
            print("   AutoClickAttack: " .. tostring(_G.YOKUDO_Config.AutoClickAttack))
            print("   AutoBuySword: " .. tostring(_G.YOKUDO_Config.AutoBuySword))
            print("   AutoUnlockHaki: " .. tostring(_G.YOKUDO_Config.AutoUnlockHaki))
            print("   WeaponType: " .. tostring(_G.YOKUDO_Config.WeaponType))
            return
        end
    end
    
    print("📁 No config found for: " .. Player.Name .. ", creating default...")
    for k, v in pairs(DEFAULT) do
        _G.YOKUDO_Config[k] = v
    end
    _G.YOKUDO_SaveConfig()
end

-- ==================================================
-- SAVE CONFIG
-- ==================================================
function _G.YOKUDO_SaveConfig()
    local json = HttpService:JSONEncode(_G.YOKUDO_Config)
    
    if writefile then
        writefile(CONFIG_FILE, json)
    elseif syn and syn.crypt then
        syn.crypt.custom_writefile(CONFIG_FILE, json)
    end
    
    print("✅ Config Saved for: " .. Player.Name)
    print("   File: " .. CONFIG_FILE)
    print("   AutoBuso: " .. tostring(_G.YOKUDO_Config.AutoBuso))
    print("   WeaponType: " .. tostring(_G.YOKUDO_Config.WeaponType))
end

-- ==================================================
-- UPDATE SINGLE CONFIG
-- ==================================================
function _G.YOKUDO_UpdateConfig(key, value)
    _G.YOKUDO_Config[key] = value
    _G.YOKUDO_SaveConfig()
end

-- ==================================================
-- CHECK IF CONFIG EXISTS
-- ==================================================
function _G.YOKUDO_ConfigExists()
    local json = nil
    if readfile then
        local ok, data = pcall(readfile, CONFIG_FILE)
        if ok then json = data end
    elseif syn and syn.crypt then
        local ok, data = pcall(syn.crypt.custom_readfile, CONFIG_FILE)
        if ok then json = data end
    end
    return json and json ~= ""
end

-- ==================================================
-- DELETE CONFIG
-- ==================================================
function _G.YOKUDO_DeleteConfig()
    pcall(function()
        if writefile then
            writefile(CONFIG_FILE, "")
        elseif syn and syn.crypt then
            syn.crypt.custom_writefile(CONFIG_FILE, "")
        end
        print("🗑️ Config deleted for: " .. Player.Name)
    end)
end

-- ==================================================
-- CHECK FEATURE READY
-- ==================================================
local function IsFeatureReady(featureName)
    if featureName == "AutoBuso" then
        return _G.YOKUDO_SetBuso ~= nil
    elseif featureName == "WalkOnWater" then
        return _G.YOKUDO_SetWalk ~= nil or _G.YOKUDO_ToggleWalkOnWater ~= nil
    elseif featureName == "AutoDarkBeard" then
        return _G.YOKUDO_SetDarkBeard ~= nil or _G.YOKUDO_ToggleAutoDarkBeard ~= nil
    elseif featureName == "AutoCursedCaptain" then
        return _G.YOKUDO_SetCursedCaptain ~= nil or _G.YOKUDO_ToggleAutoCursedCaptain ~= nil
    elseif featureName == "AutoCore" then
        return _G.YOKUDO_SetCore ~= nil or _G.YOKUDO_ToggleAutoCore ~= nil
    elseif featureName == "AutoClickAttack" then
        return _G.YOKUDO_SetClickAttack ~= nil or _G.YOKUDO_ToggleAutoClickAttack ~= nil
    elseif featureName == "AutoBuySword" then
        return _G.YOKUDO_SetBuySword ~= nil or _G.YOKUDO_ToggleAutoBuySword ~= nil
    elseif featureName == "AutoUnlockHaki" then
        return _G.YOKUDO_SetUnlockHaki ~= nil or _G.YOKUDO_ToggleAutoUnlockHaki ~= nil
    end
    return false
end

-- ==================================================
-- APPLY CONFIG WITH RETRY (ប្រើ Set Functions)
-- ==================================================
function _G.YOKUDO_ApplyConfig()
    print("🔄 Applying config for: " .. Player.Name)
    
    local c = _G.YOKUDO_Config
    
    -- ==============================================
    -- AUTO BUSO
    -- ==============================================
    local busoState = c.AutoBuso
    if _G.YOKUDO_SetBuso then
        _G.YOKUDO_SetBuso(busoState)
        print("✅ Auto Buso set to: " .. tostring(busoState))
    else
        print("⚠️ Auto Buso Set function not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetBuso then
                    _G.YOKUDO_SetBuso(busoState)
                    print("✅ Auto Buso set to: " .. tostring(busoState) .. " (retry " .. retryCount .. ")")
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_Buso then
        _G.YOKUDO_UpdateUI_Buso(busoState)
    end
    
    -- ==============================================
    -- WALK ON WATER
    -- ==============================================
    local walkState = c.WalkOnWater
    if _G.YOKUDO_SetWalk then
        _G.YOKUDO_SetWalk(walkState)
        print("✅ Walk on Water set to: " .. tostring(walkState))
    else
        print("⚠️ Walk on Water Set function not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetWalk then
                    _G.YOKUDO_SetWalk(walkState)
                    print("✅ Walk on Water set to: " .. tostring(walkState) .. " (retry " .. retryCount .. ")")
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_Walk then
        _G.YOKUDO_UpdateUI_Walk(walkState)
    end
    
    -- ==============================================
    -- AUTO DARKBEARD (ប្រើ Set Function)
    -- ==============================================
    local darkBeardState = c.AutoDarkBeard
    if _G.YOKUDO_SetDarkBeard then
        _G.YOKUDO_SetDarkBeard(darkBeardState)
        print("✅ Auto DarkBeard set to: " .. tostring(darkBeardState))
    elseif _G.YOKUDO_ToggleAutoDarkBeard then
        if darkBeardState and not _G.YOKUDO_AutoDarkBeardEnabled then
            _G.YOKUDO_ToggleAutoDarkBeard()
            print("✅ Auto DarkBeard started from config")
        elseif not darkBeardState and _G.YOKUDO_AutoDarkBeardEnabled then
            _G.YOKUDO_ToggleAutoDarkBeard()
            print("❌ Auto DarkBeard stopped from config")
        end
    else
        print("⚠️ Auto DarkBeard not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetDarkBeard then
                    _G.YOKUDO_SetDarkBeard(darkBeardState)
                    print("✅ Auto DarkBeard set to: " .. tostring(darkBeardState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoDarkBeard then
                    if darkBeardState and not _G.YOKUDO_AutoDarkBeardEnabled then
                        _G.YOKUDO_ToggleAutoDarkBeard()
                        print("✅ Auto DarkBeard started from config (retry " .. retryCount .. ")")
                    elseif not darkBeardState and _G.YOKUDO_AutoDarkBeardEnabled then
                        _G.YOKUDO_ToggleAutoDarkBeard()
                        print("❌ Auto DarkBeard stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_DarkBeard then
        _G.YOKUDO_UpdateUI_DarkBeard(darkBeardState)
    end
    
    -- ==============================================
    -- AUTO CURSED CAPTAIN (ប្រើ Set Function)
    -- ==============================================
    local cursedCaptainState = c.AutoCursedCaptain
    if _G.YOKUDO_SetCursedCaptain then
        _G.YOKUDO_SetCursedCaptain(cursedCaptainState)
        print("✅ Auto Cursed Captain set to: " .. tostring(cursedCaptainState))
    elseif _G.YOKUDO_ToggleAutoCursedCaptain then
        if cursedCaptainState and not _G.YOKUDO_AutoCursedCaptainEnabled then
            _G.YOKUDO_ToggleAutoCursedCaptain()
            print("✅ Auto Cursed Captain started from config")
        elseif not cursedCaptainState and _G.YOKUDO_AutoCursedCaptainEnabled then
            _G.YOKUDO_ToggleAutoCursedCaptain()
            print("❌ Auto Cursed Captain stopped from config")
        end
    else
        print("⚠️ Auto Cursed Captain not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetCursedCaptain then
                    _G.YOKUDO_SetCursedCaptain(cursedCaptainState)
                    print("✅ Auto Cursed Captain set to: " .. tostring(cursedCaptainState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoCursedCaptain then
                    if cursedCaptainState and not _G.YOKUDO_AutoCursedCaptainEnabled then
                        _G.YOKUDO_ToggleAutoCursedCaptain()
                        print("✅ Auto Cursed Captain started from config (retry " .. retryCount .. ")")
                    elseif not cursedCaptainState and _G.YOKUDO_AutoCursedCaptainEnabled then
                        _G.YOKUDO_ToggleAutoCursedCaptain()
                        print("❌ Auto Cursed Captain stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_CursedCaptain then
        _G.YOKUDO_UpdateUI_CursedCaptain(cursedCaptainState)
    end
    
    -- ==============================================
    -- AUTO CORE (ប្រើ Set Function)
    -- ==============================================
    local coreState = c.AutoCore
    if _G.YOKUDO_SetCore then
        _G.YOKUDO_SetCore(coreState)
        print("✅ Auto Core set to: " .. tostring(coreState))
    elseif _G.YOKUDO_ToggleAutoCore then
        if coreState and not _G.YOKUDO_AutoCoreEnabled then
            _G.YOKUDO_ToggleAutoCore()
            print("✅ Auto Core started from config")
        elseif not coreState and _G.YOKUDO_AutoCoreEnabled then
            _G.YOKUDO_ToggleAutoCore()
            print("❌ Auto Core stopped from config")
        end
    else
        print("⚠️ Auto Core not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetCore then
                    _G.YOKUDO_SetCore(coreState)
                    print("✅ Auto Core set to: " .. tostring(coreState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoCore then
                    if coreState and not _G.YOKUDO_AutoCoreEnabled then
                        _G.YOKUDO_ToggleAutoCore()
                        print("✅ Auto Core started from config (retry " .. retryCount .. ")")
                    elseif not coreState and _G.YOKUDO_AutoCoreEnabled then
                        _G.YOKUDO_ToggleAutoCore()
                        print("❌ Auto Core stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_Core then
        _G.YOKUDO_UpdateUI_Core(coreState)
    end
    
    -- ==============================================
    -- AUTO CLICK ATTACK (ប្រើ Set Function)
    -- ==============================================
    local clickState = c.AutoClickAttack
    if _G.YOKUDO_SetClickAttack then
        _G.YOKUDO_SetClickAttack(clickState)
        print("✅ Auto Click Attack set to: " .. tostring(clickState))
    elseif _G.YOKUDO_ToggleAutoClickAttack then
        if clickState and not _G.YOKUDO_AutoClickAttackEnabled then
            _G.YOKUDO_ToggleAutoClickAttack()
            print("✅ Auto Click Attack started from config")
        elseif not clickState and _G.YOKUDO_AutoClickAttackEnabled then
            _G.YOKUDO_ToggleAutoClickAttack()
            print("❌ Auto Click Attack stopped from config")
        end
    else
        print("⚠️ Auto Click Attack not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetClickAttack then
                    _G.YOKUDO_SetClickAttack(clickState)
                    print("✅ Auto Click Attack set to: " .. tostring(clickState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoClickAttack then
                    if clickState and not _G.YOKUDO_AutoClickAttackEnabled then
                        _G.YOKUDO_ToggleAutoClickAttack()
                        print("✅ Auto Click Attack started from config (retry " .. retryCount .. ")")
                    elseif not clickState and _G.YOKUDO_AutoClickAttackEnabled then
                        _G.YOKUDO_ToggleAutoClickAttack()
                        print("❌ Auto Click Attack stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_ClickAttack then
        _G.YOKUDO_UpdateUI_ClickAttack(clickState)
    end
    
    -- ==============================================
    -- AUTO BUY SWORD (ប្រើ Set Function)
    -- ==============================================
    local buySwordState = c.AutoBuySword
    if _G.YOKUDO_SetBuySword then
        _G.YOKUDO_SetBuySword(buySwordState)
        print("✅ Auto Buy Sword set to: " .. tostring(buySwordState))
    elseif _G.YOKUDO_ToggleAutoBuySword then
        if buySwordState and not _G.YOKUDO_AutoBuySwordEnabled then
            _G.YOKUDO_ToggleAutoBuySword()
            print("✅ Auto Buy Sword started from config")
        elseif not buySwordState and _G.YOKUDO_AutoBuySwordEnabled then
            _G.YOKUDO_ToggleAutoBuySword()
            print("❌ Auto Buy Sword stopped from config")
        end
    else
        print("⚠️ Auto Buy Sword not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetBuySword then
                    _G.YOKUDO_SetBuySword(buySwordState)
                    print("✅ Auto Buy Sword set to: " .. tostring(buySwordState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoBuySword then
                    if buySwordState and not _G.YOKUDO_AutoBuySwordEnabled then
                        _G.YOKUDO_ToggleAutoBuySword()
                        print("✅ Auto Buy Sword started from config (retry " .. retryCount .. ")")
                    elseif not buySwordState and _G.YOKUDO_AutoBuySwordEnabled then
                        _G.YOKUDO_ToggleAutoBuySword()
                        print("❌ Auto Buy Sword stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_BuySword then
        _G.YOKUDO_UpdateUI_BuySword(buySwordState)
    end
    
    -- ==============================================
    -- AUTO UNLOCK HAKI (ប្រើ Set Function)
    -- ==============================================
    local unlockHakiState = c.AutoUnlockHaki
    if _G.YOKUDO_SetUnlockHaki then
        _G.YOKUDO_SetUnlockHaki(unlockHakiState)
        print("✅ Auto Unlock Haki set to: " .. tostring(unlockHakiState))
    elseif _G.YOKUDO_ToggleAutoUnlockHaki then
        if unlockHakiState and not _G.YOKUDO_AutoUnlockHakiEnabled then
            _G.YOKUDO_ToggleAutoUnlockHaki()
            print("✅ Auto Unlock Haki started from config")
        elseif not unlockHakiState and _G.YOKUDO_AutoUnlockHakiEnabled then
            _G.YOKUDO_ToggleAutoUnlockHaki()
            print("❌ Auto Unlock Haki stopped from config")
        end
    else
        print("⚠️ Auto Unlock Haki not ready, will retry...")
        task.spawn(function()
            local maxRetry = 5
            local retryCount = 0
            while retryCount < maxRetry do
                task.wait(0.5)
                retryCount = retryCount + 1
                if _G.YOKUDO_SetUnlockHaki then
                    _G.YOKUDO_SetUnlockHaki(unlockHakiState)
                    print("✅ Auto Unlock Haki set to: " .. tostring(unlockHakiState) .. " (retry " .. retryCount .. ")")
                    break
                elseif _G.YOKUDO_ToggleAutoUnlockHaki then
                    if unlockHakiState and not _G.YOKUDO_AutoUnlockHakiEnabled then
                        _G.YOKUDO_ToggleAutoUnlockHaki()
                        print("✅ Auto Unlock Haki started from config (retry " .. retryCount .. ")")
                    elseif not unlockHakiState and _G.YOKUDO_AutoUnlockHakiEnabled then
                        _G.YOKUDO_ToggleAutoUnlockHaki()
                        print("❌ Auto Unlock Haki stopped from config (retry " .. retryCount .. ")")
                    end
                    break
                end
            end
        end)
    end
    if _G.YOKUDO_UpdateUI_UnlockHaki then
        _G.YOKUDO_UpdateUI_UnlockHaki(unlockHakiState)
    end
    
    -- ==============================================
    -- ⭐ WEAPON TYPE (ប្រើ SetWeaponType - ដូច SEA3)
    -- ==============================================
    local weaponType = c.WeaponType or "Melee"
    if _G.YOKUDO_SetWeaponType then
        -- ពន្យាពេលបន្តិចដើម្បីឲ្យ UI ផ្ទុករួច
        task.spawn(function()
            task.wait(0.5)
            _G.YOKUDO_SetWeaponType(weaponType)
        end)
        print("✅ Weapon Type will be set to: " .. weaponType)
    else
        -- Fallback
        if _G.YOKUDO_AutoEquip then
            _G.YOKUDO_AutoEquip.SelectedType = weaponType
        end
        if _G.YOKUDO_UpdateWeaponButton then
            _G.YOKUDO_UpdateWeaponButton(weaponType)
        end
        print("⚠️ Weapon Type set manually: " .. weaponType)
    end
    
    print("✅ Config applied for: " .. Player.Name)
end

-- ==================================================
-- LOAD CONFIG ON START
-- ==================================================
_G.YOKUDO_LoadConfig()

print("✅ ConfigManager Loaded (With Set Functions - Weapon Config)")
print("📁 Config file: " .. CONFIG_FILE)
