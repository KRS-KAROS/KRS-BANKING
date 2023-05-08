fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Name 'krs-banking'
Author '𝗞𝗥𝗦®'
Discord 'https://discord.gg/wM4XDaXfU8' -- 𝗞𝗥𝗦® --


client_script {
    'config.lua',
    'client/**.lua'
}

server_script {
    'config.lua',
    'server/**.lua'
}

ui_page 'ui/krs.html'

files{
    'ui/krs.html',
    'ui/krs.css',
    'ui/krs.js',
    'ui/logo.gif',
    'ui/carta.png'
}

dependencies {
	'es_extended',
	'ox_target'
}