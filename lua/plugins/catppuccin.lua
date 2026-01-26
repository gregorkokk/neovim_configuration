return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Light theme
    -- vim.cmd.colorscheme "catppuccin-latte"
    -- Cool dark
    vim.cmd.colorscheme "catppuccin-frappe"
    -- Warm dark
    -- vim.cmd.colorscheme "catppuccin-macchiato"
    -- Darkest -> current
    -- vim.cmd.colorscheme "catppuccin-mocha"
  end
}
