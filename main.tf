provider "aws" {
  region  = "us-east-2"
}


data "template_file" "dynamodb_items" {
  template = file("${path.module}/items.json")

  vars = {
    project_prefix = replace("${var.project_prefix}", "-", "_")
    table_name     = "${var.project_prefix}-tables-mapping"
    region         = var.region
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.project_prefix}-tables-mapping"
  hash_key     = "catalog_table"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "catalog_table"
    type = "S"
  }

  provisioner "local-exec" {
    command     = "echo '${data.template_file.dynamodb_items.rendered}' > out.json ; ${path.module}/populate_db.sh"
    interpreter = ["bash", "-c"]
  }
}
