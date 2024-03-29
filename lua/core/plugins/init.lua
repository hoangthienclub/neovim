local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
        fn.system(
        {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
    )
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init(
    {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "rounded"})
            end
        }
    }
)

-- Install your plugins here
return packer.startup(
    function(use)
        use {"wbthomason/packer.nvim"} -- Have packer manage itself
        use {"nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins
        use {"windwp/nvim-autopairs", config = "require('configs/autopairs')"} -- Autopairs, integrates with both cmp and treesitter

        use {"numToStr/Comment.nvim", config = "require('configs/comment')"}
        use {"JoosepAlviste/nvim-ts-context-commentstring"}
        use {"kyazdani42/nvim-web-devicons"}
        use {"kyazdani42/nvim-tree.lua", config = "require('configs/nvim-tree')"}
        use {"akinsho/bufferline.nvim", config = "require('configs/bufferline')"}
        use {"moll/vim-bbye"}
        use {"nvim-lualine/lualine.nvim", config = "require('configs/lualine')"}
        use {"akinsho/toggleterm.nvim", config = "require('configs/toggleterm')"}
        use {"ahmedkhalf/project.nvim", config = "require('configs/project')"}
        use {"lewis6991/impatient.nvim", config = "require('configs/impatient')"}
        use {"lukas-reineke/indent-blankline.nvim", config = "require('configs/indentline')"}
        use {"goolord/alpha-nvim", config = "require('configs/alpha')"}
        use {"folke/which-key.nvim", config = "require('configs/whichkey')"}

        -- Colorschemes
        use {"folke/tokyonight.nvim"}
        use {"lunarvim/darkplus.nvim"}

        -- Cmp
        use {"hrsh7th/nvim-cmp"} -- The completion plugin
        use {"hrsh7th/cmp-buffer"} -- buffer completions
        use {"hrsh7th/cmp-path"} -- path completions
        use {"saadparwaiz1/cmp_luasnip"} -- snippet completions
        use {"hrsh7th/cmp-nvim-lsp"}
        use {"hrsh7th/cmp-nvim-lua"}

        -- Snippets
        use {"L3MON4D3/LuaSnip"} --snippet engine
        use {"rafamadriz/friendly-snippets"} -- a bunch of snippets to use

        -- LSP
        use {"neovim/nvim-lspconfig"} -- enable LSP
        use {"williamboman/mason.nvim"} -- simple to use language server installer
        use {"williamboman/mason-lspconfig.nvim"}
        use {"jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
        use {"RRethy/vim-illuminate"}

        -- Telescope
        use {"nvim-telescope/telescope.nvim", config = "require('configs/telescope')"}

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            config = "require('configs/treesitter')"
        }

        -- Git
        use {"lewis6991/gitsigns.nvim", config = "require('configs/gitsigns')"}
        use {"xiyaowong/nvim-transparent", config = "require('configs/transparent')"}

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins

        -- Prettier
        use {"MunifTanjim/prettier.nvim"}
        --
        use {"folke/zen-mode.nvim", config = "require('configs/zen-mode')"}
        use {"folke/twilight.nvim", config = "require('configs/twilight')"}

        use {"nvim-telescope/telescope-file-browser.nvim"}
        use {"iamcco/markdown-preview.nvim"}

        -- Themes
        use {"catppuccin/nvim", as = "catppuccin", config = "require('configs/catppuccin')"}
        -- use({"monsonjeremy/onedark.nvim", branch = "treesitter", config = "require('configs/colorscheme')"})

        --
        use({
            "utilyre/barbecue.nvim",
            tag = "*",
            requires = {
                "SmiteshP/nvim-navic",
                "nvim-tree/nvim-web-devicons", -- optional dependency
            },
            after = "nvim-web-devicons", -- keep this if you're using NvChad
            config = "require('configs/nvim-web-devicons')"
        })

        use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('configs/neogit')" })
        -- use 'adelarsq/neoline.vim'
        use {'ojroques/nvim-hardline', config = "require('configs/nvim-hardline')"}

        use {
            'jghauser/mkdir.nvim'
        }
        use {
            'rcarriga/nvim-notify'
        }
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)
