local telescope = require('telescope')

local ext_config = {}
local swap_config = {}

function swap_config.setup(config)
  ext_config = config or {}
end

swap_config.exports = {
  replace_configs = function (opts)
    opts = opts or {}
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

    -- Use ext_config.path to get the path to JSON files

    local json_files = vim.fn.systemlist('ls -1 ' .. ext_config.path .. '/*.json')

    pickers.new(opts, {
      prompt_title = 'Replace Configuration File',
      finder = finders.new_table {
        results = json_files,
      },
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          local src_file = selection.value
          local dest_file = ext_config.path .. '/configuration.json'
          vim.cmd('!cp ' .. src_file .. ' ' .. dest_file)
          print('Replaced configuration.json with ' .. src_file)
        end)
        return true
      end,
    }):find()
  end,
}

return swap_config

