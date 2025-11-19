@echo off
echo Note: Make sure your AWS credentials are configured via AWS CLI or environment variables
echo You can set them using: aws configure
echo Or set environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN

echo Deploying EC2 CloudFormation Stack...

set STACK_NAME=my-ec2-stack
set TEMPLATE_FILE=ec2-instance.yaml
set KEY_NAME=%1

if "%KEY_NAME%"=="" (
    echo Usage: deploy-ec2.bat ^<your-key-pair-name^>
    echo Example: deploy-ec2.bat my-key-pair
    exit /b 1
)

echo Creating CloudFormation stack: %STACK_NAME%
aws cloudformation create-stack ^
    --stack-name %STACK_NAME% ^
    --template-body file://%TEMPLATE_FILE% ^
    --parameters ParameterKey=KeyName,ParameterValue=%KEY_NAME%

if %ERRORLEVEL% EQU 0 (
    echo Stack creation initiated successfully!
    echo Waiting for stack to complete...
    aws cloudformation wait stack-create-complete --stack-name %STACK_NAME%
    
    if %ERRORLEVEL% EQU 0 (
        echo Stack created successfully!
        echo Getting stack outputs...
        aws cloudformation describe-stacks --stack-name %STACK_NAME% --query "Stacks[0].Outputs"
    ) else (
        echo Stack creation failed or timed out.
    )
) else (
    echo Failed to create stack. Check your AWS credentials and permissions.
)

pause