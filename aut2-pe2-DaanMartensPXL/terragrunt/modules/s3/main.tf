resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket,
    aws_s3_bucket_public_access_block.bucket,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.bucket

  policy = <<EOP
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*"
    }
  ]
}
EOP
}


# Sync images later on
# # Uploading images to the bucket
# resource "aws_s3_bucket_object" "image_1" {
#   bucket = aws_s3_bucket.todo_bucket_daan.bucket
#   key    = "image1.jpg"
#   source = "images/image1.jpg"  # Local path to the image file
#   acl    = "public-read"
# }

# resource "aws_s3_bucket_object" "image_2" {
#   bucket = aws_s3_bucket.todo_bucket_daan.bucket
#   key    = "image2.jpg"
#   source = "images/image2.jpg"  # Local path to the image file
#   acl    = "public-read"
# }

# # ...repeat for any additional images

#possible alternative
# resource "null_resource" "upload_images" {
#   provisioner "local-exec" {
#     command = "aws s3 sync images/ s3://${aws_s3_bucket.todo_bucket_daan.bucket}/ --acl public-read"
#   }

#   triggers = {
#     bucket = aws_s3_bucket.todo_bucket_daan.id
#   }
# }