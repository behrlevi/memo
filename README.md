How to expand LVM volume with XFS:

  1. identify the the disk with lsblk
  2. resize the partition with fdsisk
      a. delete the partition (the data will be kept)
      b. create a new partition starting from the same block but with extended end
      c. write out the changes
  3. resize the LVM volume: pvresize /dev/sda
  4. extend the logical volume: lvextend -l +100%FREE /dev/mapper/vgngmae-lvname
  5. resize the file system: xfs_growfs /mount/point

How to install docker on RHEL:

  1. Remove conflicting packages: dnf remove -y podman buildah
  2. add docker repo: dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
  3. install docker: dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  4. start & enable the service: systemctl start docker | systemctl enable docker
  5. (OPTIONAL) add user to docker group -no need to sudo: sudo usermod -aG docker $USER newgrp docker
  6. test docker: docker run hello-world

How to remove all docker containers:

  docker stop "$(docker ps -a -q)"
  docker rm "$(docker ps -a -q)"
