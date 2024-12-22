local M = {}

local api = vim.api
local function set_global_channel(opts)
	local buf = vim.api.nvim_get_current_buf()
	local buffer = vim.bo[buf]
	vim.g.kdas_chan = buffer.channel
	vim.g.kdas_buf = buf
	vim.g.kdas_win = api.nvim_get_current_win()
end

local function send_current_line(opts)
	local line = vim.api.nvim_get_current_line()
	api.nvim_chan_send(vim.g.kdas_chan, line .. "\r")
end

local function send_current_visual(opt)
	api.nvim_command("* y")
	local jumpback_win = api.nvim_get_current_win()
	api.nvim_set_current_win(vim.g.kdas_win)
	api.nvim_command("normal! p")
	api.nvim_chan_send(vim.g.kdas_chan, "\r")
	api.nvim_set_current_win(jumpback_win)
end

M.setup = function(opts) end

-- KeyMap setup
vim.api.nvim_create_user_command("SetPasteWindow", set_global_channel, {})
vim.keymap.set({ "n" }, "<leader>tl", send_current_line, { desc = "Sends the current line to the terminal set." })
vim.keymap.set(
	{ "n", "v" },
	"<leader>tv",
	send_current_visual,
	{ desc = "Sends the visual seclection to the terminal set." }
)

return M
