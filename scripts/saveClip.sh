#!/usr/bin/env bash

kill -SIGRTMIN+3 $(cat /tmp/gsr.pid)
