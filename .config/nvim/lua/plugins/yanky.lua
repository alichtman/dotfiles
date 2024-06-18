return {
	"gbprod/yanky.nvim",
	lazy = false,
	config = function()
		require("yanky").setup({
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
				update_register_on_cycle = false,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
		})
	end,
}
