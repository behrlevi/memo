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


### The PASTA (Process for Attack Simulation and Threat Analysis) framework

1. Define the Objectives

    Establish the scope of the threat modelling exercise by identifying the systems, applications, or networks being analysed and the specific security objectives and compliance requirements to be met.

   - Set clear and realistic security objectives for the threat modelling exercise.
   - Identify relevant compliance requirements and industry-specific security standards.

3. Define the Technical Scope

    Create an inventory of assets, such as hardware, software, and data, and develop a clear understanding of the system's architecture, dependencies, and data flows.

    - Identify all critical assets, such as systems and applications, that handle sensitive data owned by the organisation.
    - Develop a thorough understanding of the system architecture, including data flows and dependencies.

4. Decompose the Application

    Break down the system into its components, identifying entry points, trust boundaries, and potential attack surfaces. This step also includes mapping out data flows and understanding user roles and privileges within the system.

   - Break down the system into manageable components or modules.
   - Identify and document each component's possible entry points, trust boundaries, attack surfaces, data flows, and user flows.

5. Analyse the Threats 

    Identify potential threats to the system by considering various threat sources, such as external attackers, insider threats, and accidental exposures. This step often involves leveraging industry-standard threat classification frameworks or attack libraries.

    - Research and list potential threats from various sources, such as external attackers, insider threats, and accidental exposures.
    - Leverage threat intelligence feeds and industry best practices to stay updated on emerging threats.

6. Vulnerabilities and Weaknesses Analysis

    Analyse the system for existing vulnerabilities, such as misconfigurations, software bugs, or unpatched systems, that an attacker could exploit to achieve their objectives. Vulnerability assessment tools and techniques, such as static and dynamic code analysis or penetration testing, can be employed during this step.

   - Use a combination of tools and techniques, such as static and dynamic code analysis, vulnerability scanning, and penetration testing, to identify potential weaknesses in the system.
    - Keep track of known vulnerabilities and ensure they are addressed promptly.

7. Analyse the Attacks

    Simulate potential attack scenarios and evaluate the likelihood and impact of each threat. This step helps determine the risk level associated with each identified threat, allowing security teams to prioritise the most significant risks.

   - Develop realistic attack scenarios and simulate them to evaluate their potential consequences.
   - Create a blueprint of scenarios via Attack Trees and ensure that all use cases are covered and aligned with the objective of the exercise.

8. Risk and Impact Analysis

    Develop and implement appropriate security controls and countermeasures to address the identified risks, such as updating software, applying patches, or implementing access controls. The chosen countermeasures should be aligned with the organisation's risk tolerance and security objectives.

   - Assess the likelihood and impact of each identified threat and prioritise risks based on their overall severity.
   - Determine the most effective and cost-efficient countermeasures for the identified risks, considering the organisation's risk tolerance and security objectives.

### The DREAD framework
  
| DREAD | Definition |
|-------|------------|
| Damage | The potential harm that could result from the successful exploitation of a vulnerability. This includes data loss, system downtime, or reputational damage. |
| Reproducibility | The ease with which an attacker can successfully recreate the exploitation of a vulnerability. A higher reproducibility score suggests that the vulnerability is straightforward to abuse, posing a greater risk. |
| Exploitability | The difficulty level involved in exploiting the vulnerability considering factors such as technical skills required, availability of tools or exploits, and the amount of time it would take to exploit the vulnerability successfully. |
| Affected Users | The number or portion of users impacted once the vulnerability has been exploited. |
| Discoverability | The ease with which an attacker can find and identify the vulnerability considering whether it is publicly known or how difficult it is to discover based on the exposure of the assets (publicly reachable or in a regulated environment). |

### Comparison

| Framework | Use Case Applications |
|-----------|----------------------|
| MITRE ATT&CK | Unlike DREAD and STRIDE, which focus more on potential risks and vulnerabilities, ATT&CK provides a practical and hands-on approach by mapping adversary tactics.<br><br>• Assess the effectiveness of existing controls against known attack techniques used by threat actors. |
| DREAD | DREAD offers a more numerical and calculated approach to threat analysis than STRIDE or MITRE ATT&CK, making it excellent for clearly prioritising threats.<br><br>• Qualitatively assess the potential risks associated with specific threats.<br>• Prioritise risk mitigation based on the collective score produced by each DREAD component. |
| STRIDE | While other frameworks like MITRE ATT&CK focus on real-world adversary tactics, STRIDE shines in its structure and methodology, allowing for a systematic review of threats specific to software systems.<br><br>• Analyse and categorise threats in software systems.<br>• Identify potential vulnerabilities in system components based on the six STRIDE threat categories.<br>• Implement appropriate security controls to mitigate specific threat types. |
| PASTA | Excellent for aligning threat modelling with business objectives. Unlike other frameworks, PASTA integrates business context, making it a more holistic and adaptable choice for organisations.<br><br>• Conduct risk-centric threat modelling exercises aligned with business objectives.<br>• Prioritise threats based on their potential impact and risk level to the organisation.<br>• Build a flexible methodology that can be adapted to different organisational contexts. |
