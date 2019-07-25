#!/bin/bash

#PREFIX="${HOME}/github/yhaplo" ;
PREFIX="/tmp/yhaplo" ;
WORKDIR="/tmp/work" ;
#echo ${PREFIX} ${WORKDIR} ;
if [ ! -e ${WORKDIR} ] ; then mkdir ${WORKDIR}; fi ;
OUTDIR="${WORKDIR}/yhaplo" ;
if [ ! -e ${OUTDIR} ] ; then mkdir ${OUTDIR}; fi ;

#WRKFILE="${1}" ; echo WRKFILE=${WRKFILE} ;
WRKFILE="${1}" ; 

cd ${PREFIX} ;

BASE="$(basename ${WRKFILE} .txt)" ;

cp ${WRKFILE} ${WORKDIR}/${BASE}.23andMe.txt
${PREFIX}/convert2genos.py  ${WORKDIR}/${BASE}.23andMe.txt
${PREFIX}/callHaplogroups.py -i ${PREFIX}/converted/${BASE}.genos.txt -c -hp -hpd -ds -dsd -as -asd
mkdir ${OUTDIR} ;
cp -r ${PREFIX}/output/* ${OUTDIR}/;
rm ${PREFIX}/converted/${BASE}.genos.txt
