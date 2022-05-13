require("basic")

require("keybindings")

require("plugins")

require("colorscheme")

require("hop").setup()
require("lualine").setup()
require("plugin-config.bufferline")
require("plugin-config.dashboard")
require("plugin-config.indent-blankline")
require("plugin-config.mundo")
require("plugin-config.nvim-tree")
require("plugin-config.transparent")
require("plugin-config.treesitter")
require("plugin-config.vista")

require("lsp/setup")
require("lsp/nvim-cmp")
require("lsp/null-ls")
