# --- terraform-aws-s3.variables ---

variable "bucket_name" {
  type = string
  description = "Name for your S3 Bucket"

  # Additional restrictions are applied to specific types of buckets, i.e. no suffixes of:
  # -s3alias, --ol-s3, .mrap, --x-s3, --table-s3, -an\
  # And . is not allowed for Transfer Acceleration enabled buckets

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket names must be between 3 (min) and 63 (max) characters long"
  }

  validation {
    condition     = can(regex("^[a-z0-9.-]+$", var.bucket_name))
    error_message = "Bucket names can consist only of lowercase letters, numbers, dots (.), and hyphens (-)."
  }

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket names must begin and end with a letter or number"
  }

  validation {
    condition     = !strcontains(var.bucket_name, "..")
    error_message = "Bucket names must not contain two adjacent periods."
  }

  validation {
    condition     = !can(regex("^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$", var.bucket_name))
    error_message = "Bucket names must not be formatted as an IP address (for example, 192.168.5.4)"
  }

  validation {
    condition     = !startswith(var.bucket_name, "xn--")
    error_message = "Bucket names must not start with the prefix xn--"
  }

  validation {
    condition     = !startswith(var.bucket_name, "sthree-")
    error_message = "Bucket names must not start with the prefix sthree-"
  }

  validation {
    condition     = !startswith(var.bucket_name, "amzn-s3-demo-")
    error_message = "Bucket names must not start with the prefix amzn-s3-demo-"
  }
}

variable "bucket_versioning" {
  type = bool
  default = true
}
