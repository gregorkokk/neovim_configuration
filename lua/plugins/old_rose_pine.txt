return {
  "rose-pine/neovim",
  lazy = false,
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "dawn",  -- light theme
    })
    vim.cmd.colorscheme "rose-pine"
  end
}
