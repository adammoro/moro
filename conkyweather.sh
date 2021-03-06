#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <zipcode>
#
#(c) Adam Moro 2017

METRIC=0 # 0 for F, 1 for C

if [ -z $1 ]; then
    echo
    echo "USAGE: weather.sh <zipcode>"
    echo
    exit 0;
fi

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'
