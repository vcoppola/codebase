#!/bin/sh
clear
echo
echo $0
if [ $# -eq 0 ]
then
  echo "Not enough parameters supplied"
  echo "Need environment "
  echo "environment can be: stg prod"
  echo
  exit
fi  

case "$1" in
  "stg")  
    echo Processing Environment: STG
  ;;
  "prod")  
    echo Processing Environment: PROD
  ;;
  *)
    echo "Bad mode: " $1
    exit
  ;;
esac

EXTvar="group=$1"

ansible-playbook -K base.yml -i inventory/environments --extra-vars "$EXTvar"
