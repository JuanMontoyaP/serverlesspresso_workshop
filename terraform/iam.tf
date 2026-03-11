data "aws_iam_policy_document" "cognito_unauthorized_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.identity_pool.id]
    }
  }
}

resource "aws_iam_role" "cognito_unauthorized_role" {
  name               = "ServerlesspressoCognitoUnauthorizedRole"
  assume_role_policy = data.aws_iam_policy_document.cognito_unauthorized_trust_policy.json
}

data "aws_iam_policy_document" "cognito_unauthorized_policy" {
  statement {
    effect = "Allow"

    actions = [
      "cognito-sync:ListDatasets",
      "cognito-sync:ListRecords",
      "cognito-sync:UpdateRecords"
    ]

    resources = [
      "arn:aws:cognito-sync:${var.aws_region}:${data.aws_caller_identity.current.account_id}:identitypool/${aws_cognito_identity_pool.identity_pool.id}"
    ]
  }
}

resource "aws_iam_role_policy" "cognito_unauthorized_policy" {
  name = "CognitoUnauthorizedPolicy"
  role = aws_iam_role.cognito_unauthorized_role.id

  policy = data.aws_iam_policy_document.cognito_unauthorized_policy.json
}

data "aws_iam_policy_document" "cognito_authorized_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.identity_pool.id]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values   = ["authenticated"]
    }
  }
}

resource "aws_iam_role" "cognito_authorized_role" {
  name               = "ServerlesspressoCognitoAuthorizedRole"
  assume_role_policy = data.aws_iam_policy_document.cognito_authorized_trust_policy.json
}

data "aws_iam_policy_document" "cognito_authorized_policy" {
  statement {
    effect = "Allow"

    actions = [
      "cognito-sync:ListDatasets",
      "cognito-sync:ListRecords",
      "cognito-sync:UpdateRecords"
    ]

    resources = [
      "arn:aws:cognito-sync:${var.aws_region}:${data.aws_caller_identity.current.account_id}:identitypool/${aws_cognito_identity_pool.identity_pool.id}"
    ]
  }
}

resource "aws_iam_role_policy" "cognito_authorized_policy" {
  name = "CognitoAuthorizedPolicy"
  role = aws_iam_role.cognito_authorized_role.id

  policy = data.aws_iam_policy_document.cognito_authorized_policy.json
}
