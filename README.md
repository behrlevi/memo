## PKI Infrastructure

Create a CA
  1. Generate a private key for the CA
     ```
     openssl genrsa -aes256 -out private/cakey.pem 4096
     ```
  2. Generate a certificate signing request for the CA (public key)
     ```
      openssl req -x509 -new -key private/cakey.pem -days 1095 -sha256 -extensions v3_ca -out cacert.pem
     ```
Create an SSL certificate for a web server
  1. Generate a private key
     ```
     openssl genrsa -aes256 -out example.com_key.pem 4096
     ```
  2. Generate a certificate signing request
    (The Common Name/FQDN must exactly match the websites URL for this to work)
     ```
     openssl req -new -sha256 -key example.com_key.pem -out example.com_csr.pem
     ```
  2. Sign the certificate
     ```
     openssl ca -days 1095 -notext -md sha256 -keyfile private/cakey.pem -cert cacert.pem -in example.com_csr.pem -out example_cert.pem
     ```

Alternatively to generate the key and a certificate signing request at the same time
```
openssl req -new -newkey rsa:2048 -nodes -keyout key.pem -out csr.pem
```

To view the contents of a certificate
```
openssl x0509 -in cert.pem -noout -text | less
```
The config file is in /etc/ssl. Directory names must match the config.

Firefox requires a SAN (Subject Alternative Name) to be present in the certificates.

[Custom openssl config file](custom_openssl.cnf)

Both the IP and the DNS should be present in the config)

Generate the private key (better not to use a passphrase because it won't work on some servers)
```
openssl genrsa -out server.key 4096
```
Generate the signing request
```
openssl req -new -key server.key -out server.csr -config server_cert.cnf
```
Generate the cert
```
openssl x509 -req -days 365 -in server.csr -CA /root/tls/certs/cacert.pem -CAkey /root/tls/private/cakey.pem -CAcreateserial -out server.crt -extensions req_ext -extfile server_cert.cnf
```
     
## How to expand LVM volume with XFS:

  1. identify the the disk with lsblk
  2. resize the partition with fdsisk
      a. delete the partition (the data will be kept)
      b. create a new partition starting from the same block but with extended end
      c. write out the changes
  3. resize the LVM volume: pvresize /dev/sda
  4. extend the logical volume: lvextend -l +100%FREE /dev/mapper/vgngmae-lvname
  5. resize the file system: xfs_growfs /mount/point

## Unlock a user after failed SSH login attempts:

faillog --user username --reset

## How to install docker on RHEL:

  1. Remove conflicting packages:
  ```
  dnf remove -y podman buildah
  ```
  2. add docker repo:
  ```
  dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
  ```
  3. install docker:
  ```
  dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```
  4. start & enable the service:
  ```
  systemctl start docker | systemctl enable docker
  ```
  5. (OPTIONAL) add user to docker group -no need to sudo:
  ```
  sudo usermod -aG docker $USER newgrp docker
  ```
  6. test docker:
  ```
  docker run hello-world
  ```
## How to install docker on Ubuntu:

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker images
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify the installation
sudo docker run hello-world
 ```

## How to remove all docker containers:
```
docker stop "$(docker ps -a -q)"
```
```
docker rm "$(docker ps -a -q)"
```
## How to mount SMB share on Linux:

  1. Temporary
  ```
  sudo mount -t cifs -o username=your_username,password=your_password //server_address/share_name /mnt/smbshare
  ```
  3. Permanent
  ```
  sudo apt-get install cifs-utils
  ```
  Edit /etc/fstab and add your entry:
  ```
  //server/share /pathto/mountpoint cifs credentials=/home/username/.smbcredentials,uid=shareuser,gid=sharegroup 0 0
  ```
  Create the .smbcredentials file in your home directory:
  ```
  username=shareuser
  password=sharepassword
  domain=domain_or_workgroupname
  ```
  ```
  chmod 0600 ~/.smbcredentials
  ```
  ```
  sudo mount -a
  ```
    


## Ubuntu Server static network config

    /etc/netplan/01-netcfg.yaml
```
  network:
  version: 2
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
          
    sudo netplan generate
    sudo netplan apply
```

## Stork

### Ubuntu
```
curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash

apt install isc-stork-server

apt install postgresql

su postgres

stork-tool db-create --db-name stork --db-user stork


ezekhez a parancsokhoz létre kellett hozni egy stork nevű felhasználót a Linuxban:
stork-tool db-init

stork-tool db-up
```
### Stork agent

   curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash
   
   apt install isc-stork-agent


    while true; do echo -e "\033[32m$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' < /dev/urandom | head -c $(tput cols))"; sleep 0.1; done
