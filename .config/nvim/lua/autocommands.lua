local lint = require("lint")

lint.linters_by_ft  = {
	lua             = {"luacheck"},
	javascript      = {"eslint_d"},
	typescript      = {"eslint_d"},
	javascriptreact = {"eslint_d"},
	typescriptreact = {"eslint_d"},
	python          = {"pylsp"},
}

local group = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = group,
  callback = function()
    -- Only run the linter in buffers that you can modify in order to
    -- avoid superfluous noise, notably within the handy LSP pop-ups that
    -- describe the hovered symbol using Markdown.
    if vim.bo.modifiable then lint.try_lint() end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.lsp.enable("qml-language-server")
	end,
})
