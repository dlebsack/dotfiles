local chatgpt = require("chatgpt")
local wk = require("which-key")
wk.add({
	mode = { "v" },
	{ "<leader>p",  group = "ChatGPT" },
	{ "<leader>pe", function() chatgpt.edit_with_instructions() end, desc = "Edit with instructions" },
	{ "<leader>pc", function() chatgpt.complete_code() end,          desc = "Complete code", },
})
wk.add({
	mode = { "n" },
	{ "<leader>p",  group = "ChatGPT" },
	{ "<leader>po", function() chatgpt.openChat() end, desc = "Open chat" },
})
