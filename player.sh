#!/bin/bash

read_schedule() {
    schedule=()
    while IFS=',' read -r time date filename stop_time; do
        schedule+=("$time,$date,$filename,$stop_time")
    done < "$1"
}

start_stream() {
    # Start ezstream
    ezstream -c /etc/ezstream.xml $filename
    EZSTREAM_PID=$!
}

stop_stream() {
    # Kill ezstream process
    pkill -f "ezstream"
}

main() {
    while :; do
        now=$(date +"%H:%M,%Y-%m-%d")
        read_schedule "$schedule_file"
       for event in "${schedule[@]}"; do
            event_time=$(echo "$event" | cut -d ',' -f1)
            event_date=$(echo "$event" | cut -d ',' -f2)
            filename=$(echo "$event" | cut -d ',' -f3)
            stop_time=$(echo "$event" | cut -d ',' -f4)

            # Calculate time difference in seconds
            start_time="$event_time,$event_date"
            if [ "$start_time" == "$now" ]; then
                echo "starting stream!" && start_stream
            fi
            if [ "$now" == "$stop_time,$event_date" ]; then
                stop_stream
            fi
        done

        # Check every minute
        echo "The current time is" $now && echo "We will begin at" $start_time && sleep 3
    done
}

schedule_file="/srv/audio/schedule.csv"  # Change this to the path of your CSV file
#read_schedule "$schedule_file"
main
