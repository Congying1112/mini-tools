#!/usr/bin/env bash
checkProcess(){
    ps aux | grep "$1" | grep -v grep | awk '{print $2}' | grep -v PID |
        while IFS= read -r line
        do
            echo $line
        done
}

export -f checkProcess