resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  provider = aws.main
    bucket = "testing-bucket-nyi-2"

    rule {
        id = "standard_ia_transition"

        transition {
            days = 30
            storage_class = "STANDARD_IA"
        }
            status = "Enabled"
    }

    rule {
        id = "ia_glacier_transition"

        transition {
            days = 90
            storage_class = "GLACIER"
        }
            status = "Enabled"
    }
    rule {
        id = "deletion"

        expiration {
            days = 365
        }
            status = "Enabled"
    }
}

