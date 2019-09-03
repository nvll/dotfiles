so $HOME/dotfiles/plugins.vim
so $HOME/dotfiles/keybinds.vim
so $HOME/dotfiles/settings.vim
if !empty(glob(expand("$HOME/.vimrc.local")))
    exe 'so' "$HOME/.vimrc.local"
endif
