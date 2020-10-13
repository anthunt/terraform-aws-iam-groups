variable "group" {
    type = object({
        name                = string
        path                = string
        attach_policy_arns  = list(string)
        inline_policies     = map(string)
    })
}