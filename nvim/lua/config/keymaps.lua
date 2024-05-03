-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

vim.keymap.set("n", "<leader>B", function()
  vim.cmd("2TermExec cmd='conan_build.sh'")
end, { desc = "Conan Build (root dir)" })
