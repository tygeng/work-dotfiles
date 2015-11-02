cd ~
rmdir ~/.vim
rmdir ~/.zsh
rm ~/.vimrc
rm ~/.zshrc
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

    ln -sd ~/.dotfiles/zsh/.zsh ~/.zsh
    ln -sd ~/.dotfiles/vim/.vim ~/.vim
    ln -s ~/.dotfiles/.Xmodmap ~/.Xmodmap
    ln -s ~/.dotfiles/.compton.conf ~/.compton.conf
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -sd ~/.dotfiles/bin ~/bin
    ln -sd ~/.dotfiles/i3/.i3 ~/.i3
    ln -s ~/.dotfiles/i3/.i3status.conf ~/.i3status.conf
    xrdb -merge ~/.dotfiles/i3/.xresources

mkdir ~/.vimundo

cd ~/.vim/bundle || (echo 'Cannot cd to ~/.vim/bundle. Will exit' && exit)

git clone https://github.com/marijnh/tern_for_vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd ..
git clone https://github.com/scrooloose/syntastic.git
cd ~

