HOSTNAME=10.0.2.25
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.0-x86_64.rpm
sudo rpm -vi metricbeat-7.3.0-x86_64.rpm
sed -i 's/#host:/host:/g' /etc/metricbeat/metricbeat.yml
sed -i s/"localhost:5601"/"$HOSTNAME:5601"/g /etc/metricbeat/metricbeat.yml
sed -i s/"localhost:9200"/"$HOSTNAME:9200"/g /etc/metricbeat/metricbeat.yml
sed -i 's/#username:/username:/g' /etc/metricbeat/metricbeat.yml
sed -i 's/#password:/password:/g' /etc/metricbeat/metricbeat.yml
sed -i s/"changeme"/"password"/g /etc/metricbeat/metricbeat.yml
sudo metricbeat setup
sudo service metricbeat start


curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.0-x86_64.rpm
sudo rpm -vi metricbeat-7.3.0-x86_64.rpm
sudo metricbeat modules enable system
sudo metricbeat setup
sudo service metricbeat start



curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.3.0-x86_64.rpm
sudo rpm -vi auditbeat-7.3.0-x86_64.rpm
sed -i 's/#host:/host:/g' /etc/auditbeat/auditbeat.yml
sed -i s/"localhost:5601"/"$HOSTNAME:5601"/g /etc/auditbeat/auditbeat.yml
sed -i s/"localhost:9200"/"$HOSTNAME:9200"/g /etc/auditbeat/auditbeat.yml
sed -i 's/#username:/username:/g' /etc/auditbeat/auditbeat.yml
sed -i 's/#password:/password:/g' /etc/auditbeat/auditbeat.yml
sed -i s/"changeme"/"password"/g /etc/auditbeat/auditbeat.yml
sudo auditbeat setup
sudo service auditbeat start
