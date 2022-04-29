function add_to_path_if_exists
  set NEW_PATH_COMPONENT $argv[1]
  if test -d $NEW_PATH_COMPONENT
    set PATH $PATH $NEW_PATH_COMPONENT
  end
end

add_to_path_if_exists /opt/homebrew/bin # macOS (Apple Silicon)
add_to_path_if_exists /home/linuxbrew/.linuxbrew/bin # for codespaces
add_to_path_if_exists /home/linuxbrew/.linuxbrew/sbin # for codespaces