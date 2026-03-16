#!/bin/sh

echo "Starting Automation Server..."

# start postiz
postiz &

# start n8n
n8n
