# Installation of prometheus server

prometheus --version

if [ "$?" -ne 0 ]; then
    echo "Prometheus Server not found"
else  
    echo "Prometheus Server already installed"
    exit 2
fi

dnf install git ansible -y

cd /etc/ansible

sed -ri  's/^#(host_key_checking = False)/\1/' /etc/ansible/ansible.cfg
sed -ri  's/^#(remote_user = root)/\1/' /etc/ansible/ansible.cfg

tee -a hosts >> /dev/null <<EOT
[local]
127.0.0.1
EOT

git clone https://github.com/cloudalchemy/ansible-prometheus.git roles/ansible-prometheus

tee -a prometheus-playbook.yml > /dev/null <<EOT

---
- name: "Instalação do Prometheus"
  hosts: local
  roles:
   - ansible-prometheus
EOT

mkdir /root/.ssh
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""

cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

ansible-playbook prometheus-playbook.yml

tee -a /etc/environment >> /dev/null <<EOT
PATH=$PATH:/usr/local/bin
EOT

source /etc/environment

curl http://localhost:9090

if [ "$?" -eq 0 ]; then
    echo "Prometheus Server installed"
fi


tee -a /etc/prometheus/prometheus.yml >> /dev/null <<EOT
    static_configs:
    - targets:
      - 10.30.4.10:9100
      - 10.23.4.11:9100
EOT

systemctl restart prometheus.service
