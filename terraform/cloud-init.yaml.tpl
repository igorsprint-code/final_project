#cloud-config
users:
  - name: ${ssh_user}
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - ${ssh_key}


write_files:
  - path: /opt/compose/compose.yaml
    content: |
      version: '3.8'
      services:
        web:
          image: cr.yandex/${yc_registry}/py_app:2.0
          restart: always
          ports:
           - 80:5000
          environment:
            DB_HOST: '${db_host}'
            DB_NAME: '${db_name}'
            DB_USER: '${db_user}'
            DB_PASSWORD: '${db_password}'



runcmd:
  - curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  - sh /tmp/get-docker.sh
  - usermod -aG docker ${ssh_user}
  - docker compose -f /opt/compose/compose.yaml up -d

  
