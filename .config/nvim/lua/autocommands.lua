vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.lsp.enable("qml-language-server")
	end,
})
