#!/bin/bash
DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )
export NODE_PATH="$DIR/lib/node_modules"
export PATH="$DIR/bin:$PATH"