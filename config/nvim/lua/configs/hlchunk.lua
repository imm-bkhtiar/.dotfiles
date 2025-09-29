require('hlchunk').setup({
  chunk = {
    enable = true
  },
  indent = {
    enable = true
  },
})

local indent = require('hlchunk.mods.chunk')
indent({
  style = {}
}):enable() -- don't forget call enable method
