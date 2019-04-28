.DEFAULT_GOAL := help

PROJECT_NAME ?= aws-sam-appsync
ENV ?= unstable
AWS_BUCKET_NAME ?= development-stage

help:
	@echo Available tasks:
	@echo	package		Upload any artifacts that your Lambda application requires to an AWS S3 bucket.
	@echo deploy
	@echo deploy-schema

deploy-schema:
	@echo "Deploy Graph QL schema to S3"
	aws s3 cp schema.graphql s3://$(AWS_BUCKET_NAME)/schema.graphql

package:
	@echo	"Package task triggered"
	aws cloudformation package \
  --template-file template.yml \
  --output-template-file package.yml \
  --s3-bucket $(AWS_BUCKET_NAME)

deploy:
	@echo	"Deploy task triggered"
	aws cloudformation deploy \
  --template-file package.yml \
  --stack-name sample-app-appsync-lambda \
  --capabilities CAPABILITY_IAM	\
	--parameter-overrides \
			ParamProjectName=$(PROJECT_NAME) \
			ParamENV=$(ENV)	\
			ParamBucket=$(AWS_BUCKET_NAME)
