local opt = vim.o

vim.g.nvimdir = '~/.config/nvim'

vim.cmd.colorscheme('gruvbox-material')

-- fold
opt.foldmethod  = 'indent'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = '1'
opt.foldenable = true

opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.smartindent = false
opt.swapfile    = false
opt.textwidth   = 80
opt.smartcase   = true
opt.backspace = 'indent,eol,start'

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

opt.termguicolors = true

opt.hidden = true
opt.ruler  = true

opt.hlsearch       = false
opt.ignorecase     = true
opt.autoindent     = true
opt.number         = true
opt.relativenumber = true

opt.autoread = true

tab_history_file = '/tmp/nvim_tab_history'

vim.api.nvim_create_autocmd({'BufUnload'}, {
    pattern = '*',
    callback = function()
        local history = io.open(tab_history_file, 'a')
        history:write("\n" .. vim.api.nvim_buf_get_name(0))
        history:close()
    end
})

-- vim.api.nvim_create_autocmd({'BufWritePost'}, {
--     pattern = 'packer.lua',
--     command = 'PackerSync'
-- })

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'php',
  },
})

-- vim.api.nvim_add_user_command('nvim_dir', 'cd ~/.config/nvim')

local builtin = require('telescope.builtin')

project_files = function()
    local opts = {} -- define here if you want to define something
    local is_inside_work_tree = {}

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
      vim.fn.system("git rev-parse --is-inside-work-tree")
      is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if is_inside_work_tree[cwd] then
      builtin.git_files(opts)
    else
      builtin.find_files(opts)
    end
end
