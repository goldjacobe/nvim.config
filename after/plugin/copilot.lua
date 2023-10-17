if not vim.g.vscode then 
    require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end
