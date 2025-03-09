return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			openai_params = {
				model = "gpt-4-1106-preview",
			},
			edit_with_instructions = {
				keymaps = {
					accept = "<C-a>",
					use_output_as_input = "<C-u>",
				},
			},

		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
