# AWS CI/CD - Glue via CloudFormation

## Task submission

Create `<service>.yml` files for each service.

## Tasks

Create a `cicd/glue.yml` CloudFormation template with the following parameters:
  - S3BucketData
  - S3BucketScripts
  - GlueJobName
  - GlueJobRoleName
  - GlueDatabaseLandingName
  - GlueDatabaseDatalakeName
  - GlueCrawlerLandingTriggerName
  - GlueCrawlerLandingName
  - GlueCrawlerDatalakeTriggerName
  - GlueCrawlerDatalakeName
  - GlueJobTriggerName

Update this CloudFormation template to deploy your create triggers for your Glue Crawler and Job.

**Note**: make sure to `tag` your deployments with `Owner: <user>`.

## Extra tasks

- Deploy the Glue Workflow (crawler-landing-trigger -> crawler-landing -> job-trigger -> job -> crawler-datalake-trigger -> crawler-datalake)
- Modify your Glue job so that it collects the table names configuration from DynamoDB (*jobs configuration*)
- Create a CloudFormation template for your CodePipeline service (`<user>-academy-codepipeline`)