function __sf_section_node
  __sf_util_set_default SPACEFISH_NODE_SHOW true
  __sf_util_set_default SPACEFISH_NODE_SYMBOL ⬢
  __sf_util_set_default SPACEFISH_NODE_COLOR green

  # Show current version of node, exception system.
  if test $SPACEFISH_NODE_SHOW = false
    return
  end

  # Show NODE status only for JS-specific folders
  if not test -f package.json -a -d node_modules
    return
  end

  set -l node_version ""

  if test nvm
    set node_version (nvm current 2>/dev/null)

    if test $node_version = "system" -a $node_version = "node"
      set node_version (command node -v)
    end
  else if test $node_version = (nodenv version-name)
    if test $node_version = "system" -a $node_version = "node"
      set node_version (command node -v)
    end
  end

  echo -s -n (set_color -o $SPACEFISH_NODE_COLOR) " $SPACEFISH_NODE_PREFIX$SPACEFISH_NODE_SYMBOL $node_version$SPACEFISH_NODE_SUFFIX"
end