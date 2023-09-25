#!/usr/bin/env python3
import aws_cdk as cdk

from meljuga_s3_stack.meljuga_s3_stack_stack import StackCreation


app = cdk.App()
StackCreation(
    app,
    "meljuga-cdk-stack-task-2",
    env=cdk.Environment(account="456582705970", region="eu-central-1"),
)

app.synth()
