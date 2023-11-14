# uuid-hex.nvim
convert uuid to hex to hex literal and back again

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- plugins/uuid-hex.lua
return {
  'danporterhonor/uuid-hex.nvim',

  config = function()
    local uuid_hex = require('uuid-hex')
    vim.keymap.set('n', '<leader>th', uuid_hex.toggle, {})
  end,
}
```
