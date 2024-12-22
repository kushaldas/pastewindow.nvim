## pastewindow.nvim

A simple neovim plugin to allow to send a line or a visual selection to a target window.
I am using this to send to a terminal, helpful for teaching.

### Installation

 - Packer

   ```lua
   use "kushaldas/pastewindow"
   ```

 - [lazy.nvim](https://github.com/folke/lazy.nvim)
   
   ```lua
   {
	   "kushaldas/pastewindow"
   }
   ```

### Setup

NOTE: calling setup is not necessary.

```
   require('pastewindow').setup()
```

### Usage

    :SetPasteWindow
    	Run this command in the target window, and then you can use the following keybinding.

### KEYBINDINGS

	<leader>tl	To send the current line to the target window.
	<leader>tv	To send current visual selection to the target window.


