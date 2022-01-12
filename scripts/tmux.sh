SESSION=dev

cd ~/Projects/novads
tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:2 -n 'MP'
tmux new-window -t $SESSION:3 -n 'construct'
tmux new-window -t $SESSION:4 -n 'market'
tmux new-window -t $SESSION:5 -n 'qoffer'
tmux kill-window -t $SESSION:1

tmux select-window -t $SESSION:4
tmux send-keys 'cd ~/Projects/qoffer/laravel' C-m
tmux select-window -t $SESSION:3
tmux send-keys 'cd ~/Projects/novads/market' C-m
tmux select-window -t $SESSION:2
tmux send-keys 'cd ~/Projects/novads/construct' C-m
tmux select-window -t $SESSION:1
tmux send-keys 'cd ~/Projects/novads/main-project' C-m


tmux attach -t $SESSION
