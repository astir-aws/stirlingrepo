# Define VPC Variable

variable "aws-vpc-cidr" {
  type        = string
  default     = "172.0.0.0/16"
  description = "vpc-cidr-block"
}

variable "pub-sb-1-cidr" {
  type        = string
  default     = "172.0.0.0/24"
  description = "pub-sb-1-cidr-block"
}

variable "pub-sb-2-cidr" {
  type        = string
  default     = "172.0.1.0/24"
  description = "pub-sb-2-cidr-block"
}

variable "pri-sb-1-cidr" {
  type        = string
  default     = "172.0.2.0/24"
  description = "pri-sb-1-cidr-block"
}
variable "pri-sb-2-cidr" {
  type        = string
  default     = "172.0.3.0/24"
  description = "pri-sb-2-cidr-block"
}

variable "pri-sb-3-cidr" {
  type        = string
  default     = "172.0.4.0/24"
  description = "pri-sb-3-cidr-block"
}

variable "pri-sb-4-cidr" {
  type        = string
  default     = "172.0.5.0/24"
  description = "pri-sb-4-cidr-block"
}
