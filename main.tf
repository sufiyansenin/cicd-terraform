provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "user_updates" {
  name = "sufiyan-updates-topic"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce5-tfstate-bucket-1"
    key    = "sufiyan.tfstate"
    region = "us-east-1"
  }
}