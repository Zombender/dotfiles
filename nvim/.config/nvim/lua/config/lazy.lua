local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.java" },
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      opts = {
        servers = {
          html = {},
        },
      },
    },
    {
      "samharju/synthweave.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("synthweave")
        -- transparent version
        -- vim.cmd.colorscheme("synthweave-transparent")
      end,
    },
    {
      "tpope/vim-fugitive",
    },
    {
      "saghen/blink.cmp",
      opts = {
        keymap = {
          ["<Tab>"] = {
            function(cmp)
              if cmp.is_visible() then
                cmp.accept()
                return true
              end
            end,
            "fallback",
          },
        },
      },
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    {
      "uga-rosa/ccc.nvim",
      -- Carga el plugin solo cuando ejecutes el comando o presiones la tecla
      cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
      keys = {
        { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
        { "<leader>ch", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Color Highlighter" },
      },
      opts = {
        -- Ejemplo de configuración: activar el resaltado automático al iniciar
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      },
      config = function(_, opts)
        require("ccc").setup(opts)
      end,
    },
  },
  defaults = {

    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "synthweave" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
