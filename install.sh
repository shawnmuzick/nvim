#create a symlink to .vimrc in ~/
cd ~
ln -s .vim/.vimrc .vimrc

#map .vimrc to nvim config, they are compatible
ln -s .config/nvim/pack .vim/pack
ln -s .config/nvim/init.vim .vimrc

# Load all of the submodules
cd ~/.config/nvim
git submodule update --recursive --remote

# Check for/Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
     sudo dnf install nodejs
fi

# Insert Coc extensions folder
echo Inserting Coc extensions folder
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
	echo '{"dependencies":{}}'> package.json
fi

# Build Coc Enhancements
echo Building Coc Enhancements
npm install coc-clangd coc-css coc-prettier coc-emmet coc-html coc-json coc-rome coc-tsserver \
 	--global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

echo Installation Complete!
