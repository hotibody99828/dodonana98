-- ==================================================
-- TABS (SEA2) - NO CONFIG
-- ==================================================

local Y = _G.Y
local Services = _G.YOKUDO.Services
local Settings = _G.YOKUDO

-- Create Pages
local InfoPage = CreatePage("INFO")
local ShopPage = CreatePage("SHOP")
local AutoHopPage = CreatePage("AUTO_HOP")
local DarkBeardPage = CreatePage("DARK_BEARD")
local CursedCaptainPage = CreatePage("CURSED_CAPTAIN")
local CorePage = CreatePage("CORE")
local SwordPage = CreatePage("SWORD_LEGENDARY")
local HakiPage = CreatePage("HAKI_LEGENDARY")
local FruitPage = CreatePage("FRUIT")
local BerryPage = CreatePage("BERRY")
local SettingPage = CreatePage("SETTING")

-- Create Tabs
local InfoTab = CreateTab("Info", 1)
local ShopTab = CreateTab("Shop", 2)
local AutoHopTab = CreateTab("Auto Hop", 3)
local DarkBeardTab = CreateTab("Dark Beard", 4)
local CursedCaptainTab = CreateTab("Cursed Captain", 5)
local CoreTab = CreateTab("Core", 6)
local SwordTab = CreateTab("Sword Legendary", 7)
local HakiTab = CreateTab("Haki Legendary", 8)
local FruitTab = CreateTab("Fruit", 9)
local BerryTab = CreateTab("Berry", 10)
local SettingTab = CreateTab("Setting", 11)

-- Tab Map
local Tabs = {
    [InfoTab] = InfoPage,
    [ShopTab] = ShopPage,
    [AutoHopTab] = AutoHopPage,
    [DarkBeardTab] = DarkBeardPage,
    [CursedCaptainTab] = CursedCaptainPage,
    [CoreTab] = CorePage,
    [SwordTab] = SwordPage,
    [HakiTab] = HakiPage,
    [FruitTab] = FruitPage,
    [BerryTab] = BerryPage,
    [SettingTab] = SettingPage
}

