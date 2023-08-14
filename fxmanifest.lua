fx_version 'cerulean'
game 'gta5'

author 'SyreX'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/icons/*.png',
  'html/style.css',
  'html/listener.js'
}

client_script {
  'client/zone_red.lua',
  'client/zone_green.lua',
}

shared_script {
  'config.lua'
}
