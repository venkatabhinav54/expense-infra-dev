variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense-bastion"
        Environment = "dev"
        Terraform = "true"
    }
}


variable "bastion_tags" {
    default = {
        Component = "bastion"
    }
}