return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		"BurntSushi/ripgrep",
		"sharkdp/fd",
		"nvim-tree/nvim-web-devicons",
    },
	opts = {
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
		},
	},
}
