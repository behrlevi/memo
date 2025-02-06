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
