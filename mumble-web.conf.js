// You can overwrite the default configuration values set in [config.js] here.
// There should never be any required changes to this file and you can always
// simply copy it over when updating to a new version.

let config = window.mumbleWebConfig // eslint-disable-line no-unused-vars

// E.g. changing default address and theme:
// config.defaults.address = 'voice.example.com'
// config.defaults.theme = 'MetroMumbleDark'
config.defaults.address = 'localhost'
config.defaults.port = '8089/demo'

config.connectDialog.address = false
config.connectDialog.port = false
config.connectDialog.token = false
config.connectDialog.channelName = false
