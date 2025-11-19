# AWS EC2 Deployment Scripts

This repository contains automated scripts for deploying and managing AWS EC2 instances using CloudFormation.

## 🚀 Quick Start

### Prerequisites
- AWS CLI installed and configured
- Valid AWS credentials with EC2 and CloudFormation permissions
- Windows environment (batch scripts)

### Setup AWS Credentials
```cmd
set-aws-credentials.bat
```
This script helps configure your AWS credentials if not already set up.

### Deploy EC2 Instance
```cmd
deploy-ec2.bat
```
Deploys an EC2 instance using the CloudFormation template `ec2-instance.yaml`.

### Delete Stack
```cmd
delete-stack.bat
```
Removes the deployed CloudFormation stack and associated resources.

## 📁 Files Description

- **`ec2-instance.yaml`** - CloudFormation template defining the EC2 infrastructure
- **`deploy-ec2.bat`** - Batch script to deploy the CloudFormation stack
- **`delete-stack.bat`** - Batch script to delete the CloudFormation stack
- **`set-aws-credentials.bat`** - Helper script for AWS credentials setup
- **`.gitignore`** - Git ignore file for common AWS/Python artifacts

## 🔧 Usage

1. **Configure AWS credentials** (if not already done):
   ```cmd
   set-aws-credentials.bat
   ```

2. **Deploy your infrastructure**:
   ```cmd
   deploy-ec2.bat
   ```

3. **Clean up resources** when done:
   ```cmd
   delete-stack.bat
   ```

## 🛡️ Required AWS Permissions

Your AWS user/role needs the following permissions:
- `cloudformation:*`
- `ec2:*`
- `iam:PassRole` (if the template creates IAM roles)

## 📝 Customization

Modify `ec2-instance.yaml` to:
- Change instance types
- Add security groups
- Configure networking
- Add additional AWS resources

## ⚠️ Important Notes

- Always run `delete-stack.bat` to avoid unnecessary AWS charges
- Review the CloudFormation template before deployment
- Ensure you have proper AWS permissions
- Monitor AWS costs in the AWS Console

## 🔍 Troubleshooting

- **Credentials Error**: Run `aws configure` or use `set-aws-credentials.bat`
- **Permission Denied**: Check IAM permissions for your AWS user
- **Stack Already Exists**: Delete the existing stack first or use a different stack name
- **Region Issues**: Ensure your AWS CLI is configured for the correct region

## 📞 Support

For AWS-related issues, refer to the [AWS Documentation](https://docs.aws.amazon.com/) or [AWS Support](https://aws.amazon.com/support/).