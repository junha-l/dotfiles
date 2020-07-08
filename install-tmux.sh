# Install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
echo "set-option -g default-shell /usr/bin/zsh" >> .tmux/.tmux.conf.local
cp .tmux/.tmux.conf.local .
