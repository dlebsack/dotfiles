# ============================
# ===       Plugins        ===
# ============================
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-yank'

set -g @catppuccin_window_left_separator "█"
set -g @catppuccin_window_right_separator "█ "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_modules "directory session"
set -g @catppuccin_status_left_separator  " █"
set -g @catppuccin_status_right_separator "█"

# ==========================
# ===  General settings  ===
# ==========================
set -ga terminal-overrides ",*256col*:Tc"
set -g default-terminal "screen-256color"
set -g history-limit 20000
set -g buffer-limit 20
set -sg escape-time 0
set -g display-time 1500
set -g remain-on-exit off
set -g repeat-time 300
setw -g allow-rename off
setw -g automatic-rename off
setw -g aggressive-resize on

set -g prefix C-b

# Set parent terminal title to reflect current window in tmux session
set -g set-titles on
set -g set-titles-string "#I:#W"

# Start index of window/pane with 1, because we're humans, not computers
set -g base-index 1
setw -g pane-base-index 1

# Enable mouse support
# set -g mouse on

# ==========================
# ===   Key bindings     ===
# ==========================

# Unbind default key bindings, we're going to override
unbind "\$" # rename-session
unbind ,    # rename-window
unbind %    # split-window -h
unbind '"'  # split-window
unbind '}'  # swap-pane -D
unbind '{'  # swap-pane -U
unbind [    # paste-buffer
unbind ]
unbind "'"  # select-window
unbind n    # next-window
unbind p    # previous-window
unbind l    # last-window
unbind M-n  # next window with alert
unbind M-p  # next window with alert
unbind o    # focus thru panes
unbind &    # kill-window
unbind "#"  # list-buffer
unbind =    # choose-buffer
unbind z    # zoom-pane
unbind M-Up  # resize 5 rows up
unbind M-Down # resize 5 rows down
unbind M-Right # resize 5 rows right
unbind M-Left # resize 5 rows left


# Edit configuration and reload
bind C-e new-window -n 'tmux.conf' "sh -c '\${EDITOR:-neovim} ~/.tmux.conf && tmux source ~/.tmux.conf && tmux display \"Config reloaded\"'"

# Reload tmux configuration
bind C-r source-file ~/.tmux.conf \; display "Config reloaded"

# new window and retain cwd
bind c new-window -c "#{pane_current_path}"

# Prompt to rename window right after it's created
set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

# Rename session and window
bind r command-prompt -I "#{window_name}" "rename-window '%%'"
bind R command-prompt -I "#{session_name}" "rename-session '%%'"

# Split panes
bind | split-window -h -c "#{pane_current_path}"
bind _ split-window -v -c "#{pane_current_path}"

# Select pane and windows
bind -r C-[ previous-window
bind -r C-] next-window
bind -r [ select-pane -t :.-
bind -r ] select-pane -t :.+
bind -r Tab last-window   # cycle thru MRU tabs
bind -r C-o swap-pane -D
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Zoom pane
bind + resize-pane -Z

# Kill pane/window/session shortcuts
bind x kill-pane
bind X kill-window
bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
bind Q confirm-before -p "kill-session #S? (y/n)" kill-session

# Detach from session
bind d detach
bind D if -F '#{session_many_attached}' \
    'confirm-before -p "Detach other clients? (y/n)" "detach -a"' \
    'display "Session has only 1 client attached"'

# Hide status bar on demand
bind C-s if -F '#{s/off//:status}' 'set status off' 'set status on'

# Activity bell and whistles
set -g visual-activity on

# Prefer vi style key table
setw -g mode-keys vi

bind p paste-buffer
bind C-p choose-buffer

# trigger copy mode by
bind -n C-y copy-mode

# Scroll up/down by 1 line, half screen, whole screen
bind -T copy-mode-vi M-Up              send-keys -X scroll-up
bind -T copy-mode-vi M-Down            send-keys -X scroll-down
bind -T copy-mode-vi M-PageUp          send-keys -X halfpage-up
bind -T copy-mode-vi M-PageDown        send-keys -X halfpage-down
bind -T copy-mode-vi PageDown          send-keys -X page-down
bind -T copy-mode-vi PageUp            send-keys -X page-up

# When scrolling with mouse wheel, reduce number of scrolled rows per tick to "2" (default is 5)
bind -T copy-mode-vi WheelUpPane       select-pane \; send-keys -X -N 2 scroll-up
bind -T copy-mode-vi WheelDownPane     select-pane \; send-keys -X -N 2 scroll-down

# Run all plugins' scripts
run '~/.tmux/plugins/tpm/tpm'
