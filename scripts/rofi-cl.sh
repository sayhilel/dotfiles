#!/usr/bin/env bash


dir="$HOME/.config/rofi/themes/"
theme='box'

## Run
rofi \
    -dmenu \
    -theme ${dir}/${theme}.rasi
