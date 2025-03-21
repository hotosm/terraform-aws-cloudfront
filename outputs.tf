output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.arn
}

output "cloudfront_distribution_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "origin_access_identity_path" {
  description = "Path of the CloudFront origin access identity"
  value       = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
}

output "s3_bucket_id" {
  description = "ID of the S3 bucket used as origin"
  value       = data.aws_s3_bucket.origin_bucket.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket used as origin"
  value       = data.aws_s3_bucket.origin_bucket.arn
}

output "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket used as origin"
  value       = data.aws_s3_bucket.origin_bucket.bucket_domain_name
}
