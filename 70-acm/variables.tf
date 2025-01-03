variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
        Environment = "dev"
    }
}


variable "zone_name" {
    default = "devops1289s.online"
}

variable "zone_id" {
    default = "Z00627433U7UR5KQZSUZM"
}