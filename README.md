# Weapon Black Market Shop
>    MADE BY : Re-Ignited D3velopment Crew

>    Visit our Discord Server for direct help with our scripts and general ESX / Fivem Help
>    ( https://discord.gg/akXEgcF )

>    Author: Deviljin112    Discord: D3v#0802   Github: ( https://github.com/Deviljin112 )

>    Co-Author: BTNGaming   Discord: BTNGaming#0001 Github: ( https://github.com/BTNGaming )

>    Special thanks to : Crumble - Helped with some coding issues :)

# Disclaimer

#### FEEL FREE TO EDIT THE CODE FOR PERSONAL USE!
#### DO NOT SHARE THE WORK AS YOUR OWN!
#### DO NOT SELL THIS WORK!

### -= FOR PERSONAL USE ONLY =-

# Description

    This is a black market weapon shop that uses a stock system.
    When stock runs out players are unable to purchase more weapons from this shop.
    After 24hrs (at the specified time in config) there is a new delivery of stock.
    
    Weapons are chosen at random from 3 categories; Pistols, Rifles and Snipers.
    New weapons are only chosen when stock of the current weapon is 0.
    So when there is still stock at the specified time the weapon will not be restocked or replaced.

    There is also an option for a script restart refill.
    Basically if the server or script is restarted you can have the 'stock' of weapons refilled to random values specified in Config file.
    Again this will only occur to the weapons that have 0 stock at the time of the restart.

    You can change what the weapons are changed to and everything about them, price, stock amounts etc.


# Installation

1) Place folder rid_blackmarket in you /resources/ folder
2) Add rid_blackmarket in your server.cfg file
3) Start your server and enjoy!

## Discord

* Don't forget to join us on Discord: https://discord.me/rid
* If that link doesn't work, Use this: https://discord.gg/akXEgcF

### Release History

* Version 2.1
    * ADD: Option to choose normal money or black money

* Version 2.0
    * ADD: Disc-Inventory Option
    * ADD: Option to get ammo (disc-inventory only)
    * ADD: Change amount of ammo given (non disc-inventory only)
    * ADD: Option to choose when RESTOCK or REFILL occurs
    * ADD: Shotguns, SMGs in Blackmarket
    * ADD: Ability to add any amount of weapons to randomizer
    * ADD: Option to choose how many weapons are in each category ( Removed category limit )
    * ADD: Random values for stock
    * FIX: Removed DEBUG prints and other debugging functionality

* Version 1.1
    * ADD: Config option for police to use the blackmarket
    * ADD: Config option for police to see the blackmarket marker
    
* Version 1.0
    * ADD: Refill stock on server restart
    * ADD: Random weapon delivery at specified time
    * ADD: Random amount of stock added
    * FIX: Multiple tables of data in the menu

### TO DO

* Change of location at specified time to a random from config
* Random Chance notification for police when purchasing weapon from black market
* Police to "shut down" black market sales for 24hrs (config specific)

### Dependencies

- ESX

**IF USING DISC-INVENTORYHUD THE FOLLOWING ARE ALSO DEPENDENCIES**
- Disc-Ammo
- Disc-Base
- Disc-InventoryHud

### Inspired By

- esx_weaponshop

#### MORE UPDATES IN THE FUTURE!

#### Please like/favorite on the FiveM Forums.
