# 🚑 Disaster Recovery Procedure

This document describes how to recover Terraform-managed infrastructure
in case of state file corruption or accidental deletion.

---

## 🔹 1. Identify the Issue

- Check the S3 backend bucket for the Terraform state file (`terraform.tfstate`).
- Review AWS DynamoDB for the Terraform state lock.
- Verify last successful GitHub Actions run (IaC workflow).

---

## 🔹 2. Restore the Latest Good State

AWS S3 automatically keeps **versioned copies** of your Terraform state.

To view state file versions:

```bash
aws s3api list-object-versions --bucket rocky-terraform-state-bucket --prefix dev/terraform.tfstate
To restore a specific version:

bash
Copy code
aws s3api copy-object \
  --bucket rocky-terraform-state-bucket \
  --copy-source rocky-terraform-state-bucket/dev/terraform.tfstate?versionId=<VERSION_ID> \
  --key dev/terraform.tfstate
## 🔹 3. Validate the Recovered State
After restoring the state file, run:

bash
Copy code
terraform init
terraform plan
This ensures the state is consistent with actual infrastructure.

## 🔹 4. Apply Recovery
If the plan looks correct and matches your desired setup:

bash
Copy code
terraform apply -auto-approve
This reapplies missing or drifted resources.

## 🔹 5. Verify Infrastructure Health
Check AWS Console → S3, DynamoDB, IAM, etc.

Ensure all required resources are up and tagged correctly.

Confirm no duplicate or orphaned resources exist.

## 🔹 6. Prevent Future Failures
Always run Terraform via CI/CD (GitHub Actions).

Never edit the .tfstate file manually.

Keep S3 bucket versioning enabled.

Regularly test this recovery process in a sandbox.

📘 Reference:

Terraform Remote State Backend Docs

AWS S3 Versioning

yaml
Copy code

---

### ✅ **Final Check**
Once added, commit it:

```bash
git add RECOVERY.md
git commit -m "🩺 Added disaster recovery documentation"
git push origin dev