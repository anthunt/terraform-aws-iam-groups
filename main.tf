module "iam_group" {
    source = "./modules/iam-group"

    for_each = var.groups
    group = merge(each.value, {"name" = each.key})
    providers = {
        aws = aws
    }
}