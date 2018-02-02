function __sf_util_git_branch
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end
