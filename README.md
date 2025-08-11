# skeleton-tf-root-module #

[![GitHub Build Status](https://github.com/cisagov/skeleton-tf-root-module/workflows/build/badge.svg)](https://github.com/cisagov/skeleton-tf-root-module/actions)
[![License](https://img.shields.io/github/license/cisagov/skeleton-tf-root-module)](https://spdx.org/licenses/)
[![CodeQL](https://github.com/cisagov/skeleton-tf-root-module/workflows/CodeQL/badge.svg)](https://github.com/cisagov/skeleton-tf-root-module/actions/workflows/codeql-analysis.yml)

This is a generic skeleton project that can be used to quickly get a
new [cisagov](https://github.com/cisagov) [Terraform root
module](https://developer.hashicorp.com/terraform/language/modules#the-root-module)
GitHub repository started.  This skeleton project contains [licensing
information](LICENSE), as well as [pre-commit
hooks](https://pre-commit.com) and
[GitHub Actions](https://github.com/features/actions) configurations
appropriate for the major languages that we use.

See the [Terraform
documentation](https://www.terraform.io/docs/modules/index.html) for
more details on Terraform modules and the standard module structure.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- AWS CLI access [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
  for the appropriate account on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [`backend.tf`](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [`backend.tf`](backend.tf)).

## Building the Terraform-based infrastructure ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`.
1. Create a `<workspace_name>.tfvars` file with all of the required
   variables (see [Inputs](#inputs) below for details).
1. Run the command `terraform init`.
1. Create the Terraform infrastructure by running the command:

   ```console
   terraform apply -var-file=<workspace_name>.tfvars
   ```

## Tearing down the Terraform-based infrastructure ##

1. Select the appropriate Terraform workspace by running
   `terraform workspace select <workspace_name>`.
1. Destroy the Terraform infrastructure in that workspace by running
   `terraform destroy -var-file=<workspace_name>.tfvars`.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
| ---- | ------- |
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

| Name | Version |
| ---- | ------- |
| aws | ~> 6.7 |

## Modules ##

| Name | Source | Version |
| ---- | ------ | ------- |
| example | github.com/cisagov/skeleton-tf-module | v1.1.0 |

## Resources ##

| Name | Type |
| ---- | ---- |
| [aws_subnet.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| ami\_owner\_account\_id | The ID of the AWS account that owns the AMI, or "self" if the AMI is owned by the same account as the provisioner. | `string` | `"self"` | no |
| aws\_availability\_zone | The AWS availability zone to deploy into (e.g. a, b, c, etc.). | `string` | `"a"` | no |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | ```{ "Testing": true }``` | no |
| tf\_role\_arn | The ARN of the role that can terraform non-specialized resources. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
| ---- | ----------- |
| arn | The EC2 instance ARN. |
| availability\_zone | The AZ where the EC2 instance is deployed. |
| id | The EC2 instance ID. |
| private\_ip | The private IP of the EC2 instance. |
| subnet\_id | The ID of the subnet where the EC2 instance is deployed. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## New Repositories from a Skeleton ##

Please see our [Project Setup guide](https://github.com/cisagov/development-guide/tree/develop/project_setup)
for step-by-step instructions on how to start a new repository from
a skeleton. This will save you time and effort when configuring a
new repository!

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
