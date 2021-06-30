ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ""
local CurrentActionData = {}
local ShopOpen = false
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("rid_blackmarket:sendShop")
AddEventHandler("rid_blackmarket:sendShop", function(shopItems)
    for k, v in pairs(shopItems) do
        Config.Zones[k].Items = v
    end
end)

function OpenShopMenu(zone)
    local elements = {}
    ShopOpen = true
    Config.Zones["BlackMarket"].Items = nil
    TriggerServerEvent("rid_blackmarket:stockUpdate")
    while Config.Zones["BlackMarket"].Items == nil do
        Citizen.Wait(10)
    end
    for i = 1, #Config.Zones[zone].Items, 1 do
        local item = Config.Zones[zone].Items[i]
        table.insert(elements, {
	        label = ("%s - <span style='color: green;'>%s</span> - <span style='color: red;'>%s</span>"):format(item.label, _U("shop_menu_item", ESX.Math.GroupDigits(item.price)), item.stock),
	        price = item.price,
	        weaponName = item.item,
	        stock = item.stock
	    })
    end
    ESX.UI.Menu.CloseAll()
    PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", false)
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "shop", {
        title = _U("shop_menu_title"),
        align = "top-left",
        elements = elements
    }, function(data, menu)
        ESX.TriggerServerCallback("rid_blackmarket:buyWeapon", function(bought)
            if bought then
                DisplayBoughtScaleform(data.current.weaponName, data.current.price)
                ESX.UI.Menu.CloseAll()
            else
                PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", false)
                ESX.UI.Menu.CloseAll()
            end
        end, data.current.weaponName, zone)
    end, function(data, menu)
        PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", false)
        ShopOpen = false
        menu.close()
        CurrentAction = "shop_menu"
        CurrentActionMsg = _U("shop_menu_prompt")
        CurrentActionData = {zone = zone}
    end, function(data, menu)
        PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", false)
    end)
end

function DisplayBoughtScaleform(weaponName, price)
    local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
    local sec = 4
    BeginScaleformMovieMethod(scaleform, "SHOW_WEAPON_PURCHASED")
    PushScaleformMovieMethodParameterString(_U("weapon_bought", ESX.Math.GroupDigits(price)))
    PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
    PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
    PushScaleformMovieMethodParameterString("")
    PushScaleformMovieMethodParameterInt(100)
    EndScaleformMovieMethod()
    PlaySoundFrontend(-1, "WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", false)
    Citizen.CreateThread(function()
        while sec > 0 do
	        Citizen.Wait(0)
            sec = sec - 0.01
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    end)
end

AddEventHandler("rid_blackmarket:hasEnteredMarker", function(zone)
    if zone == "BlackMarket" then
        CurrentAction = "shop_menu"
        CurrentActionMsg = _U("shop_menu_prompt")
        CurrentActionData = {zone = zone}
    end
end)

AddEventHandler("rid_blackmarket:hasExitedMarker", function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        if ShopOpen then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Locations, 1 do
                local location = v.Locations[i]
                local coords = GetEntityCoords(PlayerPedId())
                local distance = #(coords - location)
                if distance < 50.0 then
                    wait = 1
                    if PlayerData.job and PlayerData.job.name ~= "police" then
                        if (Config.Type ~= -1 and distance < Config.DrawDistance) then
                            DrawMarker(Config.Type, location, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                        end
                    elseif Config.Police_Visibility then
                        if (Config.Type ~= -1 and distance < Config.DrawDistance) then
                            DrawMarker(Config.Type, location, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                        end
                    end
                    break
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local coords = GetEntityCoords(PlayerPedId())
        local isInMarker, currentZone = false, nil
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Locations, 1 do
                local distance = #(coords - v.Locations[i])
                if distance < 50.0 then
                    wait = 1
                    if distance < Config.Size.x then
                        isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
                    end
                    break
                end
            end
        end
        if PlayerData.job and PlayerData.job.name ~= "police" then
            if isInMarker and not HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = true
                TriggerEvent("rid_blackmarket:hasEnteredMarker", currentZone)
            end
        end
        if isInMarker and not HasAlreadyEnteredMarker and Config.Police_Use then
            HasAlreadyEnteredMarker = true
            TriggerEvent("rid_blackmarket:hasEnteredMarker", currentZone)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent("rid_blackmarket:hasExitedMarker", LastZone)
        end
        Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'shop_menu' then
                    OpenShopMenu(CurrentActionData.zone)
                end
                CurrentAction = nil
            end
        else
        	Citizen.Wait(500)
        end
    end
end)
