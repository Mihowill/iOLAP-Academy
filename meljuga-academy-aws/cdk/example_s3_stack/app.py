#!/usr/bin/env python3
import aws_cdk as cdk

from meljuga_s3_stack_stack import ExampleS3StackStack


app = cdk.App()
ExampleS3StackStack(
    app,
    "meljuga-AcademyS3Stack",
    env=cdk.Environment(account="456582705970", region="eu-central-1"),
)

app.synth()
