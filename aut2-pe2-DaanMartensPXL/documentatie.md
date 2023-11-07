# **Documentatie PE2 Automation II | Daan Martens**

## **Terragrunt**

### **Map structure**

Terragrunt heeft een goede map structuur nodig:
```
.
├── environments
│   ├── production
│   │   └── vpc
│   │       └── terragrunt.hcl
│   ├── prod
│   │   └── vpc
│   │       └── terragrunt.hcl
└── modules
    ├── vpc
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── ...

```

### **VPC**

Aanmaken van vpc module.

### **s3**

Aanmaken van s3 bucket.

### **MySQL DB**

Aanmaken van MySQL database.
Aanmaken van sg_db.

### **ALB**

Aanmaken van ALB.
Aanmaken van sg_lb.

