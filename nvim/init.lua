-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.g.vscode then
  vim.cmd("source ~/.config/nvim/legacy_config.vim")
else
  require("config.lazy")
end
