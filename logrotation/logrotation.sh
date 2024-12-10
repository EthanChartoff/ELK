#!/bin/bash

echo "Starting cron service..."
cron

echo "Tailing cron log at $CRON_LOG..."
tail -f $CRON_LOG
