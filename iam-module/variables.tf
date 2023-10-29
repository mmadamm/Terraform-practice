
variable "user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "Adam"
}

variable "group_name" {
  description = "Name of the IAM group"
  type        = string
  default     = "DevOps"
}

# variable "policy_name" {
#   description = "Name of the IAM policy"
#   type        = string
# }

# variable "policy_document" {
#   description = "IAM policy document"
#   type        = string
# }


variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {
        company="fawry"
        team   ="devops"
  }
}