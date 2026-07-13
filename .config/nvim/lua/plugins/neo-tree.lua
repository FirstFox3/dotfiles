return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
	opts = {
		reveal = true,
		enable_diagnostics = true,
		filesystem = {
			hijack_netrw_behavior = "open_current", -- Opens the neotree window in current position instead of netrw
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_ignored = false,
				hide_gitignored = false,
			},
		},
	},
  }
}
