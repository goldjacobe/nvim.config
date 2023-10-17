function ColorMyPencils(color)
	color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

if not vim.g.vscode then
    ColorMyPencils()
end
