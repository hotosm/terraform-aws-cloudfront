variable "s3_bucket_name" {
  description = "Name of the S3 bucket to be used as the origin"
  type        = string
}

variable "create_s3_bucket_policy" {
  description = "Whether to create an S3 bucket policy to allow CloudFront access"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept user requests"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
  default     = "CloudFront distribution for S3"
}

variable "default_root_object" {
  description = "Object that CloudFront returns when a viewer requests the root URL"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "Price class for the distribution (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"
  validation {
    condition     = contains(["PriceClass_All", "PriceClass_200", "PriceClass_100"], var.price_class)
    error_message = "Price class must be one of PriceClass_All, PriceClass_200, or PriceClass_100."
  }
}

variable "allowed_methods" {
  description = "HTTP methods that CloudFront processes and forwards to the origin"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "HTTP methods for which CloudFront caches responses"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "forward_query_string" {
  description = "Whether to forward query strings to the origin"
  type        = bool
  default     = false
}

variable "forward_cookies" {
  description = "Specifies which cookies to forward to the origin (none, all, whitelist)"
  type        = string
  default     = "none"
}

variable "viewer_protocol_policy" {
  description = "Protocol that viewers can use to access the content (allow-all, redirect-to-https, https-only)"
  type        = string
  default     = "redirect-to-https"
}

variable "min_ttl" {
  description = "Minimum time objects stay in CloudFront cache"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default time objects stay in CloudFront cache"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum time objects stay in CloudFront cache"
  type        = number
  default     = 86400
}

variable "compress" {
  description = "Whether CloudFront automatically compresses certain files"
  type        = bool
  default     = true
}

variable "geo_restriction_type" {
  description = "Method to restrict distribution of your content by country (none, whitelist, blacklist)"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "ISO 3166-1-alpha-2 country codes for geo restriction"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to assign to the distribution"
  type        = map(string)
  default     = {}
}

variable "use_default_certificate" {
  description = "Whether to use the default CloudFront certificate"
  type        = bool
  default     = true
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate to use with the distribution"
  type        = string
  default     = null
}

variable "minimum_protocol_version" {
  description = "Minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "custom_error_response_page_404_enabled" {
  description = "Whether to enable a custom error response for 404 errors"
  type        = bool
  default     = false
}

variable "custom_error_response_page_404" {
  description = "Path to the custom error page for 404 errors"
  type        = string
  default     = "/404.html"
}

variable "custom_error_response_page_404_ttl" {
  description = "Minimum TTL for the custom error response"
  type        = number
  default     = 60
}
variable "custom_error_response_page_403_enabled" {
  description = "Whether to enable a custom error response for 403 errors"
  type        = bool
  default     = false
}

variable "custom_error_response_page_403" {
  description = "Path to the custom error page for 403 errors"
  type        = string
  default     = "/403.html"
}

variable "custom_error_response_page_403_ttl" {
  description = "Minimum TTL for the custom error response"
  type        = number
  default     = 60
}

#variables for dynamic custom_error_response block
variable "custom_error_response_pages" {
  description = "List of custom error response pages"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = []
}

variable "aliases" {
  type = list(string)
  default = []
}