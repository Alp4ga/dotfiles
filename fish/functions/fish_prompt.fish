function __user_host
  set -l content 
  if [ (id -u) = "0" ];
    echo -n (set_color --bold red)
  else
    echo -n (set_color --bold green)
  end
  echo -n $USER@(hostname|cut -d . -f 1) (set color normal)
end

function __current_path
  echo -n (set_color white) (pwd) (set_color normal) 
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info (set_color --bold red) $git_branch
    else
      set git_info (set_color --bold green) $git_branch
    end

    echo -n $git_info (set_color normal) 
  end
end

function fish_prompt
  echo -n (set_color --bold green)""(set_color blue)
  __current_path
  __git_status
  echo (set_color blue)"> "(set_color normal)
end

function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) $st(set_color normal)
  end
end