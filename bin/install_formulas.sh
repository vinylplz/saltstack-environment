#!/bin/bash
# Larger formulas are split out into their own repos.
# This script should be run once after a fresh checkout
# of saltstack-environment to populate the formulas/
# directory

FORMULAS="postgres jira sun-java apache"

BIN_DIR=$(dirname $(readlink -f $0))

cd ${BIN_DIR}/../formulas
for F in $FORMULAS ; do
    git clone https://github.com/vinylplz/${F}-formula.git
done

cd -

