if command -v fzf >/dev/null 2>&1; then
  if fzf --bash >/dev/null 2>&1; then
    eval "$(fzf --bash)"
  else
    [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
    [ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
    [ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
    [ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
  fi
fi
