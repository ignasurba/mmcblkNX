#!/bin/bash
SESSION=mmcblkNX

tmux kill-session -t $SESSION
tmux new-session -d -s $SESSION

tmux split-window -v
tmux select-pane -t 0
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "dmesg -w" C-m
tmux select-pane -t 1
tmux send-keys "sudo ./test_1.sh" C-m
tmux select-pane -t 2
tmux send-keys "sudo ./test_2.sh" C-m

tmux attach-session -t $SESSION
