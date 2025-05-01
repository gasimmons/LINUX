#!/bin/bash

# Color Scheme
BOLD="\e[1m"
RESET="\e[0m"
CYAN="\e[36m"
MAGENTA="\e[35m"
YELLOW="\e[33m"
GREEN="\e[32m"

# System Info
user=$(whoami)
host=$(hostname)
os=$(source /etc/os-release && echo "$NAME")
kernel=$(uname -r)
wm=$(echo "$XDG_CURRENT_DESKTOP" || echo "$DESKTOP_SESSION")
uptime=$(uptime -p | sed 's/up //')
shell=$(basename "$SHELL")
pkgs=$(pacman -Q | wc -l)
term=$TERM

# Output
echo -e "${MAGENTA}${BOLD}╭──────[ ${user}@${host} ]──────╮${RESET}"
echo -e "${CYAN}│ OS:        ${RESET}${os}"
echo -e "${CYAN}│ Kernel:    ${RESET}${kernel}"
echo -e "${CYAN}│ WM/DE:     ${RESET}${wm}"
echo -e "${CYAN}│ Uptime:    ${RESET}${uptime}"
echo -e "${CYAN}│ Shell:     ${RESET}${shell}"
echo -e "${CYAN}│ Packages:  ${RESET}${pkgs}"
echo -e "${CYAN}│ Terminal:  ${RESET}${term}"
echo -e "${MAGENTA}${BOLD}╰─────────────────────────────╯${RESET}"
