terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  # s3 is a regional service only but it's name should be globally unique
  backend "s3" {
    bucket = "project-state-file-6250"  # name of the bucket should be globally unique 
    key = "dynamic-block-remote" # name of file in s3 bucket to store state file remotely in S3 
    region = "us-east-1" #specifying region as s3 is regional service
    use_lockfile = true
    encrypt = true
  }
}

provider "aws"  {

  # Configuration options

}