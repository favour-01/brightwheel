variable "username" {
  type    = list(string)
  default = ["Tope", "Tom", "David", "Thompson", "Danzor"]
}

resource "aws_iam_user" "userlist" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_group" "dev_group" {
  name = "Developer"
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  count  = length(var.username)
  user   = element(var.username, count.index)
  groups = [aws_iam_group.dev_group.name, ]
}