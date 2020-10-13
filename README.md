# Managing a IAM Groups (terraform-aws-iam-groups)

[toc]

## 1. Module Usage

>```terraform
> module "iam_groups" {
>     source    = "anthunt/iam-groups/aws"
>     version   = "0.0.1"
>     aws       = var.aws
>     groups     = var.groups
> }
> ```

## 2. variables.tf Sample

>```terraform
> variable "aws" {
>     type = object({
>         region  = string
>         profile = string
>     })
> }
> 
> variable "groups" {
>     type = map(object({
>         path                = string
>         attach_policy_arns  = list(string)
>         inline_policies     = map(string)
>     }))
> }
>```

## 3. tfvars Sample

>```terraform
> aws = {
>     "region" = "AWS Region ID"
>     "profile" = "AWS CLI Profile Name from ~/.aws/credentials or config"
> }
> 
> groups = {
> 
>     GroupName01 = {
>         "path" = "/"
>         "attach_policy_arns" = [
>             "Managed policy ARN 01",
>             "Managed policy ARN 02",
>             ...
>         ]
>         "inline_policies" = {} # End Of inline_policies
>     } # End Of GroupName01
> 
> 
>     GroupName02 = {
>         "path" = "/"
>         "attach_policy_arns" = [
>             "Managed policy ARN 01",
>             "Managed policy ARN 02",
>             ...
>         ]
>         "inline_policies" = {
>             "INLINE-Policy-Name" = <<EOF
> {
>     "Version": "2012-10-17",
>     "Statement": [
>         {
>             "Effect": "Allow",
>             "Action": [
>                 "sts:AssumeRole"
>             ],
>             "Resource": [
>                 "AssumeRole ARN 01",
>                 "AssumeRole ARN 02",
>                 ...
>             ]
>         }
>     ]
> }
> EOF
>         } # End Of inline_policies
>     } # End Of GroupName02
> 
> } # End Of groups
> ```

