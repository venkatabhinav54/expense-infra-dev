variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}


variable "vpn_tags" {
    default = {
        Component = "vpn"
    }
}

variable "zone_name" {
    default = "devops1289.online"
}


