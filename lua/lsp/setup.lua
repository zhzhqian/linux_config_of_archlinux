local lsp_installer = require("nvim-lsp-installer")
-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
	sumneko_lua = require("lsp.lua"), -- /lua/lsp/lua
	pyright = require("lsp.python"),
	gopls = require("lsp.go"),
	hls = require("lsp.haskell"),
}

-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]
	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				-- 绑定快捷键
				require("keybindings").mapLSP(buf_set_keymap)
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end,
		})
	end
end)
