output "url" {
  value = "${aws_s3_bucket.site.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}
