#!/bin/bash
Xvfb :1 -screen 0 1024x768x16 &
sleep 2
fluxbox &
x11vnc -display :1 -forever -nopw -create &
firefox
