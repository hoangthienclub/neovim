local twilight = require("twilight")

twilight.setup {
  {
    dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = false, term_bg = "#000000"},
    context = 10,
    treesitter = true,
    expand = {"function", "method", "table", "if_statement"}
  }
}

