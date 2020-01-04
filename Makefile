.PHONY: deps clean build

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

# 追加
packege:
	sam package --template-file template.yaml --output-template-file output-template.yaml --s3-bucket sam-template-store-takara --profile takara

# 追加
deploy:
	sam deploy --template-file output-template.yaml --stack-name go-lambda --capabilities CAPABILITY_IAM --profile koike