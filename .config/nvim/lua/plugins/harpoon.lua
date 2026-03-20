return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    require("harpoon").setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })
  end,
  keys = function()
    local keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>hc",
        function()
          require("harpoon"):list():clear()
          vim.notify("Harpoon list cleared", vim.log.levels.INFO)
        end,
        desc = "Clear all Harpoons",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          local toggle_opts = {
            border = "rounded",
            title_pos = "center",
            ui_width_ratio = 0.40,
          }

          harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>H",
        function()
          local harpoon = require("harpoon")
          local finder = function()
            local paths = {}
            for _, item in ipairs(harpoon:list()) do
              table.insert(paths, item.value)
            end

            return require("telescope.finders").new_table({
              results = paths,
            })
          end
          local conf = require("telescope.config").values
          local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                  results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                  map("i", "<C-d>", function()
                    local state = require("telescope.actions.state")
                    local selected_entry = state.get_selected_entry()
                    local current_picker = state.get_current_picker(prompt_bufnr)

                    table.remove(harpoon_files.items, selected_entry.index)
                    current_picker:refresh(finder())
                  end)
                  return true
                end,
              })
              :find()
          end
          toggle_telescope(harpoon:list())
        end,
        desc = "Harpoon Telescope",
      },
      {
        "<leader>hn",
        function()
          local harpoon = require("harpoon")
          harpoon:list():next()
        end,
        desc = "Harpoon Next",
      },
      {
        "<leader>hp",
        function()
          local harpoon = require("harpoon")
          harpoon:list():prev()
        end,
        desc = "Harpoon Prev",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
