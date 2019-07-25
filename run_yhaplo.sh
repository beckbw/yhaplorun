#!/bin/bash

PREFIX="/tmp/yhaplo" ;
WORKDIR="/tmp/work" ;

if [ ! -e ${WORKDIR} ] ; then mkdir ${WORKDIR}; fi ;
OUTDIR="${WORKDIR}/yhaplo" ;
if [ ! -e ${OUTDIR} ] ; then mkdir ${OUTDIR}; fi ;

WRKFILE="${2}" ; 

cd ${WORKDIR} ;
BASE="$(basename ${WRKFILE} .txt)" ;

echo "Renaming..."
cp ${WRKFILE} ${WORKDIR}/${BASE}.23andMe.txt

cd ${PREFIX} ;
${PREFIX}/convert2genos.py  ${WORKDIR}/${BASE}.23andMe.txt
${PREFIX}/callHaplogroups.py -i ${PREFIX}/converted/${BASE}.genos.txt -c -hp -hpd -ds -dsd -as -asd

cp -r ${PREFIX}/output/* ${OUTDIR}/;
mv ${WORKDIR}/${BASE}.23andMe.txt ${OUTDIR}/;
rm ${PREFIX}/converted/${BASE}.genos.txt
