# ipl-manager
Demo resource with a few map scenarios that you can toggle on/off with simple commands.

Usage is `/toggleipl <number>` from 1-3 e.g `/toggleipl 1`

Here are the map names:
```lua
local Maps = {
    { name = "Paleto Tunnel",     map = "paleto-tunnel-debris", enabled = false },
    { name = "Senora FWY Bridge", map = "mavigasenorafreeway",  enabled = math.random(1, 3) == 2 and true or false },
    { name = "Paleto Walls",      map = "paleto-walls",         enabled = false }
}
```

The middle one i put a math.random so sometimes when the server starts, it's enabled but sometimes its not. You can do this to add dynamic rp to your server or just straight set them to true/false

You can run the command from console or ingame, you will need `command.toggleipl` as your ace permission e.g `add_ace group.admin command.toggleipl allow`