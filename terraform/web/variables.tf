variable "aws_account_id" {
  description = "AWS account ID. This is provided only for policies which explicitly need it defined."
  type        = "string"
  default     = "912167340146a"
}

variable "aws_region" {
  description = "AWS region from which to launch."
  type        = "string"
  default     = "us-west-2"
}

variable "domain_name" {
  description = "The domain name of the website"
  type        = "string"
  default     = "bluecircle"
}

variable "path_to_website" {
  description = "The relative path of the website from terraform orchestration"
  type        = "list"

  default = [
    "./web/index.html",
    "./web/coffee/index.html",
    "./web/menu-1/index.html",
    "./web/teas/index.html",
  ]
}

variable "mime_types" {
  description = "Allowed content types for website transactions"

  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
  }
}
