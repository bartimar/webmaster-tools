#!/bin/bash

# handle input
[[ $# != 1 ]] && echo "FATAL ERROR: Exactly one argument must be passed!" && exit 1
domain="$1"
[[ $domain == *"."* ]] && echo "FATAL ERROR: Domain contains a dot!" && exit 2

# set endpoint
## set TLD to check
tld=(cz eu com net org info biz name pl)
## set base endpoint url
base="https://hosting.wedos.com/en/domain-check.html"
## set query string
qs="domain=${domain}&tld="
for d in ${tld[@]}
do
  qs="${qs}${d}%7C"
done
# remove last %7C
qs=${qs%\%7C}

endpoint="${base}?${qs}"

# download result - look for "Domain is (not) available"
result=$(curl "$endpoint" 2>/dev/null | grep -io "domain is ..." | grep -o "ava\|not")

# print summary
i=0
for res in $result
do
  [[ $res == 'ava' ]] && res=yes || res=no
  echo ${tld[$i]} $res
  ((i++))
done
