#!/bin/env bash

function prev {
    playerctl previous
}

function next {
    playerctl next
}

function pause {
    playerctl pause
}

function play {
    playerctl play
}

function toggle {
    playerctl play-pause
}

case $1 in
play)
    play
    ;;
pause)
    pause
    ;;
next)
    next
    ;;
prev)
    prev
    ;;
toggle)
    toggle
    ;;
esac
