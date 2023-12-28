vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'sainnhe/gruvbox-material',
        as = 'gruvbox',
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async',
        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end
        })
    }

    use 'junegunn/vim-easy-align'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('ibl').setup() end
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
    }

    use({
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup();
        end
    })

    use {
      "startup-nvim/startup.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
          require("startup").setup({
              theme = "evil",
              options = {
                  open_file = "<C-p>"
              }
          })
      end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    mode = 'tabs',
                    separator_style = 'slope'
                }
            })
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    use('jwalton512/vim-blade')
    use('sainnhe/edge')
    use('hrsh7th/cmp-buffer')
end)
