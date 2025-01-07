local Maps = {
    { name = "Paleto Tunnel",     map = "paleto-tunnel-debris", enabled = false },
    { name = "Senora FWY Bridge", map = "mavigasenorafreeway",  enabled = math.random(1, 3) == 2 and true or false },
    { name = "Paleto Walls",      map = "paleto-walls",         enabled = false }
}

CreateThread(function()
    for _, v in pairs(Maps) do
        print(string.format("Loaded IPL %s - State: %s", v.name, v.enabled))
    end
end)

lib.callback.register(
    "IPLController:GetMaps",
    function()
        return Maps
    end
)

RegisterCommand(
    "toggleipl",
    function(source, args, rawCommand)
        local map = args[1]

        if not map then
            return
        end

        map = tonumber(map)

        if not Maps[map] then
            return
        end

        Maps[map].enabled = not Maps[map].enabled
        TriggerClientEvent("IPLController:ReceiveMaps", -1, Maps)
        if source == 0 then
            print("^2[IPLController] Player ^5CONSOLE^7 toggled IPL: ^5" .. Maps[map].name .. "^7")
        else
            print(
                "^2[IPLController] Player ^5" ..
                GetPlayerName(source) .. "^7 toggled IPL: ^5" .. Maps[map].name .. "^7"
            )
        end
    end,
    true
)
