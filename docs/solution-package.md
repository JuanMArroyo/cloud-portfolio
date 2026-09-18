# Solution Package

## Business problem
Cloud services should be reproducible, secure, and testable instead of relying on manual console configuration.

## Solution
Use Terraform to model AWS infrastructure, starting with a working serverless API and progressing toward three-tier networking and reusable templates.

## Architecture
API Gateway → Lambda → JSON health response, with Terraform managing the supporting AWS resources. The repository also contains in-progress three-tier patterns.

## Implementation
Start with `project2-serverless-api/` for the implemented path. Treat projects marked scaffolded or in progress according to the status table in the root README.

## Validation
Invoke the API endpoint, confirm the expected response, run Terraform validation/plan, and record evidence without committing secrets or state.

## Operations
Use logs and health responses for troubleshooting; review Terraform plans before applying changes and destroy temporary resources after testing.

## Security, cost, and recovery
Use least-privilege IAM, parameterize secrets, protect Terraform state, and document cleanup to avoid unexpected AWS spend.

## Lessons learned
A small working slice is stronger portfolio evidence than an oversized claim: build, validate, document, then expand.
