return {
    'tpope/vim-fugitive',
    keys = {
        -- Open current file on github.com
        {
            '<leader>go',
            ':GBrowse<cr>',
            mode = { 'n', 'v' },
            desc = '[G]it [B]rowse file',
        },
        { '<leader>gs', ':Git<cr>', mode = { 'n', 'v' }, desc = '[G]it [S]tatus' },
    },
    cmd = { 'Git' },
    dependencies = { "tpope/vim-rhubarb" },
}
