return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "cpp", "csv", "cuda", "make", "python" },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  }
}
