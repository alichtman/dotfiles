-- https://github.com/SethGunnells/dotfiles/blob/b3fae694b114e213b63f6a45efd7ee98e00430f5/nvim/lua/plugins/telescope.lua#L49-L76
--
local function is_git_repo()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	return vim.v.shell_error == 0
end

local function get_git_root_opts()
	local opts = {}
	if is_git_repo() then
		local dot_git_path = vim.fn.finddir(".git", ".;")
		opts = { cwd = vim.fn.fnamemodify(dot_git_path, ":h") }
	end
	return opts
end

local function make_find_files(from_root)
	return function()
		local opts = {
			hidden = true,
			previewer = false,
			path_display = {
				shorten = {
					len = 5,
					exclude = { -1, -2 },
				},
			},
		}
		if from_root then
			opts = vim.tbl_extend("force", opts, get_git_root_opts())
		end
		require("telescope.builtin").find_files(opts)
	end
end

return {}
