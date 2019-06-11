SHELL := /bin/bash

# List of targets the `readme` target should call before generating the readme
export README_DEPS ?= docs/targets.md docs/terraform.md
export TERRAFORM_VERSION ?= 0.12.1

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

## Override the terraform/validate from build-harness
## so that it is TF 0.12 friendly.
terraform/validate:
	AWS_DEFAULT_REGION=us-east-1 @$(TERRAFORM) validate

## Lint terraform code
lint:
	$(SELF) terraform/install terraform/get-modules terraform/get-plugins terraform/lint terraform/validate
