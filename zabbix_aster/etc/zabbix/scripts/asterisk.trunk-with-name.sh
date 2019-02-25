#!/bin/bash

total=`sudo asterisk -rx 'sip show registry' | sed -n '/registrations/p' | awk '{print $1}'`
active=`sudo asterisk -rx 'sip show registry' | sed -n '/Registered/p' | wc -l`
offline=`sudo asterisk -rx 'sip show registry' | sed -n '/Request\|Rejected\|Authentication\|Auth/p' | awk '{print $3}'`
if [ $active -lt $total ]
then
echo Trunks offline $offline
else
echo All trunks are online
fi
