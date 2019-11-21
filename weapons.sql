USE `essentialmode`;

CREATE TABLE `black_market` (
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
	('WEAPON_HEAVYSNIPER', 30000, 5, 'BlackMarket', 'sniper')
;
