curl https://raw.githubusercontent.com/Shouo/dein.vim/master/bin/installer.sh > installer.sh

sh installer.sh ~/.cache/dein

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bck
mv ~/.config/nvim/init.vim.min ~/.config/nvim/init.vim

nvim -c "call dein#install()"

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.min
mv ~/.config/nvim/init.vim.bck ~/.config/nvim/init.vim
