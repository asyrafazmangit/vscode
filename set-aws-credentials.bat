@echo off
echo This script helps you configure AWS credentials
echo.
echo Option 1: Use AWS CLI configuration
echo   aws configure
echo.
echo Option 2: Set environment variables
echo   set AWS_ACCESS_KEY_ID=your_access_key
echo   set AWS_SECRET_ACCESS_KEY=your_secret_key
echo   set AWS_SESSION_TOKEN=your_session_token
echo.
echo Testing credentials...
aws sts get-caller-identity