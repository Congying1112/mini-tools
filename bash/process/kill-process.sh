#!/usr/bin/env bash
. .check-process.sh

killProcess(){
    process_name="$1"
    str_in_process="$2"
    pids=$(checkProcess "$2")
    echo $pids
    if ! [[ -z "${pids// }" ]]; then
        echo "Kill Process"
        kill $pids
        pids=$(checkProcess "$1")
        if ! [[ -z "${pids// }" ]]; then
            echo "Failed to stop Process"
            exit 1
        else
            echo "Process stopped"
        fi
    fi
}

export -f killProcess