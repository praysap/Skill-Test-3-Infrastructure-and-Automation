variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium" # Slightly larger for Ubuntu and multiple containers
}

# variable "ubuntu_ami_id" {
#   description = "The specific Ubuntu AMI ID to use"
#   default     = "ami-020cba7c55df1f615"  # Replace with your AMI ID
# }
variable "ubuntu_ami_id" {
  description = "The specific Ubuntu AMI ID to use"
  type        = string
}
variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "aniruddha-key"
}