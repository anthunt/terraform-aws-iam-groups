resource "aws_iam_group" "iam_group" {
  name = var.group.name
  path = var.group.path
}

resource "aws_iam_group_policy_attachment" "policy_attach" {
    for_each = toset(var.group.attach_policy_arns)
    group      = aws_iam_group.iam_group.name
    policy_arn = each.value
}

resource "aws_iam_group_policy" "inline_policy" {
    for_each = var.group.inline_policies
    name  = each.key
    group = aws_iam_group.iam_group.id
    policy = each.value
}