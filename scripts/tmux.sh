SESSION=dev

cd ~/Projects
tmux new-session -d -s $SESSION


tmux new-window -t $SESSION:2 -n 'homy'
tmux new-window -t $SESSION:3 -n 'qoffer'
tmux new-window -t $SESSION:4 -n 'samvel'
tmux new-window -t $SESSION:5 -n 'husher'
tmux kill-window -t $SESSION:1

tmux select-window -t $SESSION:1
tmux send-keys 'cd ~/Projects/coder/homy' C-m
tmux select-window -t $SESSION:2
tmux send-keys 'cd ~/Projects/qoffer/qoffer-laravel' C-m
tmux select-window -t $SESSION:3
tmux send-keys 'cd ~/Projects/coder/samvel' C-m
tmux select-window -t $SESSION:4
tmux send-keys 'cd ~/Projects/coder/husher.am' C-m

tmux select-window -t $SESSION:1




tmux attach -t $SESSION
