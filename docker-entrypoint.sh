#!/bin/sh

echo "Starting automation server..."

# start postiz
postiz &

# start n8n
n8n
