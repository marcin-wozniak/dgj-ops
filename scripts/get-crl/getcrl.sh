#!bin/bash
logfile="/ec/acc/app/eevidence/wget.log"

CRL1="http://crl.servicepki.com/DG_Justice/crl/EEDES_OPERATIONAL_CA.crl"
CRL1_outputfile="/ec/acc/app/eevidence/nginx_ins/html/EEDES_OPERATIONAL_CA.crl"

CRL2="http://crl.servicepki.com/DG_Justice/arl/EEDES_ROOT_CA.crl"
CRL2_outputfile="/ec/acc/app/eevidence/nginx_ins/html/EEDES_ROOT_CA.crl"

function download_CRL () {
echo $(date)  >> $logfile
rm -v /tmp/temp.crl >> $logfile
wget_output=$(wget --append-output=$logfile --output-document="/tmp/temp.crl" -ehttp_proxy=http://a005i9z9:bnls66ms5s2@ps-lux-sys.cec.eu.int:8012 $1)
if [ $? -eq 0 ]; then
cp -v /tmp/temp.crl $2 >> $logfile
else
echo $(date) "NOT RESPONDING" >> $logfile
fi
}

echo "===========================================================" >> $logfile
echo "Downloading OPERATIONAL CRL..." >> $logfile
download_CRL $CRL1 $CRL1_outputfile
echo "Downloading ROOT CRL..." >> $logfile
download_CRL $CRL2 $CRL2_outputfile




