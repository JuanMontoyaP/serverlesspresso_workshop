output "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  value       = aws_cognito_user_pool.user_pool.id
}

output "cognito_identity_pool_id" {
  description = "The ID of the Cognito Identity Pool"
  value       = aws_cognito_identity_pool.identity_pool.id
}

output "serverless_frontend_url" {
  description = "The URL of the Serverless Frontend"
  # value       = "&host=d3rtodyzbrgtvdnp3tly6wjnz4.appsync-api.${var.aws_region}.amazonaws.com&orderManagerEndpoint=https://pt2x3ki5hd.execute-api.${var.aws_region}.amazonaws.com/Prod/&APIGWEndpointValidatorService=https://kr6xstot14.execute-api.${var.aws_region}.amazonaws.com/Prod/&APIGWEndpointConfigService=https://4kam9fp29a.execute-api.${var.aws_region}.amazonaws.com/Prod/&APIGWEndpointReviewService=https://5up05hdalf.execute-api.${var.aws_region}.amazonaws.com/Prod/&poolId=${aws_cognito_identity_pool.identity_pool.id}"
  value = <<-EOT
    https://workshop-display.serverlesscoffee.com/
    ?region=${var.aws_region}
    &userPoolId=${aws_cognito_user_pool.user_pool.id}
    &userPoolWebClientId=${aws_cognito_user_pool_client.user_pool_client.id}
    &host=t5bnzdajjzhlnpzupghqr6wuky.appsync-api.us-west-2.amazonaws.com
    &orderManagerEndpoint=https://kb8uaz615f.execute-api.us-west-2.amazonaws.com/Prod/
    &APIGWEndpointValidatorService=https://t6x6h0xkfc.execute-api.us-west-2.amazonaws.com/Prod/
    &APIGWEndpointConfigService=https://0g1wsm4bna.execute-api.us-west-2.amazonaws.com/Prod/
    &APIGWEndpointReviewService=https://dq3k5ppjkh.execute-api.us-west-2.amazonaws.com/Prod/
    &poolId=${aws_cognito_identity_pool.identity_pool.id}
  EOT
}
