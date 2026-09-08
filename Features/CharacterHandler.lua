-- ==================================================
-- CHARACTER RESPAWN HANDLER (SEA2) - WITH SET FUNCTIONS
-- ==================================================

local Player = _G.YOKUDO.Player

Player.OnCharacterAdded(function()
    task.wait(0.5)
    
    -- ==============================================
    -- AUTO BOSS FEATURES (ប្រើ Set Functions)
    -- ==============================================
    
    -- Auto Darkbeard
    if _G.YOKUDO_AutoDarkBeardEnabled then
        if _G.YOKUDO_SetDarkBeard then
            _G.YOKUDO_SetDarkBeard(true)
            print("✅ Auto Darkbeard restarted")
        end
    end
    
    -- Auto Cursed Captain
    if _G.YOKUDO_AutoCursedCaptainEnabled then
        if _G.YOKUDO_SetCursedCaptain then
            _G.YOKUDO_SetCursedCaptain(true)
            print("✅ Auto Cursed Captain restarted")
        end
    end
    
    -- Auto Core
    if _G.YOKUDO_AutoCoreEnabled then
        if _G.YOKUDO_SetCore then
            _G.YOKUDO_SetCore(true)
            print("✅ Auto Core restarted")
        end
    end
    
    -- ==============================================
    -- AUTO ABILITIES (ប្រើ Set Functions)
    -- ==============================================
    
    -- Auto Buso
    if _G.YOKUDO_BusoEnabled then
        if _G.YOKUDO_SetBuso then
            _G.YOKUDO_SetBuso(true)
            print("✅ Auto Buso restarted")
        end
    end
    
    -- Auto Ken
    if _G.YOKUDO_ObservationEnabled then
        if _G.YOKUDO_ToggleAutoKen then
            -- Auto Ken មិនទាន់មាន Set Function ទេ
            _G.YOKUDO_ToggleAutoKen()
            print("✅ Auto Ken restarted")
        end
    end
    
    -- ==============================================
    -- MOVEMENT HACKS (ប្រើ Set Functions)
    -- ==============================================
    
    -- Walk on Water
    if _G.YOKUDO_WalkEnabled then
        if _G.YOKUDO_SetWalk then
            _G.YOKUDO_SetWalk(true)
            print("✅ Walk on Water restarted")
        end
    end
    
    -- Speed Hack
    if _G.YOKUDO_SpeedEnabled then
        if _G.YOKUDO_StartSpeedLoop then
            _G.YOKUDO_StartSpeedLoop()
            print("✅ Speed Hack restarted")
        end
    end
    
    -- Jump Hack
    if _G.YOKUDO_JumpEnabled then
        if _G.YOKUDO_EnableJumpPower then
            _G.YOKUDO_EnableJumpPower()
            print("✅ Jump Hack restarted")
        end
    end
    
    -- ==============================================
    -- AUTO CLICK ATTACK (ប្រើ Set Functions)
    -- ==============================================
    if _G.YOKUDO_AutoClickAttackEnabled then
        if _G.YOKUDO_SetClickAttack then
            _G.YOKUDO_SetClickAttack(true)
            print("✅ Auto Click Attack restarted")
        end
    end
    
    -- ==============================================
    -- SHOP FEATURES (ប្រើ Set Functions)
    -- ==============================================
    
    -- Auto Buy Sword
    if _G.YOKUDO_AutoBuySwordEnabled then
        if _G.YOKUDO_SetBuySword then
            _G.YOKUDO_SetBuySword(true)
            print("✅ Auto Buy Sword restarted")
        end
    end
    
    -- Auto Unlock Haki
    if _G.YOKUDO_AutoUnlockHakiEnabled then
        if _G.YOKUDO_SetUnlockHaki then
            _G.YOKUDO_SetUnlockHaki(true)
            print("✅ Auto Unlock Haki restarted")
        end
    end
    
    -- ==============================================
    -- AUTO HOP FEATURES (Restart - ប្រើ Toggle)
    -- ==============================================
    
    -- Auto Hop Darkbeard
    if _G.YOKUDO_AutoHopDarkBeardEnabled then
        if _G.YOKUDO_ToggleAutoHopDarkBeard then
            _G.YOKUDO_ToggleAutoHopDarkBeard()
            print("✅ Auto Hop Darkbeard restarted")
        end
    end
    
    -- Auto Hop Cursed Captain
    if _G.YOKUDO_AutoHopCursedCaptainEnabled then
        if _G.YOKUDO_ToggleAutoHopCursedCaptain then
            _G.YOKUDO_ToggleAutoHopCursedCaptain()
            print("✅ Auto Hop Cursed Captain restarted")
        end
    end
end)

print("✅ CharacterHandler Loaded (SEA2 - Using Set Functions)")
