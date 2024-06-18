local filetypes = {
	"markdown",
	"text",
	"tex",
	"gitcommit",
	"scratch",
	"jrnl",
}
return {
	"gaoDean/autolist.nvim",
	ft = filetypes,
	config = function()
		local autolist = require("autolist")

		autolist.setup({
			colon = { indent_raw = false },
		})

		local opts = { buffer = true }

		local function set_keymaps()
			vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<CR>", { buffer = true })
			vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<CR>", { buffer = true })
			vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<CR>", { buffer = true })

			-- cycle list types with dot-repeat
			-- vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
			-- vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

			-- functions to recalculate list on edit
			vim.keymap.set("i", "<C-t>", "<c-t><cmd>AutolistRecalculate<CR>")
			vim.keymap.set("i", "<C-d>", "<c-d><cmd>AutolistRecalculate<CR>")
			vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<CR>")
			vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<CR>")
			vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<CR>")
			vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<CR>")
		end

		local augroup = vim.api.nvim_create_augroup("Autolist", {})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			group = augroup,
			callback = set_keymaps,
		})

		-- Set the keymaps the firs time autolist.nvim gets lazy-loaded
		set_keymaps()
	end,
}
