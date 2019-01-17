echo "setting zsh as default shell"
chsh -s $(which zsh)

echo "installing oh-my-zsh"
git clone https://www.github.com/robbyrussell/oh-my-zsh.git ${HOME}/.config/oh-my-zsh 
