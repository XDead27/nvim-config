-- On NixOS with nixCats, lazy.nvim appends plugin paths after VIMRUNTIME in the rtp.
-- This causes VIMRUNTIME's ftplugin/tex.vim to set b:did_ftplugin before vimtex's
-- ftplugin/tex.vim runs, so vimtex bails out and never calls vimtex#init().
-- Calling it here (after all regular ftplugins) fixes initialization.
if vim.b.vimtex == nil and vim.g.loaded_vimtex == 1 then
  vim.fn['vimtex#init']()
end
