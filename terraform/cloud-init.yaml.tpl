#cloud-config
users:
  - name: ${ssh_user}
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - ${ssh_key}

runcmd:
  - curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  - sh /tmp/get-docker.sh
  - usermod -aG docker ${ssh_user}
  - docker run  -p 80:5000 -e DB_HOST='${db_host}' -e DB_USER='${db_user}' -e DB_PASSWORD='${db_password}' -e DB_NAME='${db_name}' cr.yandex/crprnc1kqah8unjofdc9/py_app:2.0

  
