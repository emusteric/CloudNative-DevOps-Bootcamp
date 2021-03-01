output "locale" {
    description = "Location of Bucket"
    value = aws_s3_bucket.bucket.region
}

output "acceleration_status" {
    description = "Status of acceleration"
    value = aws_s3_bucket.bucket.acceleration_status
}

output "arn" {
    description = "Arn is:"
    value = aws_s3_bucket.bucket.arn
}

output "name" {
    description = "name of Bucket"
    value = aws_s3_bucket.bucket.bucket
}

output "domain" {
    description = "Bucket domain"
    value = aws_s3_bucket.bucket.bucket_domain_name
}

output "regional_domain" {
    description = "Regional Bucket Domain Name"
    value = aws_s3_bucket.bucket.bucket_regional_domain_name
}