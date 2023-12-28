local function map(mode, what, to)
    return vim.keymap.set(mode, what, to)
end

vim.g.mapleader = ","

map("n", "<leader>j", 'o<Esc>')
map("n", "<leader>k", 'O<Esc>')
map('n', 'ga', '<Plug>(EasyAlign)')
map('x', 'ga', '<Plug>(EasyAlign)')

map('i', '<C-H>', '<C-w>')

vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua project_files()<CR>", { noremap = true, silent = true })

map('v', 'J', ":m '>+1<CR>gv=gv");
map('v', 'K', ":m '<-2<CR>gv=gv");

-- nvimtree
map('n', '<C-b>', ':NvimTreeToggle<Cr>');
map('i', '<C-b>', ':NvimTreeToggle<Cr>');

map('n', '<leader>cdn', function()
    vim.cmd('cd /home/arthurx/.config/nvim')
end);
