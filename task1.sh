#!/bin/bash

pid=$(ps aux | grep '[i]nfinite.sh' | awk '{print $2}')
kill "$pid"
echo "Process infinite.sh with PID $pid has been killed."