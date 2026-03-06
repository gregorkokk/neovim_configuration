local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  -- main
  s("main", {
    t({ "int main(int argc, char *argv[])", "{", "\t" }),
    i(1, ""),
    t({ "", "\treturn 0;", "}" }),
  }),

  -- function
  s("fun", {
    i(1, "void"), t(" "), i(2, "function_name"), t("("), i(3, ""), t({ ")", "{", "\t" }),
    i(4, ""),
    t({ "", "}" }),
  }),

  -- if
  s("if", {
    t("if ("), i(1, "condition"), t({ ")", "{", "\t" }),
    i(2, ""),
    t({ "", "}" }),
  }),

  -- if-else
  s("ife", {
    t("if ("), i(1, "condition"), t({ ")", "{", "\t" }),
    i(2, ""),
    t({ "", "}", "else", "{", "\t" }),
    i(3, ""),
    t({ "", "}" }),
  }),

  -- else
  s("else", {
    t({ "else", "{", "\t" }),
    i(1, ""),
    t({ "", "}" }),
  }),

  -- for
  s("for", {
    t("for ("), i(1, "int i = 0"), t("; "), i(2, "i < n"), t("; "), i(3, "++i"), t({ ")", "{", "\t" }),
    i(4, ""),
    t({ "", "}" }),
  }),

  -- while
  s("while", {
    t("while ("), i(1, "condition"), t({ ")", "{", "\t" }),
    i(2, ""),
    t({ "", "}" }),
  }),

  -- switch
  s("switch", {
    t("switch ("), i(1, "var"), t({ ")", "{", "\tcase " }),
    i(2, "value"),
    t({ ":", "\t\t" }),
    i(3, ""),
    t({ "", "\t\tbreak;", "\tdefault:", "\t\t" }),
    i(4, ""),
    t({ "", "\t\tbreak;", "}" }),
  }),
}, { override_priority = 1001 })
