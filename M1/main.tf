resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

}

resource "aws_s3_bucket_object" "erro_interact" {
  bucket = aws_s3_bucket.datalake.id
  key    = "erros/modulo1/erro interact s3py.jpg"
  acl    = "private"
  source = "../erro interact s3py.jpg"
  etag   = filemd5("../erro interact s3py.jpg")
}

provider "aws" {
  region = "us-east-2"
}



