USE `essentialmode`;

CREATE TABLE IF NOT EXISTS `black_market` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`item` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,
	`stock` int(11) NOT NULL,
	`zone` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `black_market` (`item`, `price`, `stock`, `zone`, `category`) VALUES
	('WEAPON_PISTOL', 300, 15, 'BlackMarket', 'pistol'),
	('WEAPON_ASSAULTRIFLE', 10000, 10, 'BlackMarket', 'rifle'),
	('WEAPON_HEAVYSNIPER', 30000, 4, 'BlackMarket', 'sniper'),
	('WEAPON_PUMPSHOTGUN', 4000, 6, 'BlackMarket', 'shotgun'),
	('WEAPON_SMG', 1500, 8, 'BlackMarket', 'smg')
;
