# AWS CI/CD - State Machine via CloudFormation

## Task submission

Create `<service>.yml` files for each service.

## Tasks

**Note**: create the Roles associated to your services using CFN from scratch

Create a `cicd/statemachine.yml` CloudFormation template with the following parameters:
  - S3BucketData
  - S3BucketScripts
  - DynamoDBTableGlobalName
  - DynamoDBTableJobsName
  - StateMachineName
  - StateMachineRoleName
  - StateMachineTriggerRoleName (create a CRON (schedule) trigger (Event::Rule) that runs the Step Function daily@06.00AM)
  - LambdaLandingName
  - LambdaLandingRoleName
  - LambdaLandingUploadUNIXT (if we modify the Lambda code, it won't be recognized by CFN for deployment; this parameter is a hint to solve the problem of skipped Lambda deployments)
  - SNSTopicName (only use this if your `<user>-academy-landing` lambda utilizes SNS)
  - GlueWorkflowName (this will only be applicable after we create the Glue CFN)

Final `cicd/statemachine.yml` should contain resources:
  - `LambdaLandingRole`
  - `StateMachineRole`
  - `StateMachineTriggerRole`
  - `AcademySNSTopic` (optional)
  - `AcademyLambdaLanding`
  - `AcademyStateMachine`
  - `AcademyStateMachineTrigger`

Update this CloudFormation template to deploy your step function.

**Note**: make sure to `tag` your deployments with `Owner: <user>`.
