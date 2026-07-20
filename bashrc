# Ros 2
source /opt/ros/humble/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
colcon-build() {
  colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "$@" && source install/setup.bash
}

# Starship prompt
eval "$(starship init bash)"

bleopt_import_path=~/.blerc
source -- ~/ble.sh/out/ble.sh

export PATH="/usr/local/texlive/2026/bin/x86_64-linux:$PATH"
