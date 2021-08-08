#!/usr/bin/env bash
#
# returns "Internet Time"
# github.com/kayew
# see: https://en.wikipedia.org/wiki/Swatch_Internet_Time

# has to be GMT-1, zero clue why
read h m s <<<$(TZ=GMT-1 date "+%H %M %S")

# (UTC+1seconds + (UTC+1minutes * 60) + (UTC+1hours * 3600)) / 86.4
time=$(bc -l <<< "scale=2; ($s + ($m * 60) + ($h * 3600)) / 86.4 ")
if (( $(echo "$time < 10" | bc -l ) )); then
  time="00$time"
elif (( $(echo "$time < 100" | bc -l ) )); then
  time="0$time"
fi
echo "@$time"
