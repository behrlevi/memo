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
    (The Common Name/FQDN mus exactly match the websites URL to work)
     ```
     openssl req -new -sha256 -key example.com_key.pem -out example.com_csr.pem
     ```
  2. Sign the certificate
     ```
     openssl ca -days 1095 -notext -md sha256 -keyfile example.com_key.pem -in example.com_csr.pem -out example.pem
     ```

To view the contents of a certificate
```
openssl x0509 -in cert.pem -noout -text | less
```
The config file is in /etc/ssl. Directory names must match the config.
     
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

  1. Install dependencies:
 ```
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
 ```
  2. Add Docker’s GPG key:
  ```
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  ```
  3. Add the Docker repository to APT sources:
  ```  
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
  ```
  4. Update the package list again:
  ```
  sudo apt-get update
  ```
  5. Install Docker CE (Community Edition):
  ```
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io
  ```
  6. Verify Docker installation:
  ```
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
