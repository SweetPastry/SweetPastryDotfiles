# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# >>> bobthefish >>>
set -g fish_prompt_pwd_dir_length 0
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_virtualenv no
set -g theme_newline_cursor yes
set -g theme_display_git yes
set -g theme_display_git_default_branch yes
set -g theme_project_dir_length 0
# <<< bobthefish <<<

# >>> thefuck >>>
thefuck --alias | source
# <<< thefuck <<<
