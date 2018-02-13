ROLE_ARN=arn:aws:iam::0:role/lambdaRole

pack:
	npm install
	zip -r handler.zip index.js node_modules

create: pack
	aws lambda create-function \
		--region us-east-1 \
		--profile default \
		--function-name axios-service-axios \
		--zip-file fileb://./handler.zip \
		--runtime nodejs6.10 \
		--timeout 10 \
		--memory-size 128 \
		--role $(ROLE_ARN) \
		--handler index.handler

update: pack
	aws lambda update-function-code \
		--region us-east-1 \
		--profile default \
		--function-name axios-service-axios \
		--zip-file fileb://./handler.zip
	aws lambda update-function-configuration \
		--region us-east-1 \
		--profile default \
		--function-name axios-service-axios \
		--runtime nodejs6.10 \
		--timeout 10 \
		--memory-size 128 \
		--role $(ROLE_ARN) \
		--handler index.handler
