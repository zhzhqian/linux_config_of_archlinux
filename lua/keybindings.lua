vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap

local opt = { noremap = true, silent = true }

-- Visual模式 复制到系统剪贴板
map("v", "<C-y>", '"+y', opt)
-- Insert right
map("i", "<C-f>", "<Right>", opt)
-- windows 分屏快捷键
map("n", "<leader>ss", ":vsp<CR>", opt)
-- 关闭当前
map("n", "<leader>x", "<C-w>c", opt)
-- 关闭其他
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

map("n", "<leader>1", "1gt<ct>", opt)
map("n", "<leader>2", "2gt<ct>", opt)
map("n", "<leader>3", "3gt<ct>", opt)
map("n", "<leader>4", "4gt<ct>", opt)
map("n", "<leader>5", "5gt<ct>", opt)

-- fzf.vim
map("n", "<C-p>", ":Files<CR>", opt)
map("n", "<A-f>", ":Lines<CR>", opt)
map("n", "<leader>c", ":Rg<CR>", opt)
map("n", "<leader>b", ":Buffers<CR>", opt)

-- hop.nvim
map("n", "<leader>w", ":HopWord<CR>", opt)
map("n", "<leader>l", ":HopLine<CR>", opt)

-- vista.vim
map("n", "<leader>\\", ":Vista!!<CR>", { noremap = true })

-- mundo
map("n", "<leader>u", ":MundoToggle<CR>", opt)

local pluginKeys = {}

map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "vsplit" },
	{ key = "e", action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	mapbuf("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	-- format
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true })
end

pluginKeys.cmp = function(cmp)
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end
	return {
		["<Tab>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
				else
					fallback()
				end
			end,
		}),
		["<S-Tab>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
		}),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = cmp.mapping({
			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
				else
					fallback()
				end
			end,
		}),
	}
end

return pluginKeys
