return {
  "rose-pine/neovim",
  lazy = false,
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "dawn",
      highlight_groups = {
        CursorLine = { bg = "overlay" },
        -- This controls the cursor in terminal Neovim
        TermCursor  = { fg = "base", bg = "love" },
        Cursor      = { fg = "base", bg = "love" },
      },
    })
    vim.cmd.colorscheme "rose-pine"

    vim.opt.cursorline = true

  end
}
