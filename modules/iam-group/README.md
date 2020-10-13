# Managing a IAM Group (iam-group)

[toc]

## 1. Module Usage

>```bash
> module "iam_group" {
>     source    = "anthunt/iam-groups/iam-group/aws"> 
>     for_each  = var.groups
>     group     = merge(each.value, {"name" = each.key})
>     providers = {
>         aws = aws
>     }
> }
> ```

## 2. variables.tf Sample

>```bash
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

>```json
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

