cd ~
rm -rf .dotfiles
git clone https://github.com/tygeng/work-dotfiles.git
mv work-dotfiles .dotfiles
rmdir ~/.vim
rmdir ~/.zsh
rm ~/.vimrc
rm ~/.zshrc
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

if [[ "$unamestr" == 'Linux' ]]; then
    ln -sd ~/.dotfiles/zsh/zsh ~/.zsh
    ln -sd ~/.dotfiles/vim/vim_folder ~/.vim
elif [[ "$unamestr" == 'Darwin' ]]; then
    ln -s ~/.dotfiles/zsh/zsh ~/.zsh
    ln -s ~/.dotfiles/vim/vim_folder ~/.vim
fi

mkdir ~/.vimundo

cd ~/.vim/bundle

git clone https://github.com/marijnh/tern_for_vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh
cd ..
git clone https://github.com/scrooloose/syntastic.git
cd ~

