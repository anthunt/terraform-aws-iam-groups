output "groups" {
    value = {for k, v in var.groups : k => module.iam_group[k].iam_group}
}