#!/bin/bash

# Configuration
AWS_ACCESS_KEY_ID="Enter your access key here"
AWS_SECRET_ACCESS_KEY="Your secret access key"
S3_BUCKET="TARGET S3 BUCKET"
S3_REGION="WHATEVER REGION YOU'RE IN"

# Command-line options
FILE_TO_UPLOAD=$1
DESTINATION_PATH=$2

# Check if both file path and destination path are provided
if [ -z "$FILE_TO_UPLOAD" ] || [ -z "$DESTINATION_PATH" ]; then
	echo "Usage: $0 <awstest.txt> <s3://s3bucket/"
	exit 1
fi

# AWS CLI command to upload file to S3
aws s3 cp "$FILE_TO_UPLOAD" "s3://$S3_BUCKET/$DESTINATION_PATH" \
	--region "$S3_REGION" \
	--acl private \
	--only-show-errors

# Check if the upload was successful
if [ $? -eq 0 ]; then
	echo "File uploaded successfully to S3 bucket: $S3_BUCKET"
else
	echo "Error uploading file to S3 bucket: $S3_BUCKET"
fi
