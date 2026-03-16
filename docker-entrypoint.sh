#!/bin/sh

echo "Starting Ultimate Automation Server..."

# start n8n
n8n &
 
# start postiz
postiz &

wait
