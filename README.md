# dotfiles
My personal dotfiles setup with:
- zsh & ohmyzsh
- nvim
- iterm2

# installation on a new mac w/ zsh
1. install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
2. install [iterm 2](https://iterm2.com/downloads.html)
3. clone the repo and copy its contents to ~ 
4. set up iterm2 profile:
   4a. iTerm2 -> Preferences -> Profiles -> Other Actions -> Import JSON profiles -> nguyen-darianhuy.json
   OR set up manually
   4b. install [gruvbox-dark](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Gruvbox%20Dark.itermcolors)
      - iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> Import -> Gruvbox Dark.itermcolors
   4c. install [powerline fonts](https://github.com/powerline/fonts#quick-installation)
      - iTerm2 -> Preferences -> Profiles -> Text -> Font -> Meslo LG M for Powerline
5. install [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux)
6. install [vim-plug](https://github.com/junegunn/vim-plug#neovim)
7. install [node](https://nodejs.org/en/download/package-manager/#macos)
8. install [git-prune](https://github.com/diazod/git-prune#oh-my-zsh)
9. (OPTIONAL) hide public github email
   - `$ git config --global user.email “your-username@users.noreply.github.com”`
