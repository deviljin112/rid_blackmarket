--[[

Welcome to the introduction and tutorial for the Re-Ignited D3velopment Auto Restocking Black Market!

In this tutorial we will be going over the basics of the config, and how everything works, what it does, and how to change it to work in a manner that fits best for you and your server!
Script made by : Re-Ignited D3velopment Crew

Visit our Discord for direct help or any ESX / FiveM related help

( https://discord.gg/akXEgcF )

Tutorial Author: BTNGaming

Main Script Author : D3v

Co-Author : BTNGaming

Thanks to : Crumble

Do not sell this script

Do not share this work as your own

Edit for personal uses only

-= FOR PERSONAL USE ONLY =-

]]--

-----------------------------------------------
--[[
COMMONLY USED TERMS IN THIS DOCUMENT:

RESTOCK - Items will be replaced with new ones (Delivery of new items) when current stock is at ZERO "0".
REFILL - Items will be restocked with new stock of the same item when their current stock is at ZERO "0", and NO new items will be delivered.
]]--
-----------------------------------------------

--== MARKER SETTINGS ==--

Config.DrawDistance = 100
-- This allows you to set the distance in which the marker is visible to the player.
-- Try changing this number a bit and restart the script/server to see what works best for you.
-- (Smaller = Player has to be closer to see it)

Config.Size = { x = 1.5, y = 1.5, z = 0.5 }
-- This will allow you to set the SIZE of the marker that the player will see in game when close enough to the location.

Config.Color = { r = 255, g = 0, b = 0 }
-- This is how the color of the marker is chosen, If you want to change the color, you can find charts to give you color choices,
-- Just replace the numbers with corresponding numbers in your RGB Color Chart.
-- A decent chart can be found here: https://www.rapidtables.com/web/color/RGB_Color.html

Config.Type = 1
-- This will allow you to change the marker to whatever you want within a list that GTA Provides.
---List of available Markers: https://wiki.gtanet.work/index.php?title=Marker


--== Language Settings ==--

Config.Locale = 'en'
-- Set your Language option here, (br, de, en, es, fi, fr, pl, sv) Or create your own Locale, and set it here.

-----------------------------------------------

--== FUNCTION SETTINGS ==--


Config.Restart_refill = true
-- If this is set to TRUE, Items will be REFILLED when the server or script is restarted.

Config.Restart_restock = true
-- If this is set to TRUE, Items will be RESTOCKED when the server or script is restarted.

Config.Item_mode = true
-- If this is set to TRUE, Weapons will be sent to you as an inventory item, for scripts like Disc-InventoryHud,
-- You MUST set this to true!!! (For normal inventory system, set this to FALSE)

Config.Give_ammo = true
-- If this is set to TRUE it will give 1 normal ammo pack to the player when purchasing a gun.
-- THIS IS ONLY FOR ITEM MODE, NOT WEAPON MODE! (Works for Disc-InventoryHud and other custom inventories that turn weapons into Items).
-- (Requires you to set Config.Item_mode = true)

Config.Use_black_money = true
-- Setting this to TRUE will use Dirty/Black money. Setting this to false will use normal/clean cash.

---------------------------------------------

--== Police Settings ==--

Config.Police_Visibility = true
-- If this is set to TRUE, Police CAN see the Black Market marker if they are close enough.
-- Set to false for police to NOT be able to see the marker at all.

Config.Police_Use = true
-- If this is set to TRUE, Police can use the marker, and purchase black market weapons/items.

-------------------------------------------

--== Ammo Settings ==--

Config.Ammo_amount = 42
-- Set this number to how much ammo you want a player given when purchasing a black market weapon.
-- THIS IS FOR WEAPON MODE, Config.Item_mode MUST be set to false.

------------------------------------------

--== Refill Settings ==--

Config.Refill_stock = true
-- With this set to TRUE, Your stock will refill when server restart/script restart occurs.

Config.Pistol_stock Config.Shotgun_stock Config.Smg_stock Config.Rifle_stock Config.Sniper_stock = math.random(#,#)
-- Here you can choose the amount of guns to restock if Config.Refill_stock is enabled. You can either use math.random(#,#)
-- to generate a random amount between the 2 numbers of your choosing, Or use a static number such as 6 by removing math.random
-- and placing just a single number in its place.

------------------------------------------

--== Restock Settings ==--

Config.Timed_restock = true
-- If this is set to true, The weapons will be restocked at a time chosen by you in the next setting below!

Config.Hour = 18
-- What hour do you want the RESTOCKING to occur? (24 hour cycle. Ex. 18 = 6PM).

Config.Minute = 00
-- What minute do you want the RESTOCKING to occur? (00-59) (Combined with hour is currently set to 18:00 aka 6:00pm.)

--== Weapon Settings ==--

Config.Cat_pistols = 3 Config.Cat_rifles = 3 Config.Cat_snipers = 3 Config.Cat_shotgun = 3 Config.Cat_smg = 3
-- Here you can choose how many weapons are in each category to randomly choose from. (Be sure to make sure the Config.Weapon_restock
-- below this has that many weapons in it)

````````````````````````````````````````````
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
-- In this section, You can set various different features.

-- ~ Firstly, "name =" - Add the weapon spawn name of a weapon you want a random chance of stocking in your black market.

-- ~ Second, "price =" - Set the price you want the gun to sell for in the black market.

-- ~ Third, "starting_stock =" - You can set how many of that gun stock. You can use math.random(#,#) to get a RANDOM amount,
-- or change "math.random(#,#)" to a static number like "6" to get exactly 6 if that weapon is chosen.

----------------------------------------------------

--== LOCATION SETTINGS ==--

-- DO NOT UNDER ANY CIRCUMSTANCES UNLESS YOU KNOW WHAT YOU ARE DOING, CHANGE ANYTHING IN THE FOLLOWING CODE ASIDE FROM THE COORDINATES!!!
Config.Zones = {

	BlackMarket = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1297.63, -392.76, 35.6)
		}
	}
}
-- ONLY CHANGE THE LINE THAT SAYS vector3(-1297.63, -392.76, 35.6)
-- The only thing you need to change is -1297.63, -392.76, 35. to the location/cordinates you want your black market to be.

--------------------------------------------------
