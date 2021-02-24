#!/usr/bin/env bash

clock() {
  datetime=$(date "+%A, %b. %e, %Y %T")

  echo -n "$datetime"
}

while true; do
        echo "%{c}%{F#FFFF00}%{B#0000FF} $(clock) %{F-}%{B-}"
        sleep 1
done
