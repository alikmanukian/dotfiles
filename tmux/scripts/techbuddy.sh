SESSION=dev

ssh-add ~/.ssh/accontech
ssh-add ~/.ssh/aws

cd ~/www/accontech/techbuddy
tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'tb-monitoring'
tmux kill-window -t $SESSION:0
tmux new-window -t $SESSION:0 -n 'tb-local'
tmux new-window -t $SESSION:2 -n 'tb-servers'

# spliting 1st window
tmux select-window -t $SESSION:0
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 20

# spliting 2nd row
tmux select-window -t $SESSION:1
tmux split-window -h

# activate 1st window
tmux select-window -t $SESSION:0
tmux send-keys -t 1.left 'git loglive' C-m
tmux send-keys -t 1.right 'docker exec techbuddy tail -f /var/www/techbuddy/storage/logs/laravel.log' C-m

# tmux split-window -v
# tmux resize-pane -D 10
# tmux send-keys 'cd /' C-m


tmux attach -t $SESSION
