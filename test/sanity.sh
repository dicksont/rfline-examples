#!/bin/sh

SCRIPT_DIR=`dirname $0`
EXAMPLES_ROOT=`dirname ${SCRIPT_DIR}`
CAT_JS=${EXAMPLES_ROOT}/bin/cat.js
LINECOUNT_JS=${EXAMPLES_ROOT}/bin/linecount.js
LICENSE_FILE=${EXAMPLES_ROOT}/LICENSE
CAT=cat
WC="wc -l"

TEXT1=`${CAT} ${LICENSE_FILE}`
TEXT2=`${CAT_JS} ${LICENSE_FILE}`

if [ "${TEXT1}" = "${TEXT2}" ]; then
  echo "PASSED bin/cat.js"
else
  echo "FAILED bin/cat.js"
  exit 1

fi

COUNT1=`${LINECOUNT_JS} ${LICENSE_FILE}`
COUNT2=`${WC} ${LICENSE_FILE} | awk '{print $1}'`

if [ ${COUNT1} -eq ${COUNT2} ]; then
  echo "PASSED bin/linecount.js"
else
  echo "FAILED bin/linecount.js"
  exit 1

fi

exit 0
