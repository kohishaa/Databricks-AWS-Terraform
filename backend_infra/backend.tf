resource "aws_s3_bucket" "backend_bucket" {
  bucket = ""
  }
resource "aws_s3_bucket_versioning" "versioning_configuration" {
  bucket = aws_s3_bucket.backend_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


#Dynamodb

resource "aws_dynamodb_table" "lock" {
  name             = ""
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"
  

  attribute {
    name = "LockID"
    type = "S"
  }
}