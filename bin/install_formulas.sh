#!/bin/bash
# Larger formulas are split out into their own repos.
# This script should be run once after a fresh checkout
# of saltstack-environment to populate the formulas/
# directory

# This approach works for now, but propbably a better 
# approach is to put a config file in formulas that contains
# a list of repo:branch pairs for each env and loop through
# that.  somthing like:
# base {
#   'https://github.com/vinlyplz/postgres-formula.git': 'master'
#   'https://github.com/vinlyplz/sun-java-formula.git': 'master'
#   'https://github.com/vinlyplz/apache-formula.git': 'master'
# },
# prod {
#   'https://github.com/vinlyplz/a-broken-formula.git': 'hotfix-1234'
# },
# dev {
#   'https://github.com/vinlyplz/jira-formula.git': 'dev'
# }


BASE_FORMULAS="postgres jira sun-java apache"
PROD_FORMULAS=" "
DEV_FORMULAS=" "

BIN_DIR=$(dirname $(readlink -f $0))


# BASE FORMULAS
echo "Installing BASE formulas..."
cd ${BIN_DIR}/../roots/formulas/base
for F in $BASE_FORMULAS ; do
    git clone https://github.com/vinylplz/${F}-formula.git
done
echo "Done."

# PROD FORMULAS
echo "Installing PROD formulas..."
cd ${BIN_DIR}/../roots/formulas/prod
for F in $PROD_FORMULAS ; do
    git clone https://github.com/vinylplz/${F}-formula.git
done
echo "Done."

# DEV FORMULAS
echo "Installing DEV formulas..."
cd ${BIN_DIR}/../roots/formulas/dev
for F in $DEV_FORMULAS ; do
    git clone https://github.com/vinylplz/${F}-formula.git
    cd ${F}-formula
    git branch dev
    cd ..
done
echo "Done."


cd - >/dev/null
