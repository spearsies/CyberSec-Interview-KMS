---
type: interview-question
question: "Explain the AWS shared responsibility model."
domain: [cloud]
role: [security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed: 
tags:
  - review
  - interview-question
---

# ❓ Explain the AWS shared responsibility model.

## Question
Explain the AWS Shared Responsibility Model and give examples of security responsibilities for each party.

## Quick Answer
**AWS is responsible for security OF the cloud** (infrastructure, hardware, facilities).
**Customer is responsible for security IN the cloud** (data, applications, access management, OS patching).

## Detailed Answer

### The Division of Responsibilities

```
┌─────────────────────────────────────────────────┐
│        CUSTOMER RESPONSIBILITY                  │
│         "Security IN the Cloud"                 │
├─────────────────────────────────────────────────┤
│ • Customer Data                                 │
│ • Platform, Applications, IAM                   │
│ • Operating System, Network, Firewall Config    │
│ • Client-Side Encryption & Integrity            │
│ • Server-Side Encryption (File System/Data)     │
│ • Network Traffic Protection                    │
├─────────────────────────────────────────────────┤
│           AWS RESPONSIBILITY                    │
│         "Security OF the Cloud"                 │
├─────────────────────────────────────────────────┤
│ • Compute, Storage, Database, Networking        │
│ • Hardware, AWS Global Infrastructure           │
│ • Regions, Availability Zones, Edge Locations   │
│ • Physical Security of Data Centers             │
└─────────────────────────────────────────────────┘
```

---

### AWS Responsibilities (Security OF the Cloud)

**Infrastructure Protection:**
- Physical data center security (guards, cameras, biometrics)
- Environmental controls (power, cooling)
- Hardware lifecycle management
- Network infrastructure and virtualization layer
- Managed service infrastructure (RDS, Lambda, S3 backend)

**AWS Managed Services:**
- Patching/maintenance of managed database engines (RDS)
- S3 infrastructure resilience and durability
- DDoS protection (AWS Shield Standard)
- Hardware decommissioning and destruction

**Compliance:**
- SOC 1/2/3, ISO 27001, PCI DSS, HIPAA, FedRAMP compliance
- Third-party audits and certifications
- Regional regulatory compliance

---

### Customer Responsibilities (Security IN the Cloud)

**Responsibility VARIES by Service Type:**

#### IaaS (EC2, VPC) - Most Customer Responsibility
```
Customer owns:
✅ Guest OS patching and updates
✅ Application software security
✅ Security group/NACL configuration
✅ IAM user/role management
✅ Data encryption (at rest and in transit)
✅ Network traffic firewall rules
✅ Endpoint protection (antivirus, EDR)
```

#### PaaS (RDS, Elastic Beanstalk) - Shared Management
```
AWS manages: Database engine patching
Customer owns:
✅ IAM database access control
✅ Security group configuration
✅ Database encryption enablement
✅ Backup configuration
✅ Data classification
```

#### SaaS (Managed Services like S3, DynamoDB) - Least Customer Responsibility
```
AWS manages: Infrastructure, patching, availability
Customer owns:
✅ Bucket policies and permissions
✅ Object encryption settings
✅ Access logging configuration
✅ Data within the buckets
```

---

### Detailed Responsibility Matrix

| Security Area | IaaS (EC2) | PaaS (RDS) | SaaS (S3) |
|---------------|------------|------------|-----------|
| **Hardware** | AWS | AWS | AWS |
| **Hypervisor** | AWS | AWS | AWS |
| **Network Infrastructure** | AWS | AWS | AWS |
| **Operating System** | **Customer** | AWS | AWS |
| **Application** | **Customer** | **Customer** | AWS |
| **Data** | **Customer** | **Customer** | **Customer** |
| **Access Management** | **Customer** | **Customer** | **Customer** |
| **Patching** | **Customer** | **Shared** | AWS |

---

### Common Security Tasks by Responsibility

**Always Customer Responsibility:**
1. **Identity & Access Management**
   - IAM users, roles, policies
   - MFA enforcement
   - Principle of least privilege
   - Access key rotation

2. **Data Protection**
   - Data classification
   - Encryption key management (KMS)
   - Data residency compliance
   - Backup strategy

3. **Network Security**
   - Security Groups configuration
   - NACLs (Network Access Control Lists)
   - VPC design and segmentation
   - VPN/Direct Connect configuration

4. **Monitoring & Logging**
   - CloudTrail enablement
   - CloudWatch alerts
   - GuardDuty/Security Hub configuration
   - Log retention policies

5. **Compliance**
   - Meeting industry regulations (HIPAA, PCI)
   - Data handling procedures
   - Incident response plan
   - Vulnerability scanning

**Always AWS Responsibility:**
- Physical data center security
- Hardware disposal
- Hypervisor and networking hardware
- Core infrastructure services

---

### Real-World Scenarios

**Scenario 1: EC2 Instance Compromise**
```
AWS: Ensures underlying hardware is secure
Customer: Should have:
  • Patched the OS (their responsibility)
  • Configured security groups properly
  • Deployed EDR/antivirus
  • Enabled CloudWatch/GuardDuty
  • Implemented IAM roles (not credentials on instance)
```

**Scenario 2: S3 Data Breach**
```
AWS: S3 infrastructure is secure and resilient
Customer: Should have:
  • Set correct bucket policies (public vs private)
  • Enabled encryption (S3-SSE or KMS)
  • Enabled access logging
  • Implemented least privilege IAM policies
  • Blocked public access settings
```

**Scenario 3: RDS SQL Injection**
```
AWS: Database engine is patched and infrastructure secured
Customer: Should have:
  • Implemented input validation (application layer)
  • Used parameterized queries
  • Applied WAF rules (if applicable)
  • Restricted security group access
  • Enabled database activity monitoring
```

---

## Interview Tips

### How to Demonstrate Understanding:

1. **Use the "OF vs IN" framework** clearly
2. **Give specific examples** from AWS services you've used
3. **Discuss how responsibility shifts** based on service model (IaaS → PaaS → SaaS)
4. **Mention tools**: CloudTrail, Security Hub, GuardDuty, Config
5. **Talk about real incidents**: "I've seen S3 buckets exposed because..."

### Common Mistakes to Avoid:

❌ "AWS secures everything" - Wrong! Customer has major responsibilities
❌ "It's all documented, I'll just follow AWS docs" - Show you understand the WHY
❌ Forgetting about IAM - Customer's most critical responsibility
❌ Assuming managed services = no customer responsibility

### Advanced Discussion Points:

**Inherited vs Shared vs Customer-Only Controls:**
- **Inherited**: Physical security (AWS only)
- **Shared**: Patching (depends on service type)
- **Customer Only**: Data encryption, IAM, application security

**Service-Specific Nuances:**
- Lambda: AWS patches runtime, customer secures function code
- EKS: AWS manages control plane, customer secures worker nodes
- DynamoDB: AWS handles infrastructure, customer configures encryption/IAM

### Follow-up Questions You Might Get:

**Q: "Who's responsible if an EC2 instance gets compromised?"**
A: "Depends on root cause. If unpatched OS vulnerability, that's customer's responsibility since OS patching is customer-owned. If AWS hypervisor vulnerability, that's AWS. Most breaches are customer configuration issues."

**Q: "How does shared responsibility impact compliance?"**
A: "AWS provides infrastructure compliance certifications (SOC 2, ISO 27001), but customers must implement controls for their data and applications. We inherit some controls but must implement others. For HIPAA, AWS is Business Associate, customer is Covered Entity."

**Q: "What's your experience implementing this model?"**
A: *[Share specific examples from your work, like implementing encryption, IAM policies, or responding to misconfigurations]*

### Example Answer Framework:

> "The Shared Responsibility Model divides security between AWS and the customer. AWS handles security OF the cloud - the infrastructure, hardware, and physical facilities. Customers handle security IN the cloud - our data, applications, IAM, and configurations.
>
> The boundary shifts based on service type. With EC2, we're responsible for OS patching and security. With RDS, AWS patches the database engine but we configure security groups and encryption. With S3, AWS secures the infrastructure but we set bucket policies and access controls.
>
> In my experience at [company], I've implemented this by [specific example: enabling CloudTrail across all accounts, implementing least privilege IAM policies, requiring MFA for all users, enabling encryption on S3 and EBS, etc.]. A critical lesson was [share a real incident or near-miss]."

## Related Concepts
- [[C_AWS-IAM-Best-Practices]]
- [[Q_Cloud_AWS-Security-Services]]
- [[C_Cloud-Security-Frameworks]]
- [[Q_Cloud_Azure-Shared-Responsibility]]
- [[C_Defense-in-Depth-Cloud]]

## Flashcard
AWS Shared Responsibility Model::AWS secures OF the cloud (infrastructure), Customer secures IN the cloud (data, apps, IAM)
Customer always responsible for::IAM, data encryption, security groups, application security, OS patching (IaaS)
AWS always responsible for::Physical security, hardware, hypervisor, core infrastructure, managed service backends
IaaS vs PaaS vs SaaS responsibility::IaaS (most customer), PaaS (shared), SaaS (least customer, AWS handles most)
