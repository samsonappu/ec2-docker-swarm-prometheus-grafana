ansible-playbook playbook.yml 
ansible-playbook -i hosts dockerswarm/playbook.yml --key-file="ubuntukey.pem"
ansible-playbook -i elk/hosts elk.yml --key-file="ubuntukey.pem"
ansible-playbook -i hosts filebeat.yml --key-file="ubuntukey.pem" 
