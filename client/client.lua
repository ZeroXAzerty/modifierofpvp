---------------- Functions -------------



---------------- VISUAL ----------------

-------- Crosshair

Citizen.CreateThread(function()
    if Config.EnableCrosshair == false then
        local isSniper = false
        while true do
            Citizen.Wait(0)

            local ped = GetPlayerPed(-1)

            local currentWeaponHash = GetSelectedPedWeapon(ped)

            if currentWeaponHash == 100416529 then
                isSniper = true
            elseif currentWeaponHash == 205991906 then
                isSniper = true
            elseif currentWeaponHash == -952879014 then
                isSniper = true
            elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
                isSniper = true
            else
                isSniper = false
            end

            if isSniper == false then
                HideHudComponentThisFrame(14)
            end
        end
    end
end)

---------------- NO VISUAL -------------

-------- Damage Modifier

Citizen.CreateThread(function()
    local currentWeaponHash = nil
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(0)
        currentWeaponHash = GetSelectedPedWeapon(ped)
        SetWeaponDamageModifierThisFrame(currentWeaponHash, Config.DamageMultiplier)
    end
end)


-------- Whipping

Citizen.CreateThread(function()
    if Config.Whipping == false then
        while true do
            Citizen.Wait(0)
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end

end)






