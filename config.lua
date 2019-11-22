--[[

Script made by : Re-Ignited D3velopment Crew

Visit our Discord for direct help or any ESX / FiveM related help
( https://discord.gg/akXEgcF )


Main Author	: D3v
Co-Author	: BTNGaming
Thanks to	: Crumble

Do not sell this script
Do not share this work as your own
Edit for personal uses only

-= FOR PERSONAL USE ONLY =-

]]--


--== MARKER SETTINGS ==--


Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 255, g = 0, b = 0 }
Config.Type          = 1

Config.Locale = 'en'


--[[

TERMS:

	RESTOCK - Items will be replaced with new ones ( Delivery of new items ) when current stock is 0
	REFIL - Items will be restocked with new stock when their current stock is 0, no new items will be delivered

]]--


--== FUNCTION SETTINGS ==--


-- What should be used on server / script restart?
-- If true stock will be REFILLED
-- If false stock will be RESTOCKED
Config.Restart_refill = true

-- What should happen at the timed event?
-- If true stock wil be RESTOCKED
-- If false stock will be REFILLED
Config.Restart_restock = true

-- If you using disc-inventory set this to true otherwise false
Config.Item_mode = true

-- Give ammo pack after buying a gun?
-- Requires Item_mode = true
Config.Give_ammo = true

-- Use black money or normal money?
-- If true will use black money
-- If false wil use normal money
Config.Use_black_money = true


--== POLICE SETTINGS ==--

-- Can police see marker?
Config.Police_Visibility = true

-- Can police use the marker?
Config.Police_Use = true


--== AMMO SETTINGS ==--


-- How much ammo is given on purchase
-- Requires Item_mode = false
Config.Ammo_amount = 42


--== REFILL SETTINGS ==--


-- Stock Refill ON or OFF
Config.Refill_stock = true

-- How much stock is refilled
-- Needs Above to be True
Config.Pistol_stock		= math.random(8,16)
Config.Shotgun_stock	= math.random(2,6)
Config.Smg_stock		= math.random(6,10)
Config.Rifle_stock		= math.random(4,8)
Config.Sniper_stock		= math.random(1,4)


--== RESTOCK SETTINGS ==--


-- Stock Restock ON or OFF
Config.Timed_restock = true

-- What time? ( 24 hour clock ONLY )
-- Needs above to be true
Config.Hour		= 18
Config.Minute	= 00

-- How many weapons are in each category
Config.Cat_pistols	= 3
Config.Cat_rifles	= 3
Config.Cat_snipers	= 3
Config.Cat_shotgun	= 3
Config.Cat_smg		= 3

-- What weapons are to be randomized ( needs above to be true )
Config.Weapon_restock = {

	pistol	= {
		
		{
			name			= "WEAPON_PISTOL",
			price			= 300,
			starting_stock	= math.random(8,16),
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

	shotgun	= {
		
		{
			name			= "WEAPON_PUMPSHOTGUN",
			price			= 3000,
			starting_stock	= math.random(4,8)
		},

		{
			name			= "WEAPON_SAWNOFFSHOTGUN",
			price			= 2500,
			starting_stock	= math.random(2,8)
		},

		{
			name			= "WEAPON_HEAVYSHOTGUN",
			price			= 5500,
			starting_stock	= math.random(1,6)
		}
	},

	smg	= {
		
		{
			name			= "WEAPON_MICROSMG",
			price			= 1000,
			starting_stock	= math.random(4,8)
		},

		{
			name			= "WEAPON_SMG",
			price			= 1500,
			starting_stock	= math.random(2,8)
		},

		{
			name			= "WEAPON_MINISMG",
			price			= 2500,
			starting_stock	= math.random(1,6)
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


--== LOCATION SETTINGS ==--


-- Zone config
-- ONLY CHANGE LOCATION DO NOT ADD NEW ZONE!!
Config.Zones = {

	BlackMarket = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1297.63, -392.76, 35.6)
		}
	}
}
