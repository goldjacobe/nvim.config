return {
  "Wansmer/treesj",
  keys = {
    {
      "<leader>j",
      function()
        require("treesj").toggle()
      end,
      desc = "TreeSJ toggle",
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
