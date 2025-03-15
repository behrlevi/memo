#!/bin/bash

# Base configuration for cis_ubuntu22-04.yml 

sudo su

# ID: 28526
apt install aide aide-common
aideinit
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db

# ID: 28528
chown root:root /boot/grub/grub.cfg
chmod u-wx,go-rwx /boot/grub/grub.cfg

# ID: 28531
sed -i 's/^enabled=1/enabled=0/' /etc/default/apport
systemctl stop apport.service
systemctl --now disable apport.service

# ID: 28532
echo "* hard core 0" >> /etc/security/limits.conf
echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
sysctl -w fs.suid_dumpable=0

# ID: 28538
echo "Property of Séchenyi István University.
For authorized users only.
All activity is constantly monitored and reported." > /etc/issue

# ID: 28539
echo "Property of Séchenyi István University.
For authorized users only.
All activity is constantly monitored and reported." > /etc/issue.net
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config

# ID: 28546
apt install chrony -y
timedatectl set-timezone Europe/Budapest

# ID: 28547
systemctl --now mask systemd-timesyncd.service

# ID: 28587
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP

# ID: 28588
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP

# ID: 28589
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT
ip6tables -A INPUT -s ::1 -j DROP

# ID: 28656
echo "DEFAULTS	logfile=\"/var/log/sudo.log\"" >> /etc/sudoers
touch /var/log/sudo.log

# ID: 28661
apt install libpam-pwquality -y
echo "minlen = 14" >> /etc/security/pwquality.conf
echo "minclass = 4" >> /etc/security/pwquality.conf

# ID: 28663
sed -i 's/\(pam_unix\.so\).*/\1 obscure use_authtok try_first_pass yescrypt remember=5/' /etc/pam.d/common-password

# ID: 28664
sed -i 's/\(ENCRYPT_METHOD\).*/\1 yescrypt/' /etc/login.defs

# ID: 28566
apt purge rsync -y
systemctl mask rsync

# ID: 28570
apt purge telnet -y

# ID: 28578
#apt purge iptables ufw -y

# ID: 28585
#apt install nftables -y
#apt purge iptables -y

# ID: 28580
nft add table inet filter
nft create chain inet filter input
nft create chain inet filter forward
nft create chain inet filter output
nft add rule inet filter input tcp dport 22

# ID: 28582
systemctl enable nftables

# ID: 28590
apt install auditd audispd-plugins -y

# ID: 28592 && 28593
sed -i "/^GRUB_CMDLINE_LINUX=/ s/\"\"/\"audit=1 audit_backlog_limit=8192\"/" /etc/default/grub
update-grub

# ID: 28595

if ! grep -q "max_log_file_action" /etc/audit/auditd.conf; then
    echo "max_log_file_action = keep_logs" >> /etc/audit/auditd.conf
else
	sed -i "/^max_log_file_action/ s/=.*/= keep_logs/" /etc/audit/auditd.conf
fi

# ID: 28597
echo -e "-w /etc/sudoers -p wa -k scope\n-w /etc/sudoers.d -p wa -k scope" >> /etc/audit/rules.d/50-scope.rules
augenrules --load

# ID: 28598
echo -e "-a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation\n-a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation" >> /etc/audit/rules.d/50-user_emulation.rules
augenrules --load

# ID: 28599
echo -e "-a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k time-change\n-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime -k time-change\n-w /etc/localtime -p wa -k time-change " >> /etc/audit/rules.d/50-time-change.rules
augenrules --load

# ID: 28600
echo -e "-a always,exit -F arch=b64 -S sethostname,setdomainname -k system-locale\n-a always,exit -F arch=b32 -S sethostname,setdomainname -k system-locale\n-w /etc/issue -p wa -k system-locale\n-w /etc/issue.net -p wa -k system-locale\n-w /etc/hosts -p wa -k system-locale\n-w /etc/networks -p wa -k system-locale\n-w /etc/network/ -p wa -k system-locale " >> /etc/audit/rules.d/50-system_local.rules

# ID: 28601
echo -e " -w /etc/group -p wa -k identity -w /etc/passwd -p wa -k identity\n-w /etc/gshadow -p wa -k identity\n-w /etc/shadow -p wa -k identity\n-w /etc/security/opasswd -p wa -k identity " >> /etc/audit/rules.d/50-identity.rules

# ID: 28611
chown root /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/augenrules

# ID: 28613
sudo tee -a /etc/aide/aide.conf <<EOF
# Audit Tools
/sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512
/sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512
/sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512
/sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512
/sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512
/sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512
EOF

# ID: 28614
apt install systemd-journal-remote -y

# ID: 28617
sed -i '/Compress=yes/s/^#//' /etc/systemd/journald.conf
systemctl restart systemd-journald

# ID: 28618
sed -i '/Storage=/s/^#//' /etc/systemd/journald.conf
sed -i '/^Storage/ s/=.*/=persistent/' /etc/systemd/journald.conf
systemctl restart systemd-journald

# ID: 28622
sed -i '/ForwardToSyslog=yes/s/^#//' /etc/systemd/journald.conf
systemctl restart systemd-journald

# ID: 28626
chown root:root /etc/crontab
chmod og-rwx /etc/crontab

# ID: 28627
chown root:root /etc/cron.hourly/
chmod og-rwx /etc/cron.hourly/

# ID: 28628
chown root:root /etc/cron.daily/
chmod og-rwx /etc/cron.daily/

# ID: 28629
chown root:root /etc/cron.weekly/
chmod og-rwx /etc/cron.weekly/

# ID: 28630
chown root:root /etc/cron.monthly/
chmod og-rwx /etc/cron.monthly/

# ID: 28631
chown root:root /etc/cron.d/
chmod og-rwx /etc/cron.d/

# ID: 28632
rm /etc/cron.deny
touch /etc/cron.allow
chmod g-wx,o-rwx /etc/cron.allow
chown root:root /etc/cron.allow

# ID: 28633
rm /etc/at.deny
touch /etc/at.allow
chmod g-wx,o-rwx /etc/at.allow
chown root:root /etc/at.allow

# ID: 28634
chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config

# ID: 28638
sed -i '/#PermitRootLogin/s/^#//' /etc/ssh/sshd_config
sed -i '/^PermitRootLogin/s/prohibit-password/no/' /etc/ssh/sshd_config

# ID: 28643
sed -i '/X11Forwarding/s/^#//' /etc/ssh/sshd_config
sed -i '/^X11Forwarding/s/yes/no/' /etc/ssh/sshd_config

# ID: 28649
sed -i '/#MaxAuthTries/s/^#//' /etc/ssh/sshd_config
sed -i '/MaxAuthTries/s/6/4/' /etc/ssh/sshd_config

# ID: 28650
sed -i '/#MaxStartups/s/^#//' /etc/ssh/sshd_config
sed -i '/MaxStartups/s/:100/:60/' /etc/ssh/sshd_config

# ID: 28652
sed -i '/#LoginGraceTime/s/^#//' /etc/ssh/sshd_config
sed -i '/LoginGraceTime/s/2m/60/' /etc/ssh/sshd_config

# ID: 28653
sed -i '/#ClientAliveInterval/s/^#//' /etc/ssh/sshd_config
sed -i '/#ClientAliveCountMax/s/^#//' /etc/ssh/sshd_config
sed -i '/ClientAliveInterval/s/0/15/' /etc/ssh/sshd_config
