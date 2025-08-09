#!/bin/bash

# ctrlr.sh
#
# A shell script (bash) that replaces the default CTRL+r behavior.
# It uses rofi
#
# Version: 1.4.5
# Original Author:  Lawrence Lagerlof <llagerlof@gmail.com>
# GitHub:  http://github.com/llagerlof/ctrlr
# License: https://opensource.org/licenses/MIT
# 
# Modified by Rafael Sieber <rafaelsieber@live.com>
# 
#
# Installation:
#
# 1. Install rofi
# 3. Copy this file to /usr/local/bin/
# 4. Make it executable: chmod +x /usr/local/bin/ctrlr.sh
# 5. Override the vanilla CTRL+r adding the following line to the end of your .bashrc:
#
#    bind -x '"\C-r": "source /usr/local/bin/ctrlr.sh"'
#
# 6. Restart the terminal
# 7. Be happy


# Check if fzf is installed
if ! command -v rofi >/dev/null 2>&1; then
  echo "rofi not found. Please install rofi first."
  exit 1
fi

# Read .bash_history and use fzf to select an item
selected_command=$(history | tac | awk '{$1=""; print substr($0, 2)}' | awk '!seen[$0]++' | rofi -dmenu)

READLINE_LINE="$selected_command"
READLINE_POINT=${#READLINE_LINE}
