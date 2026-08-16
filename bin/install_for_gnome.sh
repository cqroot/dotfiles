#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
readonly SCRIPT_DIR

PROJECT_DIR=$(dirname "${SCRIPT_DIR}")
readonly PROJECT_DIR

DCONF_DIR="${PROJECT_DIR}/dconf"
readonly DCONF_DIR

function dump_gnome_settings() {
    echo "Dumping GNOME settings to ${DCONF_DIR}"
    if [[ ! -d "${DCONF_DIR}" ]]; then
        mkdir -p "${DCONF_DIR}"
    fi
    dconf dump /com/github/libpinyin/ibus-libpinyin/libpinyin/ >"${DCONF_DIR}/ibus-libpinyin.dconf"
    dconf dump /org/gnome/desktop/input-sources/ >"${DCONF_DIR}/input-sources.dconf"
    dconf dump /org/gnome/desktop/interface/ >"${DCONF_DIR}/interface.dconf"
    dconf dump /org/gnome/desktop/session/ >"${DCONF_DIR}/session.dconf"
    dconf dump /org/gnome/desktop/screensaver/ >"${DCONF_DIR}/screensaver.dconf"
    dconf dump /org/gnome/desktop/wm/preferences/ >"${DCONF_DIR}/wm-preferences.dconf"
    dconf dump /org/gnome/desktop/wm/keybindings/ >"${DCONF_DIR}/keybindings.dconf"
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ >"${DCONF_DIR}/custom-keybindings.dconf"
    echo "Dump completed"
}

function load_gnome_settings() {
    echo "Loading GNOME settings from ${DCONF_DIR}"
    dconf load /com/github/libpinyin/ibus-libpinyin/libpinyin/ <"${DCONF_DIR}/ibus-libpinyin.dconf"
    dconf load /org/gnome/desktop/input-sources/ <"${DCONF_DIR}/input-sources.dconf"
    dconf load /org/gnome/desktop/interface/ <"${DCONF_DIR}/interface.dconf"
    dconf load /org/gnome/desktop/session/ <"${DCONF_DIR}/session.dconf"
    dconf load /org/gnome/desktop/screensaver/ <"${DCONF_DIR}/screensaver.dconf"
    dconf load /org/gnome/desktop/wm/preferences/ <"${DCONF_DIR}/wm-preferences.dconf"
    dconf load /org/gnome/desktop/wm/keybindings/ <"${DCONF_DIR}/keybindings.dconf"
    dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ <"${DCONF_DIR}/custom-keybindings.dconf"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
    echo "Load completed"
}

function main() {
    echo "Starting run_once_after_restore-gnome-settings.sh, args: $*"
    case "$1" in
    dump)
        dump_gnome_settings
        ;;
    *)
        load_gnome_settings
        ;;
    esac
    echo "Done"
}

main "$@"
