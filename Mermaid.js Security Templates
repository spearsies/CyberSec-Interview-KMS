📊 Mermaid.js Security Templates

Copy these code blocks into your notes to visualize complex security processes. In Obsidian, these will render as interactive diagrams.

1. The "https://www.google.com/search?q=Google.com" Flow (Sequence Diagram)

Use this for the classic "What happens when you type a URL?" question. It visualizes the handshake between the Client, DNS, and Server.

sequenceDiagram
    participant C as Client (Browser)
    participant D as DNS Server
    participant S as Web Server (Google)

    Note over C: User types google.com
    C->>D: DNS Query: Where is google.com?
    D-->>C: DNS Response: 142.250.xxx.xxx
    
    C->>S: TCP SYN (Three-way Handshake)
    S-->>C: TCP SYN-ACK
    C->>S: TCP ACK
    
    C->>S: TLS ClientHello (Cipher Suites)
    S-->>C: TLS ServerHello + Certificate
    Note over C,S: Key Exchange & Encryption Established
    
    C->>S: HTTP GET / (Encrypted)
    S-->>C: 200 OK (Website Content)


2. Incident Response Playbook (Flowchart)

Use this for "How do you handle a suspicious login alert?" or "Phishing Response."

graph TD
    A[Alert: Suspicious Login] --> B{Valid User?}
    B -- Yes --> C[Check Location/Device]
    B -- No --> D[Isolate Account]
    
    C --> E{Known Travel?}
    E -- No --> D
    E -- Yes --> F[False Positive - Close Alert]
    
    D --> G[Force Password Reset]
    D --> H[Revoke Active Sessions]
    G --> I[Notify User via Secondary Channel]
    H --> J[Perform Forensic Audit]


3. Defense in Depth Architecture (Flowchart)

Use this to visualize network segmentation and security layers.

graph LR
    Internet((Internet)) --- FW1[External Firewall]
    FW1 --- DMZ[DMZ: Public Web Server]
    DMZ --- FW2[Internal Firewall]
    
    subgraph Internal_Network
        FW2 --- App[App Server]
        App --- DB[(Database)]
        FW2 --- AD[Active Directory]
    end
    
    style DMZ fill:#f96,stroke:#333
    style Internal_Network fill:#bbf,stroke:#333


4. Privilege Escalation Chain (Gantt/Timeline style)

Use this to visualize an attack sequence or a Red Team exercise timeline.

gantt
    title Attack Lifecycle (Kill Chain)
    dateFormat  HH:mm
    axisFormat %H:%M

    section Recon
    Scanning Subnets      :a1, 00:00, 1h
    section Exploitation
    SQL Injection         :a2, after a1, 30m
    section Persistence
    Installing Web Shell  :a3, after a2, 15m
    section Lateral Movement
    Cred Dumping (LSASS)  :a4, after a3, 45m
    Accessing Domain Controller :a5, after a4, 1h


5. How to use in Obsidian

Ensure you are in Live Preview or Reading Mode.

Create a code block with the language set to mermaid.

Paste the code above inside the block.
