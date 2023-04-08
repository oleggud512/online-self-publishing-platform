# если сразу разбивать а не вводить команду а потом бить, то все будет ок.
new-session -s CW -n cmd -d

send-keys 'cd server && npm run start' C-m

split-window -h

send-keys 'cd client' C-m
send-keys 'flutter run'

split-window -v

split-window -v

send-keys 'emupixel33' C-m

select-pane -U

send-keys 'cd client && rps watch' C-m

select-pane -U

select-pane -L

split-window -v

split-window -v

resize-pane -y 30

send-keys 'cd admin && npm run start' C-m

select-pane -U

resize-pane -y 30

send-keys 'cd server && npm run build:watch' C-m

select-pane -R

resize-pane -y 20

select-pane -U

select-pane -U

resize-pane -D 40

new-window -n editor

send-keys 'nvim .' C-m

previous-window

attach-session -t CW
