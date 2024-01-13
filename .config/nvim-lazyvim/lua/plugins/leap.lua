return {
    'ggandor/leap.nvim', -- TODO: Doesn't work! vim-easymotion
    config = function()
        require('leap').set_default_keymaps()
    end
}
