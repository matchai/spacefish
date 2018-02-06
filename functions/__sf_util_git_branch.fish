function __sf_util_git_branch
  echo (command git rev-parse --abbrev-ref HEAD ^/dev/null)
end
