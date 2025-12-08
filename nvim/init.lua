-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = { "text", "*" }, -- Check both text files and any file
  callback = function(args)
    -- Only apply if filetype is 'text' or empty (no filetype detected)
    local ft = vim.bo[args.buf].filetype
    if ft == "text" or ft == "" or ft == "conf" or "latex" then
      vim.wo.wrap = true
      vim.bo.textwidth = 0  -- Prevent auto line breaks
    end
  end,
})

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
