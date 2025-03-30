### Threat Emulation vs Threat Simulation

1. Threat emulation (aka adversary emulation, attack simulation, purple teaming is an intelligence-driven impersonation of real-world attack scenarios and TTPs in a controlled environment to test, assess and improve an organisation's security defences and response capabilities. This means that you seek to behave as the adversary would. Threat emulation aims to identify and mitigate security gaps before attackers exploit them.
2. In contrast, threat simulation commonly represents adversary functions or behaviour through predefined and automated attack patterns that pretend to represent an adversary. This implies that the actions taken during the exercise will combine TTPs from one or more groups but not an exact imitation of a particular adversary.

### High-Level Process of Threat Modelling

1. Defining the scope
  
   Identify the specific systems, applications, and networks in the threat modelling exercise.

2. Asset Identification

   Develop diagrams of the organisation's architecture and its dependencies. It is also essential to identify the importance of each asset based on the information it handles,  such as customer data, intellectual property, and financial information.

3. Identify Threats

   Identify potential threats that may impact the identified assets, such as cyber attacks, physical attacks, social engineering, and insider threats.

4. Analyse Vulnerabilities and Prioritise Risks

   Analyse the vulnerabilities based on the potential impact of identified threats in conjunction with assessing the existing security controls. Given the list of vulnerabilities, risks should be prioritised based on their likelihood and impact.

5. Develop and Implement Countermeasures

   Design and implement security controls to address the identified risks, such as implementing access controls, applying system updates, and performing regular vulnerability assessments.

6. Monitor and Evaluate

   Continuously test and monitor the effectiveness of the implemented countermeasures and evaluate the success of the threat modelling exercise. An example of a simple measurement of success is tracking the identified risks that have been effectively mitigated or eliminated.

### The STRIDE framework

| Category | Definition | Policy Violated |
|:---------|:-----------|:----------------|
| Spoofing | Unauthorised access or impersonation of a user or system. | Authentication |
| Tampering | Unauthorised modification or manipulation of data or code. | Integrity |
| Repudiation | Ability to deny having acted, typically due to insufficient auditing or logging. | Non-repudiation |
| Information Disclosure | Unauthorised access to sensitive information, such as personal or financial data. | Confidentiality |
| Denial of Service | Disruption of the system's availability, preventing legitimate users from accessing it. | Availability |
| Elevation of Privilege | Unauthorised elevation of access privileges, allowing threat actors to perform unintended actions. | Authorisation |
