variable "region" {
    description = "The region of AWS."
}

variable "access_key" {
    description = "The AWS access key."
}

variable "secret_key" {
    description = "The AWS secret key."
}

variable "tag_name" {
    description = "The tag name for resources being created."
    default = "Development"
}

variable "team" {
    description = "The name of the team these resources are for."
}
