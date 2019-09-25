#!/bin/bash
sleep 20s
sed -e "s/\${master_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_master | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/"  ins_template > ins_template1
sleep 5s
sed -e "s/\${worker01_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_worker01 | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/"  ins_template1 > ins_template2
sleep 5s
sed -e "s/\${worker02_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_worker02 | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/"  ins_template2 > hosts
sleep 5s
sed -e "s/\${master_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_master | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/"  elk_template > elk.sh
sleep 5s
sed -e "s/\${master_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_master | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/" elk_hosts > elk/hosts
sleep 5s
sed -e "s/\${master_private_ip}/`./ec2.py --list --refresh-cache | grep -B 2 -A 2 tag_Name_sdc_master | awk 'FNR==4{print $0}' | awk '{$1=$1};1' | sed 's/"//g'`/" file_template > filebeat.sh
