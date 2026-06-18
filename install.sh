#!/usr/bin/env bash
set -eEo pipefail

export REARCHY_PATH="$HOME/.local/share/rearchy"
export REARCHY_INSTALL="$REARCHY_PATH/install"
export REARCHY_INSTALL_LOG_FILE="/tmp/rearchy-install.log"

# Compatibility alias so sourced omarchy scripts keep working
export OMARCHY_PATH="$REARCHY_PATH"
export OMARCHY_INSTALL="$REARCHY_INSTALL"
export OMARCHY_INSTALL_LOG_FILE="$REARCHY_INSTALL_LOG_FILE"

export PATH="$REARCHY_PATH/bin:$PATH"

source $REARCHY_INSTALL/helpers/all.sh

start_install_log

run_logged $REARCHY_INSTALL/config/all.sh
run_logged $REARCHY_INSTALL/login/all.sh

stop_install_log
