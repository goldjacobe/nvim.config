return {
  "folke/snacks.nvim",
  version = false,
  keys = {
    {
      "<leader>e",
      function()
        require("snacks").picker.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer (Root Dir)",
    },
    {
      "<leader>E",
      function()
        require("snacks").picker.explorer({ cwd = vim.uv.cwd() })
      end,
      desc = "Explorer (cwd)",
    },
  },
  setup = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- If netrw was already loaded, clear this augroup
    if vim.fn.exists("#FileExplorer") then
      vim.api.nvim_create_augroup("FileExplorer", { clear = true })
    end
  end,
}
