#### COLOUR

tm_color_active=colour41
tm_color_inactive=colour241
tm_color_feature=colour13
tm_color_music=colour164
tm_active_border_color=colour198

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set -g status-style fg=$tm_color_active,bg=default,default

# default window title colors
set -g window-status-style fg=$tm_color_active,bg=default
set -g window-status-format "#I #W"

# active window title colors
set -g window-status-current-style fg=$tm_color_active,bg=default
set-window-option -g window-status-current-format "#[bold]#I #W"

# pane border
set -g pane-border-style fg=$tm_color_inactive
set -g pane-active-border-style fg=$tm_active_border_color

# message text
set -g message-style fg=$tm_color_active,bg=default

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_date="#[fg=$tm_color_inactive] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]#S"

set -g status-left $tm_session_name' '
set -g status-right $tm_date' '$tm_host
