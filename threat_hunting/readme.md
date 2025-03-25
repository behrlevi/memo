# Threat Hunting Methodology

| Tactic | Hunting Methodology |
|--------|---------------------|
| **Initial Access** | • Seek patterns of numerous failed login attempts to external services, followed by a successful authentication.<br>• Monitor intrusion attempts on web applications and potential code execution on web servers.<br>• Look for unusual file downloads and temporary files created by Outlook clients.<br>• Correlate all subsequent events after the successful intrusion attempt. |
| **Execution** | • Identify excessive usage of cmd.exe and powershell.exe.<br>• Spot misused legitimate operating system binaries and scripts (LOLBAS) and correlate their subsequent execution.<br>• Look for potential abuse of installed programming tools.<br>• Utilise the parent-child relationships of processes to connect associated events. |
| **Defence Evasion** | • Look for attempts to disable security software.<br>• Keep an eye out for log deletion events.<br>• Look for process injection activities.<br>• Correlate all evasion activities to their parent process and find subsequent events if the evasion attempt succeeded. |
| **Persistence** | • Watch out for the creation of scheduled tasks.<br>• Look for suspicious registry modifications on known registries used for persistence.<br>• Correlate all persistence activities back to their parent process. |
| **Command and Control** | • Look for a high count of unique subdomains on a single domain.<br>• Spot unusual outgoing connections to cloud services/applications.<br>• Look for an unusual number of outbound connections to an unfamiliar domain.<br>• Correlate all unusual activity back to its associated process. |

| Tactic | Hunting Methodology |
|--------|---------------------|
| **Discovery** | • Look for executions of built-in tools used for enumerating user and host information.<br>• Spot unusual internal network scanning activities.<br>• Hunt for unusual processes initiating LDAP queries.<br>• Utilise the parent-child relationships of processes to connect associated events. |
| **Privilege Escalation** | • Look for unusual SYSTEM account processes spawned by a low-privileged user.<br>• Hunt for potential service permission abuses via service binary modification.<br>• Utilise the parent-child relationship of processes, including the context of the user who spawned it. |
| **Credential Access** | • Hunt for known indicators that are associated with LSASS credential dumping.<br>• Monitor events related to domain controller data replication.<br>• Seek patterns of numerous failed login attempts to Windows hosts, followed by successful authentication.<br>• Observe unusual process creation activities of potentially compromised accounts. |
| **Lateral Movement** | • Hunt for unusual process creations made by WmiPrvSE.exe.<br>• Look for suspicious successful authentication patterns that may indicate a potential Pass-the-Hash activity.<br>• Observe unusual process creation activities after detecting a successful lateral movement attempt.<br>• Correlate the source of the lateral movement attempt and investigate how the source was compromised. |
