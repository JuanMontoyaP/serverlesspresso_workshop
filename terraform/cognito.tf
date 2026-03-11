resource "aws_cognito_user_pool" "user_pool" {
  name = "Serverlesspresso-User-Pool"

  auto_verified_attributes = ["email"]
  mfa_configuration        = "OFF"

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  email_verification_message = "Your verification code is {####}"

  password_policy {
    minimum_length    = 6
    require_uppercase = false
    require_lowercase = false
    require_numbers   = false
    require_symbols   = false
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name            = "Serverlesspresso-User-Pool-Client"
  generate_secret = false
  user_pool_id    = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = "Serverlesspresso-Identity-Pool"
  allow_unauthenticated_identities = true

  cognito_identity_providers {
    client_id     = aws_cognito_user_pool_client.user_pool_client.id
    provider_name = "cognito-idp.${var.aws_region}.amazonaws.com/${aws_cognito_user_pool.user_pool.id}"
  }
}

resource "aws_cognito_identity_pool_roles_attachment" "identity_pool_role_mapping" {
  identity_pool_id = aws_cognito_identity_pool.identity_pool.id

  roles = {
    authenticated   = aws_iam_role.cognito_authorized_role.arn
    unauthenticated = aws_iam_role.cognito_unauthorized_role.arn
  }
}
