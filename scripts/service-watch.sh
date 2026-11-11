#!/usr/bin/env bash

# LinuxLab Service Watch

PROJECT_DIR="/home/shukla/LinuxLab"
LOG_DIR="$PROJECT_DIR/logs"
STATE_DIR="$LOG_DIR/service-state"

mkdir -p "$STATE_DIR"

for service in nginx linuxlab-tunnel; do

    if systemctl is-active --quiet "$service"; then
        current="RUNNING"
    else
        current="STOPPED"
    fi

    state_file="$STATE_DIR/$service.state"

    if [[ ! -f "$state_file" ]]; then
        echo "$current" > "$state_file"
        continue
    fi

    previous=$(cat "$state_file")

    if [[ "$current" != "$previous" ]]; then

        message="$service changed from $previous to $current"

        echo "$(date '+%F %T') ALERT: $message" \
            >> "$LOG_DIR/service-alerts.log"

        logger -t linuxlab-monitor "$message"

        echo "$current" > "$state_file"
    fi

done
