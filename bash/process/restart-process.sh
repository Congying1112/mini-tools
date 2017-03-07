#!/usr/bin/env bash
. ./check-process.sh
. ./kill-process.sh

restartProcess(){
    process_name="$1"
    str_in_process="$2"
    start_process_cmd="$3"

    killProcess "$process_name" "$str_in_process"
    echo Starting "$process_name"
    eval $start_process_cmd
    sleep 10
    pids=$(checkProcess "$str_in_process")
    if [[ -z "${pids// }" ]]; then
        echo $process_name "failed to start, pls check"
        exit 2
    else
        echo $process_name "started"
    fi
}

export -f restartProcess