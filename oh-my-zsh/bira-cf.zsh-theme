# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_time='%W %*'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'


if type 'set_cf_api_status' | grep -q 'function' ; then
    echo "exists"
    local _cf_api_status='$(set_cf_api_status)'
else
    echo "doesn't exist"
    local _cf_api_status=
fi

#PROMPT="╭─ ${user_host} ${current_dir} ${git_branch}
#PROMPT="╭─ ${current_time} ${user_host} ${current_dir} ${git_branch}
PROMPT="╭─ ${current_time} ${user_host} ${current_dir} ${git_branch} ${_cf_api_status}
╰─ %B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
