#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Capitalize Copied Text
# @raycast.mode inline

# Optional parameters:
# @raycast.icon 🍀


# Documentation:
# @raycast.description capitalize copied text and put it back to clipboard
# @raycast.author Tran Xuan Nam
# @raycast.authorURL https://github.com/namtx

pbpaste | ruby -e "puts gets.split(' ').map(&:capitalize).join('')" | pbcopy

echo "😍🚀✅"


