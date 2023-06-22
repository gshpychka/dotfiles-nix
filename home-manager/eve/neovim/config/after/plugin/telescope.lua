local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Telescope commands" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Telescope LSP references" })

vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})

require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            case_mode = "smart_case",
        }
    }
}

require('telescope').load_extension('fzf')
