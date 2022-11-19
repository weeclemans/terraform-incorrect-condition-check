locals {
  snow = [ 22 ]
}

variable "foo2" {
  type = list
  default = [ 22 ]
}

resource "null_resource" "command1" {
  count = ( local.snow == [ 22 ] ) ? 1 : 0
  provisioner "local-exec" {
    command = "echo 1"
  }
}

resource "null_resource" "command2" {
  count = ( local.snow[0] == 22 ) ? 1 : 0
  provisioner "local-exec" {
    command = "echo 2"
  }
}

resource "null_resource" "command3" {
  count = ( var.foo2 == [ 22 ] ) ? 1 : 0
  provisioner "local-exec" {
    command = "echo 3"
  }
}

resource "null_resource" "command4" {
  count = ( var.foo2[0] == 22 ) ? 1 : 0
  provisioner "local-exec" {
    command = "echo 4"
  }
}
