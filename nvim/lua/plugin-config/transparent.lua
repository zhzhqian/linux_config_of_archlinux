require("transparent").setup({
	-- enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups
		-- example of akinsho/nvim-bufferline.lua
		"all",
	},
	exclude_group = {}, -- table: groups you don't want to clear
})
