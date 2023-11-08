# Telescope Swap Config Extension

This is a Telescope extension for Neovim that allows users to quickly swap JSON configuration files within a specified directory.

## Features

- Browse JSON configuration files within a predefined path.
- Replace a target configuration file with a selected file from the list.
- Streamlined workflow integrated with Telescope's fuzzy finder interface.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Neovim (0.5 or newer)
- Telescope.nvim plugin installed

## Installation

To install the `telescope-swap-config` extension, use your favorite package manager for Neovim. If you're using `packer.nvim`, you can add it like this:

```lua
use {
  'hamidi-dev/telescope-swap-config',
  requires = { {'nvim-telescope/telescope.nvim'} }
}
```

## Setup

After installing the extension, you need to include it in your Telescope setup in your init.lua:

```lua 
require('telescope').setup {
  extensions = {
    swap_config = {
      path = '/path/to/your/json/files', -- Replace with your actual path
    },
  },
}

-- Load the extension
require('telescope').load_extension('swap_config')
```

## Usage

To use the extension, run the following command in Neovim:

:Telescope swap_config replace_configs

This will open a picker with all the JSON files in the specified path. Selecting a file will replace the target configuration.json with the chosen file.


## Configuration

The extension can be configured by passing a table with options to the setup function. The available option is:

- path: The directory path where your JSON configuration files are located.

### Example:

```lua
require('telescope').setup {
  extensions = {
    swap_config = {
      path = os.getenv('MY_JSON_CONFIGS') or '/default/path',
    },
  },
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

License

MIT
