#!/usr/bin/env bash


get-os () {
	if [ "$(uname)" == "Darwin" ]; then
		# Do something under Mac OS X platform        
		echo "Darwin"
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		# Do something under GNU/Linux platform
		echo "Linux"
	elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
		# Do something under 32 bits Windows NT platform
		echo "MINGW32_NT"
	elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
		# Do something under 64 bits Windows NT platform
		echo "MINGW64_NT"
	fi
}
