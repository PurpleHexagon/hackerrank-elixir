#!/bin/bash

FILES="testcases/input/*"
for input_filename in $FILES
do
    input=`cat $input_filename`
    actual_output=`elixir solution.exs <<< "$input"`

    output_filename=$(echo "$input_filename" | sed "s/input/output/")
    output_filename=$(echo "$output_filename" | sed "s/input/output/")
    output=`cat $output_filename`

    if [ "$output" = "$actual_output" ]; then
        echo "Passed"
    else
        echo "Failed"
    fi    
done
