vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.completeopt = vim.o.completeopt:gsub("preview", "")

vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeWinSize = 50
vim.g.NERDTreeShowHidden = 1

vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
