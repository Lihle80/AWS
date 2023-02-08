#! /bin/bash

LINE=1
for FILE in *
do
		mv "$FILE" $(ls | sed -n $LINE\p | sed 's/ /-/g')
		echo "Line $LINE done"
		((LINE++))
done

# This script removes spaces in a file name and replaces it with a dash ("-"), this script runs on all files in the current directory.
