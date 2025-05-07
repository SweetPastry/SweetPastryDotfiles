# Sweet Pastry `.dotfiles`

Below is an example demonstrating how to use GNU Stow to manage your .dotfiles. For more detailed information, please refer to the official documentation.

- Installation

macOS (via Homebrew)
```sh
brew install stow
```
Creating a .dotfiles Folder

mkdir ~/.dotfiles

Place all configuration files you want to manage (e.g., for Neovim, Zsh, Git, etc.) in this folder for centralized version control and easy maintenance.

Example: Managing Neovim Configuration
	1.	Create the configuration directory (in the example, <Username> serves as the “package” name):

mkdir -p ~/.dotfiles/<Username>/.config/nvim


	2.	Add your Neovim config files (e.g., init.vim or init.lua) to the ~/.dotfiles/<Username>/.config/nvim folder.
	3.	Run stow from within your ~/.dotfiles directory to create symbolic links:

cd ~/.dotfiles
stow <Username>

This will automatically link all files in the <Username> folder to your $HOME directory following the same file structure. It is similar to using ln -s, but stow handles more complex symlink structures for you.

By using this approach, you can keep your configuration files neatly organized, version-controlled, and easily portable across different environments.