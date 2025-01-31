return {
  -- disable neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    keys = {
      {
        "<leader>e",
        false,
      },
      {
        "<leader>E",
        false,
      },
    },
  },
  -- disable flash
  { "folke/flash.nvim", enabled = false },
}
