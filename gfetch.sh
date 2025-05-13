#!/bin/bash

# Colorscheme
BOLD="\e[1m"
RESET="\e[0m"
CYAN="\e[36m"
MAGENTA="\e[35m"

# System info
user=$(whoami)
host=$(/usr/bin/hostname)
os=$(source /etc/os-release && echo "$NAME")
kernel=$(uname -r)
wm=${XDG_CURRENT_DESKTOP:-$DESKTOP_SESSION}
uptime=$(uptime -p | sed 's/up //')
shell=$(basename "$SHELL")
pkgs=$(pacman -Q | wc -l)
term=$TERM
cpu=$(lscpu | grep "Model name" | sed -E 's/Model name:\s+//' | sed -E 's/ [A-Z][a-z]+-Core.*//')
gpu=$(lspci | grep -E "VGA|3D" | cut -d ':' -f3 | xargs)
gpu_name=$(echo "$gpu" | grep -oP '\[\K[^\]]+')


echo -e "${MAGENTA}${BOLD}╭──────[ ${user}@${host} ]──────────────────────╮${RESET}"
echo -e "${CYAN}│ OS:        ${RESET}${os}$(printf '%*s' $((35 - ${#os})) '')${CYAN}│${RESET}"
echo -e "${CYAN}│ Kernel:    ${RESET}${kernel}$(printf '%*s' $((35 - ${#kernel})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ WM/DE:     ${RESET}${wm}$(printf '%*s' $((35 - ${#wm})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ Uptime:    ${RESET}${uptime}$(printf '%*s' $((35 - ${#uptime})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ Shell:     ${RESET}${shell}$(printf '%*s' $((35 - ${#shell})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ Packages:  ${RESET}${pkgs}$(printf '%*s' $((35 - ${#pkgs})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ Terminal:  ${RESET}${term}$(printf '%*s' $((35 - ${#term})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ CPU:       ${RESET}${cpu}$(printf '%*s' $((35 - ${#cpu})) ' ')${CYAN}│${RESET}"
echo -e "${CYAN}│ GPU:       ${RESET}${gpu_name}$(printf '%*s' $((35 - ${#gpu_name})) ' ')${CYAN}│${RESET}"
echo -e "${MAGENTA}${BOLD}╰───────────────────────────────────────────────╯${RESET}"
