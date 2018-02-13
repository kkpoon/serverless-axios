# serverless-axios

This is a serverless framework service which wrap the axios http client into
an AWS Lambda function.

## Deployment

You can use `make` command to deploy the AWS Lambda function.
Please update the value of `ROLE_ARN` in the `Makefile` with the actual ARN of the IAM role for the Lambda function before excute the `make` command.

For the first time deployment of the function, please run the following command.

```
$ make create
```

To update existing AWS Lambda function, please run the following command.

```
$ make update
```
