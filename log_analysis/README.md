### Log processing: ###
  1. Source identification
  
  2. Log collection (rsyslog)
  
    a. Centralization - endpoints | servers | network
    b. SIEM
  
  3. Analysis
  
    a. Data source - web | ssh | router | etc.
    b. Parsing - Splunk engine, Elastic, log parsers
    c. Normalization - unified standard format
    d. Sorting - time, severity, source, event type, etc.
    e. Classification - labels -> filtering
    f. Correlation - The most important step in security analysis. Gathering and comparing logs from different sources to find the links between them. 
    g. Visualization and reporting - Narrate a story by charts and graphs.


### Important Winlog Event IDs 
Account Management	

    4720: User account creation.
    4722: User account enabled.
    4723: Attempt to change an account password.
        The user attempts to change their password.
    4724: Attempt to reset the account password.
        The user attempts to reset the password of another account.
    4725: Account disable.
    4726: Account removal.

Account Logon	

    4624: Successful logon.
    4625: Failed logon.
    4634 and 4647: Logoff.
    4779: Session disconnect.

Scheduled Tasks	

    4698: Scheduled task creation.
    4702: Scheduled task updated.
    4699: Scheduled task deletion.

Security	

    1100: Logging service disabled.
    1102: Log deletion.
    1116: Malware detection.

### Linux logs requiring binaries to view


Failed logins only
        /var/log/faillog

    faillog

	
 Active login records
        /var/log/wtmp

    who

Last logins
        /var/log/lastlog

    lastlog

	
 Kernel ring buffer logs
        /var/log/dmesg

    dmesg
