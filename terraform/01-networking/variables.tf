variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "workshop-devops-na-nuvem"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::591853006687:role/devops-na-nuvem-admin-role"
    region = "us-east-1"
  }
}

variable "vpc" {
  type = object({
    cidr_block               = string
    name                     = string
    internet_gateway_name    = string
    public_route_table_name  = string
    private_route_table_name = string
    nat_gateway_name         = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    cidr_block               = "10.0.0.0/16"
    name                     = "devops-na-nuvem-vpc"
    internet_gateway_name    = "devops-na-nuvem-igw"
    nat_gateway_name         = "devops-na-nuvem-nat-gateway"
    public_route_table_name  = "devops-na-nuvem-public-route-table"
    private_route_table_name = "devops-na-nuvem-private-route-table"
    public_subnets = [
      {
        name                    = "devops-na-nuvem-tf-public-subnet-1a"
        cidr_block              = "10.0.0.0/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                    = "devops-na-nuvem-tf-public-subnet-1b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
      }
    ]
    private_subnets = [
      {
        name                    = "devops-na-nuvem-tf-private-subnet-1a"
        cidr_block              = "10.0.0.128/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = false
      },
      {
        name                    = "devops-na-nuvem-tf-private-subnet-1b"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
      }
    ]
  }
}