local function SelectTab(SelectedTab, SelectedPage)
    for Tab, Page in pairs(Tabs) do
        Page.Visible = false
        local Indicator = Tab:FindFirstChild("Indicator")
        local TabText = Tab:FindFirstChild("TabText")
        Y.TS:Create(Tab, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        if Indicator then
            Y.TS:Create(Indicator, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        end
        if TabText then
            Y.TS:Create(TabText, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(155, 155, 175)}):Play()
        end
    end

    SelectedPage.Visible = true
    task.wait(0.05)
    pcall(function()
        SelectedPage.CanvasPosition = Vector2.new(0, 0)
    end)

    Y.TS:Create(SelectedTab, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    local Indicator = SelectedTab:FindFirstChild("Indicator")
    local TabText = SelectedTab:FindFirstChild("TabText")
    if Indicator then
        Y.TS:Create(Indicator, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    end
    if TabText then
        Y.TS:Create(TabText, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end
end

for Tab, Page in pairs(Tabs) do
    Tab.MouseButton1Click:Connect(function()
        SelectTab(Tab, Page)
    end)
end

SelectTab(InfoTab, InfoPage)

-- ==================================================
-- ⭐ INFO TAB
-- ==================================================

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -20, 0, 40)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "YOKUDO HUB PREMIUM"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = InfoPage

-- Line
local line = Instance.new("Frame")
line.Name = "Line"
line.Size = UDim2.new(0.9, 0, 0, 1)
line.Position = UDim2.new(0.05, 0, 0, 55)
line.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
line.BorderSizePixel = 0
line.Parent = InfoPage

-- Telegram Group
local tgLabel = Instance.new("TextLabel")
tgLabel.Name = "TgLabel"
tgLabel.Size = UDim2.new(1, -20, 0, 22)
tgLabel.Position = UDim2.new(0, 10, 0, 72)
tgLabel.BackgroundTransparency = 1
tgLabel.Text = "Telegram Group :"
tgLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
tgLabel.TextSize = 13
tgLabel.TextXAlignment = Enum.TextXAlignment.Left
tgLabel.TextYAlignment = Enum.TextYAlignment.Center
tgLabel.Font = Enum.Font.GothamBold
tgLabel.Parent = InfoPage

local tgLink = Instance.new("TextLabel")
tgLink.Name = "TgLink"
tgLink.Size = UDim2.new(1, -20, 0, 22)
tgLink.Position = UDim2.new(0, 10, 0, 94)
tgLink.BackgroundTransparency = 1
tgLink.Text = "https://t.me/mailay20"
tgLink.TextColor3 = Color3.fromRGB(200, 200, 220)
tgLink.TextSize = 12
tgLink.TextXAlignment = Enum.TextXAlignment.Left
tgLink.TextYAlignment = Enum.TextYAlignment.Center
tgLink.Font = Enum.Font.Gotham
tgLink.Parent = InfoPage

-- Discord Group
local dcLabel = Instance.new("TextLabel")
dcLabel.Name = "DcLabel"
dcLabel.Size = UDim2.new(1, -20, 0, 22)
dcLabel.Position = UDim2.new(0, 10, 0, 126)
dcLabel.BackgroundTransparency = 1
dcLabel.Text = "Discord Group :"
dcLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
dcLabel.TextSize = 13
dcLabel.TextXAlignment = Enum.TextXAlignment.Left
dcLabel.TextYAlignment = Enum.TextYAlignment.Center
dcLabel.Font = Enum.Font.GothamBold
dcLabel.Parent = InfoPage

local dcLink = Instance.new("TextLabel")
dcLink.Name = "DcLink"
dcLink.Size = UDim2.new(1, -20, 0, 22)
dcLink.Position = UDim2.new(0, 10, 0, 148)
dcLink.BackgroundTransparency = 1
dcLink.Text = "https://discord.gg/2XbN7M5Vem"
dcLink.TextColor3 = Color3.fromRGB(200, 200, 220)
dcLink.TextSize = 12
dcLink.TextXAlignment = Enum.TextXAlignment.Left
dcLink.TextYAlignment = Enum.TextYAlignment.Center
dcLink.Font = Enum.Font.Gotham
dcLink.Parent = InfoPage

-- Telegram User
local tgUserLabel = Instance.new("TextLabel")
tgUserLabel.Name = "TgUserLabel"
tgUserLabel.Size = UDim2.new(1, -20, 0, 22)
tgUserLabel.Position = UDim2.new(0, 10, 0, 180)
tgUserLabel.BackgroundTransparency = 1
tgUserLabel.Text = "Telegram :"
tgUserLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
tgUserLabel.TextSize = 13
tgUserLabel.TextXAlignment = Enum.TextXAlignment.Left
tgUserLabel.TextYAlignment = Enum.TextYAlignment.Center
tgUserLabel.Font = Enum.Font.GothamBold
tgUserLabel.Parent = InfoPage

local tgUserLink = Instance.new("TextLabel")
tgUserLink.Name = "TgUserLink"
tgUserLink.Size = UDim2.new(1, -20, 0, 22)
tgUserLink.Position = UDim2.new(0, 10, 0, 202)
tgUserLink.BackgroundTransparency = 1
tgUserLink.Text = "@maibigber"
tgUserLink.TextColor3 = Color3.fromRGB(200, 200, 220)
tgUserLink.TextSize = 12
tgUserLink.TextXAlignment = Enum.TextXAlignment.Left
tgUserLink.TextYAlignment = Enum.TextYAlignment.Center
tgUserLink.Font = Enum.Font.Gotham
tgUserLink.Parent = InfoPage

-- Build By
local buildLabel = Instance.new("TextLabel")
buildLabel.Name = "BuildLabel"
buildLabel.Size = UDim2.new(1, -20, 0, 30)
buildLabel.Position = UDim2.new(0, 10, 0, 240)
buildLabel.BackgroundTransparency = 1
buildLabel.Text = "Build By : Kon Khmer 🇰🇭"
buildLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
buildLabel.TextSize = 13
buildLabel.TextXAlignment = Enum.TextXAlignment.Center
buildLabel.TextYAlignment = Enum.TextYAlignment.Center
buildLabel.Font = Enum.Font.GothamBold
buildLabel.Parent = InfoPage

-- ==================================================
-- REFRESH BUTTONS
-- ==================================================
CreateRefreshButton(DarkBeardPage, 1)
CreateRefreshButton(CursedCaptainPage, 1)
CreateRefreshButton(CorePage, 1)
CreateRefreshButton(SwordPage, 1)
CreateRefreshButton(HakiPage, 1)
CreateRefreshButton(FruitPage, 1)
CreateRefreshButton(BerryPage, 1)

-- ==================================================
-- AUTO HOP TAB (NO CONFIG)
-- ==================================================
CreateSectionTitle(AutoHopPage, "Select Weapon for attack", 1)
CreateWeaponDropdown(AutoHopPage, 2)

-- ⭐ Auto Click Attack (Smart Checkbox - ប្រើ ToggleFunction)
local clickAttack = CreateSmartCheckbox(
    AutoHopPage,
    "Auto Click Attack",
    3,
    function()  -- ToggleFunction
        _G.YOKUDO_ToggleAutoClickAttack()
    end,
    function()  -- GetStateFunction
        return _G.YOKUDO_AutoClickAttackEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_ClickAttack == nil then
    _G.YOKUDO_UpdateUI_ClickAttack = clickAttack.Update
end

CreateSectionTitle(AutoHopPage, "Farm Boss", 4)

-- ⭐ Auto Darkbeard (Smart Checkbox - ប្រើ ToggleFunction)
local darkBeard = CreateSmartCheckbox(
    AutoHopPage,
    "Auto Darkbeard",
    5,
    function()
        _G.YOKUDO_ToggleAutoDarkBeard()
    end,
    function()
        return _G.YOKUDO_AutoDarkBeardEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_DarkBeard == nil then
    _G.YOKUDO_UpdateUI_DarkBeard = darkBeard.Update
end

-- Auto Hop Darkbeard (Checkbox ដើម)
local hopDarkBeardFrame, hopDarkBeardCheckbox, getHopDarkBeardState = CreateCheckbox(AutoHopPage, "Auto Hop Darkbeard", 6)

CreateSectionTitle(AutoHopPage, "Farm Boss", 7)

-- ⭐ Auto Cursed Captain (Smart Checkbox - ប្រើ ToggleFunction)
local cursedCaptain = CreateSmartCheckbox(
    AutoHopPage,
    "Auto Cursed Captain",
    8,
    function()
        _G.YOKUDO_ToggleAutoCursedCaptain()
    end,
    function()
        return _G.YOKUDO_AutoCursedCaptainEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_CursedCaptain == nil then
    _G.YOKUDO_UpdateUI_CursedCaptain = cursedCaptain.Update
end

-- Auto Hop Cursed Captain (Checkbox ដើម)
local hopCursedCaptainFrame, hopCursedCaptainCheckbox, getHopCursedCaptainState = CreateCheckbox(AutoHopPage, "Auto Hop Cursed Captain", 9)

CreateSectionTitle(AutoHopPage, "Farm Boss", 10)

-- ⭐ Auto Core (Smart Checkbox - ប្រើ ToggleFunction)
local core = CreateSmartCheckbox(
    AutoHopPage,
    "Auto Core",
    11,
    function()
        _G.YOKUDO_ToggleAutoCore()
    end,
    function()
        return _G.YOKUDO_AutoCoreEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_Core == nil then
    _G.YOKUDO_UpdateUI_Core = core.Update
end

-- ==================================================
-- AUTO HOP CHECKBOX EVENTS
-- ==================================================
hopDarkBeardCheckbox.MouseButton1Click:Connect(function()
    if _G.YOKUDO_ToggleAutoHopDarkBeard then
        _G.YOKUDO_ToggleAutoHopDarkBeard()
    end
end)

hopCursedCaptainCheckbox.MouseButton1Click:Connect(function()
    if _G.YOKUDO_ToggleAutoHopCursedCaptain then
        _G.YOKUDO_ToggleAutoHopCursedCaptain()
    end
end)

-- ==================================================
-- SETTING TAB (NO CONFIG)
-- ==================================================
CreateSectionTitle(SettingPage, "Tween Settings", 1)
CreateStopTweenButton(SettingPage, 2)

CreateSectionTitle(SettingPage, "Other", 3)

-- ⭐ No Clip (Checkbox ដើម)
local noClipFrame, noClipCheckbox, getNoClipState = CreateCheckbox(SettingPage, "No Clip", 4)

CreateSectionTitle(SettingPage, "Auto Abilities", 5)

-- ⭐ Auto Buso (Smart Checkbox - ប្រើ ToggleFunction)
local buso = CreateSmartCheckbox(
    SettingPage,
    "Auto Buso",
    6,
    function()
        _G.YOKUDO_ToggleAutoBuso()
    end,
    function()
        return _G.YOKUDO_BusoEnabled or false
    end
)

-- Auto Ken (Checkbox ដើម)
local obsFrame, obsCheckbox, getObsState = CreateCheckbox(SettingPage, "Auto Ken", 7)

CreateSectionTitle(SettingPage, "Movement Hacks", 8)

-- Jump Hack (Checkbox + TextBox ដើម)
local jumpHolder, jumpCheckbox, getJumpState, jumpTextBox, getJumpValue = CreateTextBoxWithCheckbox(SettingPage, "Jump Hack", 9)

-- Speed Hack (Checkbox + TextBox ដើម)
local speedHolder, speedCheckbox, getSpeedState, speedTextBox, getSpeedValue = CreateTextBoxWithCheckbox(SettingPage, "Speed Hack", 10)

-- ⭐ Walk on Water (Smart Checkbox - ប្រើ ToggleFunction)
local walk = CreateSmartCheckbox(
    SettingPage,
    "Walk on Water",
    11,
    function()
        _G.YOKUDO_ToggleWalkOnWater()
    end,
    function()
        return _G.YOKUDO_WalkEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_Walk == nil then
    _G.YOKUDO_UpdateUI_Walk = walk.Update
end

-- ==================================================
-- SETTING CHECKBOX EVENTS
-- ==================================================
obsCheckbox.MouseButton1Click:Connect(function()
    if _G.YOKUDO_ToggleAutoKen then
        _G.YOKUDO_ToggleAutoKen()
    end
end)

noClipCheckbox.MouseButton1Click:Connect(function()
    if _G.YOKUDO_ToggleNoClip then
        _G.YOKUDO_ToggleNoClip()
    end
end)

-- ==================================================
-- SHOP TAB (NO CONFIG)
-- ==================================================
CreateSectionTitle(ShopPage, "Shop", 1)

-- ⭐ Auto Buy Legendary Sword (Smart Checkbox - ប្រើ ToggleFunction)
local buySword = CreateSmartCheckbox(
    ShopPage,
    "Auto Buy Legendary Sword",
    2,
    function()
        _G.YOKUDO_ToggleAutoBuySword()
    end,
    function()
        return _G.YOKUDO_AutoBuySwordEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_BuySword == nil then
    _G.YOKUDO_UpdateUI_BuySword = buySword.Update
end

-- ⭐ Auto Unlock Haki Legendary (Smart Checkbox - ប្រើ ToggleFunction)
local unlockHaki = CreateSmartCheckbox(
    ShopPage,
    "Auto Unlock Haki Legendary",
    3,
    function()
        _G.YOKUDO_ToggleAutoUnlockHaki()
    end,
    function()
        return _G.YOKUDO_AutoUnlockHakiEnabled or false
    end
)

if _G.YOKUDO_UpdateUI_UnlockHaki == nil then
    _G.YOKUDO_UpdateUI_UnlockHaki = unlockHaki.Update
end

-- ==================================================
-- ⭐ JOIN SERVER WITH JOBID (DECODE + JOIN)
-- ==================================================
CreateSectionTitle(ShopPage, "Join Server With Jobid", 4)

local jobIdHolder = Instance.new("Frame")
jobIdHolder.Name = "JobIdHolder"
jobIdHolder.Size = UDim2.new(1, 0, 0, 28)
jobIdHolder.BackgroundTransparency = 1
jobIdHolder.BorderSizePixel = 0
jobIdHolder.LayoutOrder = 5
jobIdHolder.ZIndex = 9
jobIdHolder.Parent = ShopPage

local jobIdLabel = Instance.new("TextLabel")
jobIdLabel.Name = "JobIdLabel"
jobIdLabel.Size = UDim2.new(0, 55, 1, 0)
jobIdLabel.Position = UDim2.new(0, 0, 0, 0)
jobIdLabel.BackgroundTransparency = 1
jobIdLabel.Text = "JobId:"
jobIdLabel.TextColor3 = Color3.fromRGB(205, 205, 220)
jobIdLabel.TextSize = 11
jobIdLabel.TextXAlignment = Enum.TextXAlignment.Left
jobIdLabel.TextYAlignment = Enum.TextYAlignment.Center
jobIdLabel.Font = Enum.Font.GothamMedium
jobIdLabel.ZIndex = 10
jobIdLabel.Parent = jobIdHolder

local jobIdTextBox = Instance.new("TextBox")
jobIdTextBox.Name = "JobIdTextBox"
jobIdTextBox.Size = UDim2.new(0, 180, 1, -4)
jobIdTextBox.Position = UDim2.new(0, 58, 0, 2)
jobIdTextBox.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
jobIdTextBox.BorderSizePixel = 0
jobIdTextBox.Text = ""
jobIdTextBox.PlaceholderText = "Paste Premium Jobid or Normal"
jobIdTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jobIdTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
jobIdTextBox.TextSize = 10
jobIdTextBox.TextXAlignment = Enum.TextXAlignment.Left
jobIdTextBox.TextYAlignment = Enum.TextYAlignment.Center
jobIdTextBox.Font = Enum.Font.GothamMedium
jobIdTextBox.ZIndex = 11
jobIdTextBox.Parent = jobIdHolder

local TBoxCorner = Instance.new("UICorner")
TBoxCorner.CornerRadius = UDim.new(0, 4)
TBoxCorner.Parent = jobIdTextBox

local TBoxStroke = Instance.new("UIStroke")
TBoxStroke.Color = Color3.fromRGB(200, 200, 220)
TBoxStroke.Thickness = 0.5
TBoxStroke.Transparency = 0.2
TBoxStroke.Parent = jobIdTextBox

local joinButton = Instance.new("TextButton")
joinButton.Name = "JoinButton"
joinButton.Size = UDim2.new(0, 60, 1, -4)
joinButton.Position = UDim2.new(1, -62, 0, 2)
joinButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
joinButton.BorderSizePixel = 0
joinButton.Text = "Join"
joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
joinButton.TextSize = 11
joinButton.TextXAlignment = Enum.TextXAlignment.Center
joinButton.TextYAlignment = Enum.TextYAlignment.Center
joinButton.Font = Enum.Font.GothamBold
joinButton.ZIndex = 11
joinButton.Parent = jobIdHolder

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = joinButton

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = Color3.fromRGB(200, 200, 220)
BtnStroke.Thickness = 0.5
BtnStroke.Transparency = 0.2
BtnStroke.Parent = joinButton

joinButton.MouseEnter:Connect(function()
    joinButton.BackgroundColor3 = Color3.fromRGB(135, 120, 225)
end)

joinButton.MouseLeave:Connect(function()
    joinButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
end)

-- ⭐ JOIN BUTTON - DECODE + JOIN
joinButton.MouseButton1Click:Connect(function()
    local inputText = jobIdTextBox.Text
    if inputText and inputText ~= "" and inputText ~= "Paste Premium Jobid or Normal" then
        if _G.YOKUDO_JoinServerByEncoded then
            local ok, msg = _G.YOKUDO_JoinServerByEncoded(inputText)
            if ok then
                print("✅ " .. msg)
            else
                print("❌ " .. msg)
            end
        else
            warn("⚠️ _G.YOKUDO_JoinServerByEncoded not found! Make sure JoinServer.lua is loaded.")
        end
    else
        print("⚠️ Please paste Premium Jobid or Normal!")
    end
end)

-- ⭐ Enter key ក៏អាច Join បាន
jobIdTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        joinButton.MouseButton1Click:Fire()
    end
end)

-- ==================================================
-- OTHER PAGES
-- ==================================================

_G.YOKUDO_AutoHopPage = AutoHopPage

-- ==================================================
-- EXPORT PAGES
-- ==================================================
_G.YOKUDO_SettingPage = SettingPage
_G.YOKUDO_AutoHopPage = AutoHopPage
_G.YOKUDO_ShopPage = ShopPage

print("✅ Tabs Loaded (SEA2 - No Config)")
