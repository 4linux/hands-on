cd /etc/ansible/


sudo git clone https://github.com/4linux/ansible-node-exporter.git roles/ansible-node-exporter


vim node-playbook.yml

---
- name: "Instalação do Node Exporter"
  hosts: local
  roles:
   - ansible-node-exporter

sudo ansible-playbook node-playbook.yml

systemctl restart prometheus
