## Detect specific patterns in network traffic with these Wireshark filters

### TCP Connect Scan (nmap -sT)
```
tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size > 1024 
```

### SYN Scan (nmap -sS)
```
tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size <= 1024
```

### UDP Scan
```
icmp.type==3 and icmp.code==3
```

### ARP 

ARP Request

    arp.opcode == 1
ARP Response

    arp.opcode == 2
ARP scanning
   
    arp.dst.hw_mac==00:00:00:00:00:00

Possible ARP poisoning

    arp.duplicate-address-detected or arp.duplicate-address-frame
ARP flooding from detection

    ((arp) && (arp.opcode == 1)) && (arp.src.hw_mac == target-mac-address)
