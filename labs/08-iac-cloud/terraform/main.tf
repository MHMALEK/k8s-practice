terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "local_file" "hello" {
  filename = "${path.module}/hello-${var.environment}.txt"
  content  = "env=${var.environment}\n"
}

output "created_file" {
  value = local_file.hello.filename
}
