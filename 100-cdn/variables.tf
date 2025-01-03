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


variable "frontend_tags" {
    default = {
        Component = "backend"
    }
}

variable "zone_name" {
    default = "devops1289.online"
}