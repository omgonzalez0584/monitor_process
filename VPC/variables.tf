variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "Aws profile credential"
  default     = "awsqa"
}

variable "virginia" {
  type = object({
    name        : string
    vpc_cidr   : list(string)
    environment : string
  })

}
