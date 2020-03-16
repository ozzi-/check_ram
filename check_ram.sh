#!/bin/bash
# startup checks

if [ -z "$BASH" ]; then
  echo "Please use BASH."
  exit 3
fi
if [ ! -e "/usr/bin/which" ]; then
  echo "/usr/bin/which is missing."
  exit 3
fi
free=$(which free)
if [ $? -ne 0 ]; then
  echo "Please install 'free'."
  exit 3
fi

warning=80
critical=90

# Usage Info
usage() {
  echo '''Usage: check_curl [OPTIONS]
  [OPTIONS]:
  -w WARNING        Warning threshold in percent of used memory (default: 89%)
  -c CRITICAL       Critical threshold in percent of used memory (default: 90%)'''
}


#main
#get options
while getopts "w:c:" opt; do
  case $opt in
    w)
      warning=$OPTARG
      ;;
    c)
      critical=$OPTARG
      ;;
    *)
      usage
      exit 3
      ;;
  esac
done

start=$(echo $(($(date +%s%N)/1000000)))
total=$(awk '/^Mem/ {print $2}' <(free -m))
used=$(awk '/^Mem/ {print $3}' <(free -m))
end=$(echo $(($(date +%s%N)/1000000)))
percent=$((200*$used/$total % 2 + 100*$used/$total))


resp="OK"
code=0
if [ $percent -gt $warning ]; then
  resp="WARNING"
  code=1
fi
if [ $percent -gt $critical ]; then
  resp="CRITICAL"
  code=2
fi
echo "$resp: $percent% memory used |used=$percent%;${warning};${critical};0;100"
exit $code
