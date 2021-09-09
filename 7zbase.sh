#!/bin/bash

# echo $1
# echo $2
# echo $#

PASSWD=12211221
FILENAME=$1
MX_STEP=$2

OUTFILE=`echo $FILENAME | base64`
PASSWD=$OUTFILE
MDFILE=md-${OUTFILE}


if [ "$#" -eq "1" ] ; then
    date +%s |sha256sum |base64 > ${MDFILE}
    7za a -t7z  -r -p${PASSWD} -mhe -mx0 ${OUTFILE}.7z ${FILENAME}  ${MDFILE}
    echo ${OUTFILE}.7z
    rm -rf ${MDFILE}
elif [ "$#" -eq "2" ] ; then
    date +%s |sha256sum |base64 > ${MDFILE}
    7za a -t7z  -r -p${PASSWD} -mhe -mx${MX_STEP} ${OUTFILE}.7z ${FILENAME}  ${MDFILE}
    echo ${OUTFILE}.7z
    rm -rf ${MDFILE}
elif [ "$#" -eq "3" ] ; then
    PASSWD=$3
    date +%s |sha256sum |base64 > ${MDFILE}
    7za a -t7z  -r -p${PASSWD} -mhe -mx${MX_STEP} ${OUTFILE}.7z ${FILENAME}  ${MDFILE}
    echo ${OUTFILE}.7z
    rm -rf ${MDFILE}
else
    echo -e "\033[32me.g: \033[0m"
    echo -e "\033[32m   7zbase.sh file level passwd  \033[0m"
    echo -e "\033[32m   default 7zbase.sh file -mx0 -pfile  \033[0m"
fi



