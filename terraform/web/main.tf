terraform {
  backend "s3" {
    bucket = "tf-state-blue-circle"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_s3_bucket" "site" {
  bucket = "${var.domain_name}"

  policy = <<EOF
{
"Id": "bucket_policy_site",
"Version": "2012-10-17",
"Statement": [
  {
    "Sid": "bucket_policy_site_main",
    "Action": [
      "s3:GetObject"
    ],
    "Effect": "Allow",
    "Resource": "arn:aws:s3:::${var.domain_name}/*",
    "Principal": "*"
  }
]
}
EOF

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "object" {
  depends_on   = ["aws_s3_bucket.site"]
  count        = "${length(var.path_to_website)}"
  bucket       = "${var.domain_name}"
  key          = "${replace(element(var.path_to_website, count.index), "./web", "")}"
  content_type = "${lookup(var.mime_types, "html", "text/html")}"
  source       = "${element(var.path_to_website, count.index)}"
  etag         = "${md5(element(var.path_to_website, count.index))}"
}
