#!/bin/bash

executable="./build/quad_solver"
if [ ! -f "$executable" ]; then
  echo "Executable not found. Run 'make' first."
  exit 1
fi

count2=0
count1=0
count0=0

help_msg() {
  echo "Usage: $0 [a b c | h | N]"
  echo " - Provide coefficients or"
  echo " - Use 'h' for help or"
  echo " - Enter N (number) for repeated runs"
}

run_program() {
  if [ $# -eq 3 ]; then
    if [[ $1 =~ ^-?[0-9.]+$ && $2 =~ ^-?[0-9.]+$ && $3 =~ ^-?[0-9.]+$ ]]; then
      $executable $1 $2 $3
      return $?
    else
      echo "Invalid parameters"
      exit 1
    fi
  else
    $executable
    return $?
  fi
}

if [[ "$1" == "h" || "$1" == "H" ]]; then
  help_msg
  exit 0
elif [[ "$1" =~ ^[0-9]+$ ]]; then
  for ((i=0; i<$1; i++)); do
    run_program "${@:2}"
    case $? in
      0) ((count2++));;
      1) ((count1++));;
     -1) ((count0++));;
    esac
  done
  echo "Summary:"
  echo "2 roots: $count2"
  echo "1 root : $count1"
  echo "0 roots: $count0"
  exit 0
fi

while true; do
  run_program "$@"
  echo -n "Continue? (y/n/h): "
  read ans
  case "$ans" in
    [nN]) exit 0;;
    [hH]) help_msg;;
    *) continue;;
  esac
done
