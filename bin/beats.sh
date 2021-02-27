#!/usr/bin/env bash
#
# returns "Internet Time"
# github.com/kaewhyes
# see: https://en.wikipedia.org/wiki/Swatch_Internet_Time

read h m <<<$(TZ="UTC-1" date "+%H %M")

# ((UTC+1minutes * 60) + (UTC+1hours * 3600)) / 86.4
time=$(bc <<< "(($m * 60) + ($h * 3600)) / 86.4")
if [ $time -lt 100 ]; then
  time="0$time"
elif [ $time -lt 10 ]; then
  time="00$time"
fi
echo "@$time"
