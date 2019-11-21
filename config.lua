Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 255, g = 0, b = 0 }
Config.Type          = 1

Config.Locale = 'en'


-- Refil stock on server / script restart
Config.Refill_stock = true

-- How much stock is refilled on server / script restart
-- Needs Above to be True
Config.Pistol_stock = math.random(8,16)
Config.Rifle_stock = math.random(6,10)
Config.Sniper_stock = math.random(1,4)


-- Once a day refill with new weapon from same category
Config.Timed_restock = true

-- What time? Needs above to be true ( 24 hour clock ONLY )
Config.Hour = 18
Config.Minute = 00

-- What weapons are to be randomized ( needs above to be true )
Config.Weapon_restock = {

	pistol	= {
		
		{
			name			= "WEAPON_PISTOL",
			price			= 300,
			starting_stock	= math.random(8,16)
		},

		{
			name			= "WEAPON_COMBATPISTOL",
			price			= 500,
			starting_stock	= math.random(6,18)
		},

		{
			name			= "WEAPON_HEAVYPISTOL",
			price			= 2000,
			starting_stock	= math.random(4,8)
		}
	},

	rifle	= {
		
		{
			name			= "WEAPON_ASSAULTRIFLE",
			price			= 5000,
			starting_stock	= math.random(6,10)
		},

		{
			name			= "WEAPON_CARBINERIFLE",
			price			= 6000,
			starting_stock	= math.random(4,12)
		},

		{
			name			= "WEAPON_SPECIALCARBINE",
			price			= 8000,
			starting_stock	= math.random(2,8)
		}
	},

	sniper = {

		{
			name			= "WEAPON_SNIPERRIFLE",
			price			= 12000,
			starting_stock	= math.random(1,6)
		},

		{
			name			= "WEAPON_HEAVYSNIPER",
			price			= 20000,
			starting_stock	= math.random(1,4)
		},

		{
			name			= "WEAPON_MARKSMANRIFLE",
			price			= 22000,
			starting_stock	= math.random(1,4)
		}

	}

}

-- Zone config, ONLY CHANGE LOCATION OR ADD ANOTHER DO NOT ADD NEW ZONE!!
Config.Zones = {

	BlackMarket = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1297.63, -392.76, 35.6)
		}
	}
}
