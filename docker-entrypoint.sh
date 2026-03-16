#!/bin/sh

echo "Starting Ultimate Automation Server..."

n8n &
postiz &

wait
