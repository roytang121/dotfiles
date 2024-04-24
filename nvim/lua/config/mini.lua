-- require("mini.basics").setup()
-- require("mini.starter").setup()
-- require("mini.comment").setup()
-- require("mini.statusline").setup()
-- require("mini.tabline").setup({
-- 	-- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
-- 	show_icons = true,
--
-- 	-- Whether to set Vim's settings for tabline (make it always shown and
-- 	-- allow hidden buffers)
-- 	set_vim_settings = true,
--
-- 	-- Where to show tabpage section in case of multiple vim tabpages.
-- 	-- One of 'left', 'right', 'none'.
-- 	tabpage_section = "left",
-- })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()
-- require("mini.align").setup()
-- require("mini.fuzzy").setup()
-- require("mini.indentscope").setup({
--     draw = {
--         delay = 0,
--     }
-- })
-- require('mini.indentscope').gen_animation.none()

require("mini.bracketed").setup()
-- require("mini.pairs").setup()

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]parenthen
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
-- require('mini.ai').setup { n_lines = 500 }
