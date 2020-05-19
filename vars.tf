variable "accessor-role" {
  type        = string
  description = "role name who can access to images"
}

variable "service-assume-role" {
  type        = string
  description = "service name like eks.amazonaws.com"
}


variable "image-scope" {
  type        = string
  description = "image scope awesome-project in awesome-project/image-name"
}

variable "images" {
  type        = set(string)
  description = "image names"
}

variable "immutable" {
  type        = bool
  description = "deny push already existing tag"
  default     = true
}

variable "scanning" {
  type        = bool
  description = "enable scan on push"
  default     = true
}
