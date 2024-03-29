#Install Java
sudo yum -y install java-openjdk-devel java-openjdk

#Add Elasticsearch Repo

cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

#Install Elasticsearch and Kibana
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo yum clean all
sudo yum makecache
sudo yum -y install elasticsearch
sudo systemctl enable --now elasticsearch.service
sudo yum -y install kibana

#Copy the content under /etc/kibana/kibana.yml - Change the Host if needed
cat <<EOF | sudo tee /etc/kibana/kibana.yml
server.host: "10.0.2.25"
server.port: 5601
server.name: "elk.automation.com"
elasticsearch.hosts: "http://localhost:9200"
EOF

echo "http.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
echo "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml
systemctl restart elasticsearch

#Secure the port
sudo systemctl enable --now kibana
sudo systemctl stop firewalld
#sudo firewall-cmd --add-port=5601/tcp --permanent
#sudo firewall-cmd --reload

#Install Logstash
sudo yum -y install logstash

