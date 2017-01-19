#!/bin/bash

test() {
 for prefix in 'http://' 'http://www.' 'https://' 'https://www.';
 do
  url=${prefix}${domain}
  echo "testing url $url"
  $tool $option $url 2>/dev/null | grep "HTTP\|Location"
  echo ""
 done
}

domain="$1"
tool='curl'
option='-I'

test
