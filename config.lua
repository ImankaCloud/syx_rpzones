Config = {}
Config.DisableCombat = true        -- If true, combat actions are disabled for players within Greenzones.
Config.RadiusBlip = true           -- If true, displays a circular blip on the map indicating the Greenzone area.
Config.RedRadiusBlipDisable = true -- If true, it will hide the circular blip indicating the Redzone area on the map.
Config.UiEnable = true             -- Enables UI notifications for Greenzones when set to true.
Config.RedZoneUiEnable = true      -- Enables UI notifications for Redzones when set to true.
Config.UnArmPlayer = true          -- If true, players are set to "unarmed" within Greenzones.


Config.Greenzones = {
  ["POLICE"] = {
      Coords = { ['x'] = 427.62, ['y'] = -983.77, ['z'] = 30.71 },
      Radius = 150.0,
      BlipColour = 2,
  },
  ["JobCenter"] = {
    Coords = { ['x'] = -263.38, ['y'] = -965.77, ['z'] = 30.57 },
    Radius = 150.0,
    BlipColour = 2,
  },
  ["CarDealer"] = {
    Coords = { ['x'] = -33.74, ['y'] = -1101.99, ['z'] = 25.77 },
    Radius = 100.0,
    BlipColour = 2,
  },
  ["TAXI"] = {
    Coords = { ['x'] = 903.17, ['y'] = -170.54, ['z'] = 23.72 },
    Radius = 100.0,
    BlipColour = 2,
  },
  ["MECHANIC"] = {
    Coords = { ['x'] = -342.46, ['y'] = -133.27, ['z'] = 60.43 },
    Radius = 110.0,
    BlipColour = 2,
  }
}

Config.Redzones = {
  ["Ballas"] = {
      Coords = { ['x'] = 105.44, ['y'] = -1940.03, ['z'] = 20.15 },
      Radius = 150.0,
      BlipColour = 1,
  }
}
