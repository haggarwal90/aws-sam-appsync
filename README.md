# AWS SAM APPSYNC POC

## References
- [Lambda Resolver Tutorial] (https://docs.aws.amazon.com/appsync/latest/devguide/tutorial-lambda-resolvers.html)
- [AWS AppSync] (https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_AppSync.html)

## How To Run
1. Create S3 bucket and update same into Makefile `AWS_BUCKET_NAME`
2. Execute `make deploy-schema` (Only first time or any new update in schema)
3. Execute `make package`
4. Excute `make deploy`

## How To Test
1. Goto AWS AppSync service from console.
2. Execute below query

```
    query {
        allPosts {
            id
            author
            title
            content
            url
            ups
            downs
            relatedPosts {
                id
                title
            }
        }
    }
```
