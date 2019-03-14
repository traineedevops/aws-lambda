#!/bin/bash

AWS_USER=mycli

##################################################################
#
#		Deploy Lambda function using SAM via AWS CLI 
#
##################################################################

aws s3 mb s3://ec2-owner-tag-$AWS_USER	 # Create S3 bucket to store your deployment packeges


aws cloudformation package --template-file template.yaml --s3-bucket ec2-owner-tag-$AWS_USER --output-template-file output.yaml # Create deployment package && upload to S3.


aws cloudformation deploy --stack-name ec2-owner-tag --template-file output.yaml --capabilities CAPABILITY_IAM # Deploy lambda


##################################################################
# P.S. 
# 
#	Make sure your working directory containe template YAML's...
#
##################################################################
#	DELETE stack :
#
#		aws cloudformation delete-stack --stack-name ec2-owner-tag
#	
#	DELETE S3 Bucket :
#	
#		aws s3 rb s3://ec2-owner-tag-$AWS_USER --force
#
##################################################################