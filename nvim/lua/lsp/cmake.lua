local cmake_on_attach = function(client, bufnr)
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
	-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
end
return {
    cmd ={"~/.config/nvim/nvim-python/bin/cmake-language-server"},
    on_attach = cmake_on_attach,
    filetypes = {"cmake"},   
  }
  