#!/bin/sh

echo "Did you read the script?   Continue?"
echo
echo "*** Hit Return to continue, or CTRL-C now! ***"

read x

set -x
vagrant plugin install vagrant-vbguest
