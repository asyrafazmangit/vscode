@echo off
echo Note: Make sure your AWS credentials are configured via AWS CLI or environment variables
echo You can set them using: aws configure

echo Deleting CloudFormation Stack...

set STACK_NAME=my-ec2-stack

echo Deleting CloudFormation stack: %STACK_NAME%
aws cloudformation delete-stack --stack-name %STACK_NAME%

if %ERRORLEVEL% EQU 0 (
    echo Stack deletion initiated successfully!
    echo Waiting for stack to be deleted...
    aws cloudformation wait stack-delete-complete --stack-name %STACK_NAME%
    
    if %ERRORLEVEL% EQU 0 (
        echo Stack deleted successfully!
    ) else (
        echo Stack deletion failed or timed out.
        echo Checking stack status...
        aws cloudformation describe-stacks --stack-name %STACK_NAME% --query "Stacks[0].StackStatus"
    )
) else (
    echo Failed to delete stack. Check your AWS credentials and permissions.
)

pause