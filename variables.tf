variable "aws" {
    type = object({
        region  = string
        profile = string
    })
}

variable "groups" {
    type = map(object({
        path                = string
        attach_policy_arns  = list(string)
        inline_policies     = map(string)
    }))
}