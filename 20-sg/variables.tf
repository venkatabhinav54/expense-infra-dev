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

variable "mysql_sg_tags" {
    default = {
        component = "mysql"
    }
}

variable "backend_sg_tags" {
    default = {
        component = "backend"
    }
}

variable "frontend_sg_tags" {
    default = {
        component = "frontend"
    }
}

variable "bastion_sg_tags" {
    default = {
        component = "bastion"
    }
}

variable "ansible_sg_tags" {
    default = {
        component = "ansible"
    }
}

variable "app_alb_sg_tags" {
    default = {
        component = "app-alb"
    }
}

variable "vpn_sg_tags" {
    default = {
        component = "vpn"
    }
}

variable "web_alb_sg_tags" {
    default = {
        Component = "web-alb"
    }
}