fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CodeCool Developer'
description 'CC Premium Armour Suit'
version '1.1.1'

shared_script {
    'config/config.general.lua',
    'config/config.shared.lua',
    'config/config.function.lua',
    'config/config.locale.lua',
    'config/config.notification.lua',
}

server_script 'server/main.lua'

client_script 'client/main.lua'

dependencies {
    'skinchanger',
}