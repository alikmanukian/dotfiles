SESSION=dev
cd ~/www/accontech/techbuddy
tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'tb-dev'
tmux kill-window -t $SESSION:0
tmux new-window -t $SESSION:0 -n 'tb-local'
tmux new-window -t $SESSION:2 -n 'tb-io'
tmux select-window -t $SESSION:0

tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 20
tmux split-window -v
tmux resize-pane -D 10
# tmux send-keys 'cd /' C-m


tmux attach -t $SESSION
