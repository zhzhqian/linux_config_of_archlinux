require("basic")

require("keybindings")

require("plugins")

require("colorscheme")
require("hop").setup()
require("lualine").setup()
require("plugin-config.bufferline")
require("plugin-config.dashboard")
require("plugin-config.indent-blankline")
require("plugin-config.spectre")
require("plugin-config.mundo")
require("plugin-config.nvim-tree")
require("plugin-config.transparent")
require("plugin-config.treesitter")
require("plugin-config.vista")
require("plugin-config.misc")
require("plugin-config.telescope")
require("plugin-config.which-key")
require("lsp/setup")
require("lsp/nvim-cmp")
require("lsp/null-ls")

vim.lsp.set_log_level("warn")
-- aliases
local execute = vim.api.nvim_command
local vim     = vim
local opt     = vim.opt -- global
local g       = vim.g -- global for let options
local wo      = vim.wo -- window local
local bo      = vim.bo -- buffer local
local fn      = vim.fn -- access vim functions
local cmd     = vim.cmd -- vim commands
local api     = vim.api -- access vim api
-- autocommands
--- This function is taken from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

local autocmds = {
    --    reload_vimrc = {
    --        -- Reload vim config automatically
    --        { "BufWritePost", [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]] };
    --    };
    --    change_header = {
    --        { "BufWritePre", "*", "lua changeheader()" }
    --    };
    --    packer = {
    --        { "BufWritePost", "plugins.lua", "PackerCompile" };
    --    };
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    save_shada = {
        { "VimLeave", "*", "wshada!" };
    };
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
    };
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" };
    };
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] };
    };
    ansi_esc_log = {
        { "BufEnter", "*.log", ":AnsiEsc" };
    };
}

nvim_create_augroups(autocmds)
vim.opt.termguicolors = false
-- autocommands END
