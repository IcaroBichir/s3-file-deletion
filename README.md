# Infrastructure Scripting Challenge

## Questions

1. We could run this script in a Jenkins pipeline giving the needed attributes or automating the execution to be executed in a Lambda with pre-defined parameters.

2. By default the script will only show the files that will be deleted, and if we need them to be deleted, we can pass the DRY_RUN variable with the "true" value to delete the files.

3. We can update the script to receive a count at each file that is located and circle that to keep N number of files in the desired date.

## Instructions:

- The script is expecting some variables to be set it up for the execution, you can pass it during the script call or have it as environment variables.

1. DATE: Expected value is the date that will be located in the S3 objects;
2. AWS_REGION: Expected value is the AWS region where the bucket is located;
3. AWS_PROFILE: Expected value is the AWS profile of the account where the bucket is located;
4. BUCKET_NAME: Expected value is the bucket name to locate the deployment files.;

- Execution examples:

1. Test execution:
```
DATE=2022-10-09 AWS_REGION=us-east-1 AWS_PROFILE=test BUCKET_NAME=test-bucket ./s3_file_deletion.sh
```

2. Production execution:
```
DATE=2022-10-09 AWS_REGION=US-east-1 AWS_PROFILE=prod BUCKET_NAME=prod-bucket DRY_RUN=false ./s3_file_deletion.sh
```
