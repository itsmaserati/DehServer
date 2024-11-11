fx_version 'cerulean'
game 'gta5'

description 'qb-inventory'
version '1.0.2'

shared_scripts {
	'shared/config.lua',
	'shared/vehicles.lua',
	'shared/filter.lua',
	'shared/bin.lua',
	'shared/vending.lua',
	'shared/lang.lua',
	'shared/dropitems.lua',
	'@qb-weapons/config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'server/visual.lua',
}

client_scripts {
	'client/main.lua',
	'client/visual.lua',
}


ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/main.css',
	'html/js/app.js',
	'html/images/*.svg',
	'html/images/*.png',
	'html/images/*.jpg',
	'html/inventory_images/*.png',
	'html/ammo_images/*.png',
	'html/attachment_images/*.png',
	'html/*.ttf'
}

escrow_ignore {
	'shared/config.lua',
	'shared/vehicles.lua',
	'shared/filter.lua',
	'shared/bin.lua',
	'shared/vending.lua',
	'shared/lang.lua',
	'shared/dropitems.lua',
	'@qb-weapons/config.lua',
	'html/images/*.svg',
	'html/images/*.png',
	'html/images/*.jpg',
	'For Damage & BC_Wounding.lua',
	'README.md'
}

lua54 'yes'
