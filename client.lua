local function ToggleMap(map)
    if map.enabled then
        RequestIpl(map.map)
        print("^2[IPLController] ^7Requested IPL: ^5" .. map.map .. "^7")
    else
        RemoveIpl(map.map)
        print("^2[IPLController] ^7Removed IPL: ^5" .. map.map .. "^7")
    end
end

CreateThread(function()
    local MapData = lib.callback.await("IPLController:GetMaps", false)
    for _, v in pairs(MapData) do
        ToggleMap(v)
    end
end)

RegisterNetEvent("IPLController:ReceiveMaps", function(Maps)
    for _, v in pairs(Maps) do
        ToggleMap(v)
    end
end)
