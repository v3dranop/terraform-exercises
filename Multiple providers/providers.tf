provider "aws" {
  region = "us-east-1"
}
//III used the same because in lab I can only user one region
provider "aws" {
  region = "us-east-1"
  alias  = "east2"
}
