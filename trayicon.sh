#!/bin/env bash

case $1 in 
  get)
    if [ "$SYSTRAY" == "1" ]; then
      echo ""
    else
      echo ""
    fi
  ;;
  toggle)
    if [ "$SYSTRAY" == "1" ]; then
      export SYSTRAY=0
    else
      export SYSTRAY=1
    fi
  ;;
esac
