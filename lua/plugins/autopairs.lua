return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true, -- Use treesitter if available
      ts_config = {
        lua = { 'string' },
        python = { 'string' },
        cpp = { 'string' },
      },
      -- Don't add pairs if the next character is alphanumeric
      ignored_next_char = "[%w%.]",
      fast_wrap = {
        map = "<M-e>", -- Alt + e
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment"
      },
    })

    -- Integration with nvim-cmp
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
